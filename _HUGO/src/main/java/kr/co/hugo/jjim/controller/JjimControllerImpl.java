package kr.co.hugo.jjim.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.hugo.jjim.service.JjimService;
import kr.co.hugo.member.dto.MemberDTO;

@Controller
public class JjimControllerImpl implements JjimController {

	@Autowired
	JjimService jjimService;

	@Override
	@RequestMapping(value = "/jjim/jjimCancel.do", method = RequestMethod.GET)
	public void jjimCancel(@RequestParam("restIdx") int restIdx, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		int result = 0;
		HttpSession session = request.getSession();
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("member");
		String id = null;
		String nickName = null;
		Map<Object, Object> jjimMap = new HashMap<>();
		int jjimCount = 0;
		if (memberDTO != null) {
			id = memberDTO.getId();
			nickName = memberDTO.getNickname();
			jjimMap.put("id", id);
			jjimMap.put("nickName", nickName);
			jjimMap.put("restIdx", restIdx);
			result = jjimService.deleteJjim(jjimMap);
			jjimService.deleteResJjim(restIdx);
		}
		if(result == 0) {
			System.out.println("찜 삭제하기 오류");
		}
		else {
			System.out.println("찜 삭제하기 성공");
		}
	}

	@Override
	@RequestMapping(value = "/jjim/jjimAdd.do", method = RequestMethod.GET)
	public void jjimAdd(@RequestParam("restIdx") int restIdx, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		int result = 0;
		// 전체 찜 수 조회 
		int jjimCount = jjimService.jjimCount();
		HttpSession session = request.getSession();
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("member");
		String id = null;
		String nickName = null;
		Map<Object, Object> jjimMap = new HashMap<>();
		if (memberDTO != null) {
			id = memberDTO.getId();
			nickName = memberDTO.getNickname();
			jjimMap.put("id", id);
			jjimMap.put("nickName", nickName);
			jjimMap.put("restIdx", restIdx);
			jjimMap.put("jjimCount", jjimCount);
			result = jjimService.AddJjim(jjimMap);
			jjimService.addResJjim(restIdx);
		}
		if(result == 0) {
			System.out.println("찜 추가하기 오류");
		}
		else {
			System.out.println("찜 추가하기 성공");
		}
	}

}
