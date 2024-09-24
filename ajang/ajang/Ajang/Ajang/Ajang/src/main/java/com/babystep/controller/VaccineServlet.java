package com.babystep.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.babystep.model.VaccineDAO;
import com.babystep.model.VaccineDTO;


public class VaccineServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		System.out.println("VaccineServlet 도달");
		
		HttpSession session = request.getSession();

		String addageStr = (String) session.getAttribute("addage");
		Integer addage = null;

		if (addageStr != null && !addageStr.isEmpty()) {
		    try {
		        // 문자열을 Integer로 변환
		        addage = Integer.parseInt(addageStr);
		    } catch (NumberFormatException e) {
		        System.out.println("Failed to parse addage: " + e.getMessage());
		    }
		} else {
		    // addage가 없으면 기본값으로 설정하거나 다른 처리 수행
		    System.out.println("addage is null or empty");
		    addage = 0; // 기본값 설정 예시
		}

		 // 요청 인코딩 설정
        request.setCharacterEncoding("UTF-8");

        // 응답 인코딩 설정
        response.setContentType("text/html; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        
		String USER_ID = (String)request.getSession().getAttribute("id");
		List<VaccineDTO> age = new VaccineDAO().babyageselect(USER_ID);
		
		 PrintWriter out = response.getWriter();
		 boolean vaccineFound = false;
	     
	            out.println("<h3>백신 접종 정보</h3>");
	            out.println("<br>");
	            for (VaccineDTO vac : age) {
	                if (addage == vac.getVAC_AGE()) {
	                    // 백신이 있을 경우 정보 출력
	                    out.println("<p>" + vac.getVAC_NAME() + " (접종 시기: " + vac.getVAC_AGE() + "개월)</p>");
	                    vaccineFound = true;  // 백신 정보가 있음을 표시
	                }
	            }
	            
	            // 백신 정보가 없으면 출력
	            if (!vaccineFound) {
	                out.println("<p>백신 정보가 없습니다.</p>");
	            }
	        }
}
