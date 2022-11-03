package kr.co.hugo.boarder.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.co.hugo.boarder.dto.BoardDTO;
import kr.co.hugo.boarder.dto.ImageDTO;
import kr.co.hugo.boarder.service.BoardService;
import kr.co.hugo.member.dto.MemberDTO;

@Controller
public class BoardControllerImpl implements BoardController {

	@Autowired
	private BoardService boardService;
	@Autowired
	private BoardDTO boardDTO;

	private static String OUTPUT_FILE_PATH = "/Users/jeong-won-yeong/Documents/HUGO/RestaurantImage";

	// 리뷰 쓰기
	@Override
	@RequestMapping(value = "/board/addNewReview.do", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity addNewReview(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)
			throws Exception {

		multipartRequest.setCharacterEncoding("utf-8");
		String imageFileName = null;
		// 이미지 총 갯수 불러오기
		// 글정보 저장하기 위한 Map 생성
		Map<Object, Object> articleMap = new HashMap<>();
		String title = multipartRequest.getParameter("title");
		String starCount = multipartRequest.getParameter("reviewStar");
		String contents = multipartRequest.getParameter("contents");
		int restaurantIdx = Integer.parseInt(multipartRequest.getParameter("restIdx"));
		// 업로드
		List<String> fileList = upload(multipartRequest, restaurantIdx);
		Iterator<String> fileNames = multipartRequest.getFileNames();
		List<ImageDTO> imgFileList = new ArrayList<>();
		if (fileList != null && fileList.size() != 0) {
			// 전송되는 이미지 정보를 ImageDTO 객체의 속성에 차례대로 저장한 후 imageFileList에 다시 저장함
			for (String fileName : fileList) {
				ImageDTO imageDTO = new ImageDTO();
				imageDTO.setImageFileName(fileName);
				imageDTO.setRestaurantIdx(restaurantIdx);
				imgFileList.add(imageDTO);
			}
			// imageFileList를 다시 articleMap에 저장함
			articleMap.put("imgFileList", imgFileList);
		}
		articleMap.put("title", title);
		articleMap.put("starCount", starCount);
		articleMap.put("contents", contents);
		articleMap.put("restaurantIdx", restaurantIdx);

		// 로그인 시 세션에 저장된 회원정보에서 아이디(글쓴이)를 Map에 저장
		HttpSession session = multipartRequest.getSession();
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("member");
		String nickName = memberDTO.getNickname();
		articleMap.put("nickName", nickName);

		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		String message;
		ResponseEntity resEnt = null;
		try {
			int count = boardService.allImageCount();
			int articleIdx = boardService.addNewArticle(articleMap); // articleMap을 서비스 클래스로 전달함
			if (imgFileList != null && imgFileList.size() != 0) {
				// 첨부한 이미지들을 for문을 이용해 업로드함
				for (ImageDTO imageDTO : imgFileList) {
					// temp => articleNO 이미지 이동.
					imageFileName = imageDTO.getImageFileName();
					File srcFile = new File(OUTPUT_FILE_PATH + "/" + "temp" + "/" + imageFileName);
					File destFile = new File(OUTPUT_FILE_PATH + "/" + restaurantIdx);
					FileUtils.moveFileToDirectory(srcFile, destFile, true);

					Path file = Paths.get(OUTPUT_FILE_PATH + "/" + restaurantIdx + "/" + imageFileName);
					Path newFile = Paths.get(OUTPUT_FILE_PATH + "/" + restaurantIdx + "/" + count + ".jpg");
					Path newFilePath = Files.move(file, newFile);
					count++;

				}
			}
			// 매장 별점 평균구하기
			boardService.calResStarAvg(restaurantIdx);
			message = "<script>";
			message += " alert('새글을 추가했습니다.');";
			message += "opener.parent.location.reload();";
			message += " self.close();";
			message += "</script>";

			// 새 글을 추가한 후 메시지를 전달함
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);

		} catch (Exception e) {
			if (imgFileList != null && imgFileList.size() != 0) {
				// 오류 발생시 temp폴더의 이미지들 모두 삭제
				for (ImageDTO imageDTO : imgFileList) {
					imageFileName = imageDTO.getImageFileName();
					File srcFile = new File(OUTPUT_FILE_PATH + "/" + "temp" + "/" + imageFileName);
					srcFile.delete();
				}
			}

			message = "<script>";
			message += " alert('오류가 발생했습니다. 다시 시도해 주세요.');";
			message += "opener.parent.location.reload();";
			message += " self.close();";
			message += "</script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);

			e.printStackTrace();
		}

		return resEnt;
	}

