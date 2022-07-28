package kr.co.lentcar.boarder.service;

import java.util.List;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import kr.co.lentcar.boarder.dao.BoardDAO;
import kr.co.lentcar.boarder.dto.BoardDTO;

@Service("boardService")
@Transactional(propagation = Propagation.REQUIRED)
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDAO boardDAO;
	
	@Override
	public int addNewArticle(Map articleMap) throws Exception {
		// 글 정보를 저장한 후 글 번호를 가져옴
			int articleNO = boardDAO.insertNewArticle(articleMap);
			// 글번호를 articleMap에 저장한 후 
			articleMap.put("articleNO", articleNO);
			
			return articleNO;
	}

	@Override
	public List<BoardDTO> listArticles() throws Exception {
		List<BoardDTO> articlesList = boardDAO.selectAllArticlesList();
		return articlesList;
	}

}
