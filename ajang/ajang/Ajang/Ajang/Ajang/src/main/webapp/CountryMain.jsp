<%@page import="com.babystep.model.CountryDAO"%>
<%@page import="com.babystep.model.CountryDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>중고나라 게시판</title>

<style>
body {
    margin-top: 150px; /* 타이틀의 높이만큼 마진 추가 */
}

/* 컨테이너 설정 */
.countrys-container {
	max-width: 1200px; /* 최대 너비를 설정하여 가운데 정렬 */
    margin: 0 auto; /* 위아래는 0, 좌우는 자동으로 여백 설정 */
    padding: 20px; /* 안쪽 여백 추가 */
    box-sizing: border-box;
    max-height: 80vh; /* 화면 높이의 80%로 제한 */
    height: calc(100% - 60px); /* 타이틀 섹션 높이를 뺀 나머지 */
}

/* 탑 바 (가운데 정렬) */
.top-bar {
    display: flex;
    justify-content: space-between;
    align-items: center;
    width: 1100px; /* 최대 너비 설정 */
    margin: 0 auto; /* 가운데 정렬 */
    padding: 20px; /* 안쪽 여백 */
    box-sizing: border-box;
}

/* 육아도감 제목을 왼쪽으로 배치 */
.top-bar h1 {
    font-size: 2rem;
    font-weight: bold;
    margin-left: 0; /* 왼쪽으로 정렬 */
}

/* 경계선을 가운데에만 남기고 양 옆 제거 */
.section-divider-c {
    display: flex;
    align-items: center;
    margin: 20px 0;
    position: relative;
    max-width: 1100px; /* 경계선이 가운데로 정렬되도록 설정 */
    margin: 0 auto;
}

.card {
    display: flex;
    justify-content: space-between;
    background-color: white;
    padding: 20px;
    margin: 10px 0; /* 카드 간의 위아래 간격 설정 */
    width: 1000px;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s;
    /* border: 1px solid #ddd; 보더 제거 */
}

/* 카드 사이에만 경계선을 추가 */
.card:not(:last-child) {
    border-bottom: 1px solid #ddd; /* 카드 사이 경계선 */
    padding-bottom: 15px; /* 경계선과 카드 내용 사이 여백 */
}

.card img {
	width: 100px;
	height: 100px;
	object-fit: cover;
	border-radius: 10px;
	margin-right: 15px;
}

.card .content {
	flex-grow: 1;
}

.card .titles {
	font-size: 18px;
	font-weight: bold;
	color: #333;
}

.card .name, .card .date {
	font-size: 14px;
	color: #999;
}

.heart-container {
	display: flex;
	align-items: center;
	cursor: pointer;
}

.heart-container .heart {
	width: 24px;
	height: 24px;
	margin-right: 5px;
}

.heart-container .likes-count {
	font-size: 14px;
	color: #999;
}

.country-form {
	display: flex;
    flex-direction: column;
    align-items: center;
    margin: 10px auto; /* 자동으로 가운데 정렬되도록 설정 */
}

.write-country-button {
	position: fixed;
	bottom: 20px;
	right: 20px;
	background-color: #ff5722;
	color: white;
	font-size: 24px;
	border: none;
	border-radius: 50%;
	width: 60px;
	height: 60px;
	cursor: pointer;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
}

.write-country-button:hover {
	background-color: #e64a19;
}

a {
	text-decoration: none;
	color: inherit;
}

.menu {
	margin-bottom: 120px;
}

/* 다크 모드 전체 배경 및 텍스트 색상 */
body.dark-mode {
    background-color: #1e1e1e;
    color: #e0e0e0;
}

/* 다크 모드에서 컨테이너 설정 */
body.dark-mode .countrys-container {
    background-color: #1e1e1e; /* 어두운 배경 */
    color: #e0e0e0; /* 텍스트 밝은 회색 */
}

/* 다크 모드에서 탑 바 */
body.dark-mode .top-bar {
    background-color: #1e1e1e;
    color: #e0e0e0;
}

/* 다크 모드에서 제목 색상 */
body.dark-mode .top-bar h1 {
    color: #e0e0e0;
}

/* 다크 모드에서 카드 배경과 텍스트 */
body.dark-mode .card {
    background-color: #1e1e1e; /* 카드 배경 어둡게 */
    color: #e0e0e0; /* 텍스트 밝게 */
    border: 1px solid #333;
}

body.dark-mode .card:not(:last-child) {
    border-bottom: 1px solid #333; /* 카드 사이 경계선 어둡게 */
}

body.dark-mode .card:hover {
    background-color: #2c2c2c; /* 호버 시 배경 조금 밝게 */
}

body.dark-mode .card .titles {
    color: #e0e0e0;
}

body.dark-mode .card .name, 
body.dark-mode .card .date {
    color: #999; /* 이름과 날짜 색상 유지 */
}

/* 다크 모드에서 하트 아이콘 및 좋아요 수 */
body.dark-mode .heart-container .likes-count {
    color: #e0e0e0;
}

/* 다크 모드에서 작성하기 버튼 */
body.dark-mode .write-country-button {
    background-color: #333;
    color: #e0e0e0;
}

body.dark-mode .write-country-button:hover {
    background-color: #444;
}

/* 다크 모드에서 경계선 스타일 */
body.dark-mode .section-divider-c {
    border-bottom: 1px solid #333;
}

</style>
</head>
<body>

	<%
	List<CountryDTO> countrys = new CountryDAO().allCountry();
	System.out.print(countrys.size());
	pageContext.setAttribute("countrys", countrys);
	%>

	<!-- 메뉴 바 포함 -->
	<div class="menu-container">
		<jsp:include page="Title.jsp" />
	</div>
	
	<!-- 상단 바 -->
    <div class="top-bar">
        <h2>거래상품</h2>
    </div>

	<!-- 경계 바 -->
    <hr class="section-divider-c">
    
	<div class="countrys-container">

		<div class="country-form">
			<c:forEach var="c" items="${countrys}">
				<div class="card">
					<img src="<%=request.getContextPath()%>/file/${c.USED_IMG1}"
						alt="Item Image">
					<div class="content">
						<div class="titles">
							<div class="titles">
								<a href="CountryDetail.jsp?num=${c.USED_IDX}">${c.USED_TITLE}</a>
							</div>

						</div>
						<div class="name">${c.USER_NICK}</div>
						<div class="date">${c.CREATED_AT}</div>
					</div>
					<div class="heart-container">
						<p>❤️</p>
						<div class="likes-count">${c.USED_LIKE}</div>
					</div>
				</div>
			</c:forEach>
		</div>

		<!-- 글쓰기 버튼 -->
		<a href="CountryWrite.jsp">
			<button class="write-country-button">+</button>
		</a>
	</div>
	
	<script>
	// 스크롤시 자연스럽게 타이틀 사라짐
	let lastScrollTop = 0;
	const title = document.querySelector('.title');

	window.addEventListener('scroll', function () {
	    let scrollTop = window.pageYOffset || document.documentElement.scrollTop;

	    if (scrollTop > lastScrollTop) {
	        // 스크롤을 아래로 내리면 타이틀바를 부드럽게 위로 숨김
	        title.style.top = '-150px'; // 타이틀바 높이만큼 위로 이동
	    } else {
	        // 스크롤을 위로 올리면 타이틀바를 부드럽게 화면 상단에 표시
	        title.style.top = '0';
	    }

	    lastScrollTop = scrollTop;
	});
	</script>

</body>
</html>
