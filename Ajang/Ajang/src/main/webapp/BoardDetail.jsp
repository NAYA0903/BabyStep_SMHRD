<%@page import="com.babystep.model.BoardLikeDAO"%>
<%@page import="com.babystep.model.BoardDAO"%>
<%@page import="com.babystep.model.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 상세보기</title>
<style>
    body {
        font-family: 'Noto Sans KR', sans-serif;
        background-color: #f9f9f9;
        margin: 0;
        padding: 0;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
    }

    .container {
        width: 90vw;
        height: 90vh;
        max-width: 1200px;
        max-height: 800px;
        background-color: white;
        border: 1px solid #333;
        padding: 20px;
        box-sizing: border-box;
        overflow: auto;
    }

    .title {
        font-size: 24px;
        font-weight: bold;
        margin-bottom: 10px;
        border-bottom: 1px solid #ddd;
        padding-bottom: 5px;
    }

    .meta {
        font-size: 14px;
        color: #555;
        margin-bottom: 10px;
        border-bottom: 1px solid #ddd;
        padding-bottom: 5px;
    }

    .content {
        width: 100%;
        min-height: 100px;
        border: 1px solid #ccc;
        margin-bottom: 15px;
        overflow: auto;
    }

    .content img {
        max-width: 75%; /* 이미지를 컨테이너의 75% 너비로 제한 */
        max-height: 500px; /* 이미지의 최대 높이를 500px로 제한 */
        height: auto;    /* 비율에 맞춰 자동으로 높이 조정 */
        margin-bottom: 10px; /* 이미지 간 간격 */
        display: block;
        margin-left: auto;
        margin-right: auto; /* 이미지를 중앙에 정렬 */
    }

    .interactions {
        text-align: center;
        margin-bottom: 15px;
        font-size: 14px;
        color: #555;
    }

    .comments-section {
        border: 1px solid #ccc;
        padding: 10px;
        margin-top: 20px;
    }

    .comment {
        margin-bottom: 10px;
    }

    .comment-author {
        font-weight: bold;
        font-size: 14px;
        margin-bottom: 5px;
    }

    #heart {
        font-size: 22px;
        color: black;
        background: none;
        border: none;
    }

    #heart.liked {
        color: red;
    }
</style>
</head>
<body>

    <%
    int num = Integer.parseInt(request.getParameter("num"));
    BoardDTO dto = new BoardDAO().detailBoard(num);
    
    String userId = (String)session.getAttribute("id");
    boolean isLiked = new BoardLikeDAO().isLikedByUser(num,userId);

    %>
    
    <div class="container">
        <div class="title"><%=dto.getBO_TITLE() %></div>
        <div class="meta"><%=dto.getUSER_NICK() %>   |   <%=dto.getCREATED_AT() %></div>
        
        <div class="content">
            <% if(dto.getBO_FILENAME1() != null) { %>
            <img alt="" src="./file/<%=dto.getBO_FILENAME1()%>">
            <%}if(dto.getBO_FILENAME2() != null) {%> 
            <img alt="" src="./file/<%=dto.getBO_FILENAME2()%>">
            <%}if(dto.getBO_FILENAME3() != null) { %>
            <img alt="" src="./file/<%=dto.getBO_FILENAME3()%>">
            <%}if(dto.getBO_FILENAME4() != null) { %>
            <img alt="" src="./file/<%=dto.getBO_FILENAME4()%>"> 
            <%} %>
            <p><%=dto.getBO_CONTENT()%></p>
        </div>
        <div class="interactions"><button id="heart" class='<%=isLiked ? "liked" : ""%>'>❤</button> | 댓글수</div>

        <div class="comments-section">
            <div class="comment">
                <div class="comment-author">익명 1</div>
                <div class="comment-content">댓글 내용</div>
            </div>
        </div>
    </div>

<script>
    window.onload  = function() {
        var heartBtn = document.getElementById('heart');
        if (<%=isLiked%>) {
            heartBtn.classList.add('liked');
        }

        heartBtn.addEventListener('click', function () {
            const isLiked = this.classList.toggle('liked');
            const num = <%=num%>;

            if (isLiked) {
                fetch('BoardLikeService', {
                    method: 'POST',
                    headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
                    body: `action=like&num=${num}`
                }).then(() => {
                    console.log('좋아요 추가 성공');
                }).catch(err => {
                    console.error('좋아요 추가 실패', err);
                });
            } else {
                fetch('BoardLikeService', {
                    method: 'POST',
                    headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
                    body: `action=unlike&num=${num}`
                }).then(() => {
                    console.log('좋아요 취소 성공');
                }).catch(err => {
                    console.error('좋아요 취소 실패', err);
                });
            }
        });
    }
</script>
</body>
</html>