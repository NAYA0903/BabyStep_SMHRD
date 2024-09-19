<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도감</title>
<link rel="stylesheet" href="assets/css/News.css">
<style>
    /* 이전 CSS 내용... */
</style>
</head>
<body>
<!-- 메뉴 바 포함 -->
    <div class="menu-container">
        <jsp:include page="Menu.jsp" /> 
    </div>
    
    <div class="container">
        <div class="item-list">
            <!-- 각 항목 클릭 시 팝업에 제목, 설명, URL을 전달합니다. -->
            <div class="item" onclick="openPopup('적절한 이유식 시작 시기', '이것은 아이템 1에 대한 세부 정보입니다.', 'https://youtu.be/l0lnoaBMOFY?si=OWEp0z_bdrD3Uxhk')">적절한 이유식 시작 시기</div>
            <div class="item" onclick="openPopup('이유식 준비물과 추천 레시피', '이것은 아이템 2에 대한 세부 정보입니다.', 'https://youtu.be/A6ejeygQOaU?si=ujmTqArEfwvzphkL')">이유식 준비물과 추천 레시피</div>
            <div class="item" onclick="openPopup('부모가 절대 소리치지 않으면 아이들은 이렇게 자랍니다.', '이것은 아이템 3에 대한 세부 정보입니다.', 'https://youtu.be/mnAI0vuJZCQ?si=s3XwDsIi1LOeZdGj')">부모가 절대 소리치지 않으면 아이들은 이렇게 자랍니다.</div>
            <div class="item" onclick="openPopup('내 아들 자존감 높게 키우는 법', '이것은 아이템 4에 대한 세부 정보입니다.', 'https://youtu.be/CUFswRt-v8E?si=mtulBj3doaox_IYY')">내 아들 자존감 높게 키우는 법</div>
            <div class="item" onclick="openPopup('똑똑한 아이들은 OO을 잘합니다.', '이것은 아이템 5에 대한 세부 정보입니다.', 'https://youtu.be/8nHxEdnbIm0?si=N-q7cXeSqfgZMLR7')">똑똑한 아이들은 OO을 잘합니다.</div>
            <div class="item" onclick="openPopup('아이에게 욱해서 화냈다면 5분 안에 해야 할 말', '이것은 아이템 6에 대한 세부 정보입니다.', 'https://youtu.be/Nnz75WJITlE?si=yLaghQD0gdNl4hRe')">아이에게 욱해서 화냈다면 5분 안에 해야 할 말</div>
            <div class="item" onclick="openPopup('4~7세 아이를 똑똑하게 만드는 놀이법', '이것은 아이템 7에 대한 세부 정보입니다.', 'https://youtu.be/mG_TgmZpM_4?si=amhIzI9_UE_7LJ9u')">4~7세 아이를 똑똑하게 만드는 놀이법</div>
            <div class="item" onclick="openPopup('재우기 힘든 아이, 이렇게 해보세요!', '이것은 아이템 8에 대한 세부 정보입니다.', 'https://youtu.be/VkNnqIPNKpg?si=-uUa_IYI4zR8YBD5')">재우기 힘든 아이, 이렇게 해보세요!</div>
            <div class="item" onclick="openPopup('엄마도 사람입니다.', '이것은 아이템 9에 대한 세부 정보입니다.', 'https://youtu.be/LzhiMTHUc9w?si=zPMdRY7vPPPKRm_d')">엄마도 사람입니다.</div>
            <div class="item" onclick="openPopup('문에 손이 끼였어요', '이것은 아이템 10에 대한 세부 정보입니다.', 'https://youtu.be/PKWbnhPQTBY?si=ASDbsTArDIp8Yf36')">문에 손이 끼였어요</div>
            <!-- 필요한 경우 아래와 같은 형식으로 더 추가할 수 있습니다 -->
            <!-- <div class="item" onclick="openPopup('제목', '설명', 'https://example.com/4')">항목 이름</div> -->
        </div>
    </div>

    <div id="popup1" class="popup1">
        <div class="popup-content1">
            <span class="close" onclick="closePopup()">&times;</span>
            <h2 id="popup-title1"></h2>
            <p id="popup-description1"></p>
            <p id="popup-url"></p> <!-- URL 표시를 위한 요소 추가 -->
        </div>
    </div>
    
    <script>
        function openPopup(title, description, url) {
            document.getElementById('popup-title1').innerText = title;
            document.getElementById('popup-description1').innerText = description;
            // 팝업에 URL을 링크 형태로 추가
            document.getElementById('popup-url').innerHTML = `<a href="${url}" target="_blank">${url}</a>`;
            document.getElementById('popup1').style.display = 'block';
        }

        function closePopup() {
            document.getElementById('popup1').style.display = 'none';
        }

        window.onclick = function(event) {
            const popup = document.getElementById('popup1');
            if (event.target === popup) {
                closePopup();
            }
        }
    </script>
</body>
</html>
