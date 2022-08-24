package kr.co.hugo.restaurant.dao;



import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import kr.co.hugo.boarder.dto.ImageDTO;
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

	@Override
	public List<RestaurantDTO> selectSteamList() throws DataAccessException {
		List<RestaurantDTO> steamList = sqlSession.selectList("mapper.restaurant.selectSteamList");
		return steamList;
	}
	@Override
	public List<RestaurantDTO> selectVisitList() throws DataAccessException {
		List<RestaurantDTO> visitList = sqlSession.selectList("mapper.restaurant.selectVisitList");
		return visitList;
	}

	@Override
	public List<RestaurantDTO> selectStarList() throws DataAccessException {
		List<RestaurantDTO> starList = sqlSession.selectList("mapper.restaurant.selectStarList");
		return starList;
	}

	@Override
	public List<RestaurantDTO> selectDistanceList() throws DataAccessException {
		List<RestaurantDTO> distanceList = sqlSession.selectList("mapper.restaurant.selectDistanceList");
		return distanceList;
	}

	@Override
	public List<RestaurantDTO> selectFamousList() throws DataAccessException {
		List<RestaurantDTO> famousList = sqlSession.selectList("mapper.restaurant.selectFamousList");
		return famousList;
	}

	@Override
	public ImageDTO selectresImgList(int restaurantIdx) throws DataAccessException {
		ImageDTO imgList = sqlSession.selectOne("mapper.restaurant.selectImgList",restaurantIdx);
		return imgList;
	}

}
