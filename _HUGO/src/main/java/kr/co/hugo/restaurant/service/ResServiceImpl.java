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
public class ResServiceImpl implements ResService {

	@Autowired
	ResDAO resDAO;

	@Override
	public Map<String, Object> restaurantView(Map<String, Object> viewMap) throws Exception {

		Map<String, Object> restMap = new HashMap<>();
		int restIdx = (int) viewMap.get("restIdx");
		RestaurantDTO restaurant = resDAO.selectRestView(restIdx);
		String menuList = restaurant.getRestMenuList();
		String[] menuListTemp = menuList.split("cut");
		List<String> menuListarr = new ArrayList<>();
		for (int i = 0; i < menuListTemp.length; i++) {
			menuListarr.add(menuListTemp[i]);
		}
		restMap.put("menuListarr", menuListarr);

		// 이미지 부분 정보 요청
		List<ImageDTO> imgList = resDAO.resImgList(restIdx);

		restMap.put("restaurant", restaurant);
		restMap.put("menuList", menuList);
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

	@Override
	public void resPlusVisitCount(int restIdx) throws Exception {
		resDAO.plusVisitCount(restIdx);
	}

	@Override
	public Map<Object,Object> resSearchList(String search,int list) throws Exception {
		
		Map<Object,Object> resArrayMap = new HashMap<>();
		Map<Object,Object> resultMap = new HashMap<>();
		search = search.toUpperCase();
		resArrayMap.put("search", search);
		// 별점순 정렬 (default)
		String array = "RESTSTARAVG";
		// 방문순 정렬
		if(list == 2) {
			array = "RESTVISITCOUNT";		
		}
		// 찜순 정렬
		else if(list == 3) {
			array = "RESTJJIM";
		}
		// 거리순 정렬
		else if(list == 4) {
			array = "RESTVISITCOUNT";
		}
		// 인기순 정렬
		else if(list == 5) {
			array = "RESTSTARAVG";
		}
		resArrayMap.put("array", array);
		List<RestaurantDTO> resSearchList = resDAO.selectSearchList(resArrayMap);
		List<ImageDTO> listImgs = new ArrayList<>();
		for (int i = 0; i < resSearchList.size(); i++) {
			int restaurantIdx = resSearchList.get(i).getRestIdx();
			ImageDTO listImg = resDAO.selectresImgList(restaurantIdx);
			listImgs.add(listImg);
		}
		resultMap.put("resSearchList", resSearchList);
		resultMap.put("listImgs", listImgs);	
		return resultMap;
	}

}
