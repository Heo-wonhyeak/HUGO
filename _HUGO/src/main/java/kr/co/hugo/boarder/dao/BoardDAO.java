package kr.co.hugo.boarder.dao;

import java.util.List;
import java.util.Map;

import kr.co.hugo.boarder.dto.BoardDTO;

public interface BoardDAO {

	public int insertNewArticle(Map articleMap) throws Exception;

	public List<BoardDTO> selectAllArticlesList() throws Exception;

}
