<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="assets/css/Title.css">
<body>
	<!-- menu.jsp -->
	<div class="title">
		<!-- 로고 섹션 -->
		<div class="logo">
			<img src="img/MainLogo.png" alt="걸음마 로고" class="logo-image"
				onclick="location.href='Main.jsp'">
		</div>

		<!-- 네비게이션 링크 섹션 -->
		<div class="nav-links">
			<a class="com" href="News.jsp">육아도감</a> <a class="com"
				href="BoardMain.jsp">게시판</a> <a class="com" href="CountryMain.jsp">중고나라</a>
			<a class="com" href="DiaryDetail.jsp">일기</a>
		</div>

		<!-- 섹션 -->
		<section id="News.jsp">
			<!-- 육아도감 콘텐츠 -->
		</section>

		<section id="BoardMain.jsp">
			<!-- 게시판 콘텐츠 -->
		</section>

		<section id="CountryMain.jsp">
			<!-- 중고거래 콘텐츠 -->
		</section>



		<!-- 이미지 아이콘 섹션 -->
		<div class="icon-links">
			<a href="#" onclick="openChatRoomPopup()"> <img
				src="img/admin.png" alt="상담" class="admin-image">
			</a>
			<a href="#" onclick="openChatRoomPopup()"> <img
				src="img/ChatBlack.png" alt="채팅" class="chat-image">
			</a> <a href="#" onclick="toggleMypagePopup(); return false;"> <img
				src="img/MypageBlack.png" alt="마이페이지" class="mypage-image">
			</a> <a href="LogoutService"> <img src="img/LogoutBlack.png" alt="로그아웃"
				class="logout-image">
			</a>
		</div>
		<!-- 다크 모드 스위치 -->
		<label class="dark-mode-switch"> <input type="checkbox"
			id="darkModeToggle"> <span class="slider"></span>
		</label>

		<jsp:include page="MypagePopup.jsp" />
	</div>
	<script src="assets/js/Title.js"></script>
	<script>
		window
				.addEventListener(
						'scroll',
						function() {
							const title = document.querySelector('.title'); // 타이틀 선택
							const scrollPosition = window.scrollY; // 현재 스크롤 위치

							if (scrollPosition > 0) { // 스크롤이 조금이라도 발생했을 때
								title.style.background = `linear-gradient(to bottom, rgba(255, 255, 255, 1), rgba(240, 240, 240, 1))`; // 흰색에서 연한 회색으로 빠르게 전환
							} else {
								title.style.background = 'white'; // 스크롤을 맨 위로 올렸을 때 다시 흰색으로 변경
							}
						});
	</script>

</body>
</html>