package kr.co.hugo.crawler.restReview.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.hugo.boarder.dto.BoardDTO;

@Repository
public class RestReviewDAO {
	
	@Autowired
	private SqlSession sqlSession;

	public List<BoardDTO> selectAllReviews() {
		List<BoardDTO> ReviewList = sqlSession.selectReview("mapper.crawler.selectAllReviews");
		return ReviewList;
	}
}
