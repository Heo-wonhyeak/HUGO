package kr.co.hugo.boarder.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import kr.co.hugo.boarder.dto.BoardDTO;
import kr.co.hugo.boarder.dto.ImageDTO;

public interface BoardDAO {

	public int insertNewArticle(Map articleMap) throws DataAccessException;
	public List<BoardDTO> selectAllReviewsList(int restIdx) throws DataAccessException;
	public ImageDTO selectReviewImage(int reviewIdx) throws DataAccessException;

}
