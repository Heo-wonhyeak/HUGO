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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import kr.co.hugo.event.dto.CouponImageDTO;
import kr.co.hugo.event.dto.EventDTO;
import kr.co.hugo.event.dto.EventImageDTO;
import kr.co.hugo.event.service.EventService;
import kr.co.hugo.member.dto.MemberDTO;

@Controller
public class EventControllerImpl implements EventController {
	
	private static String ARTICLE_IMAGE_REFO = "/Users/hwh/Documents/GitHub/HUGO/_HUGO/src/main/webapp/resources/img";
	
	@Autowired
	private EventService eventService;

	//이벤트 러닝 페이지의 리스트를 불러온다
	@RequestMapping(value="/event/runningEventPage.do" , method= {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView runningEventPage(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String viewName = (String)request.getAttribute("viewName");
		
		String boarder =(String)request.getParameter("boarder");
		
		List<EventDTO> eventList = eventService.listEvent(boarder);

		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		
		mav.addObject("eventList",eventList);
		
		return mav;
	}
	
	//이벤트 글쓰기 페이지 열기
	@RequestMapping(value="/event/eventWriter.do" , method= {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView eventWriter(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		
		return mav;
	}
	
	@RequestMapping(value="/event/modEventWriter.do", method= {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView modEventWriter(@RequestParam("event_idx") int event_idx,HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String viewName = (String)request.getAttribute("viewName");
		
		//세션에서 로그인한 멤버를 받아옴
		HttpSession session = request.getSession();
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		
		String id = null;
		if(memberDTO != null) {
			//로그인 멤버의 아이디를 받아옴
			id = memberDTO.getId();
		}
		
		//이벤트 번호와 아이디를 Map에 저장함
		Map<String, Object> viewMap = new HashMap<>();
		viewMap.put("event_idx", event_idx);
		viewMap.put("id", id);
		
		String action = request.getParameter("action");
		viewMap.put("action", action);
		
		Map<String, Object> eventMap = eventService.viewEvent(viewMap);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		mav.addObject("eventMap",eventMap);
		
		return mav;
	}
	
	
	//이벤트 상세보기
	@RequestMapping(value="/event/eventDTL.do", method= {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView eventDTL(@RequestParam("event_idx") int event_idx,HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String viewName = (String)request.getAttribute("viewName");
		
		//세션에서 로그인한 멤버를 받아옴
		HttpSession session = request.getSession();
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		
		String id = null;
		if(memberDTO != null) {
			//로그인 멤버의 아이디를 받아옴
			id = memberDTO.getId();
		}
		
		//이벤트 번호와 아이디를 Map에 저장함
		Map<String, Object> viewMap = new HashMap<>();
		viewMap.put("event_idx", event_idx);
		viewMap.put("id", id);
		
		String action = request.getParameter("action");
		viewMap.put("action", action);
		
		Map<String, Object> eventMap = eventService.viewEvent(viewMap);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		mav.addObject("eventMap",eventMap);
		
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
		//하단으로 옮겨서 사용 해보기
		List<String> fileList = upload(multipartRequest);
		System.out.println("controller - fileList : " + fileList);
		
		
		// 어떤 게시판을 선택할 것인지 확인
		String border = multipartRequest.getParameter("boarder");
		
		ResponseEntity resEnt = null;
		
		//게시글 저장 -- 분기 지움
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
				
				/*
				  //업로드한 이미지 파일 이름을 가져옴
				   * 파라미터로 event_idx 를 보내서 파일 이름도 event_idx 로 만들기 because 파일 이름을 받기 위해서!
				   * 파일 이름이 확장자까지 나오는지 sysout 찍어보고, 나온다면 map에 저장해서 보내기 - 파일이름을 경로로 jsp 에서 확인하기 위해
					List<String> fileList = upload(multipartRequest);
					System.out.println("controller - fileList : " + fileList);
				 */
				if(imageFileList != null && imageFileList.size() != 0) {
					// 첨부한 이미지들을 for문을 이용해 업로드함
					for(EventImageDTO imageDTO : imageFileList) {
						System.out.println("controller imageFileList - imageDTO" + imageDTO);
						// temp => articleNO 이미지 이동
						imageFileName = imageDTO.getImg_name();
						
						//파일 이름 변경한 것! 쿠폰에도 적용해야함
						
						//파일 확장자
						String ext = imageFileName.substring(imageFileName.lastIndexOf("."));
						String ofile = event_idx+ext;
						
						//소스파일
						File srcFile = new File(ARTICLE_IMAGE_REFO+"/temp/"+imageFileName);
						//뉴파일
						File newFile = new File(ARTICLE_IMAGE_REFO+"/temp/"+ofile);
						
						srcFile.renameTo(newFile);
						
						eventMap.put("ofile", ofile);
						
						eventService.updateOfile(eventMap);
						
						
						File destFile = new File(ARTICLE_IMAGE_REFO+"/event/"+event_idx);
						// 소스파일 , 이동 파일 , 디렉토리 생성 여부 --> 확인해서 이동
						FileUtils.moveFileToDirectory(newFile, destFile, true);
					}
				}
				// 새 글이 정상적으로 등로된 케이스
				message ="<script>";
				message +="alert('새글을 추가했습니다.');";
				message +="location.href='"+multipartRequest.getContextPath()+"/event/runningEventPage.do?boarder=runningEvent';";
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
		
		return resEnt;
	}

	//새글쓰기시 (다중) 이미지 업로드 기능 -- 업로드한 파일 이름들 얻은 후 리턴
	private List<String> upload(MultipartHttpServletRequest multipartRequest) {
		List<String> fileList = new ArrayList<>();
		Iterator<String> fileNames = multipartRequest.getFileNames();
		
		String event_idx = multipartRequest.getParameter("event_idx");
		System.out.println("upload event_idx : "+event_idx);
		
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

	// 글 수정
	// 게시판 같을때는 수정 - 게시판이 달라질 경우 (이동할경우 해당 이벤트 삭제후 다른 게시판으로 신규 등록 진행)
	@RequestMapping(value="/event/modEvent.do", method= {RequestMethod.GET,RequestMethod.POST})
	@Override
	public ResponseEntity modEvent(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)
			throws Exception {
		multipartRequest.setCharacterEncoding("UTF-8");
		
		Map<String,Object> eventMap = new HashMap<>();
		
		Enumeration enu = multipartRequest.getParameterNames();
		while(enu.hasMoreElements()) {
			String name = (String)enu.nextElement();
			
			String value = multipartRequest.getParameter(name);
			
			System.out.println("name / value : " + name+"/"+value);
			
			eventMap.put(name, value);			
		}
		int event_idx = Integer.parseInt(eventMap.get("event_idx").toString());
		
		//업로드한 이미지 파일 이름을 가져옴 
		//하단으로 옮겨서 사용 해보기
		List<String> fileList = upload(multipartRequest);
		
		String boarder = (String)eventMap.get("boarder");
		
		String imageFileName = null;
		ResponseEntity resEnt = null;
		
		// 분기 제거
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
				
				eventService.modEvent(eventMap,fileList);
				eventMap.put("event_idx", event_idx);
				
				/*
				  //업로드한 이미지 파일 이름을 가져옴
				   * 파라미터로 event_idx 를 보내서 파일 이름도 event_idx 로 만들기 because 파일 이름을 받기 위해서!
				   * 파일 이름이 확장자까지 나오는지 sysout 찍어보고, 나온다면 map에 저장해서 보내기 - 파일이름을 경로로 jsp 에서 확인하기 위해
					List<String> fileList = upload(multipartRequest);
					System.out.println("controller - fileList : " + fileList);
				 */
				if(imageFileList != null && imageFileList.size() != 0) {
					
					File destDir = new File(ARTICLE_IMAGE_REFO+"/"+event_idx);
					//기존 이미지 파일이 저장된 폴더(디렉토리)도 삭제함
					FileUtils.deleteDirectory(destDir);
					
					// 첨부한 이미지들을 for문을 이용해 업로드함
					for(EventImageDTO imageDTO : imageFileList) {
						System.out.println("controller imageFileList - imageDTO" + imageDTO);
						
						imageFileName = imageDTO.getImg_name();
						
						//파일 이름 변경한 것! 쿠폰에도 적용해야함
						
						//파일 확장자
						String ext = imageFileName.substring(imageFileName.lastIndexOf("."));
						String ofile = event_idx+ext;

						
						//소스파일
						File srcFile = new File(ARTICLE_IMAGE_REFO+"/temp/"+imageFileName);
						//뉴파일
						File newFile = new File(ARTICLE_IMAGE_REFO+"/temp/"+ofile);
						
						srcFile.renameTo(newFile);
						
						eventMap.put("ofile", ofile);
						
						eventService.updateOfile(eventMap);
						
						
						File destFile = new File(ARTICLE_IMAGE_REFO+"/event/"+event_idx);
						// 소스파일 , 이동 파일 , 디렉토리 생성 여부 --> 확인해서 이동
						FileUtils.moveFileToDirectory(newFile, destFile, true);
					}
				}
				// 새 글이 정상적으로 등로된 케이스
				message ="<script>";
				message +="alert('글을 수정했습니다.');";
				message +="location.href='"+multipartRequest.getContextPath()+"/event/eventDTL.do?event_idx="+event_idx+"&action=registration';";
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
						message +="location.href='"+multipartRequest.getContextPath()+"/event/modEventWriter.do?event_idx="+event_idx+"';";
						message +="</script>";
						
						resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED); 
						
						e.printStackTrace();
					}
				}
			}
		
		return resEnt;
	}

	// 이벤트 삭제
	@RequestMapping(value="/event/removeEvent.do",method=RequestMethod.POST)
	@Override
	@ResponseBody
	public ResponseEntity removeEvent(@RequestParam("event_idx")int event_idx, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		response.setContentType("text/html; charset=utf-8");
		
		//문제 발생 소지를 없애기 위해 세팅
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		
		String message;
		ResponseEntity resEnt = null;
		
		try {
			eventService.removeEvent(event_idx);
			
			//첨부 이미지 폴더 받아오기
			File destDir = new File(ARTICLE_IMAGE_REFO+"/"+event_idx);
			//첨부된 이미지 파일이 저장된 폴더(디렉토리)도 삭제함
			FileUtils.deleteDirectory(destDir);
			
			message ="<script>";
			message +="alert('글을 삭제했습니다.');";
			message +="location.href='"+request.getContextPath()+"/event/runningEventPage.do?boarder=runningEvent';";
			message +="</script>";
			
			// 글을 삭제한 후 메시지를 전달함
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			
		} catch (Exception e) {
			
			message ="<script>";
			message +="alert('오류가 발생했습니다.');";
			message +="location.href='"+request.getContextPath()+"/event/eventDTL.do?event_idx='"+event_idx+"&action=registration;";
			message +="</script>";
			
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED); 
			
			e.printStackTrace();
			
		}
		
		return resEnt;
	}

	@Override
	@RequestMapping(value="/event/eventReply.do", method= {RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public ResponseEntity eventReply(@RequestParam("event_idx") int event_idx,MultipartHttpServletRequest multipartRequest, HttpServletResponse response)
			throws Exception {
		multipartRequest.setCharacterEncoding("UTF-8");
		
		//문제 발생 소지를 없애기 위해 세팅
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		
		//댓글 정보 저장하기 위한 Map 생성
		Map replyMap = new HashMap<>();
		Enumeration enun = multipartRequest.getParameterNames();
		while(enun.hasMoreElements()) {
			String name = (String) enun.nextElement();
			String value = multipartRequest.getParameter(name);
			replyMap.put(name, value);
			
			System.out.println("Reply name / value : " + name+"/"+value);
		}
		
		String message ="";
		ResponseEntity resEnt = null;
		
		try {
			
			eventService.addEventReply(replyMap);
			
			message ="<script>";
			message +="alert('댓글이 작성되었습니다');";
			message +="location.href='"+multipartRequest.getContextPath()+"/event/eventDTL.do?event_idx="+event_idx+"&action=registration';";
			message +="</script>";
			
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.OK); 
			
		}catch (Exception e) {
			
			message ="<script>";
			message +="alert('댓글 입력중 오류가 발생했습니다.');";
			message +="location.href='"+multipartRequest.getContextPath()+"/event/eventDTL.do?event_idx="+event_idx+"&action=registration';";
			message +="</script>";
			
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.OK); 
			
			e.printStackTrace();
		}
		
		System.out.println(message);
		
		
		
		
		return resEnt;
	}
	
	
	@Override
	@RequestMapping(value="/event/like.do",method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity like(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		response.setContentType("text/html; charset=utf-8");
		
		//문제 발생 소지를 없애기 위해 세팅
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		
		String message;
		ResponseEntity resEnt = null;
		
		int event_idx = Integer.parseInt(request.getParameter("event_idx"));
		String id = request.getParameter("id");
		int like_yn = Integer.parseInt(request.getParameter("like_yn"));
		
		Map likeMap = new HashMap<>();
		likeMap.put("event_idx", event_idx);
		likeMap.put("id", id);
		
		if(like_yn == 0) {
			try {
				eventService.insertLike(likeMap);
				
				message ="<script>";
//				message +="$('#like').html(\"<i class='fa-solid fa-heart' style='color:red;'></i> &nbsp;좋아요&nbsp;${event.like_count}\");";
				message +="location.href='"+request.getContextPath()+"/event/eventDTL.do?event_idx="+event_idx+"&action=registration';";
				message +="</script>";
				
				resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.OK); 
				
			} catch (Exception e) {
				System.out.println("좋아요 입력 오류");
				e.printStackTrace();

			}
		} else {
			try {
				eventService.deleteLike(likeMap);
				
				message ="<script>";
				message +="$('#like').html(\"<i class='fa-regular fa-heart' style='color:red;'></i> &nbsp;좋아요&nbsp;${event.like_count}\");";
				message +="location.reload();";
				message +="</script>";
				
				resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.OK); 
			} catch (Exception e) {
				System.out.println("좋아요 취소 오류");
				e.printStackTrace();
			}
		}
		
		
		
		return resEnt;
	}

	@RequestMapping(value="/event/removeReply.do",method=RequestMethod.POST)
	@Override
	@ResponseBody
	public ResponseEntity removeReply(@RequestParam("event_reply_idx") int event_reply_idx,@RequestParam("event_idx") int event_idx, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		response.setContentType("text/html; charset=utf-8");
		
		//문제 발생 소지를 없애기 위해 세팅
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		
		String message;
		ResponseEntity resEnt = null;
		
		
		try {
			eventService.removeReply(event_reply_idx);
			
			message ="<script>";
			message +="alert('댓글을 삭제했습니다.');";
			message +="location.href='"+request.getContextPath()+"/event/eventDTL.do?event_idx="+event_idx+"&action=registration';";
			message +="</script>";
			
			// 글을 삭제한 후 메시지를 전달함
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			
		} catch (Exception e) {
			
			message ="<script>";
			message +="alert('오류가 발생했습니다.');";
			message +="location.href='"+request.getContextPath()+"/event/eventDTL.do?event_idx='"+event_idx+"&action=registration;";
			message +="</script>";
			
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED); 
			
			e.printStackTrace();
			
		}
		
		return resEnt;
	}
}
