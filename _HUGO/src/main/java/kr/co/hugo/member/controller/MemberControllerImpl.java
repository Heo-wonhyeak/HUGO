package kr.co.hugo.member.controller;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.co.hugo.member.dto.MemberDTO;
import kr.co.hugo.member.service.MemberService;



@Controller("memberController")
@EnableAspectJAutoProxy 
public class MemberControllerImpl implements MemberController {

	@Autowired
	private MemberService memberService;
	
	@Autowired
	private MemberDTO memberDTO;

	/*
	 * 로그인창 요청 시 매개변수 result가 전송되면 
	 * 변수 result에 값을 저장함.
	 * 매개변수 result가 전송되지 않으면 무시함.
	 */
	@RequestMapping(value = "/member/*Form.do", method = RequestMethod.GET)
	public ModelAndView form(@RequestParam(value = "result", required = false) String result,
							@RequestParam(value="action" , required = false)String action,
							HttpServletRequest request, HttpServletResponse response) throws Exception {
		//String viewName = getViewName(request);
		
		//interceptor에서 바인딩된 뷰이름을 가져옴
		String viewName = (String) request.getAttribute("viewName");
		
		HttpSession session = request.getSession();
		session.setAttribute("action", action);
		
		//db 연동 작업이 없는 입력창 요청시 뷰이름만 ModelAndView로 반환함
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}

	@Override
	@RequestMapping(value = "/member/addMember.do", method = RequestMethod.POST)
	public ModelAndView addMember(@ModelAttribute("member") MemberDTO memberDTO, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		request.setCharacterEncoding("utf-8");
		
		//설정된 MemberDTO 객체를 SQL문으로 전달해 회원등록 함
		int result = memberService.addMember(memberDTO);
		ModelAndView mav = new ModelAndView("redirect:/main/main.do");
		return mav;
	}

	@Override
	@RequestMapping(value="/member/duplicateCheck.do",method = RequestMethod.POST)
	public ResponseEntity<String> duplicateCheck(String id, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String result = memberService.duplicateCheck(id);
		ResponseEntity<String> resEntity = new ResponseEntity<String>(result, HttpStatus.OK);
		
		return resEntity;
	}
	
	
}
