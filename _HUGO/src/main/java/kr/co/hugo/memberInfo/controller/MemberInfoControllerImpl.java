package kr.co.hugo.memberInfo.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.co.hugo.member.dto.MemberDTO;
import kr.co.hugo.memberInfo.service.MemberInfoService;

@Controller("memberInfoController")
public class MemberInfoControllerImpl implements MemberInfoController {
	
	@Autowired
	private MemberInfoService memberInfoService;
	@Autowired
	private MemberDTO memberDTO;
	
	@Override
	@RequestMapping(value = "/memberInfo/*.do", method = RequestMethod.GET)
	public ModelAndView memberInfoForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();	
		mav.setViewName(viewName);
		
		return mav;
	}
	
	@Override
	@RequestMapping(value = "/memberInfo/viewMemberInfo.do", method = RequestMethod.GET)
	public ModelAndView viewMemberInfo(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		memberDTO = (MemberDTO)session.getAttribute("member");
		String id = memberDTO.getId();
		
		MemberDTO member = memberInfoService.viewMemberInfo(id);
		session.setAttribute("member", member);
		
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();	
		mav.setViewName(viewName);
		return mav;
	}
	@Override
	@RequestMapping(value = "/memberInfo/updateMemberInfo.do", method = RequestMethod.POST)
	public ResponseEntity changeMemberInfo(@ModelAttribute MemberDTO member,HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		memberInfoService.updateMemberInfo(member);
		
		 HttpHeaders responseHeaders = new HttpHeaders();
		 responseHeaders.add("Content-Type", "text/html; charset=utf-8"); 
		 String message; 
		 ResponseEntity resEnt = null;
		 
		 message = "<script>"; 
		 message += "alert('수정이 완료되었습니다');";
		 message += " location.href='"+request.getContextPath()+"/memberInfo/viewMemberInfo.do';";
		 message += "</script>"; 
		
		 resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.OK); 
		
		 return resEnt; 
			
	}

	
}
