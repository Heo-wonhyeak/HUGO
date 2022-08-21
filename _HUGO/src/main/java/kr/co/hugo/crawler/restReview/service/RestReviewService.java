package kr.co.hugo.crawler.restReview.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import kr.co.hugo.boarder.dto.BoardDTO;
import kr.co.hugo.crawler.restReview.dao.RestReviewDAO;
import kr.co.hugo.crawler.restinfo.dto.RestInfoDTO;
import kr.co.hugo.restaurant.dao.ResDAO;

public class RestReviewService {

	@Autowired
	RestReviewDAO restReviewDAO;

	

	public List<BoardDTO> listReview(String resIdxURL) {
		List<BoardDTO> ReviewList = restReviewDAO.selectReviews(resIdxURL);

		return ReviewList;
	}



	public int modReviewIdx(Map<Object, Object> reviewMap) {
		int result = 0;
		
		result = restReviewDAO.modReviewIdx(reviewMap);
		return result;
	}

}
