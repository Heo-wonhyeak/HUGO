package kr.co.hugo.main;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

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
		List<RestaurantDTO> vistList = resService.resVisitList();
		List<RestaurantDTO> distanceList = resService.resDistanceList();
		List<RestaurantDTO> famousList = resService.resFamousList();
		
		
		
		ModelAndView mav = new ModelAndView();
		String viewName = (String)request.getAttribute("viewName");
		mav.setViewName(viewName);
		
		
		return mav;
	}
}
