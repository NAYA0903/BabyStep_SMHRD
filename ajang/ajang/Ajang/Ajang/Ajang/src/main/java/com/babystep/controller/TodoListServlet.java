package com.babystep.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.babystep.model.TodoDTO;

public class TodoListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	    TodoService todoService = new TodoService();
	    
	    @Override
	    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	       
	    	 // 요청(Request) 인코딩 설정
	        request.setCharacterEncoding("UTF-8");

	        // 응답(Response) 인코딩 설정
	        response.setContentType("text/html; charset=UTF-8");
	        response.setCharacterEncoding("UTF-8");

	        String method = request.getMethod(); // 요청 방식을 확인
	        String userId = (String) request.getSession().getAttribute("id");

	        if (method.equalsIgnoreCase("GET")) {
	            // GET 요청 처리
	            String year = request.getParameter("year");
	            String month = request.getParameter("month");
	            String day = request.getParameter("day");

	            String selectedDate = year + "-" + month + "-" + day;

	            List<TodoDTO> todoList = todoService.getTodoListByDate(userId, selectedDate);

	            PrintWriter out = response.getWriter();
	            
	            if (todoList == null || todoList.isEmpty()) {
	                out.println("<p>할 일이 없습니다.</p>");
	            } else {
	                for (TodoDTO todo : todoList) {
	                    if (todo != null) {
	                        out.println("<div class='todo-item'>");
	                        out.println("<img src='img/check.png' alt='아이콘'>");
	                        out.println("<span>" + todo.getTodoContent() + "</span>");
	                        out.println("</div>");
	                    }
	                }
	            }

	        } else if (method.equalsIgnoreCase("POST")) {
	            // POST 요청 처리
	            try {
	                String todoContent = request.getParameter("todoContent");
	                String todoDateStr = request.getParameter("todoDate");
	                String[] dateParts = todoDateStr.split("[년월일 ]+");

	                String formattedDate = String.format("%04d-%02d-%02d",
	                    Integer.parseInt(dateParts[0]),  // 년도
	                    Integer.parseInt(dateParts[1]),  // 월
	                    Integer.parseInt(dateParts[2])); // 일

	                Date todoDate = Date.valueOf(formattedDate);

	                if (todoContent == null || todoDate == null || userId == null) {
	                    throw new IllegalArgumentException("입력값이 유효하지 않습니다.");
	                }

	                todoService.addTodoListByDate(todoContent, todoDate, userId);

	                response.sendRedirect("Main.jsp");

	            } catch (Exception e) {
	                e.printStackTrace();
	                request.setAttribute("errorMessage", e.getMessage());
	                request.getRequestDispatcher("Error.html").forward(request, response);
	            }
	        }
	    }
	}
