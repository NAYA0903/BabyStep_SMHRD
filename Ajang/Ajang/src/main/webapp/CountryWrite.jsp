<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>맘들의 중고나라</title>

<style>
/* 기본적인 body 스타일 */
html, body {
    height: 100%;
    margin: 0;
    padding: 0;
    font-family: 'Comic Sans MS', 'Arial', sans-serif;
    background-color: #ffe6e6; /* 부드럽고 따뜻한 배경색 */
    color: #333;
}

/* 컨테이너 설정 */
.container {
    width: 80%;
    max-width: 1200px;
    margin: 0 auto;
    padding: 20px;
    box-sizing: border-box;
}

/* 기본적인 카드 스타일 */
.card {
    border: 0;
    box-shadow: 0px 0px 10px 0px rgba(255, 182, 193, 0.5); /* 연한 분홍색 그림자 */
    background-color: #ffffff;
    border-radius: 15px;
    padding: 20px;
    margin-bottom: 1.875rem;
}

/* 게시판 제목 */
h2 {
    text-align: center;
    margin-bottom: 20px;
    font-size: 2.5rem;
    color: #ff6666; /* 따뜻한 붉은 색상 */
}

/* 폼 디자인 */
.form-group {
    display: flex;
    flex-direction: column;
    margin-bottom: 15px;
}

.form-group label {
    font-size: 1.2rem;
    margin-bottom: 5px;
}

.form-group input, .form-group textarea {
    padding: 0.75rem;
    font-size: 1rem;
    border-radius: 15px;
    border: 1px solid #ffd1d1;
    background: #fffafa;
}

textarea {
    resize: vertical;
    min-height: 150px;
}

/* 작성하기 버튼 */
#submit {
    width: 150px;
    height: 45px;
    background-color: #ff9999;
    color: white;
    border: none;
    cursor: pointer;
    border-radius: 15px;
    font-size: 1rem;
    transition: background-color 0.3s ease;
    margin-top: 20px;
    box-shadow: 0 4px 8px rgba(255, 102, 102, 0.3);
}

#submit:hover {
    background-color: #ff6666;
    box-shadow: 0 4px 12px rgba(255, 102, 102, 0.5); /* 호버 시 그림자 */
}

/* 반응형 설정 */
@media (max-width: 768px) {
    .container {
        width: 95%;
    }
}

</style>
</head>
<body>

   <div class="container">
      <div class="card">
         <h2>중고나라 글쓰기</h2>
         
         <form action="BoardService" method="post" enctype="multipart/form-data">
            <div class="form-group">
               <label for="title">제목</label>
               <input type="text" id="title" name="title" placeholder="제목을 입력하세요" required>
            </div>

            <div class="form-group">
               <label for="writer">작성자</label>
               <input type="text" id="writer" name="writer" placeholder="작성자 이름을 입력하세요" required>
            </div>

            <div class="form-group">
               <label for="content">내용</label>
               <textarea id="content" name="content" placeholder="내용을 입력하세요" required></textarea>
            </div>
            
            <div class="form-group">
               <label for="file">첨부 파일</label>
               <input type="file" id="file" name="file">
            </div>
            
            <!-- 작성하기 버튼 -->
            <input id="submit" type="submit" value="작성하기">
         </form>
      </div>
   </div>

</body>
</html>
