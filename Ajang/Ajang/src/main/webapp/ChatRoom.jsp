<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Chat Rooms</title>
</head>
<body>
    <h2>Available Chat Rooms</h2>

    <ul>
        <!-- 방 목록을 반복해서 출력 -->
        <c:forEach var="room" items="${rooms}">
            <li>
                ${room.roomTitle} - <a href="/chatRoom?roomIdx=${room.roomIdx}">Enter Room</a>
            </li>
        </c:forEach>
    </ul>

    <!-- 새로운 방 생성 폼 -->
    <form action="/createRoom" method="post">
        <input type="text" name="roomTitle" placeholder="Room Title" required>
        <input type="text" name="roomInfo" placeholder="Room Info" required>
        <input type="number" name="roomLimit" placeholder="Room Limit" required>
        <input type="hidden" name="userId" value="<%= session.getAttribute("id") %>">
        <input type="text" name="roomStatus" placeholder="Room Status (active/inactive)" required>
        <input type="text" name="roomImg" placeholder="Room Image URL">
        <button type="submit">Create Room</button>
    </form>
</body>
</html>
