package com.babystep.controller;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.babystep.model.UserDAO;
import com.babystep.model.UserDTO;

public class RegisterService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 도달했는지 확인하기 위한 RegisterService
		System.out.println("==========================");
		System.out.println("[RegisterService]");
		System.out.println("==========================");

		// 1. 인코딩 작업
		request.setCharacterEncoding("UTF-8");

		// 2. 데이터 꺼내오기
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String nickname = request.getParameter("nickname");
		String addr = request.getParameter("addr");

		try {
			// 비밀번호 해싱 처리
			String hashedPassword = PasswordUtil.hashPassword(pw);

			// 3. 회원가입 로직 처리
			UserDTO dto = new UserDTO(id, hashedPassword, nickname, addr);
			UserDAO dao = new UserDAO();
			int result = dao.Register(dto);

			// 4. 결과 처리
			if (result > 0) {
				// 회원가입 성공시 닉네임을 공유하고 RegisterSuccess.jsp로 이동
				HttpSession session = request.getSession();
				session.setAttribute("nickname", nickname);
				session.setAttribute("id", id);
				response.sendRedirect("RegisterSuccess.jsp");

			} else {
				// 회원가입 실패 시 Main.jsp로 리다이렉트
				response.sendRedirect("Main.jsp");
			}
		} catch (NoSuchAlgorithmException e) {
			// 해싱 알고리즘이 없을 경우 발생하는 예외 처리
			e.printStackTrace();
			// 에러 페이지로 리다이렉트
			request.setAttribute("errorMessage", "비밀번호 해싱 중 오류가 발생했습니다.");
			RequestDispatcher dispatcher = request.getRequestDispatcher("Error.jsp");
			dispatcher.forward(request, response);
		}
	}
}
