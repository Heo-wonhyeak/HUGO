package kr.co.lentcar.boarder.dao;

import java.util.List;
import java.util.Map;

import kr.co.lentcar.boarder.dto.BoardDTO;

public interface BoardDAO {

	public int insertNewArticle(Map articleMap) throws Exception;

	public List<BoardDTO> selectAllArticlesList() throws Exception;

}
