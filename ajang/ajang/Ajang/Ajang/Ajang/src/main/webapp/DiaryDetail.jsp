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
<link rel="stylesheet" href="assets/css/DiaryDetail.css">

<!-- Google Fonts 사용 -->
<link href="https://fonts.googleapis.com/css?family=Nunito&display=swap"
	rel="stylesheet">

</head>
<body>

	<%
	String USER_ID = (String) session.getAttribute("id");
	int babyage = new DiaryPopupDAO().babyage(USER_ID);
	List<DiaryPopupDTO> diaryList = new DiaryPopupDAO().alldiary(USER_ID);
	System.out.print(diaryList.size());
	pageContext.setAttribute("diaryList", diaryList);
	%>

	<div class="menu-container">
		<jsp:include page="Title.jsp" />
	</div>

	<div class="diary-detail-container">
		<h1>우리 아기 일기장</h1>

		<hr>

		<div class="diary-detail-entries">
			<%
			if (diaryList != null && !diaryList.isEmpty()) {
			%>
			<%
			for (DiaryPopupDTO diary : diaryList) {
			%>
			<div class="diary-detail-entry">
				<%-- 사진을 버튼으로 넘길 수 있도록 구현 --%>
				<div class="diary-detail-image-container"
					id="slider-<%=diary.getDI_IDX()%>">
					<%
					if (diary.getDI_FILE1() != null && diary.getDI_FILE2() != null) {
					%>
					<img src="./file/<%=diary.getDI_FILE1()%>" class="active"> <img
						src="./file/<%=diary.getDI_FILE2()%>"> <span
						class="diary-detail-prev"
						onclick="prevImage('slider-<%=diary.getDI_IDX()%>')">&#10094;</span>
					<span class="diary-detail-next"
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

			<div class="diary-detail-entry-content-wrapper">
	
    <div class="diary-detail-entry-details">
        <div>작성일: <%=diary.getCREATED_AT()%></div>
        <div class="height">아기 키: <%=diary.getDI_HEIGHT()%></div>
        <div class="weight">아기 몸무게: <%=diary.getDI_WEIGHT()%></div>
    </div>

    <div class="diary-detail-diary-content" style="white-space: break-spaces;">
        <p><%=diary.getDI_CONTENT()%></p>
    </div>
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

</body>
</html>
