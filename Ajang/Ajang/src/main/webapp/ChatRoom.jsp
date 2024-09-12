<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Chat Room</title>
    <script>
        let ws;
        let userId = '<%= session.getAttribute("id") %>';
        console.log("사용자 ID: " + userId);
        
        let roomTitle = '<%= request.getParameter("roomTitle") %>';
        console.log("채팅방 이름: " + roomTitle);

        function connect() {
            ws = new WebSocket("ws://localhost:8083/chat/websocket/" + roomTitle);
            
            ws.onmessage = function (event) {
                let message = event.data;
                let chatBox = document.getElementById("chatBox");
                chatBox.innerHTML += '<div>' + message + '</div>';
            };

            ws.onopen = function () {
                console.log("웹소켓 연결 완료");
            };

            ws.onclose = function () {
                console.log("웹소켓 연결 끊김");
            };
        }

        function sendMessage() {
            let message = document.getElementById("message").value;
            if (message.trim() !== "") {
                ws.send(JSON.stringify({
                    userId: userId,
                    roomTitle: roomTitle,
                    content: message
                }));
                document.getElementById("message").value = "";
            }
        }

        window.onload = connect;
    </script>
</head>
<body>
    <h2>Chat Room: <%= request.getParameter("roomTitle") %></h2>
    <div id="chatBox" style="border:1px solid #000; height:300px; overflow-y:scroll; width: 400px;"></div>
    <input type="text" id="message" placeholder="메세지를 입력하세요." style="width: 300px;">
    <button onclick="sendMessage()">Send</button>
</body>
</html>
