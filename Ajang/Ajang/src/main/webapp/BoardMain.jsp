<%@page import="java.util.List"%>
<%@page import="com.babystep.model.BoardDTO"%>
<%@page import="com.babystep.model.BoardDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8" 	isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   
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
    width: 100%;
    max-width: 1200px;
    margin: 0 auto;
    padding: 20px;
    box-sizing: border-box;
}

/* 기본적인 카드 스타일 */
.card {
    border: 0;
    box-shadow: 0px 0px 10px 0px rgba(0, 0, 0, 0.1); /* 회색 그림자 효과 */
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
    color: #6c757d; /* 회색 제목 색상 */
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
    background: #f1f3f5; /* 밝은 회색 배경 */
    width: auto;
    flex: 1;
}

.search-form select {
    max-width: 150px;
}

.search-form button {
    flex: 0 1 auto;
    width: 100px;
    background-color: #adb5bd; /* 회색 버튼 색상 */
    color: white;
    border: none;
    cursor: pointer;
    transition: background-color 0.3s ease;
}

.search-form button:hover {
    background-color: #868e96; /* 버튼에 호버 시 더 진한 회색 */
}

/* 게시판 테이블 */
table {
    width: 100%;
    border-collapse: collapse;
    margin: 20px 0;
    box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1); /* 테이블에 그림자 효과 추가 */
}

th, td {
    padding: 10px;
    border: 1px solid #ced4da; /* 회색 테두리 */
    text-align: center;
    white-space: nowrap;
}

.title {
    padding: 0px 60px;
}

.hitcount {
    padding: 0px 2px;
}

th {
    background-color: #adb5bd; /* 회색 헤더 배경색 */
    color: white; /* 헤더 텍스트 색상 */
    font-weight: bold;
}

td {
    background-color: #f9f9f9;
}

/* 작성하기 버튼 */
#write {
    width: 100px;
    height: 35px;
    background-color: #adb5bd; /* 회색 버튼 색상 */
    color: white;
    border: none;
    cursor: pointer;
    border-radius: 5px;
    font-size: 1rem;
    transition: background-color 0.3s ease;
    text-align: center;
    line-height: 35px;
    text-decoration: none; /* 링크의 밑줄 제거 */
}

#write:hover {
    background-color: #868e96; /* 버튼에 호버 시 어두운 회색 */
}

/* 작성하기 버튼을 오른쪽으로 정렬 */
.button-wrapper {
    display: flex;
    justify-content: flex-end;
    margin-bottom: 10px;
}

/* 반응형 설정 */
@media (max-width: 768px) {
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
  text-decoration: none; /* 밑줄 제거 */
  color: black;
}

</style>
</head>
<body>
	<% 
    // BoardDAO 객체를 통해 데이터베이스의 모든 게시글을 조회하여 List<BoardDTO> 객체에 저장
	  
    List<BoardDTO> boards = new BoardDAO().allBoard(); 

// 조회된 게시글 리스트의 크기를 출력하여, 게시글의 개수를 확인 (디버깅용)
    System.out.print(boards.size());

    // 조회된 게시글 리스트를 JSP 페이지의 pageContext에 저장하여 이후 페이지에서 사용 가능하게 설정
    pageContext.setAttribute("boards", boards); 
%>

   <div class="container">
      <div class="card">
         <h2>게시판</h2>
         <div class="search-form">
            <select>
               <option value="title">제목</option>
               <option value="name">이름</option>
               <option value="content">내용</option>
            </select>
            <input type="text" placeholder="검색어를 입력하세요">
            <button type="submit">검색</button>
         </div>
         
         <hr>
         <div class="button-wrapper">
            <a href="BoardWrite.jsp" id="write">작성하기</a>
         </div>
         
         <table>
            <tr>
               <th class="num">번호</th>
               <th class="title">제목</th>
               <th class="name">작성자</th>
               <th class="credate">작성일자</th>
               <th class="like">하트수</th>
               <th class="hitcount">조회수</th>
            </tr>
            
            <c:forEach var="b" items="${boards}" varStatus="s">
						<tr>
						
							<td>${s.count}</td>
							<td><a class = titles href="BoardDetail.jsp?num=${b.BO_IDX}">${b.BO_TITLE}</a></td>
							<td>${b.USER_NICK}</td>
							<td>${b.CREATED_AT}</td>
							<td>${b.BO_LIKES}</td>
							<td>${b.BO_VIEWS}</td>
							
						</tr>
					</c:forEach>
            <!-- 게시판 데이터 삽입 -->
         </table>
      </div>
   </div>
<script type="text/javascript">
var title = document.getElementById('title');

title.addEventListener('click', function () {
<% %>

</script>

</body>

</html>
