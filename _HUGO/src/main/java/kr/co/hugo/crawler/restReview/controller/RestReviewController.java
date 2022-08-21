package kr.co.hugo.crawler.restReview.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.hugo.boarder.dto.BoardDTO;
import kr.co.hugo.crawler.restReview.service.RestReviewService;

@Controller
public class RestReviewController {

	
	@Autowired
	RestReviewService restReviewService;
	
	// 크롤링한 리뷰들 (Page_URL -> 매장idx)와 articlesIdx 변환
	@RequestMapping(value = "", method = { RequestMethod.GET, RequestMethod.POST })
	public void articlesIdxChange(HttpServletRequest request, HttpServletResponse response) throws Exception {
		List<BoardDTO> ReviewLists = restReviewService.listReview();
		
	}
	
	// 크롤링한 리뷰들 imageURL(리뷰에 image없을시 image_url을 메인이미지로 사용) 들 각 매장idx의 articleIdx 폴더에 저장
	@RequestMapping(value = "", method = { RequestMethod.GET, RequestMethod.POST })
	public void downloadURLImage(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
	}
	
	// username, userTotalReview member에 저장
	// member table 활성화 시 사용
	@RequestMapping(value = "", method = { RequestMethod.GET, RequestMethod.POST })
	public void memberCrawler(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
	}
	
}


















