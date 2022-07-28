package kr.co.hugo.restaurant.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ResContorollerImpl implements ResController{
	
	@RequestMapping(value="/restaurants/restaurantView.do" , method= {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView restaurantView(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		
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
