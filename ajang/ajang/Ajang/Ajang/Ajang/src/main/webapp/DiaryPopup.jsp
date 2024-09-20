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

	<!-- 팝업 창 -->
	<div id="diaryPopup" class="popup">
		<form action="DiaryPopupService" method="post"
			enctype="multipart/form-data">
			<div class="popup-header">
				<h2>Diary Entry</h2>
				<button class="close-btn" onclick="toggleDiaryPopup()">❌</button>
				<input class="close-btn" type="reset" value="초기화">
			</div>
			<div>
				<label>제목:</label> <input type="text" name="title"
					placeholder="제목을 입력하세요">
			</div>
			<div>
				<label>날짜:</label> <input type="date" name="date">
			</div>
			<div>
				<label>아기 개월수:</label> <input type="text" name="babynumber"
					placeholder="개월수를 입력하세요">
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
				<textarea name="content" placeholder="오늘의 기록을 적어보세요"></textarea>
			</div>
			<div class="photo-upload">
				<div>
					<label>사진 1:</label> <input type="file" name="file1">
				</div>
				<div>
					<label>사진 2:</label> <input type="file" name="file2">
				</div>
			</div>
			<div class="button-container">
				<input class="add-btn" type="submit" onclick="toggleDiaryPopup()"
					value="작성하기">
				<button class="update-btn" onclick="toggleDiaryPopup()">수정</button>
				<div class="button-group"></div>
			</div>
		</form>
	</div>

	<!-- 팝업 배경 -->
	<div id="diaryOverlay" class="popup-overlay"
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
