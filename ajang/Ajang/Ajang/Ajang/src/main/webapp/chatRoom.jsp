<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <link rel="icon" href="img/OngalLogoPabi.png" sizes="128x128">
    <title>옹알이방</title>
    <script>
    let websocket;
    let userId = "<%= session.getAttribute("id") %>";  // 세션에서 사용자 ID를 가져옴

    function connect() {
        let roomIdx = "<%= request.getParameter("roomIdx") %>";
        let protocol = window.location.protocol === 'https:' ? 'wss' : 'ws';  // 프로토콜 결정 (http면 ws, https면 wss)
        let host = window.location.hostname;  // 동적으로 현재 호스트를 가져옴
        let port = window.location.port;      // 동적으로 현재 포트를 가져옴
        let wsUrl = `${protocol}://${host}:${port}/Ajang/chat/${roomIdx}`;  // 동적 URL 생성
        console.log("WebSocket URL: ", wsUrl);

        websocket = new WebSocket(wsUrl);

        websocket.onopen = function(event) {
            console.log("WebSocket is open now.");
        };

        websocket.onclose = function(event) {
            console.log("WebSocket is closed now.");
        };

        websocket.onerror = function(event) {
            console.error("WebSocket error observed:", event);
        };

        websocket.onmessage = function(event) {
            const message = event.data;
            const chatBox = document.getElementById("chatBox");

            // 'memberCount:'로 시작하는 메시지는 인원 수 업데이트
            if (message.startsWith("memberCount:")) {
                const memberCount = message.split(":")[1].trim();
                document.getElementById("memberCount").innerText = memberCount + "명";  // 위에 인원 수 표시
            } else {
                // 일반 채팅 메시지 처리
                const messageData = message.split(':');  // 메시지를 'userId: message' 형태로 받는다고 가정
                const senderId = messageData[0].trim();
                const messageContent = messageData[1].trim();

                const messageElement = document.createElement("p");

                // 자신이 보낸 메시지는 오른쪽, 상대방이 보낸 메시지는 왼쪽에 표시
                if (senderId === userId) {
                    messageElement.classList.add("my-message");
                    messageElement.textContent = messageContent;
                } else {
                    messageElement.classList.add("other-message");
                    messageElement.textContent = senderId + ": " + messageContent;
                }

                chatBox.appendChild(messageElement);
                scrollToBottom();  // 메시지를 받으면 스크롤을 맨 아래로 이동
            }
        };
    }
    
    function scrollToBottom() {
        const chatBox = document.getElementById("chatBox");
        setTimeout(() => {
            chatBox.scrollTop = chatBox.scrollHeight;  // 스크롤을 맨 아래로 이동
        }, 100);  // DOM 업데이트가 완료될 시간을 고려해 약간의 딜레이 추가
    }

    function sendMessage() {
        const messageInput = document.getElementById("messageInput");
        if (websocket && websocket.readyState === 1) {
            console.log("Sending message: " + messageInput.value);
            websocket.send(messageInput.value);
            messageInput.value = '';
            toggleSendButton();  // 전송 후 버튼 비활성화
            scrollToBottom();  // 메시지를 전송한 후 스크롤을 아래로 이동
        } else {
            console.error("WebSocket 연결이 열려 있지 않습니다.");
        }
    }
    
    // Enter 키로 메시지 전송
    document.addEventListener("keydown", function(event) {
        if (event.key === "Enter") {
            event.preventDefault(); // Enter 시 줄바꿈 방지
            sendMessage();
        }
    });
    
    // 전송 버튼 활성화/비활성화 함수
    function toggleSendButton() {
        const messageInput = document.getElementById("messageInput");
        const sendButton = document.getElementById("sendButton");
        
        // 입력된 값이 없거나 공백만 있을 경우 비활성화
        if (messageInput.value.trim() === "") {
            sendButton.disabled = true;
        } else {
            sendButton.disabled = false;
        }
    }

    // 페이지가 로드될 때 버튼을 비활성화 상태로 설정
    window.onload = function() {
        connect();  // 웹소켓 연결
        toggleSendButton();  // 처음엔 버튼 비활성화
        scrollToBottom();
        
        // textarea의 입력 이벤트 감지
        const messageInput = document.getElementById("messageInput");
        messageInput.addEventListener("input", toggleSendButton);
    };
