package Servlet;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Model.DBConnection;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");

        String filePath = getServletContext().getRealPath("/Register.jsp");

        if (filePath != null) {
            response.setContentType("text/html");
            Files.copy(Paths.get(filePath), response.getOutputStream());  // getOutputStream만 사용
        } else {
            response.getWriter().write("HTML file not found");  // 이 경우에만 getWriter() 호출
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    	request.setCharacterEncoding("UTF-8");
    	
    	response.setContentType("text/html; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
       
        // 닉네임 중복 확인 기능
        String action2 = request.getParameter("checkNickname");
        if ("check".equals(action2)) {
            handleNicknameCheck(request, response);
            return;
        }
        
        
        
        // 아이디 중복 확인 기능
        String action = request.getParameter("checkID");
        if ("check".equals(action)) {
            handleIDCheck(request, response);
            return;
        }

        // 회원가입 처리 로직
        String name = request.getParameter("NAME");
        String nickname = request.getParameter("NICKNAME");
        String ID = request.getParameter("ID");
        String password = request.getParameter("PW");
        String pw_check = request.getParameter("PW_Check");
        String email = request.getParameter("EMAIL");
        
        // 아이디 중복 확인 (회원가입 시 최종 확인)
        if (isNicknameExists(nickname)) {
            response.getWriter().println("<script>alert('이미 존재하는 닉네임입니다. 다시 입력하세요.'); history.back();</script>");
            return;
        }
        
        
        // 아이디 중복 확인 (회원가입 시 최종 확인)
        if (isIDExists(ID)) {
            response.getWriter().println("<script>alert('이미 존재하는 아이디입니다. 다시 입력하세요.'); history.back();</script>");
            return;
        }

        // 입력 값이 없을 때
        if (name == null || name.isEmpty()) {
            response.getWriter().println("<script>alert('이름을 입력하세요.'); history.back();</script>");
            return;
        } else if (nickname == null || nickname.isEmpty()) {
            response.getWriter().println("<script>alert('닉네임을 입력하세요.'); history.back();</script>");
            return;
        } else if (ID == null || ID.isEmpty()) {
            response.getWriter().println("<script>alert('아이디를 입력하세요.'); history.back();</script>");
            return;
        } else if (password == null || password.isEmpty()) {
            response.getWriter().println("<script>alert('비밀번호를 입력하세요.'); history.back();</script>");
            return;
        } else if (email == null || email.isEmpty()) {
            response.getWriter().println("<script>alert('이메일을 입력하세요.'); history.back();</script>");
            return;
        }

        // 비밀번호와 비밀번호 확인이 일치하지 않을 때
        if (password == null || !password.equals(pw_check)) {
            response.getWriter().println("<script>alert('비밀번호가 일치하지 않습니다.'); history.back();</script>");
            return;
        }

        // 비밀번호 해싱 (SHA-256 사용)
        String hashedPassword = hashPassword(password);

        try (Connection connection = DBConnection.getConnection()) {
            String sql = "INSERT INTO USERS (NAME, NICKNAME, ID, PW, EMAIL) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement statement = connection.prepareStatement(sql);

            statement.setString(1, name);
            statement.setString(2, nickname);
            statement.setString(3, ID);
            statement.setString(4, hashedPassword);
            statement.setString(5, email);
            statement.executeUpdate();
            response.sendRedirect("Login.html");
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("error.html");
        }
    }
    
    private boolean isNicknameExists(String nickname) {
        boolean exists = false;

        try (Connection connection = DBConnection.getConnection()) {
            String sql = "SELECT COUNT(*) FROM USERS WHERE NICKNAME = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, nickname);
            ResultSet rs = statement.executeQuery();

            if (rs.next()) {
                int count = rs.getInt(1);
                if (count > 0) {
                    exists = true;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return exists;
    }
    
    
    private boolean isIDExists(String userID) {
        boolean exists = false;

        try (Connection connection = DBConnection.getConnection()) {
            String sql = "SELECT COUNT(*) FROM USERS WHERE ID = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, userID);
            ResultSet rs = statement.executeQuery();

            if (rs.next()) {
                int count = rs.getInt(1);
                if (count > 0) {
                    exists = true;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return exists;
    }
    
    
    private void handleNicknameCheck(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String nickname = request.getParameter("NICKNAME");

        try (Connection connection = DBConnection.getConnection()) {
            String sql = "SELECT COUNT(*) FROM USERS WHERE NICKNAME = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, nickname);
            ResultSet rs = statement.executeQuery();

            if (rs.next()) {
                int count = rs.getInt(1);
                if (count > 0) {
                    request.setAttribute("checkNicknameResult", "이미 존재하는 닉네임입니다. 다시 입력하세요.");
                } else {
                    request.setAttribute("checkNicknameResult", "사용 가능한 닉네임입니다!");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("checkIDResult", "오류가 발생했습니다. 다시 시도해주세요.");
        }

        // 중복 확인 결과를 원래 폼으로 반환
        request.getRequestDispatcher("/Register.jsp").forward(request, response);
    }

    private void handleIDCheck(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String userID = request.getParameter("ID");

        try (Connection connection = DBConnection.getConnection()) {
            String sql = "SELECT COUNT(*) FROM USERS WHERE ID = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, userID);
            ResultSet rs = statement.executeQuery();

            if (rs.next()) {
                int count = rs.getInt(1);
                if (count > 0) {
                    request.setAttribute("checkIDResult", "이미 존재하는 아이디입니다. 다시 입력하세요.");
                } else {
                    request.setAttribute("checkIDResult", "사용 가능한 아이디입니다!");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("checkIDResult", "오류가 발생했습니다. 다시 시도해주세요.");
        }

        // 중복 확인 결과를 원래 폼으로 반환
        request.getRequestDispatcher("/Register.jsp").forward(request, response);
    }

    private String hashPassword(String password) {
        try {
            MessageDigest digest = MessageDigest.getInstance("SHA-256");
            byte[] encodedHash = digest.digest(password.getBytes());
            StringBuilder hexString = new StringBuilder(2 * encodedHash.length);
            for (byte b : encodedHash) {
                String hex = Integer.toHexString(0xff & b);
                if (hex.length() == 1) {
                    hexString.append('0');
                }
                hexString.append(hex);
            }
            return hexString.toString();
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException("RegisterServlet 비밀번호 해싱 과정 중 오류", e);
        }
    }
}