	private List<String> upload(MultipartHttpServletRequest multipartRequest, int restIdx)
			throws ServletException, IOException {
		multipartRequest.setCharacterEncoding("utf-8");

		List<String> fileList = new ArrayList<>();
		Iterator<String> fileNames = multipartRequest.getFileNames();
		while (fileNames.hasNext()) {
			String fileName = fileNames.next();
			MultipartFile mFile = multipartRequest.getFile(fileName);
			String originalFilename = mFile.getOriginalFilename();

			if (originalFilename != "" && originalFilename != null) {
				fileList.add(originalFilename); // 첨부한 이미지 파일의 이름들을 차례대로 저장함
				File file = new File(OUTPUT_FILE_PATH + "/" + restIdx + "/" + fileName);
				if (mFile.getSize() != 0) {
					if (!file.exists()) {
						file.getParentFile().mkdirs(); // 경로에 해당하는 디렉토리들 생성
						mFile.transferTo(new File(OUTPUT_FILE_PATH + "/" + "temp" + "/" + originalFilename)); // 임시로
						// 저장된 MultipartFile을 실제 파일로 전송
					}
				}
			}
		}

		return fileList;
	}

	@Override
	@RequestMapping(value = "/board/goodCheck.do", method = RequestMethod.GET)
	public void goodCheck(@RequestParam("restIdx") int restIdx, @RequestParam("articleIdx") int articleIdx,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		// 새로운 추천 번호 가져오기
		int result = 0;
		int steamedIdx = boardService.reviewNewSteamCount();
		HttpSession session = request.getSession();
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("member");
		String id = null;
		Map<Object, Object> steamedMap = new HashMap<>();
		if (memberDTO != null) {
			id = memberDTO.getId();
			steamedMap.put("id", id);
			steamedMap.put("restIdx", restIdx);
			steamedMap.put("articleIdx", articleIdx);
			steamedMap.put("steamedIdx", steamedIdx);
			result = boardService.AddSteamed(steamedMap);
			result = boardService.updateReviewSteamed(articleIdx);
		}
		if (result == 0) {
			System.out.println("찜 추가하기 오류");
		} else {
			System.out.println("찜 추가하기 성공");
		}
	}

