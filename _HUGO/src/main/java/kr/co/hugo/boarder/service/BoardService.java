package kr.co.hugo.boarder.service;

import java.util.List;
import java.util.Map;

import kr.co.hugo.boarder.dto.BoardDTO;
import kr.co.hugo.boarder.dto.BoardSteamedDTO;

public interface BoardService {

	public int addNewArticle(Map articleMap) throws Exception;
	// 매장 상세보기 모든 리뷰 가져오기
	public Map<Object,Object> listReviews(int restIdx,int list,String nickname,String id) throws Exception;
	// 리뷰 상세보기 가져오기
	public Map<Object, Object> reviewInfo(int reviewIdx) throws Exception;
	// 리뷰에 저장된 모든 이미지 개수
	public int allImageCount();
	// 매장 총 리뷰 평균 별점구하기
	public void calResStarAvg(int restaurantIdx) throws Exception;
	// 리뷰 추천해요 중복 체크
	public List<BoardSteamedDTO> reviewSteamedCount(Map<Object, Object> steamedCheckMap) throws Exception;
	// 리뷰 추천해요 새로운 번호 가져오기
	public int reviewNewSteamCount() throws Exception;
	// 리뷰 추천해요 찜 추가
	public int AddSteamed(Map<Object, Object> steamedMap) throws Exception;
	// 리뷰 추천해요 1 증가
	public int updateReviewSteamed(int articleIdx) throws Exception;
	
	
}
