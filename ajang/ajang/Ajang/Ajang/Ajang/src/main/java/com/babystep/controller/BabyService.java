package com.babystep.controller;

import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.babystep.db.SqlSessionManager;

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
        String scheContent = request.getParameter("scheContent");
        String userId = (String) request.getSession().getAttribute("id");
        
        // 빈 값인 경우 일정 저장 로직을 실행하지 않고 리다이렉트
        if (byName == null || byName.isEmpty() ||
        	byBirthdateStr == null || byBirthdateStr.isEmpty() ||
        	byGender == null || byGender.isEmpty())
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

        // ScheduleDTO 객체 생성 및 값 설정
        BabyDTO sche = new ScheduleDTO();
        sche.setScheTitle(scheTitle);
        sche.setScheStDt(scheStDt);
        sche.setScheEdDt(scheEdDt);
        sche.setScheContent(scheContent);
        sche.setUserId(userId);

        // DAO를 이용해 일정 추가
        ScheduleDAO scheduleDAO = new ScheduleDAO(SqlSessionManager.getSqlSession());
        int result = scheduleDAO.addSchedule(sche);

        // 결과에 따라 페이지 이동 또는 응답
        if (result > 0) {
            response.sendRedirect("Main.jsp");  // 성공 시 메인 페이지로 리다이렉트
        } else {
            response.getWriter().write("일정 저장에 실패했습니다.");
        }
        
        // 일정 조회
        List<ScheduleDTO> schedules = scheduleDAO.getSchedulesByDate(sche);
        
        // JSON으로 변환 후 응답
        String jsonSchedules = new com.google.gson.Gson().toJson(schedules);
        response.getWriter().write(jsonSchedules);
    }

}
