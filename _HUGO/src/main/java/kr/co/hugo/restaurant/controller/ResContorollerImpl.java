package kr.co.hugo.restaurant.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.co.hugo.member.dto.MemberDTO;
import kr.co.hugo.restaurant.service.ResService;

@Controller("resController")
public class ResContorollerImpl implements ResController{
	
	@Autowired
	ResService resService;
	
	@RequestMapping(value="/restaurants/restaurantView.do" , method= {RequestMethod.GET,RequestMethod.POST})
	@Override
	public ModelAndView restaurantView(@RequestParam("restIdx") int restIdx,HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String viewName = (String)request.getAttribute("viewName");	
		HttpSession session = request.getSession();
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("member");

		String id = null;
		if (memberDTO != null) {
			id = memberDTO.getId();
			
		}
		
		Map<String, Object> viewMap = new HashMap<>();
		viewMap.put("restIdx", restIdx);
		viewMap.put("id", id);	
		Map<String, Object> restMap = resService.restaurantView(viewMap);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		mav.addObject("restMap", restMap);
		return mav;
	}
	@RequestMapping(value="/restaurants/restaurantsReviewInfo.do" , method= {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView restaurantsReviewInfo(String id,HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		
		return mav;
	}
	@RequestMapping(value="/restaurants/restaurantsReviewWrite.do" , method= {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView restaurantsReviewWrite(String id,HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		
		return mav;
	}
	@RequestMapping(value="/restaurants/restaurantsPhoto.do" , method= {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView restaurantsPhoto(String id,HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		
		return mav;
	}
	@RequestMapping(value="/restaurants/restaurantsReviewMod.do" , method= {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView restaurantsReviewMod(String id,HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		
		return mav;
	}
	
}
