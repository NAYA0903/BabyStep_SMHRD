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
    <link rel="icon" href="img/OngalLogoPabi.png" sizes="128x128">
    <title>옹알이방</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        
        .Logo {
        	width: 320px;
        	height: 130px;
        	position: fixed;
        	top:0px;
        	z-index: 1000;
        	background-color: white;
        }
        
        .LogoImg {
        	margin-top:10px;
        }
        
        .search-box {
        	position: fixed;
        	top:110px;
   			display: flex;
    		align-items: center;
    		background-color: #f3f3f3;
    		border-radius: 20px;
    		padding: 10px;
    		width: 310px;
    		height: 20px;
    		margin-bottom: 30px;
    		z-index: 1005;
		}

	    .search-box input {
    		border: none;
  		    background-color: transparent;
    		outline: none;
    		font-size: 14px;
    		width: 100%;
    		padding-left: 30px;
    		color: #999;
		}

		.search-box::before {
   		    content: url('img/search.png');
    		position: absolute;
    		left: 10px;
    		top: 40%;
    		transform: translateY(-50%);
    		width: 16px;
    		height: 16px;
		}
		
        .chat-room-list {
        	margin: 170px 20px 0px ;
            display: flex;
            flex-direction: column;
            gap: 15px; /* 방 사이의 간격 */
        }

        .chat-room {
        	
            display: flex;
            align-items: center;
            background-color: #fff;
            padding: 15px;
            border-radius: 10px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); /* 그림자 효과 */
        }

        .chat-room-thumbnail img {
            width: 60px;
            height: 60px;
            border-radius: 8px;
            object-fit: cover;
        }

        .chat-room-info {
            flex-grow: 1;
            margin-left: 15px;
        }

        .chat-room-info h3 {
            margin: 0;
            font-size: 16px;
            font-weight: bold;
        }

        .chat-room-info p {
            margin: 5px 0;
            color: #888;
            font-size: 14px;
        }

        .chat-room-stats {
            color: #aaa;
            font-size: 12px;
            
        }

        .chat-room-likes {
            font-size: 16px;
            color: #666;
            display: flex;
            align-items: center;
        }
        
        .chat-room:hover {
            background-color: #DCDCDC ; 
        }

		
		.addRoom {
			position: fixed;
			border: none;
			background-color: transparent;
			width: 32px;
			height: 32px;
			cursor: pointer;
			display: flex;
    		justify-content: center;
    		align-items: center;
    		bottom: 20px;
			right: 20px;
		}
		
    </style>
</head>
<body>

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
    
 		<!-- 로고 div -->
    	<div class="Logo">
    		<img src="img/OngalRoomLogo.png" class="LogoImg">
   		</div>
    
    	<!-- 옹알이방 검색 div -->
    	<div class="search-box">
    		<input type="text" class="search" placeholder="옹알이방 이름 검색">
   	 	</div>
    
    <!-- 채팅방 리스트 -->
    <div class="chat-room-list">
        <c:forEach var="room" items="${chatRoomList}" varStatus="s">
            <div class="chat-room" onclick="location.href='chatRoom.jsp?roomIdx=${room.roomIdx}&roomTitle=${room.roomTitle}&userId=${sessionScope.id}'">
    			<div class="chat-room-thumbnail">
        			<img src="img/BabyStepLogo.png" alt="Thumbnail">
   				</div>
    		<div class="chat-room-info">
        		<h3>${room.roomTitle}</h3>
        		<p>#${room.roomTitle}</p>
        		
        			<div class="chat-room-stats">
            			<span>${room.userId}</span> · <span>${room.openedAt}</span>
        			</div>
    		</div>
    		
    <div class="chat-room-likes">
        <span>${room.roomLimit}</span>
    </div>
</div>
        </c:forEach>
    </div>

    <!-- 방 생성 버튼 -->
    <div class="create-room">
        <a href="createChatRoom.jsp">
            <button class="addRoom">
            	<img alt="Add-Room" src="img/addRoom.png">
            </button>
        </a>
    </div>

</body>
</html>
