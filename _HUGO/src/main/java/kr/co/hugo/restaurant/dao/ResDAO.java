package kr.co.hugo.restaurant.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import kr.co.hugo.restaurant.dto.RestaurantDTO;

public interface ResDAO {
	public RestaurantDTO selectRestView(int restIdx) throws DataAccessException;
	public List<RestaurantDTO> selectAllViews() throws DataAccessException;
}
