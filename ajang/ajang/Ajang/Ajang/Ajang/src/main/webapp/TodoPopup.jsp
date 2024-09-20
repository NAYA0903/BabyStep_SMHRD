<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    body {
        font-family: 'Arial', sans-serif;
        background-color: #f0f9f0;
        margin: 0;
        padding: 20px;
        box-sizing: border-box;
    }

    /* 팝업 스타일 */
    .popup {
        display: none;
        position: fixed;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        width: 90%;
        max-width: 600px; /* 최대 너비를 설정하여 화면에 맞게 표시되도록 */
        background-color: white;
        padding: 20px; /* 패딩을 줄여서 크기를 더 줄임 */
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        border-radius: 10px;
        z-index: 1000;
        overflow-y: auto; /* 세로 스크롤 추가 */
        max-height: 80vh; /* 화면 높이에 맞게 최대 높이 제한 */
    }

    /* 팝업 헤더 */
    .popup-header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 15px;
    }
    
    .popup-header img {
    height: 40px;
    width: 60px;
    position: fixed;
    right: 5px;
 	}

    .popup h2 {
        font-size: 24px;
        font-weight: bold;
        color: #333;
        margin: 0;
    }

    .popup .close-btn {
        background-color: transparent; /* 배경을 투명하게 설정 */
        color: #CF0202;
        font-size: 10px;
        text-align: center;
        border: none; /* 테두리도 제거 */
        cursor: pointer;
    }

    .popup .close-btn:hover {
        color: #a00000; /* 버튼이 활성화될 때 색상 변경 */
    }

    /* 팝업 내부 항목 스타일 */
    .popup div {
        margin-bottom: 15px;
    }

    .popup div label {
        font-size: 16px;
        font-weight: bold;
        color: #333;
        margin-bottom: 8px;
        display: block;
    }

    .popup div input,
    .popup div textarea {
        width: 100%;
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 5px;
        font-size: 14px;
        margin-top: 5px;
    }

    .popup div textarea {
        height: 80px;
        resize: none;
    }

    /* 팝업 배경 어두운 부분 */
    .popup-overlay {
        display: none;
        position: fixed;
        top: 0;
        left: 0;
        width: 100vw;
        height: 100vh;
        background-color: rgba(0, 0, 0, 0.5);
        z-index: 500;
    }

    /* 차분한 톤의 버튼 색상 */
    .popup .add-btn,
    .popup .update-btn {
        padding: 10px 16px;
        border: none;
        border-radius: 5px;
        font-size: 14px;
        cursor: pointer;
        display: inline-block;
        margin-right: 10px;
        text-align: center;
    }

    /* 차분한 색상 */
    .popup .add-btn {
        background-color: #6a9fb5; /* 차분한 파란색 */
        color: white;
    }

    .popup .add-btn:hover {
        background-color: #568da0;
    }

    .popup .update-btn {
        background-color: #a9bfa3; /* 차분한 녹색 */
        color: white;
    }

    .popup .update-btn:hover {
        background-color: #8ea78d;
    }

    /* 버튼 간 간격을 패딩으로 조정 */
    .popup .add-btn,
    .popup .update-btn,
    .popup .close-btn {
        margin-right: 10px;
    }

    /* 버튼을 오른쪽 정렬 */
    .button-container {
        text-align: right;
    }
</style>
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
         	<input class="add-btn" type="submit" onclick="toggleTodoPopup()" value="작성하기">
         	<button class="update-btn" onclick="toggleTodoPopup()">수정</button>
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