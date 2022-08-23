package kr.co.hugo.memberInfo.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.co.hugo.member.dto.MemberDTO;

public interface MemberInfoController {
	
	public ModelAndView memberInfoForm(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView viewMemberInfo(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ResponseEntity changeMemberInfo(@ModelAttribute MemberDTO member, HttpServletRequest request, HttpServletResponse response) throws Exception;
	//public ModelAndView wishList(HttpServletRequest request, HttpServletResponse response) throws Exception;

}
