package kr.co.hugo.restaurant.dao;

import org.springframework.dao.DataAccessException;

import kr.co.hugo.restaurant.dto.RestaurantDTO;

public interface ResDAO {
	public RestaurantDTO selectRestView(int restIdx) throws DataAccessException;
}
