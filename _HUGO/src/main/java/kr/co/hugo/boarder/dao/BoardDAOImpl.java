package kr.co.hugo.boarder.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import kr.co.hugo.boarder.dto.BoardDTO;
import kr.co.hugo.boarder.dto.ImageDTO;


@Repository("boardDAO")
public class BoardDAOImpl implements BoardDAO {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int insertNewArticle(Map articleMap) throws DataAccessException {
		int articleNO = selectNewArticleNO();
		articleMap.put("articleNO", articleNO);
		int result=sqlSession.insert("mapper.board.insertNewArticle", articleMap);
		
		return articleNO;
	}

	public int selectNewArticleNO() {
		return sqlSession.selectOne("mapper.board.selectNewArticleNo");
	}

	// 매장 상세페이지 모든 리뷰 가져오기
	@Override
	public List<BoardDTO> selectAllReviewsList(int restIdx) throws DataAccessException{
		List<BoardDTO> reviewList = sqlSession.selectList("mapper.board.selectAllReviewList",restIdx);
		return reviewList;
	}
	
	// 매장 리뷰 별점 순 가져오기
	@Override
	public List<BoardDTO> selectAllSteamList(int restIdx) throws DataAccessException {
		List<BoardDTO> reviewList = sqlSession.selectList("mapper.board.selectAllStemaList",restIdx);
		return reviewList;
	}
	
	// 매장 리뷰 방문 순 가져오기
	@Override
	public List<BoardDTO> selectAllVisitList(int restIdx) throws DataAccessException {
		List<BoardDTO> reviewList = sqlSession.selectList("mapper.board.selectAllVisitList",restIdx);
		return reviewList;
	}
	
	// 매장 내가 쓴 리뷰 가져오기
	@Override
	public List<BoardDTO> selectMyReviewList(int restIdx, String nickname) throws DataAccessException {
		List<BoardDTO> reviewList = sqlSession.selectList("mapper.board.selectMyList",nickname);
		return reviewList;
	}
	
	// 매장 리뷰 이미지 정보 가져오기
	@Override
	public ImageDTO selectReviewImage(int reviewIdx) throws DataAccessException {
		ImageDTO reviewImgList = sqlSession.selectOne("mapper.board.selectAllReviewImgList",reviewIdx);
		return reviewImgList;
	}

	

	
	

}
