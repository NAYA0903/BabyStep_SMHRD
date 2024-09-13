<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chat Room</title>
    <script>
        let websocket;

        function connect() {
            let roomId = "<%= request.getParameter("roomId") %>";
            let nickname = "<%= request.getParameter("nickname") %>";
            websocket = new WebSocket("ws://localhost:8083/chat/" + roomId + "/" + nickname);

            websocket.onmessage = function(event) {
                const chatBox = document.getElementById("chatBox");
                const message = document.createElement("p");
                message.textContent = event.data;
                chatBox.appendChild(message);
            };

            websocket.onclose = function() {
                alert("연결이 종료되었습니다.");
            };
        }

        function sendMessage() {
            const messageInput = document.getElementById("messageInput");
            websocket.send(messageInput.value);
            messageInput.value = '';
        }
    </script>
    <style>
        /* 스타일 정의 */
        body {
            font-family: Arial, sans-serif;
        }
        #chatBox {
            border: 1px solid #ccc;
            width: 300px;
            height: 400px;
            overflow-y: scroll;
            margin-bottom: 10px;
        }
        #messageInput {
            width: 300px;
        }
    </style>
</head>
<body onload="connect()">
    <h1>채팅방: <%= request.getParameter("roomId") %></h1>

    <div id="chatBox"></div>
    
    <input type="text" id="messageInput" placeholder="메시지 입력">
    <button onclick="sendMessage()">Send</button>
</body>
</html>
