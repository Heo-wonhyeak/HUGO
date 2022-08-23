package kr.co.hugo.event.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;

public interface EventController {
	
	// 이벤트 추가
	public ResponseEntity addNewEvent(MultipartHttpServletRequest multipartRequest,
			HttpServletResponse response) throws Exception;
	// 이벤트 수정
	public ResponseEntity modEvent(MultipartHttpServletRequest multipartRequest,
			HttpServletResponse response) throws Exception;
	// 이벤트 삭제
	public ResponseEntity removeEvent(@RequestParam("event_idx") int event_idx, HttpServletRequest request, 
			HttpServletResponse response) throws Exception;
	// 댓글 추가
		public ResponseEntity eventReply(@RequestParam("event_idx") int event_idx,MultipartHttpServletRequest multipartRequest,
				HttpServletResponse response) throws Exception;

}
