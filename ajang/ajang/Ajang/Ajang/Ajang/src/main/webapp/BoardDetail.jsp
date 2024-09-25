<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="com.babystep.model.CommentDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.babystep.model.CommentDAO"%>
<%@page import="com.babystep.model.UserDAO"%>
<%@page import="com.babystep.model.BoardLikeDAO"%>
<%@page import="com.babystep.model.BoardDAO"%>
<%@page import="com.babystep.model.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 상세보기</title>
<style>
    body {
    
     body {
    font-family: 'Noto Sans KR', sans-serif;
    background-color: white;
    overflow-x: hidden; /* 가로 스크롤 방지 */
    overflow-y: auto; /* 세로 스크롤 허용 */
    margin: 0;
    padding: 0;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    flex-direction: column;
    justify-content: flex-start;
}

body.dark-mode {
    background-color: #121212;
    color: #e0e0e0;
}

.container {
    width: 90vw;
    height: 90vh;
    max-width: 1500px;
    max-height: 800px;
    background-color: white;
    padding: 20px;
    box-sizing: border-box;
    margin-top: 50px;
}

body.dark-mode .container {
    background-color: #1e1e1e;
    border: 1px solid #333;
}

.titles {
    font-size: 24px;
    font-weight: bold;
    margin-bottom: 10px;
    border-bottom: 1px solid #ddd;
    padding-bottom: 5px;
}

body.dark-mode .titles {
    border-bottom: 1px solid #555;
    color: #ffffff;
}

.meta {
    font-size: 14px;
    color: #555;
    margin-bottom: 10px;
    border-bottom: 1px solid #ddd;
    padding-bottom: 5px;
}

body.dark-mode .meta {
    color: #aaaaaa;
    border-bottom: 1px solid #444;
}

.content {
    width: 100%;
    min-height: 100px;
    border: 1px solid #ccc;
    margin-bottom: 15px;
    overflow: auto;
}

body.dark-mode .content {
    border: 1px solid #555;
}

.content img {
    max-width: 75%;
    max-height: 500px;
    height: auto;
    margin-bottom: 10px;
    display: block;
    margin-left: auto;
    margin-right: auto;
}

.interactions {
    text-align: center;
    margin-bottom: 15px;
    font-size: 14px;
    color: #555;
}

body.dark-mode .interactions {
    color: #aaaaaa;
}

.comments-section {
    border: 1px solid #ccc;
    padding: 10px;
    margin-top: 20px;
}

body.dark-mode .comments-section {
    border: 1px solid #555;
}

.comment {
    margin-bottom: 10px;
}

.comment-author {
    font-weight: bold;
    font-size: 14px;
    margin-bottom: 5px;
}

body.dark-mode .comment-author {
    color: #ffffff;
}

#heart {
    font-size: 22px;
    color: black;
    background: none;
    border: none;
}

body.dark-mode #heart {
    color: #e0e0e0;
}

#heart.liked {
    color: red;
}

.comment-box {
    width: 100%;
    max-width: 1140px;
    border: 1px solid #ddd;
    border-radius: 8px;
    padding: 10px;
    margin: 10px auto;
    background-color: #fff;
    display: flex;
    flex-direction: column;
}

body.dark-mode .comment-box {
    background-color: #2c2c2c;
    border: 1px solid #555;
}

.comment-header {
    font-weight: bold;
    font-size: 16px;
    margin-bottom: 10px;
}

.comment-input {
    width: 100%;
    border: none;
    outline: none;
    font-size: 14px;
    color: #999;
    resize: none;
    margin-bottom: 10px;
}

body.dark-mode .comment-input {
    background-color: #2c2c2c;
    color: #dddddd;
}

.comment-input::placeholder {
    color: #ccc;
}

body.dark-mode .comment-input::placeholder {
    color: #888;
}

.comment-icons {
    display: flex;
    justify-content: space-between;
    align-items: center;
}

.icon-set {
    display: flex;
    align-items: center;
}

.icon-set img {
    width: 24px;
    height: 24px;
    margin-right: 8px;
    cursor: pointer;
}

.comment-submit {
    color: #999;
    font-size: 14px;
    border: none;
    background: none;
    cursor: pointer;
    outline: none;
}

.comment-submit:hover {
    color: #333;
}

body.dark-mode .comment-submit {
    color: #e0e0e0;
}

