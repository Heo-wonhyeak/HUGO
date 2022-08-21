package kr.co.hugo.restaurant.dao;



import java.util.List;

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

	@Override
	public List<RestaurantDTO> selectAllViews() throws DataAccessException {
		List<RestaurantDTO> AllResList = sqlSession.selectList("mapper.restaurant.selectAllViews");
		return AllResList;
	}

}
