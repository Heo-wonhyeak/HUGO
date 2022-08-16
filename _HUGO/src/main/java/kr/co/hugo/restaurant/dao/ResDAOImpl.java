package kr.co.hugo.restaurant.dao;

import org.apache.ibatis.jdbc.SQL;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import kr.co.hugo.restaurant.dto.RestaurantDTO;

@Repository
public class ResDAOImpl implements ResDAO{
	
	@Autowired
	SqlSession sqlSession;

	@Override
	public RestaurantDTO selectRestView(int restIdx) throws DataAccessException {
		return sqlSession.selectOne("mapper.restaurant.selectRestView", restIdx);
	}

}
