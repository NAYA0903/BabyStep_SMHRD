<%@page import="com.babystep.model.CountryLikeDAO"%>
<%@page import="com.babystep.model.CountryLikeDTO"%>
<%@page import="com.babystep.model.CountryDAO"%>
<%@page import="com.babystep.model.CountryDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 상세 보기</title>
<style>
body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
	background-color: #f5f5f5;
	margin-top: 150px;
}

.container {
	max-width: 600px;
	margin: 0 auto;
	background-color: white;
	border-radius: 10px;
	box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
	padding: 20px;
	position: relative;
	top: 20px;
	padding-bottom: 50px;
	
}

/* 슬라이더 전체 컨테이너 */
.slider-container {
	position: relative;
	width: 300px;
	height: 300px;
	overflow: hidden;
	margin: 20px auto;
	border-radius: 10px;
	box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
}

/* 슬라이더 이미지들 */
.slider {
	display: flex;
	transition: transform 0.5s ease-in-out;
	width: 400%; /* 이미지가 4개라고 가정하고 4배의 너비를 설정 */
}

/* 각 이미지의 스타일 */
.slider img {
	width: 300px;
	height: 300px;
	object-fit: cover;
	object-position: center;
	border-radius: 10px;
}

/* 화살표 버튼 */
.arrow {
	position: absolute;
	top: 50%;
	transform: translateY(-50%);
	background-color: rgba(0, 0, 0, 0.5);
	color: white;
	border: none;
	padding: 10px;
	cursor: pointer;
	z-index: 10;
	font-size: 18px;
}

.arrow-left {
	left: 10px;
}

.arrow-right {
	right: 10px;
}

/* 슬라이더 아래의 점(페이지네이션) */
.dots {
	text-align: center;
	margin-top: 10px;
}

.dots button {
	border: none;
	width: 10px;
	height: 10px;
	background-color: #bbb;
	border-radius: 50%;
	display: inline-block;
	margin: 5px;
	cursor: pointer;
}

.dots .active {
	background-color: #717171;
}

/* 게시글 정보 스타일 */
.info {
	display: flex;
	align-items: center;
	margin-top: 15px;
}

.profile {
	width: 40px;
	height: 40px;
	background-color: #ddd;
	border-radius: 50%;
	margin-right: 10px;
}

.user-info {
	display: flex;
	flex-direction: column;
}

.user-name {
	font-size: 16px;
	font-weight: bold;
}

.status {
	color: #888;
	font-size: 12px;
}

.post-details {
	margin-top: 20px;
}

.post-title {
	font-size: 18px;
	font-weight: bold;
	margin-bottom: 10px;
}

.post-content {
	font-size: 14px;
	color: #555;
	line-height: 1.6;
}

.footer {
	margin-top: 30px;
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.price {
	font-size: 20px;
	font-weight: bold;
	color: #ff5722;
}

.chat-btn {
	background-color: #ff5722;
	color: white;
	padding: 10px 20px;
	border-radius: 25px;
	border: none;
	cursor: pointer;
	box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
}

.chat-btn:hover {
	background-color: #e64a19;
}

#heart {
	font-size: 27px;
	color: black;
	background: none;
	border: none;
	margin-left: auto; /* 하트를 오른쪽으로 밀기 */
	margin-right: 10px;
}

