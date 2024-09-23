<%@page import="java.io.PrintWriter"%>
<%@page import="com.babystep.model.DiaryPopupDAO"%>
<%@page import="com.babystep.model.DiaryPopupDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>육아 일기장</title>

<!-- Google Fonts 사용 -->
<link href="https://fonts.googleapis.com/css?family=Nunito&display=swap"
	rel="stylesheet">

<style>
body {
	margin-top: 150px; /* 타이틀의 높이만큼 마진 추가 */
}

.container {
	max-width: 1200px; /* 최대 너비를 설정하여 가운데 정렬 */
	margin: 0 auto; /* 위아래는 0, 좌우는 자동으로 여백 설정 */
	padding: 20px; /* 안쪽 여백 추가 */
	box-sizing: border-box;
	max-height: 80vh; /* 화면 높이의 80%로 제한 */
	height: calc(100% - 60px); /* 타이틀 섹션 높이를 뺀 나머지 */
}

h1 {
	color: #262626;
	text-align: center;
	font-size: 2.5em;
	font-weight: 600;
	margin-bottom: 30px;
}

.entries {
	display: flex;
	flex-direction: column;
	gap: 20px;
	border: 0;
	background-color: #ffffff;
	border-radius: 30px;
	padding: 20px;
	margin-bottom: 1.875rem;
	border: 2px solid black;
}

.entry {
	border: 1px solid #dbdbdb;
	border-radius: 12px;
	background: white;
	overflow: hidden;
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
	transition: transform 0.3s ease;
	display: flex;
	flex-direction: column;
}

.entry:hover {
	transform: scale(1.02);
}

.entry .image-container {
	position: relative;
	width: 100%;
	height: 400px; /* 사진 크기를 줄였습니다 */
}

.entry .image-container img {
	width: 100%;
	height: 100%;
	object-fit: cover;
	display: none; /* 기본적으로 이미지는 보이지 않음 */
}

.entry .image-container img.active {
	display: block; /* active 클래스를 가진 이미지만 표시 */
}

/* 이전/다음 버튼 */
.entry .image-container .prev, .entry .image-container .next {
	position: absolute;
	top: 50%;
	transform: translateY(-50%);
	background-color: rgba(0, 0, 0, 0.5);
	color: white;
	padding: 10px;
	cursor: pointer;
	border-radius: 50%;
	user-select: none;
}

.entry .image-container .prev {
	left: 10px;
}

.entry .image-container .next {
	right: 10px;
}

.entry-content-wrapper {
	display: flex;
	flex-direction: row;
	padding: 15px;
}

.entry-details {
	flex: 1;
	text-align: left;
}

.entry-details div {
	margin-bottom: 8px;
	color: #8e8e8e;
	font-size: 1.1em; /* 글씨 크기 키움 */
}

.entry .diary-content {
	flex: 2;
	color: #262626;
	font-size: 1.2em; /* 글씨 크기 키움 */
	margin-left: 30px;
	line-height: 1.5;
}

/* 반응형 디자인 */
@media ( max-width : 640px) {
	.entry-content-wrapper {
		flex-direction: column;
	}
	.entry .image-container {
		height: 250px; /* 모바일에서 사진 크기 더 작게 */
	}
	.entry .diary-content {
		margin-left: 0;
		margin-top: 15px;
	}
}
</style>

<script>
        // 버튼으로 이미지 전환 기능
        function showImage(sliderId, index) {
            const images = document.querySelectorAll(`#${sliderId} img`);
            images.forEach((img, i) => {
                img.classList.toggle('active', i === index);
            });
        }

        function nextImage(sliderId) {
            const images = document.querySelectorAll(`#${sliderId} img`);
            let currentIndex = [...images].findIndex(img => img.classList.contains('active'));
            let nextIndex = (currentIndex + 1) % images.length;
            showImage(sliderId, nextIndex);
        }

        function prevImage(sliderId) {
            const images = document.querySelectorAll(`#${sliderId} img`);
            let currentIndex = [...images].findIndex(img => img.classList.contains('active'));
            let prevIndex = (currentIndex - 1 + images.length) % images.length;
            showImage(sliderId, prevIndex);
        }
    </script>
</head>
<body>

	<%
	String USER_ID = (String) session.getAttribute("id");
	List<DiaryPopupDTO> diaryList = new DiaryPopupDAO().alldiary(USER_ID);
	System.out.print(diaryList.size());
	pageContext.setAttribute("diaryList", diaryList);
	%>

	<div class="menu-container">
		<jsp:include page="Title.jsp" />
	</div>

	<div class="container">
		<h1>우리 아기 일기장</h1>
		
		<hr>

		<div class="entries">
			<%
			if (diaryList != null && !diaryList.isEmpty()) {
			%>
			<%
			for (DiaryPopupDTO diary : diaryList) {
			%>
			<div class="entry">
				<%-- 사진을 버튼으로 넘길 수 있도록 구현 --%>
				<div class="image-container" id="slider-<%=diary.getDI_IDX()%>">
					<%
					if (diary.getDI_FILE1() != null && diary.getDI_FILE2() != null) {
					%>
					<img src="./file/<%=diary.getDI_FILE1()%>" class="active"> <img
						src="./file/<%=diary.getDI_FILE2()%>"> <span class="prev"
						onclick="prevImage('slider-<%=diary.getDI_IDX()%>')">&#10094;</span>
					<span class="next"
						onclick="nextImage('slider-<%=diary.getDI_IDX()%>')">&#10095;</span>
					<%
					} else if (diary.getDI_FILE1() != null) {
					%>
					<img src="./file/<%=diary.getDI_FILE1()%>" class="active">
					<%
					} else if (diary.getDI_FILE2() != null) {
					%>
					<img src="./file/<%=diary.getDI_FILE2()%>" class="active">
					<%
					}
					%>
				</div>

				<div class="entry-content-wrapper">
					<div class="entry-details">
						<div>
							작성일:
							<%=diary.getCREATED_AT()%></div>
						<div class="babynumber">
							아기 개월수:
							<%=diary.getDI_BABYNUMBER()%></div>
						<div class="height">
							아기 키:
							<%=diary.getDI_HEIGHT()%></div>
						<div class="weight">
							아기 몸무게:
							<%=diary.getDI_WEIGHT()%></div>
					</div>
					<div class="diary-content"><%=diary.getDI_CONTENT()%></div>
				</div>
			</div>
			<%
			}
			%>
			<%
			} else {
			%>
			<p>조회된 일기가 없습니다.</p>
			<%
			}
			%>
		</div>
	</div>

</body>
</html>
