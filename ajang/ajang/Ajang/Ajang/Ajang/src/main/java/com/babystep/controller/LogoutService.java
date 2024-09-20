package com.babystep.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LogoutService extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void service (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 도달했는지 확인하기 위한 LogoutService
        System.out.println("==========================");
        System.out.println("[LogoutService]");
        System.out.println("==========================");
        
        HttpSession session = request.getSession();
		
        //session.invalidate();
		session.removeAttribute("id");
		
		// 세션 무효화 (세션 종료)
        session.invalidate();
	
        request.setAttribute("LogoutSuccess", "로그아웃 되었습니다.");
		response.sendRedirect("RegisterLogin.jsp");
	}

}
