<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Chat Room</title>
    <script>
        let ws;
        let USER_ID = '<%= session.getAttribute("id") %>';
        console.log("User ID: " + USER_ID);
        
        let ROOM_IDX = '<%= request.getParameter("ROOM_IDX") %>';
        console.log("Room ID: " + ROOM_IDX);

        function connect() {
            ws = new WebSocket("ws://localhost:8083/chat/websocket/" + ROOM_IDX);
            
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
                    userId: USER_ID,
                    roomIdx: ROOM_IDX,
                    content: message
                }));
                document.getElementById("message").value = "";
            }
        }

        window.onload = connect;
    </script>
</head>
<body>
    <h2>Chat Room: <%= request.getParameter("ROOM_IDX") %></h2>
    <div id="chatBox" style="border:1px solid #000; height:300px; overflow-y:scroll; width: 400px;"></div>
    <input type="text" id="message" placeholder="Type a message" style="width: 300px;">
    <button onclick="sendMessage()">Send</button>
</body>
</html>
