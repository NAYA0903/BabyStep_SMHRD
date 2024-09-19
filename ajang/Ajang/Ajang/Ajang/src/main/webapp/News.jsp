<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도감</title>
<link rel="stylesheet" href="assets/css/News.css">

</head>
<body>
<!-- 메뉴 바 포함 -->
    <div class="menu-container">
        <jsp:include page="Menu.jsp" /> 
    </div>
    
    <div class="container">
        <h1>세련된 목록</h1>
        <div class="item-list">
            <div class="item" onclick="openPopup('Item 1', '이것은 아이템 1에 대한 세부 정보입니다.')">적절한 이유식 시작 시기</div>
            <div class="item" onclick="openPopup('Item 2', '이것은 아이템 2에 대한 세부 정보입니다.')">이유식 준비물과 추천 레시피</div>
            <div class="item" onclick="openPopup('Item 3', '이것은 아이템 3에 대한 세부 정보입니다.')">부모가 절대 소리치지 않으면 아이들을 이렇게 자랍니다.</div>
            <div class="item" onclick="openPopup('Item 4', '이것은 아이템 4에 대한 세부 정보입니다.')">내 아들 자존감 높게 키우는 법</div>
            <div class="item" onclick="openPopup('Item 5', '이것은 아이템 5에 대한 세부 정보입니다.')">똑똑한 아이들은 OO을 잘합니다.</div>
            <div class="item" onclick="openPopup('Item 6', '이것은 아이템 6에 대한 세부 정보입니다.')">아이에게 욱해서 화냈다면 5분안에 해야 할 말</div>
            <div class="item" onclick="openPopup('Item 7', '이것은 아이템 7에 대한 세부 정보입니다.')">4~7세 아이를 똑똑하게 만드는 놀이법</div>
            <div class="item" onclick="openPopup('Item 8', '이것은 아이템 8에 대한 세부 정보입니다.')">재우기 힘든 아이, 이렇게 해보세요!</div>
            <div class="item" onclick="openPopup('Item 9', '이것은 아이템 9에 대한 세부 정보입니다.')">엄마도 사람입니다.</div>
            <div class="item" onclick="openPopup('Item 10', '이것은 아이템 10에 대한 세부 정보입니다.')">문에 손이 끼였어요</div>
        </div>
    </div>

    <div id="popup1" class="popup1">
        <div class="popup-content1">
            <span class="close" onclick="closePopup()">&times;</span>
            <h2 id="popup-title1"></h2>
            <p id="popup-description1"></p>
        </div>
    </div>
    
    <script src="assets/js/News.js"></script>
</body>
</html>
