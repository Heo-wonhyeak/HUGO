package kr.co.hugo.restaurant.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
//		List<ImageDTO> imageFileList = boardDAO.selectImageFileLIst(articleNO);
		
		restMap.put("restaurant", restaurant);
		restMap.put("menuList",menuList);
//		articleMap.put("imageFileList", imageFileList);
		return restMap;
	}

	@Override
	public List<RestaurantDTO> resAllList() throws Exception {
		List<RestaurantDTO> resAllList = resDAO.selectAllViews();
		return resAllList;
	}

}
