package com.babystep.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.babystep.model.UserDTO;
import com.babystep.model.VaccineDAO;
import com.babystep.model.VaccineDTO;

public class VaccineServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("VaccineServlet 도달");
        
        HttpSession session = request.getSession();

        // 세션에서 USER_ID와 addage 값 가져오기
        String USER_ID = (String) session.getAttribute("id");

     // 세션에서 addage 값을 문자열로 가져옴
        String addageStr = (String) session.getAttribute("addage");
        Integer babyage = null;
        
        if (addageStr != null) {
        	
            try {
            	babyage = Integer.parseInt(addageStr);
                System.out.println("백신 서블릿에서 받아온 아기 개월수 : "+ babyage);
            } catch (NumberFormatException e) {
                System.out.println("세션에서 가져온 babyage 값 변환 실패: " + e.getMessage());
            }
        }
        // 요청 인코딩 설정
        request.setCharacterEncoding("UTF-8");
        System.out.println();
        // 응답 인코딩 설정
        response.setContentType("text/html; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");

        // 백신 정보 가져오기
        List<VaccineDTO> age = new VaccineDAO().babyageselect(babyage);
        
        PrintWriter out = response.getWriter();

        boolean vaccineFound = false; // 백신이 발견되었는지 여부 확인용 변수

        if (age == null || age.isEmpty()) {
            out.println("<p>백신 정보가 없습니다.</p>");
        } else {
            out.println("<br>");
            out.println("<h3>백신 접종 정보</h3>");
            out.println("<br>");
            
            for (VaccineDTO vac : age ) {
                if (babyage == vac.getVAC_AGE()) {
                    // 백신이 있을 경우 정보 출력
                    out.println("<p>" + vac.getVAC_NAME() + " (접종 시기: " + vac.getVAC_AGE() + "개월)</p>");
                    vaccineFound = true;  // 백신 정보가 있음을 표시
                }
            }
            
            // 백신 정보가 없으면 출력
            if (!vaccineFound) {
              //  out.println("<p>백신 정보가 없습니다.</p>");
            }
        }

    }
}

