<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입</title>
</head>
<body>
    <h2>회원가입</h2>
    <form action="register" method="post" id="registerForm">
    
        <!-- 이름 입력 칸 -->
        <label for="NAME">이름:</label>
        <input type="text" id="NAME" name="NAME" value="<%= request.getParameter("NAME") != null ? request.getParameter("NAME") : "" %>"><br><br>
        
        
        <!-- 아이디 입력 칸 -->
        <label for="ID">아이디:</label>
        <input type="text" id="ID" name="ID" value="<%= request.getParameter("ID") != null ? request.getParameter("ID") : "" %>" required>
      
        <!-- 아이디 중복확인 버튼 -->
        <button type="submit" name="checkID" value="check">중복확인</button><br><br>
        
        <!-- 중복 확인 결과 표시 -->
        <span id="checkIDResult">
            <% String checkIDResult = (String) request.getAttribute("checkIDResult");
               if (checkIDResult != null) {
                   out.println(checkIDResult);
               }
            %>
        </span><br><br>
        
        <!-- 닉네임 입력 칸 -->
        <label for="NICKNAME">닉네임:</label>
        <input type="text" id="NICKNAME" name="NICKNAME" value="<%= request.getParameter("NICKNAME") != null ? request.getParameter("NICKNAME") : "" %>">
        
        <!-- 닉네임 중복확인 버튼 -->
        <button type="submit" name="checkNickname" value="check">중복확인</button><br><br>
        
        <!-- 중복 확인 결과 표시 -->
        <span id="checkNicknameResult">
            <% String checkNicknameResult = (String) request.getAttribute("checkNicknameResult");
               if (checkNicknameResult != null) {
                   out.println(checkNicknameResult);
               }
            %>
        </span><br><br>
        
        <!-- 비밀번호 입력 칸 -->
        <label for="PW">비밀번호:</label>
        <input type="password" id="PW" name="PW"><br><br>
        
        <!-- 비밀번호 확인 입력 칸 -->
        <label for="PW_Check">비밀번호 확인:</label>
        <input type="password" id="PW_Check" name="PW_Check"><br><br>
        
        <!-- 이메일 입력 칸 -->
        <label for="EMAIL">이메일:</label>
        <input type="email" id="EMAIL" name="EMAIL" value="<%= request.getParameter("EMAIL") != null ? request.getParameter("EMAIL") : "" %>"><br><br>
        
        <input type="submit" value="회원가입">
    </form>
</body>
</html>
