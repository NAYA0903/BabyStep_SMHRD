<%@page import="java.util.List"%>
<%@page import="com.babystep.model.BoardDTO"%>
<%@page import="com.babystep.model.BoardDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.babystep.model.SearchCriteria"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<style>
/* 타이틀 메뉴 아래 body 전체에 마진을 추가 */
body {
    margin-top: 150px; /* 타이틀의 높이만큼 마진 추가 */
}



/* 컨테이너 설정 */
.Board-container {
	max-width: 1200px; /* 최대 너비를 설정하여 가운데 정렬 */
    margin: 0 auto; /* 위아래는 0, 좌우는 자동으로 여백 설정 */
    padding: 20px; /* 안쪽 여백 추가 */
    box-sizing: border-box;
    max-height: 80vh; /* 화면 높이의 80%로 제한 */
    height: calc(100% - 60px); /* 타이틀 섹션 높이를 뺀 나머지 */
}

/* 기본적인 카드 스타일 */
.Board-card {
	border: 0;
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
	color: black;
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
	border: 1px solid black;
	background: white;
	width: auto;
	flex: 1;
}

.search-form select {
	max-width: 150px;
}

.search-form button {
	flex: 0 1 auto;
	width: 100px;
	background-color: white;
	color: black;
	border: 1px solid black;
	cursor: pointer;
	transition: background-color 0.3s ease;
}

.search-form button:hover {
	background-color: #9b9b9b;
	border: 1px solid white;
}

/* 게시판 테이블 */
table {
	width: 100%;
	border-collapse: collapse;
	margin: 20px 0;
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
	background-color: #f9f9f9;
	color: black;
	font-weight: bold;
}

td {
	background-color: white;
}

/* 작성하기 버튼 */
#write {
	width: 100px;
	height: 35px;
	background-color: #A0DAD0;
	color: white;
	cursor: pointer;
	border-radius: 5px;
	font-size: 1rem;
	transition: background-color 0.3s ease;
	text-align: center;
	line-height: 35px;
	text-decoration: none;
	
}

#write:hover {
	background-color: #76C7C0;
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

/* 다크 모드 전체 배경 및 텍스트 색상 */
body.dark-mode {
    background-color: #1e1e1e;
    color: #e0e0e0;
}

/* 다크 모드에서 컨테이너 설정 */
body.dark-mode .Board-container {
    background-color: #1e1e1e; /* 어두운 배경 */
    color: #e0e0e0; /* 텍스트 밝은 회색 */
}

/* 다크 모드에서 카드 스타일 */
body.dark-mode .Board-card {
    background-color: #1e1e1e; /* 어두운 배경 */
    color: #e0e0e0; /* 텍스트 밝은 회색 */
}

/* 다크 모드에서 게시판 제목 */
body.dark-mode h2 {
    color: #e0e0e0; /* 텍스트 색상 밝게 */
}

/* 다크 모드에서 검색 폼 디자인 */
body.dark-mode .search-form select,
body.dark-mode .search-form input {
    background-color: #333; /* 어두운 배경 */
    color: #e0e0e0; /* 텍스트 밝은 회색 */
    border: 1px solid #444; /* 테두리 어둡게 */
}

body.dark-mode .search-form button {
    background-color: #333;
    color: #e0e0e0;
    border: 1px solid #444;
}

body.dark-mode .search-form button:hover {
    background-color: #444;
    border: 1px solid #555;
}

/* 다크 모드에서 게시판 테이블 */
body.dark-mode table {
    background-color: #1e1e1e; /* 테이블 배경 어둡게 */
    color: #e0e0e0; /* 텍스트 색상 밝게 */
}

body.dark-mode th {
    background-color: #333; /* 헤더 배경 어둡게 */
    color: #e0e0e0;
}

body.dark-mode td {
    background-color: #1e1e1e; /* 테이블 셀 배경 어둡게 */
    color: #e0e0e0;
}

