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
		sqlSession.insert("mapper.board.insertNewArticle", articleMap);
		
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
	
	// 리뷰 상세보기 가져오기
	@Override
	public BoardDTO selectReview(int reviewIdx) throws DataAccessException {
		BoardDTO reviewList = sqlSession.selectOne("mapper.board.selectReview",reviewIdx);
		return reviewList;
	}
	
	// 리뷰 상세보기 이미지 가져오기
	@Override
	public List<ImageDTO> selectReviewImageOne(int reviewIdx) throws DataAccessException {
		List<ImageDTO> imageList = sqlSession.selectList("mapper.board.selectImg",reviewIdx);
		return imageList;
	}
	
	// 총 이미지 + 1 갯수 가져오기
	@Override
	public int selectAllImageCount() throws DataAccessException {
		int imgCount = sqlSession.selectOne("mapper.board.selectImgCount");
		return imgCount;
	}

	@Override
	public void insertNewImage(Map articleMap) {
		// 새글에 대한 새로운 이미지 번호 가져옴
		int imageFileNO = selectAllImageCount(); 
		List<ImageDTO> imgFileList = (List<ImageDTO>) articleMap.get("imgFileList");
		int articleIdx = (Integer) articleMap.get("articleIdx"); // articleMap에 있는 글 번호를 가져옴
		int restaurantIdx = (Integer) articleMap.get("restaurantIdx");
		
		if (imgFileList != null && imgFileList.size() != 0) {
			for (ImageDTO imageDTO : imgFileList) {
				imageDTO.setArticleIdx(articleIdx);
				imageDTO.setImageFileNO(imageFileNO);
				imageDTO.setRestaurantIdx(restaurantIdx);
				imageFileNO++;
				
			}
			sqlSession.insert("mapper.board.insertNewImage", imgFileList);
		}
	}


	

	
	

}
