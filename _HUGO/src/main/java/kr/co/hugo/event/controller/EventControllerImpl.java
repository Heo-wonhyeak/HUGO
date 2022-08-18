package kr.co.hugo.event.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import kr.co.hugo.event.dto.CouponImageDTO;
import kr.co.hugo.event.dto.EventImageDTO;
import kr.co.hugo.event.service.EventService;
import kr.co.hugo.member.dto.MemberDTO;



@Controller
public class EventControllerImpl implements EventController {
	
	private static String ARTICLE_IMAGE_REFO = "/Users/hwh/workspace-Spring/_HUGO/Event_IMG";
	
	@Autowired
	private EventService eventService;

	@RequestMapping(value="/event/runningEventPage.do" , method= {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView runningEventPage(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		
		return mav;
	}
	
	@RequestMapping(value="/event/eventWriter.do" , method= {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView eventWriter(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		
		return mav;
	}
	
	@RequestMapping(value="/event/eventDTL.do", method= {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView eventDTL(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		
		return mav;
	}
	
	@RequestMapping(value="/event/endEventPage.do", method= {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView endEventPage(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		
		return mav;
	}
	
	@RequestMapping(value="/event/couponPage.do", method= {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView couponPage(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		
		return mav;
	}
	
	@RequestMapping(value="/event/couponDTL.do", method= {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView couponDTL(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		
		return mav;
	}
	
	@RequestMapping(value="/event/declaration.do", method= {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView declaration(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		
		return mav;
	}

	//새글쓰기 (이미지 포함)
	@Override
	@RequestMapping(value="/event/addNewEvent.do", method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity addNewEvent(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)
			throws Exception {
		multipartRequest.setCharacterEncoding("UTF-8");
		String imageFileName = null;
		
		//글 정보 저장하기 위한 Map 생성
		Map eventMap = new HashMap<>();
		Enumeration enun = multipartRequest.getParameterNames();
		while(enun.hasMoreElements()) {
			String name = (String) enun.nextElement();
			String value = multipartRequest.getParameter(name);
			eventMap.put(name, value);
		}
		
		//로그인 시 세션에 저장된 회원정보에서 아이디(글쓴이)
		HttpSession session = multipartRequest.getSession();
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		String id = memberDTO.getId();
		eventMap.put("id", id);
		
		//업로드한 이미지 파일 이름을 가져옴
		List<String> fileList = upload(multipartRequest);
		System.out.println("controller - fileList : " + fileList);
		
		
		// 어떤 게시판을 선택할 것인지 확인
		String border = multipartRequest.getParameter("boarder");
		
		ResponseEntity resEnt = null;
		
		//진행중 이벤트 라면 
		if(border.equals("runningEvent")) {
			List<EventImageDTO> imageFileList = new ArrayList<>();
			System.out.println("imageFileList" + imageFileList);
			if(fileList != null && fileList.size() != 0) {
				//전송되는 이미지 정보를 ImageDTO 객체의 속성에 차례대로 저장한 후 imageFileList에 다시 저장함
				for(String fileName : fileList) {
					EventImageDTO imageDTO = new EventImageDTO();
					imageDTO.setImg_name(fileName);
					imageFileList.add(imageDTO);
				}
				//imageFileList 를 다시 eventMap에 저장함
				eventMap.put("imageFileList", imageFileList);
			}
			
			HttpHeaders responseHeaders = new HttpHeaders();
			responseHeaders.add("Content-Type", "text/html; charset=utf-8");
			
			String message;
			
			
			try {
				
				int event_idx = eventService.addNewEvent(eventMap);
				eventMap.put("event_idx", event_idx);
				if(imageFileList != null && imageFileList.size() != 0) {
					// 첨부한 이미지들을 for문을 이용해 업로드함
					for(EventImageDTO imageDTO : imageFileList) {
						System.out.println("controller imageFileList - imageDTO" + imageDTO);
						// temp => articleNO 이미지 이동
						imageFileName = imageDTO.getImg_name();
						File srcFile = new File(ARTICLE_IMAGE_REFO+"/temp/"+imageFileName);
						File destFile = new File(ARTICLE_IMAGE_REFO+"/event/"+event_idx);
						// 소스파일 , 이동 파일 , 디렉토리 생성 여부 --> 확인해서 이동
						FileUtils.moveFileToDirectory(srcFile, destFile, true);
					}
				}
				// 새 글이 정상적으로 등로된 케이스
				message ="<script>";
				message +="alert('새글을 추가했습니다.');";
				message +="location.href='"+multipartRequest.getContextPath()+"/event/runningEventPage.do';";
				message +="</script>";
				// 새 글을 추가한 후 메시지를 전달함
				resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED); 
			} catch (Exception e) {
				if(imageFileList != null && imageFileList.size() != 0) {
					//오류발생시 Temp폴더의 이미지 삭제!
					for(EventImageDTO imageDTO : imageFileList) {
						// temp => articleNO 이미지 이동
						imageFileName = imageDTO.getImg_name();
						File srcFile = new File(ARTICLE_IMAGE_REFO+"/temp/"+imageFileName);
						srcFile.delete();
						
						message ="<script>";
						message +="alert('오류가 발생했습니다.');";
						message +="location.href='"+multipartRequest.getContextPath()+"/event/eventWriter.do';";
						message +="</script>";
						
						resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED); 
						
						e.printStackTrace();
					}
				}
			}
		}
		// 쿠폰 페이지라면 
		else {
			List<CouponImageDTO> imageFileList = new ArrayList<>();
			if(fileList != null && fileList.size() != 0) {
				//전송되는 이미지 정보를 ImageDTO 객체의 속성에 차례대로 저장한 후 imageFileList에 다시 저장함
				for(String fileName : fileList) {
					CouponImageDTO imageDTO = new CouponImageDTO();
					imageDTO.setImg_name(fileName);
					imageFileList.add(imageDTO);
				}
				//imageFileList 를 다시 eventMap에 저장함
				eventMap.put("imageFileList", imageFileList);
			}
			
			HttpHeaders responseHeaders = new HttpHeaders();
			responseHeaders.add("Content-Type", "text/html; charset=utf-8");
			
			String message;
			
			
			try {
				int coupon_idx = eventService.addNewCoupon(eventMap);
				if(imageFileList != null && imageFileList.size() != 0) {
					// 첨부한 이미지들을 for문을 이용해 업로드함
					for(CouponImageDTO imageDTO : imageFileList) {
						// temp => articleNO 이미지 이동
						imageFileName = imageDTO.getImg_name();
						File srcFile = new File(ARTICLE_IMAGE_REFO+"/temp/"+imageFileName);
						File destFile = new File(ARTICLE_IMAGE_REFO+"/coupon/"+coupon_idx);
						// 소스파일 , 이동 파일 , 디렉토리 생성 여부 --> 확인해서 이동
						FileUtils.moveFileToDirectory(srcFile, destFile, true);
					}
				}
				// 새 글이 정상적으로 등로된 케이스
				message ="<script>";
				message +="alert('새글을 추가했습니다.');";
				message +="location.href='"+multipartRequest.getContextPath()+"/event/couponPage.do';";
				message +="</script>";
				// 새 글을 추가한 후 메시지를 전달함
				resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED); 
			} catch (Exception e) {
				if(imageFileList != null && imageFileList.size() != 0) {
					//오류발생시 Temp폴더의 이미지 삭제!
					for(CouponImageDTO imageDTO : imageFileList) {
						// temp => articleNO 이미지 이동
						imageFileName = imageDTO.getImg_name();
						File srcFile = new File(ARTICLE_IMAGE_REFO+"/temp/"+imageFileName);
						srcFile.delete();
						
						message ="<script>";
						message +="alert('오류가 발생했습니다.');";
						message +="location.href='"+multipartRequest.getContextPath()+"/event/eventWriter.do';";
						message +="</script>";
						
						resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED); 
						
						e.printStackTrace();
					}
				}
			}
		}
		
		return resEnt;
	}

	//새글쓰기시 (다중) 이미지 업로드 기능 -- 업로드한 파일 이름들 얻은 후 리턴
	private List<String> upload(MultipartHttpServletRequest multipartRequest) {
		List<String> fileList = new ArrayList<>();
		Iterator<String> fileNames = multipartRequest.getFileNames();
		
		while(fileNames.hasNext()) {
			String fileName = fileNames.next();
			MultipartFile mFile = multipartRequest.getFile(fileName);
			System.out.println("upload - fileName : " + fileName);
			String originalFileName = mFile.getOriginalFilename();
			System.out.println("upload - originalFileNAme : " + originalFileName);
			
			if(originalFileName != "" && originalFileName != null) {
				//첨부한 이미지 파일의 이름들을 차례대로 저장함
				fileList.add(originalFileName);
				File file = new File(ARTICLE_IMAGE_REFO+"/"+fileName);
				
				//이미지 존재여부 체크
				if(mFile.getSize() != 0) {
						// 경로에 해당하는 디렉토리 생성 (mkdirs - 서브디렉토리까지 생성)
						file.getParentFile().mkdirs();
						// 임시 업로드상태 -- 저장된 multipartRequest를 실제 파일로 저장함
						try {
							mFile.transferTo(new File(ARTICLE_IMAGE_REFO+"/temp/"+originalFileName));
						} catch (IllegalStateException e) {
							System.out.println("이미지 업로드중 오류 발생");
							e.printStackTrace();
						} catch (IOException e) {
							System.out.println("이미지 업로드중 오류 발생");
							e.printStackTrace();
						}
				}
			}
		}
		System.out.println("upload fileList : " + fileList);
		
		return fileList;
	}
}
