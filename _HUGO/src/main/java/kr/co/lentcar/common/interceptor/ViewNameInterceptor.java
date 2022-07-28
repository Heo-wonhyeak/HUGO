package kr.co.lentcar.common.interceptor;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class ViewNameInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		// 브라우저의 요청명에서 뷰이름을 가져옴
		String viewName = getViewName(request);
		// 뷰이름을 request에 바인딩함
		request.setAttribute("viewName", viewName);
		
		return true;
	}
	
	// http://localhost:8080/annotation/member/listMembers.do
	// request 객체에서 URL 요청명을 가져와 .do를 제외한 요청을 구함
	private String getViewName(HttpServletRequest request) {

		String contextPath = request.getContextPath();
		int begin = 0;
		if (!((contextPath == null) || ("".equals(contextPath)))) {
			begin = contextPath.length();					//전체 요청명의 길이 
		}		
		
		int end;		
		
		//주소창의 현재 uri 받아오기
		String uri = (String) request.getAttribute("javax.servlet.include.request_uri");
		if(uri == null || uri.trim().equals("")) {
			uri = request.getRequestURI();
		}
				
		
		if (uri.indexOf(";") != -1) {
			end = uri.indexOf(";");
		} else if (uri.indexOf("?") != -1) {
			end = uri.indexOf("?");
		} else {
			end = uri.length();
		}
		
		
		String filename = uri.substring(begin, end);
		System.out.println("filename0:    " + filename);
		
		//  /member/listMembers.do
		if (filename.indexOf(".") != -1) {
			filename = filename.substring(0, filename.lastIndexOf("."));
		}
		
//		
		if (filename.indexOf("/") != -1) {
			//  /member/listMembers.do 요청할 경우 member/listMembers를 파일이름으로 가져옴
			filename = filename.substring(filename.lastIndexOf("/",1), filename.length());
		}		
		System.out.println(filename);
		return filename;
	}	
}
