package com.babystep.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.babystep.db.SqlSessionManager;
import com.babystep.model.BabyDAO;
import com.babystep.model.BabyDTO;
import com.babystep.model.VaccineDAO;
import com.babystep.model.VaccineDTO;

import jakarta.websocket.Session;

public class BabyAgeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		System.out.println("BabyageServlet 도달");
		 // 요청(Request) 인코딩 설정 (POST 방식)
        request.setCharacterEncoding("UTF-8");

        // 응답(Response) 인코딩 설정
        response.setContentType("text/html; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");

        // 파라미터 값 확인
        String year = request.getParameter("year");
        String month = request.getParameter("month");
        String day = request.getParameter("day");

        // 선택된 날짜 생성
        String selectedDate = year + "-" + month + "-" + day;

        // 세션에서 USER_ID 가져오기
        String USER_ID = (String) request.getSession().getAttribute("id");

        BabyDAO babyDAO = new BabyDAO(SqlSessionManager.getSqlSession());        
        String babyage = babyDAO.upbabyage(USER_ID,selectedDate);

        // 세션에 upbabyage 저장
        HttpSession session = request.getSession();
        
     // 세션에 addageStr 저장
        if (babyage != null) {
            session.setAttribute("addage", babyage);
            System.out.println("아기 개월수 : " + babyage);
          
                // babyage를 정수형으로 변환하여 VaccineDAO 메서드 호출
                Integer babyAge1 = Integer.parseInt(babyage);
                List<VaccineDTO> vaccines = new VaccineDAO().babyageselect(babyAge1);
                // vaccines 사용
            } else {
                // babyage가 null일 때 처리
                System.out.println("아기 개월수가 null입니다.");
            }

         


        // DiaryPopup.jsp로 리다이렉트
        response.sendRedirect("DiaryPopup.jsp");
        }  
        }
