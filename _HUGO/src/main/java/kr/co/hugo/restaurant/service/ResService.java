package kr.co.hugo.restaurant.service;

import java.util.List;
import java.util.Map;

import kr.co.hugo.restaurant.dto.RestaurantDTO;

public interface ResService {
	public Map<String, Object> restaurantView(Map<String, Object> viewMap) throws Exception;

	public List<RestaurantDTO> resAllList() throws Exception;

	public List<RestaurantDTO> resSteamList() throws Exception;

	public List<RestaurantDTO> resVisitList() throws Exception;

	public List<RestaurantDTO> resStarList() throws Exception;

	public List<RestaurantDTO> resDistanceList() throws Exception;
	// 시간있으면 코드구현
	public List<RestaurantDTO> resFamousList() throws Exception;
}