#heart.liked {
	color: red;
}
</style>
</head>
<body>
   <jsp:include page="Title.jsp" />
	<%
	int num = Integer.parseInt(request.getParameter("num"));
	// 사용자가 요청한 URL에 포함된 num이라는 파라미터 값을 문자열로 받아온다
	CountryDTO dto = new CountryDAO().detailCountry(num);

	// 사용자 세션에서 ID 가져오기
	String userId = (String) session.getAttribute("id");
	boolean isLiked = new CountryLikeDAO().isLikedByUser(userId, num);

	if (dto == null) {
		System.out.println("CountryDTO 객체가 null입니다. 데이터베이스에서 값을 찾지 못했습니다.");
	} else {
		System.out.println("CountryDTO 객체가 정상적으로 반환되었습니다.");
	}

	// num을 전달하여 countryDAO 객체의 detailCountry() 메서드를 호출
	// 이 메서드는 데이터베이스에서 num에 해당하는 게시글을 조회하는 SQL 쿼리를 실행하여 
	// 해당 게시글의 세부 정보를 가져오는 역할을 한다
	// CountryDTO dto는 데이터베이스에서 불러온 게시글의 상세 정보를 저장할 객체이다.
	%>

	<div class="container">
		<div class="slider-container">
			<div class="slider" id="slider">

				<%
				if (dto.getUSED_IMG1() != null) {
				%>
				<img alt="" src="./file/<%=dto.getUSED_IMG1()%>">
				<%
				}
				if (dto.getUSED_IMG2() != null) {
				%>
				<img alt="" src="./file/<%=dto.getUSED_IMG2()%>">
				<%
				}
				if (dto.getUSED_IMG3() != null) {
				%>
				<img alt="" src="./file/<%=dto.getUSED_IMG3()%>">
				<%
				}
				if (dto.getUSED_IMG4() != null) {
				%>
				<img alt="" src="./file/<%=dto.getUSED_IMG4()%>">
				<%
				}
				%>

			</div>


			<button class="arrow arrow-left" id="prevBtn">&#10094;</button>
			<button class="arrow arrow-right" id="nextBtn">&#10095;</button>
		</div>

		<div class="dots" id="dots">
			<button class="active"></button>
			<button></button>
			<button></button>
			<button></button>
		</div>

		<div class="info">
			<div class="profile"></div>
			<div class="user-info">
				<div class="user-name">
					작성자 :
					<%=dto.getUSER_NICK()%></div>
				<div class="status"><%=dto.getCREATED_AT()%></div>
			</div>
		</div>

		<div class="container">
			<div class="post-details">
				<div class="post-title"><%=dto.getUSED_TITLE()%></div>
				<div class="post-content" style="white-space: break-spaces;"><%=dto.getUSED_CONTENT()%></div>
			</div>

			<div class="footer">
				<div class="price"><%=String.format("%,d", dto.getUSED_PRICE())%>원
				</div>

				<!-- 좋아요 버튼, 만약 isLiked가 true면 'liked' 클래스 추가 -->
				<button id="heart" class='<%=isLiked ? "liked" : ""%>'>❤︎</button>




				<button class="chat-btn">옹알이하기</button>
			</div>
		</div>
	</div>

	<script>
	 window.onload = function() {
	        // 하트 버튼 상태 설정
	        var heartBtn = document.getElementById('heart');
	        if (<%=isLiked%>) {
	            heartBtn.classList.add('liked');
	        }

	        // 하트 버튼 클릭 이벤트
	        heartBtn.addEventListener('click', function () {
	            const isLiked = this.classList.toggle('liked'); // 하트 상태 변경
	            const num = <%=num%>; // 게시글 ID

	            if (isLiked) {
	                // 좋아요 추가 요청
	                fetch('CountryLikeService', {
	                    method: 'POST',
	                    headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
	                    body: `action=like&num=${num}`
	                }).then(() => {
	                    console.log('좋아요 추가 성공');
	                }).catch(err => {
	                    console.error('좋아요 추가 실패', err);
	                });
	            } else {
	                // 좋아요 취소 요청
	                fetch('CountryLikeService', {
	                    method: 'POST',
	                    headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
	                    body: `action=unlike&num=${num}`
	                }).then(() => {
	                    console.log('좋아요 취소 성공');
	                }).catch(err => {
	                    console.error('좋아요 취소 실패', err);
	                });
	            }
	        });
	        
    const slider = document.getElementById('slider');
    const prevBtn = document.getElementById('prevBtn');
    const nextBtn = document.getElementById('nextBtn');
    const dots = document.getElementById('dots').getElementsByTagName('button');

    let currentIndex = 0;
    const totalImages = slider.getElementsByTagName('img').length;

    // 슬라이더 위치 업데이트 함수
    function updateSlider() {
        slider.style.transform = `translateX(-${currentIndex * 300}px)`; // 이미지 크기만큼 이동
        for (let i = 0; i < dots.length; i++) {
            dots[i].classList.remove('active');
        }
        dots[currentIndex].classList.add('active');
    }

    // 다음 이미지로 이동
    nextBtn.addEventListener('click', () => {
        currentIndex = (currentIndex + 1) % totalImages;
        updateSlider();
    });

    // 이전 이미지로 이동
    prevBtn.addEventListener('click', () => {
        currentIndex = (currentIndex - 1 + totalImages) % totalImages;
        updateSlider();
    });

    // 페이지 버튼 클릭 시 해당 이미지로 이동
    Array.from(dots).forEach((dot, index) => {
        dot.addEventListener('click', () => {
            currentIndex = index;
            updateSlider();
        });
    });
	 };
   
</script>

</body>
</html>
