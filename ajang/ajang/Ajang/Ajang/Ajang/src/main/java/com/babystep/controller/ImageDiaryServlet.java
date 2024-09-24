package com.babystep.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.babystep.model.DiaryPopupDAO;
import com.babystep.model.DiaryPopupDTO;

@WebServlet("/ImageDiaryServlet")
public class ImageDiaryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.println("ImageDiaryServlet 도달");

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

		String USER_ID = (String) request.getSession().getAttribute("id");

		List<DiaryPopupDTO> imagediary = new DiaryPopupDAO().detaildiary(USER_ID, selectedDate);

		PrintWriter out = response.getWriter();

		if (imagediary == null || imagediary.isEmpty()) {
			out.print("<h3>이미지</h3>");
			out.println("<br>");
			out.println("<p>작성된 이미지가 없습니다</p>");
		
		} else {
			out.print("<h3>이미지</h3>");
			out.println("<br>");
			for (DiaryPopupDTO image : imagediary) {
				if (image != null) {
					out.println("<img class='image-upload-section-con' src='./file/" + image.getDI_FILE1() + "' onerror=\"this.style.display='none'\">");;
				} 
				if (image != null) {
					out.println("<img class='image-upload-section-con' src='./file/" + image.getDI_FILE2() + "' onerror=\"this.style.display='none'\">");

				} 
			}
		}
	}

}