.comment-submit:hover {
    color: #ffffff;
}

.board-main {
    margin-top: 20px;
}

.bottom-container {
    width: 1500px;
}

body.dark-mode .bottom-container {
    background-color: #1e1e1e;
}

.sub {
	margin-left: 170px;
}

</style>
</head>
<body>
	<!-- 메뉴 바 포함 -->
	<div class="menu-container">
		<jsp:include page="Title.jsp" />
	</div>

    <%
    int num = Integer.parseInt(request.getParameter("num"));
    BoardDTO dto = new BoardDAO().detailBoard(num);
    
    String userId = (String)session.getAttribute("id");
    boolean isLiked = new BoardLikeDAO().isLikedByUser(num,userId);
    
    String nickname = new UserDAO().getNicknameById(userId); // 닉네임 가져오기
    
 	// 댓글 목록을 조회하여 가져오기
    CommentDAO commentDAO = new CommentDAO();
    List<CommentDTO> commentList = commentDAO.getCommentsByBoard(num);
    %>
    <div class="container">	
    	<div class="sub">
        <div class="titles"><%=dto.getBO_TITLE() %></div>
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

       <!-- 댓글 목록 출력 -->
    <div class="comments-section">
        <% for(CommentDTO comments : commentList) { %>
        <div class="comments">
            <div class="comment-author"><%=comments.getUserId() %></div>
            <div class="comment-content"><%=comments.getCommentContent() %></div>
            <div class="comment-date"><%=comments.getCreatedAt() %></div>
            <br>
        </div>
        <% } %>
    </div>
            <div class="comment-box">
    	<form action="CommentServlet" method="post">
    	<div class="comment-header"><%=nickname%></div>
    		<textarea name="commentContent" class="comment-input" rows="3" placeholder="댓글을 남겨보세요"></textarea>
    		<input type="hidden" name="boIdx" value="<%=dto.getBO_IDX()%>"> <!-- 게시물 번호 전달 -->
   		<div class="comment-icons">
        <div class="icon-set">
            
        </div>
        <button class="comment-submit" type="submit">등록</button>
    </div>
	</form></div>
	</div>
	<div class="bottom-container">
        <jsp:include page="BoardMain.jsp" />
      </div>
    
	  
	
        </div>
        
	
  

<script>
    window.onload = function() {
        var heartBtn = document.getElementById('heart');
        
        // 하트가 좋아요 상태일 때 색상 변경
        if (<%=isLiked%>) {
            heartBtn.classList.add('liked');
        }

        // 하트 버튼 클릭 이벤트 처리
        heartBtn.addEventListener('click', function () {
            const isLiked = this.classList.toggle('liked');
            const num = <%=num%>;
            let action = isLiked ? 'like' : 'unlike';

            // 서버로 좋아요/좋아요 취소 요청 보내기
            fetch('BoardLikeService', {
                method: 'POST',
                headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
                body: `action=${action}&num=${BO_IDX}`
            })
            .then(response => {
                if (response.ok) {
                    console.log(`좋아요 ${isLiked ? '추가' : '취소'} 성공`);
                } else {
                    console.error(`좋아요 ${isLiked ? '추가' : '취소'} 실패`);
                }
            })
            .catch(err => {
                console.error('서버 요청 실패: ', err);
            });
        });

        // 댓글 작성 버튼 활성화/비활성화 처리
        toggleSendButton(); // 처음엔 버튼 비활성화

        // textarea의 입력 이벤트 감지
        const commentInput = document.getElementById("CommentInput");
        commentInput.addEventListener("input", toggleSendButton);

        // Enter 키를 누르면 댓글 작성 폼 제출
        commentInput.addEventListener("keydown", function(event) {
            if (event.key === "Enter" && !event.shiftKey) {
                event.preventDefault(); // 엔터 키의 기본 동작(줄바꿈) 방지
                document.querySelector("form").submit(); // 폼 제출
            }
        });
    }

    // 전송 버튼 활성화/비활성화 함수
    function toggleSendButton() {
        const commentInput = document.getElementById("CommentInput");
        const sendButton = document.getElementById("sendButton");

        // 입력된 값이 없거나 공백만 있을 경우 비활성화
        if (commentInput.value.trim() === "") {
            sendButton.disabled = true;
        } else {
            sendButton.disabled = false;
        }
    }
</script>

</body>
</html>