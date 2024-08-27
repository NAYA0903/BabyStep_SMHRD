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



@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {
	    response.setContentType("text/html; charset=UTF-8");
	    response.setCharacterEncoding("UTF-8");

	    String filePath = getServletContext().getRealPath("/Login.html");

	    if (filePath != null) {
	        response.setContentType("text/html");
	        Files.copy(Paths.get(filePath), response.getOutputStream());  // getOutputStream만 사용
	    } else {
	        response.getWriter().write("HTML file not found");  // 이 경우에만 getWriter() 호출
	    }
	    
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String ID = request.getParameter("ID");
		String password = request.getParameter("PASSWORD");

		// 비밀번호 해싱 (SHA-256 사용)
		String hashedPassword = hashPassword(password);

		try (Connection connection = DBConnection.getConnection()) {
			String sql = "SELECT PASSWORD FROM USERS WHERE ID = ?";
			PreparedStatement statement = connection.prepareStatement(sql);
			statement.setString(1, ID);

			ResultSet rs = statement.executeQuery();

			if (rs.next()) {
				String storedPassword = rs.getString("PASSWORD");
				

				// 입력한 비밀번호의 해시 값과 데이터베이스의 해시 값 비교
				if (hashedPassword.equals(storedPassword)) {

					// 비밀번호가 일치하는 경우
					response.sendRedirect("Main.html");  
				} else {

					// 비밀번호가 일치하지 않는 경우
					response.sendRedirect("Login.html?error=invalid");  
				}

			}

		} catch (SQLException e) {
			e.printStackTrace();
			response.sendRedirect("error.html");  // 상대 경로로 변경
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
			throw new RuntimeException("LoginServlet 비밀번호 해싱 과정 중 오류", e);
		}
	}
}
