package kr.co.hugo.restaurant.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.co.hugo.member.dto.MemberDTO;

@Controller
public class ResContorollerImpl implements ResController{
	
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
//		viewMap.put("articleNO", articleNO);
		viewMap.put("id", id);

		// Map<String, Object> articleMap = boardService.viewArticle(articleNO); // 조회할 글 정보,이미지파일 정보를 articleMap에 설정
//		Map<String, Object> articleMap = boardService.viewArticle(viewMap);
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
//		mav.addObject("articleMap", articleMap);

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
