package kr.co.hugo.jjim.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

@Repository
public class JjimDAOImpl implements JjimDAO{
	
	@Autowired
	SqlSession sqlSession;

	@Override
	public int jjimCheckCount(Map<Object, Object> jjimCheckMap) throws DataAccessException {
		int count = sqlSession.selectOne("mapper.jjim.selectCheckJjimCount",jjimCheckMap);
		return count;
	}

	@Override
	public int deleteJjim(Map<Object, Object> jjimMap) throws DataAccessException {
		int count = sqlSession.delete("mapper.jjim.deleteJjim",jjimMap);
		return count;
	}

	@Override
	public int addJjim(Map<Object, Object> jjimMap) throws DataAccessException {
		int count = sqlSession.insert("mapper.jjim.addJjim",jjimMap);
		return count;
	}

	@Override
	public int selectJjimCount() throws DataAccessException {
		int count = sqlSession.selectOne("mapper.jjim.selectAllJjimCount");
		return count;
	}

	@Override
	public void deleteResJjim(int restIdx) throws DataAccessException {
		sqlSession.update("mapper.restaurant.deleteResJjim",restIdx);
		
	}

	@Override
	public void addResJjim(int restIdx) throws DataAccessException {
		sqlSession.update("mapper.restaurant.addResJjim",restIdx);
		
	}
	

}
