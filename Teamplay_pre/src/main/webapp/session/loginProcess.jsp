<%@page import="kr.co.ezenac.model1.Membership.MemberDTO"%>
<%@page import="kr.co.ezenac.model1.Membership.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String userId = request.getParameter("user_id");
	String userPw = request.getParameter("user_pw");
	
	String oracleDriver = application.getInitParameter("OracleDriver");
	String oracleURL = application.getInitParameter("OracleURL");
	String oracleId = application.getInitParameter("OracleId");
	String oraclePwd = application.getInitParameter("OraclePwd");

	MemberDAO dao = new MemberDAO(oracleDriver,oracleURL,oracleId,oraclePwd);
	MemberDTO memberDTO = dao.getMember(userId, userPw);
	dao.close();
	
	if (memberDTO.getId() != null) {
		session.setAttribute("UserId", memberDTO.getId());
		session.setAttribute("UserName", memberDTO.getName());
		response.sendRedirect("loginForm.jsp");
	}
	else {
		request.setAttribute("loginErrMsg", "로그인 오류입니다.");
		request.getRequestDispatcher("loginForm.jsp").forward(request, response);
		
	}
%>
    
    
    
    
    
    
    
    
    
    
    
    
    
    