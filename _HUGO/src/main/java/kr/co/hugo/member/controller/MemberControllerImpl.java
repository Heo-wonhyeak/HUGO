package kr.co.hugo.member.controller;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	
	@RequestMapping(value="/member/agree.do",method = RequestMethod.GET)
	public ModelAndView agree(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}

	@Override
	@RequestMapping(value = "/member/addMember.do", method = RequestMethod.POST)
	public ResponseEntity addMember(@ModelAttribute("member") MemberDTO memberDTO, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		request.setCharacterEncoding("utf-8");
		
		 HttpHeaders responseHeaders = new HttpHeaders();
		 responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		 String message; 
		 ResponseEntity resEnt = null;
		
		int result = memberService.addMember(memberDTO);
		
		 message = "<script>"; 
		 message += "alert('회원가입이 완료되었습니다.')";
		 message += " location.href='"+request.getContextPath()+"/main/main.do';";
		 message += "</script>"; 
		 resEnt = new ResponseEntity(message, responseHeaders,HttpStatus.CREATED); 
		 
		 return resEnt;
	}

	@Override
	@RequestMapping(value="/member/duplicateCheck.do",method = RequestMethod.POST)
	public ResponseEntity<String> duplicateCheck (@RequestParam(value = "id", required = false) String id, 
				HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(id);
		String result = memberService.duplicateCheck(id);
		System.out.println("======="+result);
		ResponseEntity<String> resEntity = new ResponseEntity<String>(result, HttpStatus.OK);
		
		return resEntity;
	}

	 @Override  
	  @RequestMapping(value="/member/login.do",method = RequestMethod.POST) public
	  ResponseEntity login(@ModelAttribute("member")MemberDTO member,
	  HttpServletRequest request, HttpServletResponse response,
	  RedirectAttributes rAttributes) throws Exception { 
		  memberDTO = memberService.login(member);
	  
		  HttpHeaders responseHeaders = new HttpHeaders();
		  responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		  String message; 
		  ResponseEntity resEnt = null;
		  
		  if (memberDTO != null) {
			  HttpSession session = request.getSession(); 
			  session.setAttribute("member", memberDTO);
			  session.setAttribute("isLogOn", true);
			  message = "<script>"; 
			  message += " location.href='"+request.getContextPath()+"/main/main.do';";
			  message += "</script>"; 
			  resEnt = new ResponseEntity(message, responseHeaders,HttpStatus.CREATED); 
			  }
		  else {
			  message = "<script>"; 
			  message += "alert('아이디나 비밀번호가 틀렸습니다');";
			  message += " location.href='"+request.getContextPath()+"/member/loginForm.do';";
			  message += "</script>"; 
			  resEnt = new ResponseEntity(message, responseHeaders,HttpStatus.CREATED); 
		  }
		 
		  return resEnt; 
	}

	  @Override
	  @RequestMapping(value = "/member/logout.do", method = RequestMethod.GET)
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws Exception {
		 
		ModelAndView mav = new ModelAndView();
		
		HttpSession session = request.getSession();
		session.removeAttribute("member");
		session.removeAttribute("isLogOn");
		
		mav.setViewName("redirect:/main/main.do");
		return mav;
	}
	  
	  @Override
	  @RequestMapping(value = "/member/searchId.do", method = RequestMethod.POST)
	public ResponseEntity searchId(MemberDTO member, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		  	
		  	HttpHeaders responseHeaders = new HttpHeaders();
			 responseHeaders.add("Content-Type", "text/html; charset=utf-8");
			 String message; 
			 ResponseEntity resEnt = null; 
			 
			 String id = memberService.searchId(member);
			 message = "<script>"; 
			  message += "alert('보유하신 아이디는 "+id+" 입니다.');";
			  message += " location.href='"+request.getContextPath()+"/member/loginForm.do';";
			  message += "</script>"; 
			  resEnt = new ResponseEntity(message, responseHeaders,HttpStatus.OK); 
			 return resEnt;
	}
	  
	  @Override
	  @RequestMapping(value = "/member/searchPw.do", method = RequestMethod.POST)
	public ResponseEntity searchPw(MemberDTO member, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		  HttpHeaders responseHeaders = new HttpHeaders();
		  responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		  String message; 
		  ResponseEntity resEnt = null; 
		  
		int isExist = memberService.searchPw(member);
		
		
		if(isExist==1) {
			HttpSession session = request.getSession();
			session.setAttribute("member", member);
			 message = "<script>"; 
			 message += " location.href='"+request.getContextPath()+"/member/changePwForm.do';";
			 message += "</script>"; 
			 resEnt = new ResponseEntity(message, responseHeaders,HttpStatus.OK); 
		}else {
			  message = "<script>"; 
			  message += "alert('아이디가 존재하지 않습니다');";
			  message += " location.href='"+request.getContextPath()+"/member/searchPwForm.do';";
			  message += "</script>"; 
			  resEnt = new ResponseEntity(message, responseHeaders,HttpStatus.OK); 
		}
		
		return resEnt;
	}
	  
	
	  
	@Override
	 @RequestMapping(value = "/member/updatePw.do", method = RequestMethod.POST)
	public ResponseEntity changePw(String pwd, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
		HttpSession session = request.getSession();
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		System.out.println(member.getId());
		System.out.println(member.getEmail());
		member.setPwd(pwd);
		memberService.updatePw(member);
		
		 HttpHeaders responseHeaders = new HttpHeaders();
		 responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		 String message; 
		 ResponseEntity resEnt = null; 
		
		 message = "<script>"; 
		  message += "alert('비밀번호가 변경되었습니다. 신규 비밀번호로 로그인해 주세요');";
		  message += " location.href='"+request.getContextPath()+"/member/loginForm.do';";
		  message += "</script>"; 
		  
		  resEnt = new ResponseEntity(message, responseHeaders,HttpStatus.OK);
		  return resEnt;
	}
	
}
