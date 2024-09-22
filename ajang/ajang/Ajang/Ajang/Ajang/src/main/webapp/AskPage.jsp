<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
/* 타이틀 메뉴 아래 body 전체에 마진을 추가 */
body {
    margin-top: 150px; /* 타이틀의 높이만큼 마진 추가 */
}



/* 컨테이너 설정 */
.Board-container {
	width: 1200px;
	margin: 20px auto;
	padding: 20px;
	box-sizing: border-box;
	max-height: 80vh;
	margin-top: 100px; /* 타이틀 높이만큼 간격 추가 */
}

/* 기본적인 카드 스타일 */
.card {
	border: 0;
	box-shadow: 0px 0px 10px 0px rgba(0, 0, 0, 0.1);
	background-color: #ffffff;
	border-radius: 8px;
	padding: 20px;
	margin-bottom: 1.875rem;
}

/* 게시판 제목 */
h2 {
	text-align: center;
	margin-bottom: 20px;
	font-size: 2rem;
	color: #6c757d;
}

/* 검색 폼 디자인 */
.search-form {
	display: flex;
	justify-content: center;
	margin: 1rem 0;
	gap: 10px;
}

.search-form select, .search-form input, .search-form button {
	padding: 0.75rem;
	font-size: 1rem;
	border-radius: 5px;
	border: 1px solid #ced4da;
	background: #f1f3f5;
	width: auto;
	flex: 1;
}

.search-form select {
	max-width: 150px;
}

.search-form button {
	flex: 0 1 auto;
	width: 100px;
	background-color: #adb5bd;
	color: white;
	border: none;
	cursor: pointer;
	transition: background-color 0.3s ease;
}

.search-form button:hover {
	background-color: #868e96;
}

/* 게시판 테이블 */
table {
	width: 100%;
	border-collapse: collapse;
	margin: 20px 0;
	box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
}

th, td {
	padding: 10px;
	border: 1px solid #ced4da;
	text-align: center;
	white-space: nowrap;
}

.titl {
	padding: 0px 60px;
}

.hitcount {
	padding: 0px 2px;
}

th {
	background-color: #adb5bd;
	color: white;
	font-weight: bold;
}

td {
	background-color: #f9f9f9;
}

/* 작성하기 버튼 */
#write {
	width: 100px;
	height: 35px;
	background-color: #adb5bd;
	color: white;
	border: none;
	cursor: pointer;
	border-radius: 5px;
	font-size: 1rem;
	transition: background-color 0.3s ease;
	text-align: center;
	line-height: 35px;
	text-decoration: none;
}

#write:hover {
	background-color: #868e96;
}

/* 작성하기 버튼을 오른쪽으로 정렬 */
.button-wrapper {
	display: flex;
	justify-content: flex-end;
	margin-bottom: 10px;
}

/* 반응형 설정 */
@media ( max-width : 768px) {
	.search-form {
		flex-direction: column;
		align-items: center;
	}
	.search-form select, .search-form input, .search-form button {
		width: 100%;
		margin-bottom: 10px;
	}
	#write {
		width: 100%;
	}
}

.titles {
	text-decoration: none;
	color: black;
}

.menu {
	margin-bottom: 120px;
}
</style>

</head>
<body>

	<!-- 타이틀 부분 -->
	<jsp:include page="Title.jsp" />

    

</body>
</html>