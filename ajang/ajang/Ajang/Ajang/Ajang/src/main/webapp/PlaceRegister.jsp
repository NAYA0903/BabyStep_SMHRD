<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<%
    HttpSession sessHttpSession = request.getSession(false); // 현재 세션 가져오기
    String userId = null;
    if (session != null) {
        userId = (String) session.getAttribute("userId"); // 세션에서 사용자 ID 가져오기
    }
%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>장소 등록</title>
    <link rel="stylesheet" href="assets/css/PlaceAll.css">
    <link rel="stylesheet" href="assets/css/PlaceRegister.css">
</head>
<body>
    <header>
        <h1>장소 등록</h1>
    </header>
    <main>
        <div class="container">
            <form id="register-form" enctype="multipart/form-data">
                <input type="hidden" name="userId" value="<%= userId != null ? userId : "" %>"> <!-- 사용자 ID 추가 -->

                <label for="category">카테고리:</label>
                <select id="category" name="placeCategory">
                    <option value="cafe">카페</option>
                    <option value="restaurant">식당</option>
                </select>
                
                <label for="photo">사진:</label>
                <input type="file" id="photo" name="placePhoto" required>
                
                <label for="name">장소명:</label>
                <input type="text" id="name" name="placeName" required>
                
                <label for="address">주소:</label>
                <input type="text" id="address" name="placeAddr" required>
                
                <label for="phone">전화번호:</label>
                <input type="text" id="phone" name="placeTel" required>
                
                <label for="sns">SNS 계정 (선택 사항):</label>
                <input type="text" id="sns" name="placeSns">
                
                <label for="comment">코멘트:</label>
                <textarea id="comment" name="placeComment" maxlength="50"></textarea>
                
                <button type="submit">등록 요청</button>
            </form>
        </div>
    </main>
    <script src="assets/js/PlaceRegister.js"></script>
</body>
</html>
