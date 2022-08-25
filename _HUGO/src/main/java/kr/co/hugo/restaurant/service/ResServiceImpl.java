package kr.co.hugo.restaurant.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.hugo.boarder.dto.ImageDTO;
import kr.co.hugo.restaurant.dao.ResDAO;
import kr.co.hugo.restaurant.dto.RestaurantDTO;

@Service("resService")
public class ResServiceImpl implements ResService{
	
	@Autowired
	ResDAO resDAO;

	@Override
	public Map<String, Object> restaurantView(Map<String, Object> viewMap) throws Exception {
		
		Map<String,Object> restMap = new HashMap<>();
		int restIdx =(int) viewMap.get("restIdx");
		RestaurantDTO restaurant = resDAO.selectRestView(restIdx);
		String menuList = restaurant.getRestMenuList();
		String[] menuListTemp = menuList.split("cut");
		List<String> menuListarr = new ArrayList<>();
		for(int i=0;i<menuListTemp.length;i++) {
			menuListarr.add(menuListTemp[i]);
		}
		restMap.put("menuListarr",menuListarr);
		
		// 이미지 부분 정보 요청
		List<ImageDTO> imgList = resDAO.resImgList(restIdx);
		
		restMap.put("restaurant", restaurant);
		restMap.put("menuList",menuList);
		restMap.put("imgList", imgList);
		return restMap;
	}

	@Override
	public List<RestaurantDTO> resAllList() throws Exception {
		List<RestaurantDTO> resAllList = resDAO.selectAllViews();
		return resAllList;
	}

	@Override
	public List<RestaurantDTO> resSteamList() throws Exception {
		List<RestaurantDTO> resSteamList = resDAO.selectSteamList();
		return resSteamList;
	}

	@Override
	public List<RestaurantDTO> resVisitList() throws Exception {
		List<RestaurantDTO> resVisitList = resDAO.selectVisitList();
		return resVisitList;
	}

	@Override
	public List<RestaurantDTO> resStarList() throws Exception {
		List<RestaurantDTO> resStarList = resDAO.selectStarList();
		return resStarList;
	}

	@Override
	public List<RestaurantDTO> resDistanceList() throws Exception {
		List<RestaurantDTO> resDistanceList = resDAO.selectDistanceList();
		return resDistanceList;
	}

	@Override
	public List<RestaurantDTO> resFamousList() throws Exception {
		List<RestaurantDTO> resFamousList = resDAO.selectFamousList();
		return resFamousList;
	}

	@Override
	public ImageDTO resImgList(int restaurantIdx) throws Exception {	
		ImageDTO imageFileList = resDAO.selectresImgList(restaurantIdx);
		return imageFileList;
	}

}
