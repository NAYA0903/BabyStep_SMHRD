<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chat Application</title>
    <style>
        ul { list-style-type: none; padding: 0; }
        li { padding: 8px; background: #f4f4f4; margin-bottom: 5px; }
        input { padding: 10px; width: 70%; }
        button { padding: 10px; width: 20%; }
    </style>
</head>
<body>
    <div id="nicknameDiv">
        <input id="nicknameInput" placeholder="Enter your nickname" />
        <button onclick="setNickname()">Set Nickname</button>
    </div>

    <div id="chatDiv" style="display: none;">
        <ul id="messages"></ul>
        <input id="input" autocomplete="off" /><button onclick="sendMessage()">Send</button>
        <button onclick="location.href='Main.jsp'">메인으로 이동</button>
    </div>

    <script>
        var socket = new WebSocket("ws://localhost:8083/chat/websocket");
        var nickname = '';

        // 닉네임 설정 함수
        function setNickname() {
            nickname = document.getElementById("nicknameInput").value;
            if (nickname.trim() !== '') {
                document.getElementById("nicknameDiv").style.display = 'none';
                document.getElementById("chatDiv").style.display = 'block';
            } else {
                alert('Please enter a valid nickname.');
            }
        }

        // WebSocket 연결이 열렸을 때 실행되는 이벤트 핸들러
        socket.onopen = function(event) {
            console.log("WebSocket is open now.");
        };

        // WebSocket 연결이 닫혔을 때 실행되는 이벤트 핸들러
        socket.onclose = function(event) {
            console.log("WebSocket is closed now.");
        };

        // WebSocket 연결 에러가 발생했을 때 실행되는 이벤트 핸들러
        socket.onerror = function(event) {
            console.error("WebSocket error observed:", event);
        };

        // WebSocket 메시지를 수신할 때 호출되는 함수
        socket.onmessage = function(event) {
            var li = document.createElement("li");
            li.textContent = event.data;
            document.getElementById("messages").appendChild(li);
        };

        // 메시지를 서버로 전송하는 함수
        function sendMessage() {
            var input = document.getElementById("input");
            console.log("일단 sendMessage()도달");
            if (socket.readyState === WebSocket.OPEN) {
                if (nickname.trim() !== '') {
                    // 닉네임과 함께 메시지를 전송
                    socket.send(nickname + ": " + input.value);
                    console.log("socket.send 도달");
                    input.value = ''; // 메시지를 보낸 후 입력 필드를 비웁니다.
                } else {
                    alert('닉네임부터 입력하세요!');
                }
            } else {
                console.error("WebSocket is not open: " + socket.readyState);
            }
        }
    </script>
</body>
</html>

