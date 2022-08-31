package kr.co.hugo.boarder.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import kr.co.hugo.boarder.dto.BoardDTO;
import kr.co.hugo.boarder.dto.ImageDTO;

public interface BoardDAO {

	public int insertNewArticle(Map articleMap) throws DataAccessException;
	// 리뷰 최신 순 (default)
	public List<BoardDTO> selectAllReviewsList(int restIdx) throws DataAccessException;
	// 리뷰 별점 순 
	public List<BoardDTO> selectAllSteamList(int restIdx) throws DataAccessException;
	// 리뷰 방문 순
	public List<BoardDTO> selectAllVisitList(int restIdx) throws DataAccessException;
	// 내가 쓴리뷰
	public List<BoardDTO> selectMyReviewList(Map<Object, Object> myReview) throws DataAccessException;
	// 이미지 정보 가져오기 (매장 상세정보)
	public ImageDTO selectReviewImage(int reviewIdx) throws DataAccessException;
	// 리뷰 상세정보 가져오기
	public BoardDTO selectReview(int reviewIdx) throws DataAccessException;
	// 리뷰 상세정보 이미지 가져오기
	public List<ImageDTO> selectReviewImageOne(int reviewIdx) throws DataAccessException;
	// 총 리뷰 이미지 갯수 + 1 가져오기
	public int selectAllImageCount() throws DataAccessException;
	// 리뷰 쓰기 이미지 insert
	public void insertNewImage(Map articleMap) throws DataAccessException;
	

}
