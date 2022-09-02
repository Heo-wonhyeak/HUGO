package kr.co.hugo.boarder.controller;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

public interface BoardController {

	// 새 리뷰 추가
	public ResponseEntity addNewReview(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)
			throws Exception;

	// 추천해요 기능
	public void goodCheck(@RequestParam("restIdx") int restIdx, @RequestParam("articleIdx") int articleIdx,
			HttpServletRequest request, HttpServletResponse response) throws Exception;

	// 리뷰 수정
	public ResponseEntity modReview(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)
			throws Exception;
}