	// (다중 이미지)수정 기능
	@Override
	@RequestMapping(value = "/board/modArticle.do", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity modReview(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)
			throws Exception {

		multipartRequest.setCharacterEncoding("utf-8");
		String imageFileName = null;
		List<ImageDTO> imgFileList = new ArrayList<>();
		// 글정보 저장하기 위한 Map 생성
		Map<Object, Object> articleMap = new HashMap<>();
		String title = multipartRequest.getParameter("title");
		String starCount = multipartRequest.getParameter("reviewStar");
		String contents = multipartRequest.getParameter("content");
		int articleIdx = Integer.parseInt(multipartRequest.getParameter("articleIdx"));
		int restaurantIdx = Integer.parseInt(multipartRequest.getParameter("restIdx"));
		
		// 수정한 이미지 업로드 (temp에 저장)
		List<String> fileList = upload(multipartRequest, restaurantIdx);
		int count = 0;
		// 원래 이미지 삭제
		List<ImageDTO> imgList = boardService.selectModImg(articleIdx);
		for (int i = 0; i < imgList.size(); i++) {
			int fileName = imgList.get(i).getImageFileNO();
			File file = new File(OUTPUT_FILE_PATH + "/" + restaurantIdx + "/" + fileName + ".jpg");
			file.delete();
			// DB에 저장된 이미지 파일 내용 삭제 후 총 이미지 갯수 가져오기
			count = boardService.deleteModImg(fileName);
		}
		// 이미지 내용 db에 insert
		
		if (fileList != null && fileList.size() != 0) {
			// 전송되는 이미지 정보를 ImageDTO 객체의 속성에 차례대로 저장한 후 imageFileList에 다시 저장함
			for (String fileName : fileList) {
				ImageDTO imageDTO = new ImageDTO();
				imageDTO.setImageFileName(fileName);
				imageDTO.setRestaurantIdx(restaurantIdx);
				imgFileList.add(imageDTO);
			}
			// imageFileList를 다시 articleMap에 저장함
			articleMap.put("imgFileList", imgFileList);
		}
		
		// 수정한 리뷰 내용 update
		articleMap.put("title", title);
		articleMap.put("starCount", starCount);
		articleMap.put("contents", contents);
		articleMap.put("restaurantIdx", restaurantIdx);
		articleMap.put("articleIdx", articleIdx);
		// 로그인 시 세션에 저장된 회원정보에서 아이디(글쓴이)를 Map에 저장
		HttpSession session = multipartRequest.getSession();
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("member");
		String nickName = memberDTO.getNickname();
		articleMap.put("nickName", nickName);

		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");

		try {
			// 수정 글 db에 업데이트
			int result = boardService.modArticle(articleMap);
			if (imgFileList != null && imgFileList.size() != 0) {
				// 첨부한 이미지들을 for문을 이용해 업로드함
				for (ImageDTO imageDTO : imgFileList) {
					// temp => articleNO 이미지 이동.
					imageFileName = imageDTO.getImageFileName();
					File srcFile = new File(OUTPUT_FILE_PATH + "/" + "temp" + "/" + imageFileName);

					File destFile = new File(OUTPUT_FILE_PATH + "/" + restaurantIdx);
					FileUtils.moveFileToDirectory(srcFile, destFile, true);

					Path file = Paths.get(OUTPUT_FILE_PATH + "/" + restaurantIdx + "/" + imageFileName);
					Path newFile = Paths.get(OUTPUT_FILE_PATH + "/" + restaurantIdx + "/" + count + ".jpg");
					Path newFilePath = Files.move(file, newFile);
					count++;
				}
			}

			message = "<script>";
			message += " alert('글을 수정했습니다.');";
			message += "opener.parent.location.reload();";
			message += " self.close();";
			message += "</script>";

			// 새 글을 추가한 후 메시지를 전달함
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);

		} catch (Exception e) {
			if (imgFileList != null && imgFileList.size() != 0) {
				// 오류 발생시 temp폴더의 이미지들 모두 삭제
				for (ImageDTO imageDTO : imgFileList) {
					imageFileName = imageDTO.getImageFileName();
					File srcFile = new File(OUTPUT_FILE_PATH + "/" + "temp" + "/" + imageFileName);
					srcFile.delete();
				}
			}

			message = "<script>";
			message += " alert('오류가 발생했습니다. 다시 시도해 주세요.');";
			message += "opener.parent.location.reload();";
			message += " self.close();";
			message += "</script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);

			e.printStackTrace();
		}

		return resEnt;
	}

	@Override
	@RequestMapping(value = "/board/deleteReview.do", method = RequestMethod.GET)
	public void deleteReview(@RequestParam("articleIdx") int articleIdx, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		request.setCharacterEncoding("utf-8");
		int result = 0;
		// 이미지 삭제
		List<ImageDTO> imgList = boardService.selectModImg(articleIdx);
		for (int i = 0; i < imgList.size(); i++) {
			int fileName = imgList.get(i).getImageFileNO();
			int restaurantIdx = imgList.get(i).getRestaurantIdx();
			File file = new File(OUTPUT_FILE_PATH + "/" + restaurantIdx + "/" + fileName + ".jpg");
			file.delete();
			// 이미지 db 정보 삭제
			result = boardService.deleteImg(fileName);
			if (result == 0)
				System.out.println("이미지 정보 삭제 오류");
		}
		// 리뷰 정보 삭제
		result = boardService.deleteArticle(articleIdx);
		if (result == 0)
			System.out.println("글 정보 삭제 오류");
	}

}
