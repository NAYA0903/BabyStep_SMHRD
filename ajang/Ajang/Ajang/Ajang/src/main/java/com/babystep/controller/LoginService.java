package com.babystep.controller;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.babystep.model.UserDAO;

public class LoginService extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        // 1. 인코딩 작업
        request.setCharacterEncoding("UTF-8");
        
        // 2. 데이터 꺼내오기
        String id = request.getParameter("id");
        String pw = request.getParameter("pw");
        
        try {
            // 3. DAO에서 사용자 정보 가져오기
            UserDAO dao = new UserDAO();
            String storedPassword = dao.getPasswordById(id);  // DB에서 저장된 비밀번호 가져오기

            if (storedPassword != null) {
                // 입력된 비밀번호 해싱
                String hashedPassword = PasswordUtil.hashPassword(pw);

                // 입력한 해싱된 비밀번호와 저장된 해싱된 비밀번호 비교
                if (hashedPassword.equals(storedPassword)) {
                    // 비밀번호가 일치하는 경우
                    HttpSession session = request.getSession();  // 세션 생성 또는 기존 세션 가져오기
                    session.setAttribute("id", id);  // 세션에 사용자 ID 저장
                    session.setMaxInactiveInterval(30 * 60);  // 세션 타임아웃 설정 (30분)
                    response.sendRedirect("Main.jsp");
                } else {
                    // 비밀번호가 일치하지 않는 경우
                    request.setAttribute("errorMessage", "아이디 또는 비밀번호가 일치하지 않습니다.");
                    request.getRequestDispatcher("RegisterLogin.jsp").forward(request, response);
                }
            } else {
                // 아이디가 존재하지 않는 경우
                request.setAttribute("errorMessage", "해당 아이디가 존재하지 않습니다.");
                request.getRequestDispatcher("RegisterLogin.jsp").forward(request, response);
            }
            
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
            response.sendRedirect("error.html");  // 에러 페이지로 리다이렉트
        }
    }
}
