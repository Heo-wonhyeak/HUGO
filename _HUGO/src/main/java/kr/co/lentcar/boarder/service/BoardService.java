package kr.co.lentcar.boarder.service;

import java.util.List;
import java.util.Map;

import kr.co.lentcar.boarder.dto.BoardDTO;

public interface BoardService {

	public int addNewArticle(Map articleMap) throws Exception;

	public List<BoardDTO> listArticles() throws Exception;
	
}
