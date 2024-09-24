package com.babystep.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.babystep.model.VaccineDAO;
import com.babystep.model.VaccineDTO;


public class VaccineServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		System.out.println("VaccineServlet 도달");
		
		 // 요청 인코딩 설정
        request.setCharacterEncoding("UTF-8");

        // 응답 인코딩 설정
        response.setContentType("text/html; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        
		String USER_ID = (String)request.getSession().getAttribute("id");
		List<VaccineDTO> age = new VaccineDAO().babyageselect(USER_ID);
		
		 PrintWriter out = response.getWriter();
	        if (age == null || age.isEmpty()) {
	            out.println("<p>백신 정보가 없습니다.</p>");
	        } else {
	        	out.println("<br>");
	            out.println("<h3>백신 접종 정보</h3>");
	            out.println("<br>");
	            for (VaccineDTO vac : age) {
	                out.println("<p>" + vac.getVAC_NAME() + " (접종 시기: " + vac.getVAC_AGE() + "개월)</p>");
	            }
	        }
	}

}
