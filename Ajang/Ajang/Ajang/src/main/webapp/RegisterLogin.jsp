<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<link rel="icon" href="img/BabyStepLogo.ico" sizes="128x128" type="image/x-icon">
<title>걸음마</title>
<link rel="stylesheet" href="assets/css/RegisterLogin.css">
</head>
				
<body>

	
	<div class="container" id="container">
		<div class="form-container sign-up-container">
			<form action="RegisterService" method="post" id="registerForm">
				
				<!-- 회원가입 -->
				
				<h1>회원가입</h1>
				
				<!-- API로그인 연동 공간 -->
				<div class="social-container">
					<a href="#" class="social-kakao">K</a> 
					<a href="#" class="social-google">G</a> 
					<a href="#" class="social-naver">N</a>
				</div>
				<span>or use your email for registration</span>
				
				<!-- 회원가입 입력란 -->
				 <input type="hidden" name="action" value="register" />
				 <!-- 닉네임 입력란 -->
				 <input type="text" name="nickname" placeholder="닉네임" />
				 <!-- 아이디 입력란 -->
				 <input type="text" name="id" placeholder="아이디" /> 
				 <!-- 비밀번호 입력란 -->
				 <input type="password" name="pw" placeholder="비밀번호" />
				 <!-- 주소 입력란 -->
				 <input type="text" name="addr" placeholder="주소" />
				
				<button class="font">회원가입</button>
				
			</form>
		</div>
		
		
		<div class="form-container sign-in-container">
			<form action="LoginService" method="post">
			
			
				<!-- 로그인 -->
				
				<h1>로그인</h1>
				<div class="social-container">
					<a href="#" class="social-kakao"><img alt="KakaoLogo" class="Kakao" src="img/kakao.png"></a>
					<a href="#" class="social-google">G</a> 
					<a href="#" class="social-naver">N</a>
				</div>
				<span>or use your account</span> 
				<input type="hidden" name="action" value="login" />
				<input type="text" name="id" placeholder="아이디" /> 
				<input type="password" name="pw" placeholder="비밀번호" /> 
				<a href="#">비밀번호 찾기</a>
				<button type="submit" class="font">로그인</button>
				
				<!-- 아이디 또는 비밀번호가 일치하지 않습니다. -->
				<% String errorMessage = (String) request.getAttribute("errorMessage"); %>
				<% if (errorMessage != null) { %>
    				<div class="error">
        				<p1><%= errorMessage %></p1>
    				</div>
				<% } %>
				
			</form>
		</div>
		
		
		<!-- 사이드 ? -->
		<div class="overlay-container">
			<div class="overlay">
				<div class="overlay-panel overlay-left">
					<img alt="BabyStepLogo" class="logo" src="img/BabyStepLogo.png">
					<p>육아 기록 웹서비스 "걸음마"</p>
					<button class="ghost" id="signIn">로그인</button>
				</div>
				<div class="overlay-panel overlay-right">
					<img alt="BabyStepLogo" class="logo" src="img/BabyStepLogo.png">
					<p>오늘도 한걸음 "걸음마"</p>
					<button class="ghost" id="signUp" >회원가입</button>
				</div>
			</div>
		</div>
	</div>

	<script src="assets/js/RegisterLogin.js"></script>

</body>

</html>