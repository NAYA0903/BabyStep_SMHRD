<%@page import="com.babystep.model.UserDTO"%>
<%@page import="com.babystep.model.CountryDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.babystep.model.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>내 정보 팝업</title>
<link rel="stylesheet" href="assets/css/MypagePopup.css">
</head>

<style>

.used {
  text-decoration: none; /* 밑줄 제거 */
  color: inherit; /* 부모 요소의 색상 유지 */
  font-size: 18px;
}

</style>
<body>


	<%
	String userId = (String) session.getAttribute("id"); // 세션에서 ID 가져오기
	String nickname = new UserDAO().getNicknameById(userId); // 닉네임 가져오기
	String joined_at = new UserDAO().getsysdate(userId); // 가입일자 가져오기
	List<CountryDTO> likedItems = new UserDAO().getUsedLike(userId); // 좋아요한 게시글 목록 가져오기
	%>



	<!-- 팝업 -->
	<div id="popup" class="popup">
		<!-- 프로필 사진과 사용자 정보를 표시하는 부분입니다. -->
		<div class="popup-header">
			<img src="profile-picture.jpg" alt="Profile Picture">
			<!-- 프로필 사진 -->


			<div>
				<h1><%=nickname%></h1>
				<!-- 사용자 닉네임 -->
				<p>
					가입일:
					<%=joined_at%></p>
				<!-- 가입일 -->
			</div>
		</div>

		<!-- 관심 장소 섹션입니다. -->
		<div class="section">
			<h2>관심 장소</h2>
			<ul>
				<li>장소 1</li>
				<li>장소 2</li>
				<li>장소 3</li>
			</ul>
		</div>

		<!-- 관심 거래 섹션입니다. -->
		<div class="section">
			<h2>관심 거래</h2>

			<ul>
				<%
				for (CountryDTO item : likedItems) {
				%>
				<li>
				<a class = "used" href="CountryDetail.jsp?num=<%=item.getUSED_IDX()%>"><%=item.getUSED_TITLE()%></a>
				</li>
				<!-- 게시글 제목 출력 -->
				<%
				}
				%>

			</ul>
		</div>

		<!-- 공유 현황 섹션입니다. -->
		<div class="section">
			<h2>공유 현황</h2>
			<p class="share-status">이 페이지는 친구와 공유되고 있습니다.</p>
			<!-- 공유 현황 -->
		</div>

		<!-- 팝업을 닫는 버튼입니다. -->
		<button class="close-btn" onclick="togglePopup()">닫기</button>
	</div>

	<!-- Overlay (배경을 어둡게 하여 팝업을 강조합니다.) -->
	<div id="overlay" class="popup-overlay" onclick="togglePopup()"></div>

	<script>
		function togglePopup() {
			var popup = document.getElementById('popup');
			var overlay = document.getElementById('overlay');
			popup.style.display = popup.style.display === 'none' ? 'block'
					: 'none';
			overlay.style.display = overlay.style.display === 'none' ? 'block'
					: 'none';
		}
	</script>


</body>
</html>