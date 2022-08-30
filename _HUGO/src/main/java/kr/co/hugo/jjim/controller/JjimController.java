package kr.co.hugo.jjim.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestParam;

public interface JjimController {
	
	// 찜 취소 
	public void jjimCancel(@RequestParam("restIdx") int restIdx,HttpServletRequest request, HttpServletResponse response) throws Exception;
	// 찜 추가
	public void jjimAdd(@RequestParam("restIdx") int restIdx,HttpServletRequest request, HttpServletResponse response) throws Exception;
}
