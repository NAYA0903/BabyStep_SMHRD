package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {

    public static Connection getConnection() throws SQLException {
        // 데이터베이스 URL, 사용자 이름, 비밀번호를 코드에 직접 설정
        String url = "jdbc:oracle:thin:@localhost:1521:xe"; // 데이터베이스 URL
        String username = "TEST"; // 데이터베이스 사용자 이름
        String password = "12345"; // 데이터베이스 비밀번호

        return DriverManager.getConnection(url, username, password);
    }
}