</script>
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        
        .top {
        	display: flex;
        	position: fixed;
        	top: 0px;
        	height: 100px;
        	background-color: white;
        	width: 100%;
        	align-items: center;  /* 세로 정렬 */
        }
        
        .logo {
        	width: 50px;
        	height: 50px;
        	margin-right: 10px;
        }
        
        .room-info {
        	display: flex;
        	flex-direction: column;
        }
        
        .room-info h6 {
        	margin: 0;
        	font-size: 18px;
        	font-weight: bold;
        }
        
        .room-info p {
        	margin: 5px 0 0;
        	color: gray;
        	font-size: 14px;
        }
        
        #chatBox {
        	margin-top: 100px;
            width: 100%;
            height: calc(100% - 120px);
            overflow-y: auto;
            margin-bottom: 140px;
            background-color: white;
            color: black;
            padding: 0px;
            
        }
        
        textarea {
   			width: 320px;
    		padding: 10px;
    		resize: none;  /* 사용자가 textarea 크기를 조절하지 못하게 설정 */
    		word-wrap: break-word;  /* 자동 줄바꿈을 명시적으로 설정 */
    		overflow-wrap: break-word;  /* 긴 단어를 줄바꿈할 때도 처리 */
    		white-space: pre-wrap;  /* 줄바꿈과 공백을 유지 */
    		vertical-align: top;
            text-align: left;
            border: none;
            height: 70px;
		  	outline: none; /* 포커스 시 외곽선 제거 */
		}

		textarea:focus {
   			border: none; /* 클릭 시 테두리 제거 */
    		outline: none; /* 포커스 시 외곽선 제거 */
		}
		
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
        
        .input {
        	bottom: 0px;
        	position: fixed;
        	width: 100%;
        	height: 130px;
        	display: flex;
        	background-color: white;
        }
        
        #messageInput {
        	margin-bottom: 30px;
        }
        
        .btn {
    		background-color: white;
    		position: fixed;
    		bottom: 10px; /* 아래에서 10px 떨어지도록 설정 */
    		right: 10px; /* 오른쪽에서 10px 떨어지도록 설정 */
    		height: 30px;
		}

		button.send {
    		width: 60px; /* 버튼 너비 설정 */
    		height: 100%; /* 버튼 높이 설정 */
    		background-color: #4CAF50; /* 버튼 색상 */
    		color: white; /* 버튼 텍스트 색상 */
    		border: none;
    		border-radius: 5px;
    		cursor: pointer;
		}

		button.send:hover {
    		background-color: #45a049; /* 마우스 오버 시 색상 */
		}
		
		button.send:disabled {
    		background-color: #d3d3d3;  /* 밝은 회색 */
    		color: #ffffff;
    		cursor: not-allowed;  /* 마우스 커서를 '금지' 모양으로 변경 */
		}
        
		::-webkit-scrollbar {
		    width: 4px; /* 세로 스크롤바 너비 */
		    height: 1px; /* 가로 스크롤바 높이 */
		}

		::-webkit-scrollbar-track {
		    background: #f0f0f0; /* 트랙 색상 */
		    border-radius: 10px; /* 둥근 모서리 */
		}

		::-webkit-scrollbar-thumb {
		    background-color: #4CAF50; /* 스크롤바 색상 */
		    border-radius: 10px; /* 둥근 모서리 */
		}

		::-webkit-scrollbar-thumb:active {
		    background-color: #2E7D32; /* 클릭 시 색상 */
		}
    </style>
</head>
<body>
    
    <div class="top">
    	<img alt="Logo" src="img/BabyStepLogo.png" class="logo">
    	<div class="room-info">
    		<h6><%= request.getParameter("roomTitle") %></h6>  <!-- 방 제목 -->
			<p id="memberCount"><img src="img/Mypage2.png" alt="people icon" style="width: 16px; height: 16px; margin-right: 5px;"> 0명</p>
    	</div>
	</div>
	
    <div id="chatBox"></div>
    
    <div class="input">
    	<textarea id="messageInput" placeholder="메시지 입력" rows="3" style="width: 300px;"></textarea>
    </div>
    
    <div class="btn">
    	<button id="sendButton" class="send" onclick="sendMessage()" disabled>전송</button>
	</div>
	    	
</body>
</html>
