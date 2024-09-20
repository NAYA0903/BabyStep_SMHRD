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
    	System.out.println("DiaryPopupServlet 도달");
    	// 요청(Request) 인코딩 설정 (POST 방식)
        request.setCharacterEncoding("UTF-8");

        // 응답(Response) 인코딩 설정
        response.setContentType("text/html; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        
     // 파라미터 값 확인
        String year = request.getParameter("year");
        String month = request.getParameter("month");
        String day = request.getParameter("day");

        if (year == null || month == null || day == null || year.isEmpty() || month.isEmpty() || day.isEmpty()) {
            // 만약 값이 없으면 기본값을 설정하거나 오류 메시지를 출력
            System.out.println("잘못된 파라미터 값이 전달되었습니다.");
        } else {
            System.out.println("year: " + year + ", month: " + month + ", day: " + day);
        }

        
   
     
        // 선택된 날짜 생성
        String selectedDate = year + "-" + month + "-" +  day ;

        // 세션에서 사용자 ID 가져오기
        String USER_ID = (String) request.getSession().getAttribute("id");
        
        // 날짜와 사용자 ID에 맞는 다이어리 목록 가져오기
        List<DiaryPopupDTO> detaildiary = diaryService.detaildiary(USER_ID, selectedDate);
        
     
        System.out.println("Selected Date: " + selectedDate);
        System.out.println("USER_ID: " + USER_ID);
        System.out.println("detaildiary: " + detaildiary);

        
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
