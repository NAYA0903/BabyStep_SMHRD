package com.babystep.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.babystep.model.DiaryPopupDTO;


public class DiaryPopupServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    // 서비스 인스턴스 생성
    TodoService diaryService = new TodoService();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    	// 요청(Request) 인코딩 설정 (POST 방식)
        request.setCharacterEncoding("UTF-8");

        // 응답(Response) 인코딩 설정
        response.setContentType("text/html; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        
        // 선택한 날짜 가져오기
        String year = request.getParameter("year");
        String month = request.getParameter("month");
        String day = request.getParameter("day");
        
        // 
     
        // 선택된 날짜 생성
        String selectedDate = year + String.format("%02d", Integer.parseInt(month)) + String.format("%02d", Integer.parseInt(day));

        // 세션에서 사용자 ID 가져오기
        String USER_ID = (String) request.getSession().getAttribute("id");
        
        // 날짜와 사용자 ID에 맞는 다이어리 목록 가져오기
        List<DiaryPopupDTO> detaildiary = diaryService.detaildiary(USER_ID, selectedDate);
        
        System.out.println("데이터 3: " + detaildiary);

        // 데이터를 request 객체에 담아 JSP로 전달
        request.setAttribute("diaryList", detaildiary);
        
     // 응답 HTML 생성
        PrintWriter out = response.getWriter();
        if (detaildiary == null || detaildiary.isEmpty()) {
            out.println("<p>할 일이 없습니다.</p>");
        } else {
            for (DiaryPopupDTO diary : detaildiary) {
                out.println("<div class='diary-item'>");
                out.println("<span>" + diary.getDI_CONTENT() + " </span>");
                out.println("</div>");
            }
        }
    }
}