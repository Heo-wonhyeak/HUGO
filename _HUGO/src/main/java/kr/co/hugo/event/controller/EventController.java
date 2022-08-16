package kr.co.hugo.event.controller;

import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.multipart.MultipartHttpServletRequest;

public interface EventController {
	
	public ResponseEntity addNewEvent(MultipartHttpServletRequest multipartRequest,
			HttpServletResponse response) throws Exception;

}
