package kr.co.hugo.restaurant.service;

import java.util.List;
import java.util.Map;

import kr.co.hugo.restaurant.dto.RestaurantDTO;

public interface ResService {
	public Map<String, Object> restaurantView(Map<String, Object> viewMap) throws Exception;

	public List<RestaurantDTO> resAllList() throws Exception;
}
