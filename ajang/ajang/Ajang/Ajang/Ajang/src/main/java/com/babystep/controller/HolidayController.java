package com.babystep.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.babystep.model.HolidayDAO;
import com.babystep.model.HolidayDTO;

public class HolidayController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 요청 파라미터 받기
        int year = Integer.parseInt(request.getParameter("year"));
        int month = Integer.parseInt(request.getParameter("month"));
        
        // DAO를 통해 공휴일 리스트 가져오기
        HolidayDAO holidayDAO = new HolidayDAO();
        List<HolidayDTO> holidays = holidayDAO.getHolidaysByMonth(year, month);

        // 결과를 JSP에 전달
        request.setAttribute("holidays", holidays);
        request.getRequestDispatcher("Main.jsp").forward(request, response);
    }
}

