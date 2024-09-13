<%@page import="com.babystep.model.ChatRoomDAO"%>
<%@page import="com.babystep.model.ChatRoomDTO"%>
<%@page import="com.babystep.db.SqlSessionManager"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>옹알이방 리스트</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        .room-list {
            margin: 20px;
        }
        .room {
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
        }
        .room a {
            text-decoration: none;
            color: #333;
        }
        .create-room {
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <h1>옹알이방</h1>
    
    <% 
    SqlSession sqlSession = null;
    List<ChatRoomDTO> chatRoomList = null;

    try {
        sqlSession = SqlSessionManager.getSession(); // SqlSession 생성
        ChatRoomDAO chatRoomDAO = new ChatRoomDAO(sqlSession); // SqlSession을 사용하여 DAO 객체 생성
        chatRoomList = chatRoomDAO.selectAllChatRooms(); // 메소드 호출
        pageContext.setAttribute("chatRoomList", chatRoomList); // 결과를 pageContext에 저장
    } catch (Exception e) {
        e.printStackTrace(); // 예외 처리
    } finally {
        if (sqlSession != null) {
            sqlSession.close(); // 세션 닫기
        }
    }
    %>
    
    <table>
        <tr>
            <th class="num">번호</th>
            <th class="title">옹알이 방 제목</th>
            <th class="name">생성자</th>
            <th class="open">생성일자</th>
            <th class="limit">제한인원</th>
        </tr>
        
        <c:forEach var="room" items="${chatRoomList}" varStatus="s">
            <tr>
                <td>${s.index + 1}</td> <!-- 1부터 시작 -->
                <td><a href="chatRoom.jsp?num=${room.roomIdx}">${room.roomTitle}</a></td>
                <td>${room.userId}</td>
                <td>${room.openedAt}</td>
                <td>${room.roomLimit}</td>
            </tr>
        </c:forEach>
    </table>

    <!-- 방 생성 버튼 추가 -->
    <div class="create-room">
        <a href="createChatRoom.jsp">
            <button>새 방 만들기</button>
        </a>
    </div>

</body>
</html>
