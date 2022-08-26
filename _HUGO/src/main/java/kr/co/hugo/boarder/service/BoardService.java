package kr.co.hugo.boarder.service;

import java.util.List;
import java.util.Map;

import kr.co.hugo.boarder.dto.BoardDTO;

public interface BoardService {

	public int addNewArticle(Map articleMap) throws Exception;
	// 매장 상세보기 모든 리뷰 가져오기
	public Map<Object,Object> listReviews(int restIdx,int list,String nickname) throws Exception;
	// 리뷰 상세보기 가져오기
	public Map<Object, Object> reviewInfo(int reviewIdx) throws Exception;
	
}
