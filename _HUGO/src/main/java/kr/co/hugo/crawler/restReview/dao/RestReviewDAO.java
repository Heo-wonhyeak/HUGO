package kr.co.hugo.crawler.restReview.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import kr.co.hugo.boarder.dto.BoardDTO;

@Repository
public class RestReviewDAO {
	
	@Autowired
	private SqlSession sqlSession;

	public List<BoardDTO> selectReviews(String resIdxURL) throws DataAccessException {
		List<BoardDTO> ReviewList = sqlSession.selectList("mapper.crawler.selectReviews",resIdxURL);
		return ReviewList;
	}

	public int modReviewIdx(Map<Object, Object> reviewMap) {
		int result = 0;
		result = sqlSession.update("mapper.crawler.modReviewIdx", reviewMap);
		return result;
	}

	public List<BoardDTO> selectAllReview() {
		List<BoardDTO> AllReview = sqlSession.selectList("mapper.crawler.selectAllReview");
		return AllReview;
	}
}
