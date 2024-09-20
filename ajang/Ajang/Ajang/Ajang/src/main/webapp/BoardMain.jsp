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
/* 기본적인 body 스타일 */
html, body {
	height: 100%;
	margin: 0;
	padding: 0;
	font-family: Arial, sans-serif;
	background-color: #f4f4f9;
	color: #333;
}

/* 컨테이너 설정 */
.container {
	width: 1200px;
	margin: 0 auto;
	padding: 20px;
	box-sizing: border-box;
	max-height: 80vh;
	overflow-y: auto;
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
	<div class="menu">
        <jsp:include page="Menu.jsp" />
    </div>

    <%
    List<BoardDTO> boards = new ArrayList<>();
    String searchField = request.getParameter("searchField");
    String searchText = request.getParameter("searchText");
    boards = new BoardDAO().allBoard(); // 모든 게시글 초기 목록

    boolean noResults = false; // 검색 결과가 없는지 체크하는 변수

    // 검색 기능 추가
    if (searchField != null && searchText != null && !searchText.trim().isEmpty()) {
        try {
            searchText = "%" + searchText.trim() + "%"; // 검색어 양쪽에 % 추가
            SearchCriteria criteria = new SearchCriteria(searchField, searchText);
            List<BoardDTO> searchResults = new BoardDAO().searchBoard(criteria.getField(), criteria.getSearchText());

            if (searchResults == null || searchResults.isEmpty()) { // 검색 결과가 없을 때
                noResults = true; 
            } else {
                boards = searchResults; // 검색 결과로 boards 업데이트
            }
        } catch (IllegalArgumentException e) {
            boards = new BoardDAO().allBoard(); // 잘못된 필드일 경우 전체 게시글 반환
        }
    }
    pageContext.setAttribute("boards", boards);
    %>

    <div class="container">
        <div class="card">
            <h2>게시판</h2>
            <form action="BoardMain.jsp" method="post">
                <div class="search-form">
                    <select name="searchField">
                        <option value="BO_TITLE">제목</option>
                        <option value="USER_NICK">이름</option>
                        <option value="BO_CONTENT">내용</option>
                    </select> 
                    <input type="text" name="searchText" placeholder="검색어를 입력하세요">
                    <button type="submit">검색</button>
                </div>
            </form>

            <hr>
            <div class="button-wrapper">
                <a href="BoardWrite.jsp" id="write">작성하기</a>
            </div>

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
                        <td><a class="titles" href="BoardDetail.jsp?num=${b.BO_IDX}">${b.BO_TITLE}</a></td>
                        <td>${b.USER_NICK}</td>
                        <td>${b.CREATED_AT}</td>
                        <td>${b.BO_LIKES}</td>
                        <td>${b.BO_VIEWS}</td>
                    </tr>
                </c:forEach>
            </table>

            <c:if test="${noResults}">
                <script type="text/javascript">
                    alert("검색 결과가 없습니다."); // 검색 결과가 없을 때 알림
                </script>
            </c:if>
        </div>
    </div>
</body>
</html>
