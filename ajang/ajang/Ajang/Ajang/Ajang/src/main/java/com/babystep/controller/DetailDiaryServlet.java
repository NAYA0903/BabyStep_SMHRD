package com.babystep.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.babystep.db.SqlSessionManager;
import com.babystep.model.BabyDAO;
import com.babystep.model.BabyDTO;
import com.babystep.model.DiaryPopupDTO;

@WebServlet("/DetailDiaryServlet")
public class DetailDiaryServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    // 서비스 인스턴스 생성
    TodoService diaryService = new TodoService();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	
    	System.out.println("DetailDiaryServlet 도달");
    	
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
        String selectedDate = year + "-" + month + "-" +  day ;

        // 세션에서 사용자 ID 가져오기
        String USER_ID = (String) request.getSession().getAttribute("id");
        
        // 날짜와 사용자 ID에 맞는 다이어리 목록 가져오기
        List<DiaryPopupDTO> detaildiary = diaryService.detaildiary(USER_ID, selectedDate);
       

        
        // 데이터를 request 객체에 담아 JSP로 전달
        request.setAttribute("diaryList", detaildiary);
        
     // 응답 HTML 생성
        PrintWriter out = response.getWriter();
        if (detaildiary == null || detaildiary.isEmpty()) {
        	out.println("<h3>일기</h3>");
        	out.println("<br>");
            out.println("<p>작성된 일기가 없습니다.</p>");

        } else {
            for (DiaryPopupDTO diary : detaildiary) {
                out.println("<div class='diary-section-con'>");
                out.println("<h3>일기</h3>");
            	out.println("<br>");
            	
                out.println("<pre style='white-space: break-spaces'><span class = 'diarydetail'	>" + diary.getDI_CONTENT() + " </span><pre>");
               
                out.println("</div>");
            }
        }
    }
}
