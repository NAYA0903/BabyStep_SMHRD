<%@page import="com.babystep.model.BabyDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.babystep.model.DiaryPopupDTO"%>
<%@page import="org.apache.ibatis.session.SqlSessionFactory"%>
<%@page import="com.babystep.model.BabyDAO"%>
<%@page import="com.babystep.model.DiaryPopupDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>아기 다이어리</title>
<link rel="stylesheet" href="assets/css/DiaryPopup.css">
</head>

<body>


<% 

String USER_ID = (String) session.getAttribute("id");
	
// 만약 세션에 저장된 addage 값이 Integer 타입이 아니고, String으로 저장되어 있다면 변환
String addageStr = (String) session.getAttribute("addage");
Integer addage = null;

if (addageStr != null && !addageStr.isEmpty()) {
    try {
        // 문자열을 Integer로 변환
        addage = Integer.parseInt(addageStr);
    } catch (NumberFormatException e) {
        System.out.println("Failed to parse addage: " + e.getMessage());
    }
} else {
    // addage가 없으면 기본값으로 설정하거나 다른 처리 수행
    System.out.println("addage is null or empty");
    addage = 0; // 기본값 설정 예시
}


System.out.print("USER_ID, addage : " + USER_ID + "  " + addage );
%>




	<!-- 팝업 창 -->
	<div id="diaryPopup" class="diary-popup">
		<form action="DiaryPopupService" method="post"
			enctype="multipart/form-data">
			<div class="diary-popup-header">
				<h2>Diary Entry</h2>
				<!-- 캘린더 닫기 버튼과 동일한 형식으로 수정 -->
				<button class="diary-close-btn" type="button"
					onclick="toggleDiaryPopup()">&#10005;</button>
			</div>
			<div class="form-field">
				<div>
					<label>제목:</label> <input type="text" name="title"
						placeholder="제목을 입력하세요">
				</div>
				<div>
					<label>날짜:</label> <input type="date" name="date">
				</div>
				<div>
					<label>아기 개월수: <%=addage %></label> 
					
					<p></p>
						
				</div>
				<div>
					<label>키:</label> <input type="text" name="height"
						placeholder="아기의 키를 입력하세요">
				</div>
				<div>
					<label>몸무게:</label> <input type="text" name="weight"
						placeholder="아기의 몸무게를 입력하세요">
				</div>
				<div>
					<label>내용:</label>
					<textarea cols=5 wrap="hard" name="content" placeholder="오늘의 기록을 적어보세요"></textarea>
				</div>
			</div>
			

			<div class="photo-upload">
				<div>
					<label>사진 1:</label> <input type="file" name="file1">
				</div>
				<div>
					<label>사진 2:</label> <input type="file" name="file2">
				</div>
			</div>
			<!-- 팝업 하단 버튼 -->
			<div class="diary-popup-footer">
			
				<input class="diary-add-btn" type="submit"
					onclick="toggleTodoPopup()" value="작성하기">
			</div>
		</form>
	</div>

	<!-- 팝업 배경 -->
	<div id="diaryOverlay" class="diary-popup-overlay"
		onclick="toggleDiaryPopup()"></div>

	<script>
		function toggleDiaryPopup() {
			var popup = document.getElementById('diaryPopup');
			var overlay = document.getElementById('diaryOverlay');
			var isHidden = popup.style.display === 'none'
					|| popup.style.display === '';
			popup.style.display = isHidden ? 'block' : 'none';
			overlay.style.display = isHidden ? 'block' : 'none';
		}
	</script>

</body>
</html>
