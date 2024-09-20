<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>세련된 팝업 창</title>
<link rel="stylesheet" href="assets/css/CalendarPopup.css">
<!-- 외부 CSS 파일 연결 -->
</head>
<body>

	

	<!-- 팝업 창 -->
	<div id="popup" class="popup-container">
		<div class="popup-content">
			<div class="popup-header">
				<h2 class="popup-title">새로운 일정</h2>
				<button class="close-btn" onclick="CalendarPopup()">&#10005;</button>
				<!-- X 버튼으로 닫기 -->
			</div>
			<div class="popup-body">
				<div class="popup-section">
					<label for="event-title">제목</label> <input type="text"
						id="event-title" placeholder="제목 입력">
				</div>

				<div class="popup-section">
					<label for="all-day">하루 종일</label> <label class="switch"> <input
						type="checkbox" id="all-day"> <span class="slider round"></span>
					</label>
				</div>

				<div class="popup-section">
					<div class="date-time">
						<label>시작</label> <input type="date" id="start-date"> <input
							type="time" id="start-time">
					</div>

					<div class="date-time">
						<label>종료</label> <input type="date" id="end-date"> <input
							type="time" id="end-time">
					</div>
				</div>

				<div class="popup-section">
					<label for="location">장소</label> <input type="text" id="location"
						placeholder="장소 입력">
				</div>

				<div class="popup-section">
					<label for="memo">메모</label>
					<textarea id="memo" placeholder="메모 입력"></textarea>
				</div>
			</div>

			<!-- 하단 버튼 -->
			<div class="popup-footer">
				<button class="cancel-btn" onclick="CalendarPopup()">취소</button>
				<button class="save-btn">저장</button>
			</div>
		</div>
	</div>

	<script>
		function CalendarPopup() {
			var popup = document.getElementById('popup');
			popup.style.display = popup.style.display === 'none' ? 'flex'
					: 'none';
		}

		// 팝업 초기 상태 숨기기
		document.addEventListener('DOMContentLoaded', function() {
			document.getElementById('popup').style.display = 'none';
		});
	</script>

</body>
</html>

