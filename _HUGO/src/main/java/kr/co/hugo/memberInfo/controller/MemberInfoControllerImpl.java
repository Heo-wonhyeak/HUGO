package kr.co.hugo.memberInfo.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller("memberInfoController")
public class MemberInfoControllerImpl implements MemberInfoController {
	
	@Override
	@RequestMapping(value = "/memberInfo/*.do", method = RequestMethod.GET)
	public ModelAndView memberInfoForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();	
		mav.setViewName(viewName);
		
		return mav;
	}
	

	
}
