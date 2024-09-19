<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>장소 등록 요청 관리</title>
    <link rel="stylesheet" href="assets/css/PlaceAll.css">
    <link rel="stylesheet" href="assets/css/PlaceAdmin.css">
</head>
<body>
    <header>
        <h1>장소 등록 요청 관리</h1>
    </header>
    <main>
        <div class="container">
            <div id="action-buttons">
                <button id="accept-button">선택 요청 수락</button>
                <button id="reject-button">선택 요청 거부</button>
            </div>
            <div id="request-list">
                <!-- 등록 요청 목록이 여기에 동적으로 추가됨 -->
            </div>
        </div>
    </main>
    <script src="assets/js/PlaceAdmin.js"></script>
</body>
</html>



