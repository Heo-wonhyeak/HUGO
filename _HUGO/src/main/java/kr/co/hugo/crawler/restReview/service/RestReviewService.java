package kr.co.hugo.crawler.restReview.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import kr.co.hugo.boarder.dto.BoardDTO;
import kr.co.hugo.crawler.restReview.dao.RestReviewDAO;
import kr.co.hugo.crawler.restinfo.dto.RestInfoDTO;

public class RestReviewService {
	
	@Autowired
	RestReviewDAO restReviewDAO;
	
	// URL 가져오기
	public List<BoardDTO> listReview(){
		List<BoardDTO> ReviewList = restReviewDAO.selectAllReviews();
		
		return ReviewList;
	}

}
