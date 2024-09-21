<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="assets/css/TodoPopup.css">
</head>
<body>

<!-- 팝업 창 -->
<div id="TodoPopup" class="popup">

	<form action="TodoListServlet" method="post" >
    	<div class="popup-header">
        	<h2>오늘의 TODO!</h2>
        	<img src="img/x.png" class="close-btn" onclick="toggleTodoPopup()">
        </div>
        <div>
        	<label> Todo 내용 :</label>
        	<input type="text" name="todoContent" placeholder="오늘의 TODO를 적어보세요 !">
        </div>
        	
        <div>
            <label> 날짜 :</label>
            <input type="text" id="todoDate" name="todoDate" readonly>
        </div>
        
    	
    
    	<div class="button-container">
         	<button class="update-btn" onclick="toggleTodoPopup()">수정</button>
         	<input class="add-btn" type="submit" onclick="toggleTodoPopup()" value="작성하기">
        <div class="button-group">
           
        </div>
    </div>
    </form>
</div>

<!-- 팝업 배경 -->
<div id="TodoOverlay" class="popup-overlay" onclick="toggleTodoPopup()"></div>

<script>
function toggleTodoPopup() {
	
    var popup = document.getElementById('TodoPopup');
    var overlay = document.getElementById('TodoOverlay');	
	
    var selectedDate = document.getElementById('selectedDateDisplay').textContent; // 선택한 날짜 가져오기
    
    // 팝업 폼에 선택한 날짜를 설정
    if (selectedDate) {
        document.getElementById('todoDate').value = selectedDate; // 선택한 날짜를 설정
        console.log("선택한 날짜 : ", selectedDate)
    }
    
    var isHidden = popup.style.display === 'none' || popup.style.display === '';
    popup.style.display = isHidden ? 'block' : 'none';
    overlay.style.display = isHidden ? 'block' : 'none';
}
</script>


</body>
</html>