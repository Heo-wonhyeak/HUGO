package kr.co.lentcar.boarder.controller;

import java.util.Enumeration;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import kr.co.lentcar.boarder.dto.BoardDTO;
import kr.co.lentcar.boarder.service.BoardService;



@Controller
public class BoardControllerImpl implements BoardController {
	
	@Autowired
	private BoardService boardService;
	@Autowired
	private BoardDTO boardDTO;

	@RequestMapping(value="/board/*Form.do" , method= {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView form(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		
		return mav;
	}

	@Override
	@RequestMapping(value="/board/addNewArticle.do", method= RequestMethod.POST)
	@ResponseBody
	public ResponseEntity addNewArticle(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)
			throws Exception {
		multipartRequest.setCharacterEncoding("UTF-8");
		
		//글 정보 저장하기 위한 Map 생성
		Map articleMap = new HashMap<>();
		Enumeration enun = multipartRequest.getParameterNames();
		while(enun.hasMoreElements()) {
			String name = (String) enun.nextElement();
			String value = multipartRequest.getParameter(name);
			articleMap.put(name, value);
		}
		int articleNO = boardService.addNewArticle(articleMap);
		articleMap.put("articleNO", articleNO);
		
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		
		String message;
		ResponseEntity resEnt = null;
		
		message ="<script>";
		message +="alert('새글을 추가했습니다.');";
		message +="location.href='"+multipartRequest.getContextPath()+"/board/listArticles.do';";
		message +="</script>";
		// 새 글을 추가한 후 메시지를 전달함
		resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.OK); 
		
		return resEnt;
	}

	@Override
	@RequestMapping(value="/board/listArticles.do",method = { RequestMethod.GET,RequestMethod.POST})
	public ModelAndView listArticles(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String)request.getAttribute("viewName");
		
		List<BoardDTO> articlesList = boardService.listArticles();
		
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("articlesList", articlesList);
		
		return mav;
	}
}
