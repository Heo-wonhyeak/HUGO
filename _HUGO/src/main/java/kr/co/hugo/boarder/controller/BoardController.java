package kr.co.hugo.boarder.controller;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

public interface BoardController {

	public ResponseEntity addNewReview(MultipartHttpServletRequest multipartRequest,
			HttpServletResponse response) throws Exception; 
}