/* 다크 모드에서 작성하기 버튼 */
body.dark-mode #write {
    background-color: #333;
    color: #e0e0e0;
}

body.dark-mode #write:hover {
    background-color: #444;
}

/* 다크 모드에서 링크 색상 */
body.dark-mode .titles {
    color: #e0e0e0;
}

</style>
</head>
<body>
	<div class="menu-container">
        <jsp:include page="Title.jsp" />
    </div>

    <%
    List<BoardDTO> boards = new ArrayList<>();
    String searchField = request.getParameter("searchField");
    String searchText = request.getParameter("searchText");

    // 초기 목록: 모든 게시글 가져오기
    boards = new BoardDAO().allBoard();

    boolean noResults = false; // 검색 결과가 없는지 체크하는 변수

    // 검색 기능 추가
    if (searchField != null && searchText != null && !searchText.trim().isEmpty()) {
        try {
            // 검색어 처리
            searchText = "%" + searchText.trim() + "%"; // % 추가

            // 로그 출력
            System.out.println("Searching with: " + searchText);

            // 검색 조건 생성
            SearchCriteria criteria = new SearchCriteria(searchField, searchText);
            List<BoardDTO> searchResults = new BoardDAO().searchBoard(criteria.getField(), criteria.getSearchText());

            if (searchResults == null || searchResults.isEmpty()) {
                noResults = true; // 검색 결과가 없으면 true로 설정
                boards.clear(); // boards를 비워서 아무 것도 표시하지 않음
            } else {
                boards = searchResults; // 검색 결과가 있으면 해당 결과로 boards 업데이트
            }
        } catch (IllegalArgumentException e) {
            boards = new BoardDAO().allBoard(); // 잘못된 필드면 전체 게시글 반환
        }
    }
    // 검색 기능 추가 종료

    pageContext.setAttribute("boards", boards);
    %>

    <div class="Board-container">
        <div class="Board-card">
            <h2>놀이터</h2>
            <form action="BoardMain.jsp" method="post">
                <div class="search-form">
                    <select name="searchField">
                        <option value="BO_TITLE">제목</option>
                        <option value="BO_CONTENT">내용</option>
                    </select> 
                    <input type="text" name="searchText" placeholder="검색어를 입력하세요">
                    <button type="submit">검색</button>
                </div>
            </form>

            <hr>

            <table>
                <tr>
                    <th class="num">번호</th>
                    <th class="titl">제목</th>
                    <th class="name">작성자</th>
                    <th class="credate">작성일자</th>
                    <th class="like">하트수</th>
                    <th class="hitcount">조회수</th>
                </tr>
                

                <c:forEach var="b" items="${boards}" varStatus="s">
                    <tr>
                        <td>${s.count}</td>
                        <td><a class="titles" href="BoardService?num=${b.BO_IDX}" onclick="increaseViews(${b.BO_IDX}); return false;">${b.BO_TITLE}</a></td>
                        <td>${b.USER_NICK}</td>
                        <td>${b.CREATED_AT}</td>
                        <td>${b.BO_LIKES}</td>
                        <td>${b.BO_VIEWS}</td>
                    </tr>
                </c:forEach>
            </table>
            
            <div class="button-wrapper">
                <a href="BoardWrite.jsp" id="write">작성하기</a>
            </div>

            <c:if test="${noResults}">
                <script type="text/javascript">
                    alert("검색 결과가 없습니다. 검색어를 다시 입력해주세요."); // 검색 결과가 없을 때 경고창 표시
                </script>
            </c:if>
        </div>
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
	
	function increaseViews(boIdx) {
	    fetch('BoardService?num=' + boIdx)
	        .then(response => {
	            if (response.ok) {
	                window.location.href = 'BoardDetail.jsp?num=' + boIdx;
	            }
	        })
	        .catch(error => console.log('조회수 증가 실패: ', error));
	}
	</script>
	
</body>
</html>
