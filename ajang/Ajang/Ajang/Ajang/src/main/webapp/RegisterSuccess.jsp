<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<link rel="icon" href="img/BabyStepLogo.ico" sizes="128x128" type="image/x-icon">
		<title>걸음마</title>
		<meta charset="UTF-8" />
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="assets/css/main.css" />
		
	</head>
	<style>
		#Update > ul.actions {
			margin-top:10%;
		}
	</style>
	<body style="text-align: center;">

		<!-- Wrapper -->
			<div id="wrapper">
				<!-- Menu -->
					<nav id="Update">	
						<ul class="actions vertical">
							
							<li>회원가입을 축하합니다.</li>
							<!-- 회원가입 한 회원정보 중 닉네임을 출력 -->
							
							<%
								String nickname = (String) request.getAttribute("nickname");
							    
							%>
							
							<!--  EL기법 : 표현하고자 하는 데이터를 손 쉽게 표현할 수 있도록 도와주는 기법 
								  JSTL기법 : Java의 조건문이나 반복문들의 제어들을 태그형태로 도와주는 기법 -->
							
							<%-- <li>Message System의 새로운 email은 <%= email %> 입니다.</li> --%>
							
							<li><h1>걸음마와 함께하실 ${nickname}님! 환영합니다.</h1></li>
							<li><button onclick='location.href="Main.jsp"'>시작하기</button></li>
						</ul>
					</nav>			
			</div>
		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/jquery.scrolly.min.js"></script>
			<script src="assets/js/jquery.scrollex.min.js"></script>
			<script src="assets/js/skel.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>
	</body>
</html>

