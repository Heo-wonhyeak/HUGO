package kr.co.hugo.main;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.co.hugo.boarder.dto.ImageDTO;
import kr.co.hugo.restaurant.dto.RestaurantDTO;
import kr.co.hugo.restaurant.service.ResService;

@Controller("mainController")
public class MainController {
	
	@Autowired
	ResService resService;

	@RequestMapping(value="/main/main.do", method= {RequestMethod.POST,RequestMethod.GET})
	public ModelAndView main(HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		List<RestaurantDTO> starList = resService.resStarList();
		List<RestaurantDTO> steamedList = resService.resSteamList();
		List<RestaurantDTO> visitList = resService.resVisitList();
		List<RestaurantDTO> distanceList = resService.resDistanceList();
		List<RestaurantDTO> famousList = resService.resFamousList();
		List<ImageDTO> starImgList = new ArrayList<>();
		List<ImageDTO> steamedImgList = new ArrayList<>();
		List<ImageDTO> visitImgList = new ArrayList<>();
		List<ImageDTO> distanceImgList = new ArrayList<>();
		List<ImageDTO> famousImgList = new ArrayList<>();
		String star50List = "starList";
		System.out.println(starList.size());
		
		for(int i=0;i<10;i++) {
			
			int restaurantIdx = starList.get(i).getRestIdx();
			ImageDTO starImag = resService.resImgList(restaurantIdx);
			starImgList.add(starImag); 
		}
		for(int i=0;i<steamedList.size();i++) {
			int restaurantIdx = steamedList.get(i).getRestIdx();
			ImageDTO steamImag = resService.resImgList(restaurantIdx);
			steamedImgList.add(steamImag);
		}
		for(int i=0;i<visitList.size();i++) {
			int restaurantIdx = visitList.get(i).getRestIdx();
			ImageDTO visitImag = resService.resImgList(restaurantIdx);
			visitImgList.add(visitImag);
		}
		for(int i=0;i<distanceList.size();i++) {
			int restaurantIdx = distanceList.get(i).getRestIdx();
			ImageDTO distanceImag = resService.resImgList(restaurantIdx);
			distanceImgList.add(distanceImag);
		}
		for(int i=0;i<famousList.size();i++) {
			int restaurantIdx = famousList.get(i).getRestIdx();
			ImageDTO famousImag = resService.resImgList(restaurantIdx);
			famousImgList.add(famousImag);
		}
		Map<Object,Object> top10List = new HashMap<>();
		top10List.put("starList", starList);
		top10List.put("steamedList", steamedList);
		top10List.put("visitList",visitList);
		top10List.put("distanceList", distanceList);
		top10List.put("famousList", famousList);
		top10List.put("starImgList", starImgList);
		top10List.put("steamedImgList", steamedImgList);
		top10List.put("visitImgList",visitImgList);
		top10List.put("distanceImgList", distanceImgList);
		top10List.put("famousImgList", famousImgList);	
		top10List.put("star50List",star50List);
		ModelAndView mav = new ModelAndView();
		String viewName = (String)request.getAttribute("viewName");
		mav.setViewName(viewName);
		mav.addObject("top10List", top10List);
		
		return mav;
	}
}
