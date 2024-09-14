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
        let userId = "<%= session.getAttribute("id") %>";  // 세션에서 사용자 ID를 가져옴

        function connect() {
            let roomIdx = "<%= request.getParameter("roomIdx") %>";
            websocket = new WebSocket("ws://localhost:8083/Ajang/chat/" + roomIdx);

            websocket.onmessage = function(event) {
                const chatBox = document.getElementById("chatBox");
                const messageData = event.data.split(':');  // 메시지를 'userId: message' 형태로 받는다고 가정
                const senderId = messageData[0].trim();
                const messageContent = messageData[1].trim();

                const message = document.createElement("p");

                // 자신이 보낸 메시지는 오른쪽, 상대방이 보낸 메시지는 왼쪽에 표시
                if (senderId === userId) {
                    message.classList.add("my-message");
                    message.textContent = "나: " + messageContent;
                } else {
                    message.classList.add("other-message");
                    message.textContent = senderId + ": " + messageContent;
                }

                chatBox.appendChild(message);
                chatBox.scrollTop = chatBox.scrollHeight;  // 스크롤을 맨 아래로 이동
            };

            websocket.onclose = function() {
                alert("WebSocket 연결이 종료되었습니다.");
            };
        }

        function sendMessage() {
            const messageInput = document.getElementById("messageInput");
            if (websocket && websocket.readyState === 1) {
                console.log("Sending message: " + messageInput.value);
                websocket.send(messageInput.value);
                messageInput.value = '';
            } else {
                console.error("WebSocket connection is not open");
            }
        }
        
     // Enter 키로 메시지 전송
        document.addEventListener("keydown", function(event) {
            if (event.key === "Enter") {
                sendMessage();
            }
        });
     
    </script>
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        #chatBox {
            border: 1px solid #ccc;
            width: 300px;
            height: 400px;
            overflow-y: scroll;
            margin-bottom: 10px;
            background-color: white;
            color: black;
            padding: 10px;
        }
        #messageInput {
            width: 300px;
        }

        /* 메시지 스타일 */
        .my-message {
            text-align: right;
            background-color: #e0ffe0;
            padding: 5px;
            border-radius: 10px;
            margin: 5px;
            color: #000;
        }

        .other-message {
            text-align: left;
            background-color: #f0f0f0;
            padding: 5px;
            border-radius: 10px;
            margin: 5px;
            color: #000;
        }
    </style>
</head>
<body onload="connect()">
    <h1>채팅방: <%= request.getParameter("roomIdx") %></h1>

    <div id="chatBox"></div>
    
    <input type="text" id="messageInput" placeholder="메시지 입력">
    <button onclick="sendMessage()">Send</button>
</body>
</html>
