<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>세련된 캘린더 팝업 창</title>
<link rel="stylesheet" href="assets/css/CalendarPopup.css">
<!-- 외부 CSS 파일 연결 -->
</head>
<body>

	<!-- 캘린더 팝업 창 -->
	<div id="calendar-popup" class="calendar-popup-container">
		<div class="calendar-popup-content">
			<div class="calendar-popup-header">
				<h2 class="calendar-popup-title">새로운 일정</h2>
				<button class="close-btn" onclick="toggleCalendarPopup()">&#10005;</button>
				<!-- X 버튼으로 닫기 -->
			</div>
			<div class="calendar-popup-body">
				<div class="calendar-popup-section">
					<label for="event-title">제목</label> <input type="text"
						id="event-title" placeholder="제목 입력">
				</div>

				<div class="calendar-popup-section">
					<label for="all-day">하루 종일</label> <label class="switch"> <input
						type="checkbox" id="all-day"> <span
						class="calendar-slider round"></span> <!-- slider를 calendar-slider로 변경 -->
					</label>
				</div>

				<div class="calendar-popup-section">
					<div class="date-time">
						<label>시작</label> <input type="date" id="start-date"> <input
							type="time" id="start-time">
					</div>

					<div class="date-time">
						<label>종료</label> <input type="date" id="end-date"> <input
							type="time" id="end-time">
					</div>
				</div>

				<div class="calendar-popup-section">
					<label for="location">장소</label> <input type="text" id="location"
						placeholder="장소 입력">
				</div>

				<div class="calendar-popup-section">
					<label for="memo">메모</label>
					<textarea id="memo" placeholder="메모 입력"></textarea>
				</div>
			</div>

			<!-- 하단 버튼 -->
			<div class="calendar-popup-footer">
				<button class="save-btn">저장</button>
				<button class="cancel-btn" onclick="toggleCalendarPopup()">취소</button>
			</div>
		</div>
	</div>

	<script>
		// 팝업을 토글(열고 닫기)하는 함수
		function toggleCalendarPopup() {
			var popup = document.getElementById('calendar-popup'); // 캘린더 팝업의 ID를 참조
			if (popup.style.display === 'none' || popup.style.display === '') {
				popup.style.display = 'flex'; // 팝업을 열기
			} else {
				popup.style.display = 'none'; // 팝업을 닫기
			}
		}

		// 페이지 로드 시 팝업을 숨김 상태로 설정
		document.addEventListener('DOMContentLoaded', function() {
			var popup = document.getElementById('calendar-popup');
			popup.style.display = 'none'; // 팝업 숨기기
		});
	</script>

</body>
</html>
