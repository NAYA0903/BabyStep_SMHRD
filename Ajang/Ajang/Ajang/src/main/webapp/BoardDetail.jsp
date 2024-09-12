<%@page import="com.babystep.model.BoardDAO"%>
<%@page import="com.babystep.model.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 상세보기</title>
<style>
  body {
    font-family: Arial, sans-serif;
    background-color: #f4f4f9;
    color: #333;
    margin: 0;
    padding: 20px;
  }

  #board {
    width: 80%;
    max-width: 800px;
    margin: 0 auto;
    padding: 20px;
    background-color: #fff;
    box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
    border-radius: 8px;
  }

  #list {
    width: 100%;
    border-collapse: collapse;
  }

  #list tr, #list td {
    padding: 10px;
    border: 1px solid #ddd;
  }

  #list td {
    text-align: left;
  }

  #list h3 {
    margin: 0;
    padding: 0;
  }

  img {
    max-width: 200px;
    margin: 10px 0;
    border-radius: 5px;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
  }

  button {
    background-color: #adb5bd;
    color: white;
    border: none;
    padding: 10px 20px;
    border-radius: 5px;
    cursor: pointer;
  }

  button:hover {
    background-color: #868e96;
  }

  td[colspan="2"] {
    text-align: center;
  }
</style>
</head>
<body>

	<%
	// 게시글 번호를 통해 조회수 증가 및 게시글 상세정보 불러오기
	int num = Integer.parseInt(request.getParameter("num"));
	BoardDTO dto = new BoardDAO().detailBoard(num); // 게시글 상세 정보 가져오기
	%>

	<div id="board">
		<table id="list">
			<tr>
				<td>제목</td>
				<td><%=dto.getBO_TITLE()%></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td><%=dto.getUSER_ID()%></td>
			</tr>
			<tr>
				<td colspan="2">내용</td>
			</tr>
			<tr>
				<td colspan="2">
					<img alt="" src="./file/<%=dto.getBO_FILENAME1()%>"> 
					<img alt="" src="./file/<%=dto.getBO_FILENAME2()%>"> 
					<img alt="" src="./file/<%=dto.getBO_FILENAME3()%>"> 
					<img alt="" src="./file/<%=dto.getBO_FILENAME4()%>">
					<h3><%=dto.getBO_CONTENT()%></h3> 
				</td>
			</tr>
			<tr>
				<td colspan="2"><a href="BoardMain.jsp"><button>뒤로가기</button></a></td>
			</tr>
		</table>
	</div>

</body>
</html>
