package kr.co.hugo.restaurant.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import kr.co.hugo.boarder.dto.ImageDTO;
import kr.co.hugo.restaurant.dto.RestaurantDTO;

public interface ResDAO {
	public RestaurantDTO selectRestView(int restIdx) throws DataAccessException;
	public List<RestaurantDTO> selectAllViews() throws DataAccessException;
	public List<RestaurantDTO> selectSteamList() throws DataAccessException;
	public List<RestaurantDTO> selectVisitList() throws DataAccessException;
	public List<RestaurantDTO> selectStarList() throws DataAccessException;
	public List<RestaurantDTO> selectDistanceList() throws DataAccessException;
	public List<RestaurantDTO> selectFamousList() throws DataAccessException;
	public ImageDTO selectresImgList(int restaurantIdx) throws DataAccessException;
}
