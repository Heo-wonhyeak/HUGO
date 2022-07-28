package kr.co.hugo.boarder.dao;

import java.util.List;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.hugo.boarder.dto.BoardDTO;


@Repository("boardDAO")
public class BoardDAOImpl implements BoardDAO {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int insertNewArticle(Map articleMap) throws Exception {
		int articleNO = selectNewArticleNO();
		articleMap.put("articleNO", articleNO);
		int result=sqlSession.insert("mapper.board.insertNewArticle", articleMap);
		
		return articleNO;
	}

	public int selectNewArticleNO() {
		return sqlSession.selectOne("mapper.board.selectNewArticleNo");
	}

	@Override
	public List<BoardDTO> selectAllArticlesList() throws Exception {
		List<BoardDTO> articlesList = sqlSession.selectList("mapper.board.selectAllArticlesList");
		return articlesList;
	}

}
