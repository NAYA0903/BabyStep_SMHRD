package com.babystep.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.babystep.db.SqlSessionManager;
import com.babystep.model.ScheduleDAO;
import com.babystep.model.ScheduleDTO;

public class ScheduleListServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String yearStr = request.getParameter("year");
        String monthStr = request.getParameter("month");
        String dayStr = request.getParameter("day");
        String userId = (String) request.getSession().getAttribute("id");

        // 날짜가 null이 아니면 처리
        if (yearStr != null && monthStr != null && dayStr != null && userId != null) {
            String fullDateStr = yearStr + "-" + monthStr + "-" + dayStr;
            java.sql.Date selectedDate = java.sql.Date.valueOf(fullDateStr);

            // ScheduleDAO를 통해 데이터베이스에서 해당 날짜의 일정을 조회
            ScheduleDAO scheduleDAO = new ScheduleDAO(SqlSessionManager.getSqlSession());

            List<ScheduleDTO> scheduleList = scheduleDAO.getSchedulesByDate(userId, selectedDate);

            System.out.println("scheduleList" + scheduleList);

            // 조회한 일정 리스트를 출력
            if (scheduleList != null && !scheduleList.isEmpty()) {
                for (ScheduleDTO sche : scheduleList) {
                    if (sche != null) {  // Null 체크 추가
                        response.getWriter().println("<p>" + sche.getScheTitle() + ": " + sche.getScheContent() + "</p>");
                    }
                }
            } else {
                response.getWriter().println("일정이 없습니다.");
            }
        } else {
            response.getWriter().println("잘못된 요청입니다.");
        }
    }
}
