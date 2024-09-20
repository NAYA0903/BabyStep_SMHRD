package com.babystep.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.babystep.model.TodoDTO;

public class TodoListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	    TodoService todoService = new TodoService();

	    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	       
       	    // 요청(Request) 인코딩 설정 (POST 방식)
	        request.setCharacterEncoding("UTF-8");

	        // 응답(Response) 인코딩 설정
	        response.setContentType("text/html; charset=UTF-8");
	        response.setCharacterEncoding("UTF-8");
	    	
	    	String year = request.getParameter("year");
	        String month = request.getParameter("month");
	        String day = request.getParameter("day");

	        // 선택된 날짜 생성
	        String selectedDate = year + "-" + month + "-" + day;
	        String userId = (String) request.getSession().getAttribute("id");

	        // TODO 리스트 가져오기
	        List<TodoDTO> todoList = todoService.getTodoListByDate(userId, selectedDate);

	        // 응답 HTML 생성
	        PrintWriter out = response.getWriter();
	        if (todoList == null || todoList.isEmpty()) {
	            out.println("<p>할 일이 없습니다.</p>");
	        } else {
	            for (TodoDTO todo : todoList) {
	                out.println("<div class='todo-item'>");
	                out.println("<img src='img/check.png' alt='아이콘'>");
	                out.println("<span>" + todo.getTodoContent() + " (" + (todo.getTodoDone().equals("Y") ? "완료" : "미완료") + ")</span>");
	                out.println("</div>");
	            }
	        }
	    }
	}
