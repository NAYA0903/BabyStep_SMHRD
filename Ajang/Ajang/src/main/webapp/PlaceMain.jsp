<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>장소 목록</title>
<link rel="stylesheet" href="assets/css/PlaceMain.css">
</head>
<body>
    <header>
        <h1>등록된 장소 목록</h1>
        <button id="toggle-favorites">찜한 장소 보기</button> <!-- 수정됨. -->
    </header>
    <main id="main-content">
        <div id="place-list">
            <!-- 장소 카드가 여기에 동적으로 추가됨 -->
        </div>
        <div id="loading" style="display: none;">로딩 중...</div>
    </main>
    <aside>
        <a href="PlaceRegister.jsp" class="register-button">새로운 장소 등록</a>
    </aside>
    <script src="assets/js/PlaceMain.js"></script>
</body>
</html>
