<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
            <form id="register-form">
                <label for="category">카테고리:</label>
                <select id="category" name="category">
                    <option value="cafe">카페</option>
                    <option value="restaurant">식당</option>
                    <!-- 추가 카테고리 -->
                </select>
                
                <label for="photo">사진 URL:</label>
                <input type="file" id="photo" name="photo" required>
                
                <label for="name">장소명:</label>
                <input type="text" id="name" name="name" required>
                
                <label for="address">주소:</label>
                <input type="text" id="address" name="address" required>
                
                <label for="phone">전화번호:</label>
                <input type="text" id="phone" name="phone" required>
                
                <label for="sns">SNS 계정 (선택 사항):</label>
                <input type="text" id="sns" name="sns">
                
                <label for="comment">코멘트:</label>
                <textarea id="comment" name="comment" maxlength="50"></textarea>
                
                <button type="submit">등록 요청</button>
            </form>
        </div>
    </main>
    <script src="assets/js/PlaceRegister.js"></script>
</body>
</html>

