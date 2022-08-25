package kr.co.hugo.boarder.service;

import java.util.List;
import java.util.Map;

import kr.co.hugo.boarder.dto.BoardDTO;

public interface BoardService {

	public int addNewArticle(Map articleMap) throws Exception;
	public Map<Object,Object> listReviews(int restIdx) throws Exception;
	
}
