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

	<div class="search-container">
		<input type="text" id="search-input" class="search-input"
			placeholder="목록 검색..." onkeyup="filterItems()">
		<!-- 키를 눌 때마다 filterItems() 호출 -->
	</div>

	<div class="container">
		<div class="item-list">
			<!-- 각 항목 클릭 시 팝업에 제목, 설명, URL을 전달합니다. -->
			<div class="item" onclick="openPopup('적절한 이유식 시작 시기', '초보 엄마를 위한 이유식 시작 시기에 대한 설명이 담긴 영상입니다.', 'https://youtu.be/l0lnoaBMOFY?si=OWEp0z_bdrD3Uxhk')">적절한 이유식 시작 시기<br><br>#이유식 #초보엄마</div>
			<div class="item"
				onclick="openPopup('이유식 준비물과 추천 레시피', '어떤 이유식을 먹여야 우리아이에게 좋은지 고민이시죠? 이 영상 하나로 고민 해결해보세요!', 'https://youtu.be/A6ejeygQOaU?si=ujmTqArEfwvzphkL')">
				이유식 준비물과 추천 레시피<br>
				<br>#이유식 #초보엄마
			</div>
			<div class="item"
				onclick="openPopup('부모가 절대 소리치지 않으면 아이들은 이렇게 자랍니다.', '현명한 훈육법에 관한 영상입니다.', 'https://youtu.be/mnAI0vuJZCQ?si=s3XwDsIi1LOeZdGj')">
				부모가 절대 소리치지 않으면 아이들은 이렇게 자랍니다.<br>
				<br>#훈육 #초보엄마
			</div>
			<div class="item"
				onclick="openPopup('내 아들 자존감 높게 키우는 법', '내 아이가 어디서든 당당했으면 좋겠다면? 지금 당장 시청하세요.', 'https://youtu.be/CUFswRt-v8E?si=mtulBj3doaox_IYY')">
				내 아들 자존감 높게 키우는 법<br>
				<br>#교육 #학습 #부모
			</div>
			<div class="item"
				onclick="openPopup('똑똑한 아이들은 OO을 잘합니다.', 'OO은 과연 무엇일까요? 영상 속에서 확인해주세요.', 'https://youtu.be/8nHxEdnbIm0?si=N-q7cXeSqfgZMLR7')">
				똑똑한 아이들은 OO을 잘합니다.<br>
				<br>#교육 #학습 #부모
			</div>
			<div class="item"
				onclick="openPopup('아이에게 욱해서 화냈다면 5분 안에 해야 할 말', '부모도 사람입니다! 내 아이에게 상처가 생겼다면 얼른 연고를 발라주세요.', 'https://youtu.be/Nnz75WJITlE?si=yLaghQD0gdNl4hRe')">
				아이에게 욱해서 화냈다면 5분 안에 해야 할 말<br>
				<br>#교육 #훈육 #부모
			</div>
			<div class="item"
				onclick="openPopup('4~7세 아이를 똑똑하게 만드는 놀이법', '똑똑한 아이를 키우고 싶은건 모든 부모가 같은 마음일거에요. 하지만 단순학습만이 정답이 아닙니다.', 'https://youtu.be/mG_TgmZpM_4?si=amhIzI9_UE_7LJ9u')">
				4~7세 아이를 똑똑하게 만드는 놀이법<br>
				<br>#교육 #학습 #놀이
			</div>
			<div class="item"
				onclick="openPopup('재우기 힘든 아이, 이렇게 해보세요!', '빠른 육퇴를 원하는 당신, 이 영상은 필수입니다!', 'https://youtu.be/VkNnqIPNKpg?si=-uUa_IYI4zR8YBD5')">
				재우기 힘든 아이, 이렇게 해보세요!<br>
				<br>#숙면 #학습 #부모 #육퇴
			</div>
			<div class="item"
				onclick="openPopup('엄마도 사람입니다.', '모두에게 부모는 처음이에요. 현명한 부모가 되기 위한 마음가짐, 이 영상으로 챙겨보세요.', 'https://youtu.be/LzhiMTHUc9w?si=zPMdRY7vPPPKRm_d')">
				엄마도 사람입니다.<br>
				<br>#힐링 #부모 #초보엄마
			</div>
			<div class="item"
				onclick="openPopup('문에 손이 끼였어요', '아이와 함께 시청해주세요! 집 안에도 아야! 할 수 있는게 참 많단다~', 'https://youtu.be/PKWbnhPQTBY?si=ASDbsTArDIp8Yf36')">
				문에 손이 끼였어요<br>
				<br>#교육 #학습 #안전
			</div>


			<!-- <div class="item" onclick="openPopup('제목', '설명', 'https://example.com/4')">항목 이름</div> -->
		</div>
	</div>

	<div id="popup1" class="popup1">
		<div class="popup-content1">
			<span class="close" onclick="closePopup()">&times;</span>
			<h2 id="popup-title1"></h2>
			<p id="popup-description1"></p>
			<p id="popup-url"></p>
			<!-- URL 표시를 위한 요소 추가 -->
		</div>
	</div>

	<script src="assets/js/News.js"></script>
</body>
</html>
