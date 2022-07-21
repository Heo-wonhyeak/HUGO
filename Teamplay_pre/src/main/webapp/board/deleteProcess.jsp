<%@page import="kr.co.ezenac.model1.board.BoardDAO"%>
<%@page import="kr.co.ezenac.model1.board.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./isLoggedIn.jsp"%> 

<%
	String num = request.getParameter("num"); 	
	
	BoardDTO dto = new BoardDTO();
	BoardDAO dao = new BoardDAO(application);
	dto = dao.selectView(num);					
	
	String sessionId = session.getAttribute("UserId").toString();
	
	int delResult = 0;
	
	if (sessionId.equals(dto.getId())) {
		dto.setNum(num);
		delResult = dao.deletPost(dto);			
		dao.close();
		
		if (delResult == 1) {
			JsFunction.alertLocation("삭제되었습니다.", "list.jsp", out);
		}
		else {
			JsFunction.alertBack("삭제에 실패했습니다.", out);
		}
	}
	else {
		JsFunction.alertBack("본인만 삭제할 수 있습니다.", out);
		return;
	}
%>


