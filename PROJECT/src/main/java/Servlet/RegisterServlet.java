package Servlet;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
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

	    String filePath = getServletContext().getRealPath("/Register.html");

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
    	
    	response.setContentType("text/html; charset=UTF-8");
    	response.setCharacterEncoding("UTF-8");
    	
        String ID = request.getParameter("ID");
        String password = request.getParameter("PASSWORD");
        String email = request.getParameter("EMAIL");

        // 입력 값 검증
        if (ID == null || ID.isEmpty() || password == null || password.isEmpty() || email == null || email.isEmpty()) {
            response.sendRedirect("error.html");
            return;
        }

        // 비밀번호 해싱 (SHA-256 사용)
        String hashedPassword = hashPassword(password);

        try (Connection connection = DBConnection.getConnection()) {
            String sql = "INSERT INTO USERS (ID, PASSWORD, EMAIL) VALUES (?, ?, ?)";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, ID);
            statement.setString(2, hashedPassword);
            statement.setString(3, email);
            statement.executeUpdate();
            response.sendRedirect("Login.html");
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("error.html");
        }
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