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
		<jsp:include page="Title.jsp" />
	</div>

	<!-- 상단 바 -->
	<div class="top-bar">
		<h2>영상추천</h2>
		<div class="search-container">
			<input type="text" class="search-input" placeholder="검색어를 입력하세요">
			<button class="search-button">검색</button>
		</div>
	</div>



	<!-- 경계 바 -->
	<hr class="section-divider-a">

	<div class="News-container">
		<div class="item-list">
			<!-- 각 항목 클릭 시 바로 URL로 이동하도록 설정 -->
			<div class="item">
				<div class="item-info">
					<h3>적절한 이유식 시작 시기</h3>
					<p>초보 엄마를 위한 이유식 시작 시기에 대한 설명이 담긴 영상입니다.</p>
				</div>
				<button class="news-watch-button"
					onclick="newsWatchVideo('https://youtu.be/l0lnoaBMOFY')">영상
					시청</button>
			</div>

			<div class="item">
				<div class="item-info">
					<h3>이유식 준비물과 추천 레시피</h3>
					<p>어떤 이유식을 먹여야 우리아이에게 좋은지 고민이시죠? 이 영상 하나로 고민 해결해보세요!</p>
				</div>
				<button class="news-watch-button"
					onclick="newsWatchVideo('https://youtu.be/A6ejeygQOaU')">영상
					시청</button>
			</div>

			<div class="item">
				<div class="item-info">
					<h3>부모가 절대 소리치지 않으면 아이들은 이렇게 자랍니다.</h3>
					<p>현명한 훈육법에 관한 영상입니다.</p>
				</div>
				<button class="news-watch-button"
					onclick="newsWatchVideo('https://youtu.be/mnAI0vuJZCQ?si=s3XwDsIi1LOeZdGj')">영상
					시청</button>
			</div>

			<div class="item">
				<div class="item-info">
					<h3>내 아들 자존감 높게 키우는 법</h3>
					<p>내 아이가 어디서든 당당했으면 좋겠다면? 지금 당장 시청하세요.</p>
				</div>
				<button class="news-watch-button"
					onclick="newsWatchVideo('https://youtu.be/CUFswRt-v8E?si=mtulBj3doaox_IYY')">영상
					시청</button>
			</div>

			<div class="item">
				<div class="item-info">
					<h3>똑똑한 아이들은 OO을 잘합니다.</h3>
					<p>OO은 과연 무엇일까요? 영상 속에서 확인해주세요.</p>
				</div>
				<button class="news-watch-button"
					onclick="newsWatchVideo('https://youtu.be/8nHxEdnbIm0?si=N-q7cXeSqfgZMLR7')">영상
					시청</button>
			</div>

			<div class="item">
				<div class="item-info">
					<h3>아이에게 욱해서 화냈다면 5분 안에 해야 할 말</h3>
					<p>부모도 사람입니다! 내 아이에게 상처가 생겼다면 얼른 연고를 발라주세요.</p>
				</div>
				<button class="news-watch-button"
					onclick="newsWatchVideo('https://youtu.be/Nnz75WJITlE?si=yLaghQD0gdNl4hRe')">영상
					시청</button>
			</div>

			<div class="item">
				<div class="item-info">
					<h3>4~7세 아이를 똑똑하게 만드는 놀이법</h3>
					<p>똑똑한 아이를 키우고 싶은건 모든 부모가 같은 마음일거에요. 하지만 단순학습만이 정답이 아닙니다.</p>
				</div>
				<button class="news-watch-button"
					onclick="newsWatchVideo('https://youtu.be/mG_TgmZpM_4?si=amhIzI9_UE_7LJ9u')">영상
					시청</button>
			</div>

			<div class="item">
				<div class="item-info">
					<h3>재우기 힘든 아이, 이렇게 해보세요!</h3>
					<p>빠른 육퇴를 원하는 당신, 이 영상은 필수입니다!</p>
				</div>
				<button class="news-watch-button"
					onclick="newsWatchVideo('https://youtu.be/VkNnqIPNKpg?si=-uUa_IYI4zR8YBD5')">영상
					시청</button>
			</div>

			<div class="item">
				<div class="item-info">
					<h3>엄마도 사람입니다.</h3>
					<p>모두에게 부모는 처음이에요. 현명한 부모가 되기 위한 마음가짐, 이 영상으로 챙겨보세요.</p>
				</div>
				<button class="news-watch-button"
					onclick="newsWatchVideo('https://youtu.be/LzhiMTHUc9w?si=zPMdRY7vPPPKRm_d')">영상
					시청</button>
			</div>

			<div class="item">
				<div class="item-info">
					<h3>문에 손이 끼였어요</h3>
					<p>아이와 함께 시청해주세요! 집 안에도 아야! 할 수 있는게 참 많단다~</p>
				</div>
				<button class="news-watch-button"
					onclick="newsWatchVideo('https://youtu.be/PKWbnhPQTBY?si=ASDbsTArDIp8Yf36')">영상
					시청</button>
			</div>




			<!-- <div class="item" onclick="openPopup('제목', '설명', 'https://example.com/4')">항목 이름</div> -->
		</div>
	</div>

	

	<script src="assets/js/News.js"></script>
</body>
</html>
