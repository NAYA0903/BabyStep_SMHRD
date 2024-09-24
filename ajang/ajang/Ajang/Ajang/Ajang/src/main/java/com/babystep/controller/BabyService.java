package com.babystep.controller;

import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.Period;
import java.time.format.DateTimeFormatter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.babystep.db.SqlSessionManager;
import com.babystep.model.BabyDAO;
import com.babystep.model.BabyDTO;

public class BabyService extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 
		// 요청(Request) 인코딩 설정
        request.setCharacterEncoding("UTF-8");

        // 응답(Response) 인코딩 설정
        response.setContentType("text/html; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");

        // 요청으로부터 파라미터 수집
        String byName = request.getParameter("byName");
        String byBirthdateStr = request.getParameter("byBirthdate");
        String byGender = request.getParameter("byGender");
        String userId = (String) request.getSession().getAttribute("id");
        
        // 빈 값인 경우 일정 저장 로직을 실행하지 않고 리다이렉트
        if (byName == null || byName.isEmpty() ||
        	byBirthdateStr == null || byBirthdateStr.isEmpty() ||
        	byGender == null || byGender.isEmpty()) {
            response.sendRedirect("Main.jsp");  // 메인 페이지로 리다이렉트
            return;
        }

        // String을 java.sql.Date로 변환 (날짜 형식: yyyy-MM-dd)
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Date byBirthdate = null;

        try {
            // String을 java.sql.Date로 변환
        	byBirthdate = new Date(dateFormat.parse(byBirthdateStr).getTime());
        } catch (ParseException e) {
            e.printStackTrace();
            response.getWriter().write("날짜 변환에 실패했습니다.");
            return;
        }
        
      
        // 생년월일을 기준으로 개월 수 계산
        int byAge = calculateBabyAgeInMonths(byBirthdateStr);

        // ScheduleDTO 객체 생성 및 값 설정
        BabyDTO baby = new BabyDTO();
        baby.setByName(byName);
        baby.setByBirthdate(byBirthdate);
        baby.setByGender(byGender);
        baby.setByAge(byAge) ;
        baby.setUserId(userId);

        // DAO를 이용해 아기 추가
        BabyDAO babyDAO = new BabyDAO(SqlSessionManager.getSqlSession());
        int result = babyDAO.addBaby(baby);

        // 결과에 따라 페이지 이동 또는 응답
        if (result > 0) {
            response.sendRedirect("Main.jsp");  // 성공 시 메인 페이지로 리다이렉트
        } else {
            response.getWriter().write("아기 저장에 실패했습니다.");
        }
        
    }
	
	// 생년월일을 기준으로 개월 수를 계산하는 메서드
    private int calculateBabyAgeInMonths(String byBirthdateStr) {
        // 생년월일 문자열을 LocalDate로 변환
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDate birthdate = LocalDate.parse(byBirthdateStr, formatter);

        // 오늘 날짜
        LocalDate today = LocalDate.now();

        // 생년월일로부터 오늘까지의 경과 개월 수 계산
        Period period = Period.between(birthdate, today);
        int months = period.getYears() * 12 + period.getMonths();

        return months; // 아기의 개월 수 반환
    }

}
