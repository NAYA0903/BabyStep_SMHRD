<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Dongle:wght@300;400;700&display=swap"
	rel="stylesheet">

<link rel="stylesheet"
	href=https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200 " />

<link rel="icon" href="img/BabyStepLogo.ico" sizes="128x128"
	type="image/x-icon">
<title>아장</title>
<link rel="stylesheet" href="assets/css/Main.css">
</head>

<body>

	<!-- 타이틀 부분 -->
	<div class="title">
		<img src="img/MainLogo.png" alt="걸음마 로고" class="logo-image"> 
		<a class="com" href="">소개</a>
		<a class="com" href="">WITHKIDS</a> 
		<a class="com" href="BoardMain.jsp">게시판</a> 
		<a class="com" href="">중고거래</a>

		<!-- 다크 모드 스위치 -->
      <label class="dark-mode-switch"> <input type="checkbox"
         id="darkModeToggle"> <span class="slider"></span>
      </label> 
      
      <a href="LogoutService"> <img src="img/Logout.png" alt="로그아웃"
         class="logout-image">
      </a> 
      
      <a href="" onclick="togglePopup(); return false;"> <img
         src="img/Mypage.png" alt="마이페이지" class="mypage-image">
      </a>

      <jsp:include page="Popup.jsp" />




	</div>


	<!-- 좌우 4:6 레이아웃의 메인 컨텐츠 -->
	<div class="main-content">
		<!-- 왼쪽 4 부분 (캘린더 API 통합 예정) -->
		<div class="left-section">
			<jsp:include page="CalendarMain.jsp" />

		</div>

		<!-- 오른쪽 6 부분 -->
			<div class="right-section">
			
			
		<!-- 날짜 표시 영역 -->
 			
 				<div class="date-section">
    				<h2>날짜</h2>
    					<%
    						String selectedDate = (String) session.getAttribute("selectedDate");
   							 if (selectedDate != null) {
        						out.println("<span>선택한 날짜: " + selectedDate + "</span>");
  							  } else {
      							  out.println("<span>선택된 날짜가 없습니다.</span>");
   							  }
						  %>

				</div>

			<!-- To-do 리스트 -->
			<div class="todo-section">
				<h3>To-do 리스트</h3>
				<div class="todo-item">
					<img src="https://via.placeholder.com/30" alt="아이콘"> 
					<span>할일 1</span>
				</div>
				<div class="todo-item">
					<img src="https://via.placeholder.com/30" alt="아이콘"> 
					<span>할일 2</span>
				</div>
				<div class="todo-item">
					<img src="https://via.placeholder.com/30" alt="아이콘"> 
					<span>할일 3</span>
				</div>
			</div>

			<!-- 이미지 업로드와 일기 작성 섹션을 가로로 나누는 부분 -->
			<div class="upload-diary-container">
				<!-- 이미지 업로드 섹션 -->
				<div class="image-upload-section">
					<h3>이미지를 파일 첨부로 올리세요</h3>
					<input type="file" accept="image/*">
				</div>

				<!-- 일기 메모 작성 섹션 -->
				<div class="diary-section">
					<h3>일기 형식의 메모 창</h3>
					<textarea placeholder="여기에 메모를 작성하세요..."></textarea>
					<div class="button-container">
						<button class="write-btn">작성하기</button>
					</div>
				</div>
			</div>
		</div>
	</div>



	<script src="assets/js/Main.js"></script>

</body>