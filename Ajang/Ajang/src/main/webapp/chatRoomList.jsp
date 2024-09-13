<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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

    <div class="room-list">
        <!-- 방 목록을 출력 -->
        <c:forEach var="room" items="${chatRoomList}">
            <div class="room">
                <a href="chatRoom.jsp?roomId=${room.roomIdx}&nickname=${sessionScope.userId}">
                    방 이름: ${room.roomTitle}, 개설자: ${room.userId}
                </a>
            </div>
        </c:forEach>
    </div>

    <!-- 방 생성 버튼 추가 -->
    <div class="create-room">
        <a href="createChatRoom.jsp">
            <button>새 방 만들기</button>
        </a>
    </div>

</body>
</html>
