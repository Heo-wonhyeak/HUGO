<%@page import="kr.co.ezenac.model1.utils.JsFunction"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
 	if (session.getAttribute("UserId") == null) { 
 		JsFunction.alertLocation("로그인 후 이용해주세요.", "../session/loginForm.jsp", out);
 		return;		
 	}
 %>