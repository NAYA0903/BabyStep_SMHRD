<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="assets/css/Menu.css">
<body>
	<!-- menu.jsp -->
	<div class="title">
		<img src="img/MainLogo.png" alt="걸음마 로고" class="logo-image" onclick="location.href='Main.jsp'"> 
		<a class="com" href="Info.jsp">소개</a> 
		<a class="com" href="News.jsp">WITHKIDS</a>
		<a class="com" href="BoardMain.jsp">게시판</a> 
		<a class="com" href="CountryMain.jsp">중고거래</a> 
		<a href="#" onclick="openChatRoomPopup()"><img src="img/Chat.png" alt="채팅" class="chat-image"></a> 
		<a href="" onclick="togglePopup(); return false;"><img src="img/Mypage2.png" alt="마이페이지" class="mypage-image"></a> 
		<a href="LogoutService"><img src="img/Logout3.png" alt="로그아웃" class="logout-image"></a>

		<!-- 다크 모드 스위치 -->
		<label class="dark-mode-switch"> <input type="checkbox"
			id="darkModeToggle"> <span class="slider"></span>
		</label>

		<jsp:include page="MypagePopup.jsp" />  
	</div>
	<script src="assets/js/Menu.js"></script>
</body>
</html>