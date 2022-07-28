package kr.co.lentcar.event.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class EventControllerImpl implements EventController {

	@RequestMapping(value="/event/runningEventPage.do" , method= {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView runningEventPage(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		
		return mav;
	}
	
	@RequestMapping(value="/event/eventWriter.do" , method= {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView eventWriter(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		
		return mav;
	}
}
