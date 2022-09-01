package kr.co.hugo.restaurant.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

public interface ResController {
	
	// 매장 상세보기 창
	public ModelAndView restaurantView(@RequestParam("restIdx") int restIdx,@RequestParam("array") int list, HttpServletRequest request, HttpServletResponse response) throws Exception;
	// 매장 이미지 더보기 창
	ModelAndView restaurantsPhoto(@RequestParam("restIdx") int restIdx, HttpServletRequest request, HttpServletResponse response) throws Exception;
	// 매장 TOP50 리스트 정렬
	public ModelAndView restaurantTop50(@RequestParam("array") int list, HttpServletRequest request, HttpServletResponse response);
	// 매장 리뷰 상세보기 창
	public ModelAndView restaurantsReviewInfo(@RequestParam("restIdx") int restIdx, HttpServletRequest request, HttpServletResponse response) throws Exception;
	// 매장 리뷰 수정/삭제 창
	public ModelAndView restaurantsReviewMod(@RequestParam("reviewIdx") int reviewIdx, HttpServletRequest request, HttpServletResponse response)
			throws Exception;
}
