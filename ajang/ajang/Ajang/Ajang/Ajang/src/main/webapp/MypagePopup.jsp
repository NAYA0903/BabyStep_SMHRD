<%@page import="com.babystep.model.UserDTO"%>
<%@page import="com.babystep.model.CountryDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.babystep.model.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>내 정보 팝업</title>
<link rel="stylesheet" href="assets/css/MypagePopup.css">
</head>

<body>

    <%
    String userId = (String) session.getAttribute("id"); // 세션에서 ID 가져오기
    String nickname = new UserDAO().getNicknameById(userId); // 닉네임 가져오기
    String joined_at = new UserDAO().getsysdate(userId); // 가입일자 가져오기
    List<CountryDTO> likedItems = new UserDAO().getUsedLike(userId); // 좋아요한 게시글 목록 가져오기
    %>

    <!-- 마이페이지 팝업 -->
    <div id="mypage-popup" class="mypage-popup">
        <!-- 프로필 사진과 사용자 정보를 표시하는 부분 -->
        <div class="mypage-popup-header">
            <img src="profile-picture.jpg" alt="Profile Picture">
            <!-- 프로필 사진 -->
            <div>
                <h1><%=nickname%></h1>
                <!-- 사용자 닉네임 -->
                <p>가입일: <%=joined_at%></p>
                <!-- 가입일 -->
            </div>
        </div>

        <!-- 관심 장소 섹션 -->
        <div class="mypage-popup-section1">
            <form action="BabyService" method="post">
            	<h2>내 아이 등록</h2>
            		<input type="text" name="byName" placeholder="내 아이 이름을 적어주세요!"><br>
            		<label>생년월일을 적어주세요</label><br>
            		<input type="date" name="byBirthdate"><br>
            		<input type="text" name="byGender" placeholder="남자/여자"><br>
            		<button type="submit">등록하기</button>
            </form>
        </div>

        <!-- 관심 거래 섹션 -->
        <div class="mypage-popup-section2">
            <h2>관심 거래</h2>
            <ul>
                <%
                for (CountryDTO item : likedItems) {
                %>
                <li>
                    <a class="used" href="CountryDetail.jsp?num=<%=item.getUSED_IDX()%>"><%=item.getUSED_TITLE()%></a>
                </li>
                <!-- 게시글 제목 출력 -->
                <%
                }
                %>
            </ul>
        </div>

        <!-- 공유 현황 섹션 -->
        <div class="mypage-popup-section3">
        	<h2>내 가족 등록하기</h2>
        		<form action="ShareScheduleServlet" method="post">
        			<input type="text" name="shareId" id="shareId" placeholder="내 가족 등록하기" required>
    				<button type="submit">등록하기</button>
        		</form>
            <h2>공유 현황</h2>
            <p class="mypage-share-status">이 페이지는 친구와 공유되고 있습니다.</p>
        </div>

        <!-- 팝업을 닫는 버튼 -->
        <button class="mypage-close-btn" onclick="toggleMypagePopup()">닫기</button>
    </div>

    <!-- Overlay (배경을 어둡게 하여 팝업을 강조) -->
    <div id="mypage-overlay" class="mypage-popup-overlay" onclick="toggleMypagePopup()"></div>

    <script>
        function toggleMypagePopup() {
            var popup = document.getElementById('mypage-popup');
            var overlay = document.getElementById('mypage-overlay');
            popup.style.display = popup.style.display === 'none' ? 'block' : 'none';
            overlay.style.display = overlay.style.display === 'none' ? 'block' : 'none';
        }
    </script>

</body>
</html>
