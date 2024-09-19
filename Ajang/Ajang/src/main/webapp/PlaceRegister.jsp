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
            <form id="register-form" enctype="multipart/form-data"> <!-- enctype 추가 -->
                <label for="category">카테고리:</label>
                <select id="category" name="placeCategory"> <!-- name 변경 -->
                    <option value="cafe">카페</option>
                    <option value="restaurant">식당</option>
                    <!-- 추가 카테고리 -->
                </select>
                
                <label for="photo">사진:</label>
                <input type="file" id="photo" name="placePhoto" required> <!-- name 변경 -->
                
                <label for="name">장소명:</label>
                <input type="text" id="name" name="placeName" required> <!-- name 변경 -->
                
                <label for="address">주소:</label>
                <input type="text" id="address" name="placeAddr" required> <!-- name 변경 -->
                
                <label for="phone">전화번호:</label>
                <input type="text" id="phone" name="placeTel" required> <!-- name 변경 -->
                
                <label for="sns">SNS 계정 (선택 사항):</label>
                <input type="text" id="sns" name="placeSns"> <!-- name 변경 -->
                
                <label for="comment">코멘트:</label>
                <textarea id="comment" name="placeComment" maxlength="50"></textarea> <!-- name 변경 -->
                
                <button type="submit">등록 요청</button>
            </form>
        </div>
    </main>
    <script src="assets/js/PlaceRegister.js"></script>
</body>
</html>
