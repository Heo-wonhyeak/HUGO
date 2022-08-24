package kr.co.hugo.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.hugo.member.dto.MemberDTO;

public interface MemberController {

	public ResponseEntity addMember(@ModelAttribute("member") MemberDTO memberDTO,HttpServletRequest request, 
			HttpServletResponse response) throws Exception;
	public ResponseEntity<String> duplicateCheck(@RequestParam("id") String id,
			HttpServletRequest request,HttpServletResponse response) throws Exception; 
	public	ResponseEntity login(@ModelAttribute("member")MemberDTO member,HttpServletRequest request,
			HttpServletResponse response,  RedirectAttributes rAttributes) throws Exception;
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response)  throws Exception; 
	public ResponseEntity searchPw(@ModelAttribute("member")MemberDTO member, HttpServletRequest request,
			HttpServletResponse response) throws Exception; 
	public ResponseEntity searchId(@ModelAttribute("member")MemberDTO member, HttpServletRequest request,
			HttpServletResponse response) throws Exception; 
	public ResponseEntity changePw(@RequestParam("pwd") String pwd ,HttpServletRequest request, HttpServletResponse response)  
			throws Exception; 
}
