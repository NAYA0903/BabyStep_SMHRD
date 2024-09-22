<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="assets/css/AskPopup.css">
</head>
<body>

	<!-- 팝업 창 -->
	<div id="AskPopup" class="ask-popup">

		<form action="AskListServlet" method="post">
			<div class="Ask-popup-header">
				<h2>오늘의 TODO!</h2>
				<!-- 캘린더 닫기 버튼과 동일한 형식으로 수정 -->
				<button class="Ask-close-btn" type="button"
					onclick="toggleAskPopup()">&#10005;</button>
			</div>

			<div class="form-field">
				<label>Todo 내용:</label> <input type="text" name="AskContent" placeholder="문의사항을 적어주세요 !">
			</div>

			<div class="form-field">
				<label>날짜:</label> <input type="text" id="AskDate" name="AskDate" readonly>
			</div>

			<!-- 팝업 하단 버튼 -->
			<div class="Ask-popup-footer">
				<button class="Ask-update-btn" onclick="toggleAskPopup()">수정</button>
				<input class="Ask-add-btn" type="submit"
					onclick="toggleAskPopup()" value="작성하기">
			</div>

		</form>
	</div>

	<!-- 팝업 배경 -->
	<div id="AskOverlay" class="Ask-popup-overlay" onclick="toggleAskPopup()"></div>

	<script>
		function toggleAskPopup() {

			var popup = document.getElementById('AskPopup');
			var overlay = document.getElementById('AskOverlay');

			var selectedDate = document.getElementById('selectedDateDisplay').textContent; // 선택한 날짜 가져오기

			// 팝업 폼에 선택한 날짜를 설정
			if (selectedDate) {
				document.getElementById('AskDate').value = selectedDate; // 선택한 날짜를 설정
				console.log("선택한 날짜 : ", selectedDate)
			}

			var isHidden = popup.style.display === 'none' || popup.style.display === '';
			popup.style.display = isHidden ? 'block' : 'none';
			overlay.style.display = isHidden ? 'block' : 'none';
		}
	</script>


</body>
</html>