<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>걸음마</title>

<!-- CSS -->
<link rel="stylesheet" href="assets/css/TodoPopup.css">
</head>
<body>

	<!-- 팝업 창 -->
	<div id="TodoPopup" class="todo-popup">

		<form action="TodoListServlet" method="post">
			
			<div class="todo-popup-header">
				<h2>오늘의 TODO!</h2>
				
				<!-- 캘린더 닫기 버튼과 동일한 형식으로 수정 -->
				<button class="todo-close-btn" type="button"
					onclick="toggleTodoPopup()">&#10005;</button>
			</div>

			<div class="form-field">
				
				<label>Todo 내용:</label> 
				<input type="text" name="todoContent" placeholder="오늘의 TODO를 적어보세요 !">
				
			</div>
			
			<div class="form-field">
			
				<label>날짜:</label> 
				<input type="text" id="todoDate" name="todoDate" readonly>
				
			</div>

			<!-- 팝업 하단 버튼 -->
			<div class="todo-popup-footer">
				<button class="todo-update-btn" onclick="toggleTodoPopup()">수정</button>
				<input class="todo-add-btn" type="submit" onclick="toggleTodoPopup()" value="작성하기">
			</div>

		</form>
		
	</div>

	<!-- 팝업 배경 -->
	<div id="TodoOverlay" class="todo-popup-overlay"onclick="toggleTodoPopup()"> </div>
	
	
	<!-- 자바 스크립트 -->
	<script src="TodoPopup.js"></script>

</body>
</html>