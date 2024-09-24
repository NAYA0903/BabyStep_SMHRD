<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 글쓰기</title>

<style>
/* 기본적인 body 스타일 */
html, body {
    height: 100%;
    margin: 0;
    padding: 0;
    font-family: 'Roboto', Arial, sans-serif;
    background-color: #ffffff; /* 바탕색을 흰색으로 변경 */
    color: #333;
}

/* 컨테이너 설정 */
.board-write-container {
    width: 60%;
    max-width: 1000px;
    margin: 0 auto;
    padding: 20px;
    box-sizing: border-box;
}

/* 기본적인 카드 스타일 */
.board-write-card {
    border: 1px solid #ced4da; /* 연한 회색 보더 */
    box-shadow: 0px 0px 15px 0px rgba(0, 0, 0, 0.1); /* 약간의 그림자 추가 */
    background-color: #ffffff; /* 밝은 흰색 배경 */
    border-radius: 10px;
    padding: 40px 30px;
    margin-bottom: 1.875rem;
    transition: border-color 0.3s ease; /* 보더 변화에 부드러운 전환 */
}

.board-write-card:hover {
    border-color: #000000; /* 호버 시 보더(테두리)를 검정색으로 변경 */
}

/* 게시판 제목 */
.board-write-title {
    text-align: center;
    margin-bottom: 20px;
    font-size: 2.5rem;
    color: block; /* 밝은 회색 느낌의 제목 색상 */
}

/* 폼 디자인 */
.board-write-form-group {
    display: flex;
    flex-direction: column;
    margin-bottom: 15px;
}

.board-write-form-group label {
    font-size: 1.2rem;
    margin-bottom: 5px;
    margin-top: 20px;
    color: #495057; /* 짙은 회색 색상 */
}

.board-write-form-group input, 
.board-write-form-group textarea, 
.board-write-form-group select {
    padding: 0.85rem;
    font-size: 1rem;
    border-radius: 8px;
    border: 1px solid #ced4da; /* 연한 회색 보더 */
    background: #ffffff; /* 입력 필드 배경색 흰색으로 변경 */
    color: #495057;
    transition: border-color 0.3s ease; /* 보더 변화에 부드러운 전환 */
}

.board-write-form-group input:hover, 
.board-write-form-group textarea:hover, 
.board-write-form-group select:hover {
    border-color: #000000; /* 입력 필드에 마우스를 올리면 테두리를 검정색으로 변경 */
}

textarea {
    resize: vertical;
    min-height: 150px;
}

/* 버튼 그룹을 flex로 한 줄에 정렬 */
.board-write-button-group {
    display: flex;
    justify-content: flex-end;
    gap: 10px; /* 버튼 사이 간격 설정 */
    margin-top: 20px;
}

/* 작성하기 버튼 */
#board-write-submit {
    width: 120px;
    height: 45px;
    background-color: #A0DAD0; /* 밝은 회색 버튼 */
    color: white;
    border: none;
    cursor: pointer;
    border-radius: 8px;
    font-size: 1rem;
    transition: background-color 0.3s ease;
}

#board-write-submit:hover {
    background-color: #76C7C0; /* 버튼에 호버 시 어두운 회색 */
}

/* 초기화 버튼 */
#board-write-reset {
    width: 120px;
    height: 45px;
    background-color: white; /* 밝은 회색 초기화 버튼 */
    color: black; /* 다크 회색 텍스트 */
    border: none;
    cursor: pointer;
    border-radius: 8px;
    font-size: 1rem;
    transition: background-color 0.3s ease;
    border: 1px solid #e9ecef;
}

#board-write-reset:hover {
    background-color: white; /* 초기화 버튼 호버 시 */
    border: 1px solid black;
}

/* 반응형 설정 */
@media (max-width: 768px) {
    .board-write-container {
        width: 95%;
    }
}

</style>
</head>
<body>

<div class="board-write-container">
    <form action="BoardService" method="post" enctype="multipart/form-data">
        <!-- 제목 입력 -->
        <div class="board-write-form-group">
            <label for="title">제목</label>
            <input type="text" id="title" name="title" placeholder="제목을 입력하세요" required>
        </div>

        <!-- 내용 입력 -->
        <div class="board-write-form-group">
            <label for="content">내용</label>
            <textarea id="content" name="content" placeholder="내용을 입력하세요" required></textarea>
        </div>

        <!-- 파일 업로드 -->
        <div class="board-write-form-group">
            <label for="file1">첨부 파일 1</label>
            <input type="file" id="file1" name="file1">

            <label for="file2">첨부 파일 2</label>
            <input type="file" id="file2" name="file2">

            <label for="file3">첨부 파일 3</label>
            <input type="file" id="file3" name="file3">

            <label for="file4">첨부 파일 4</label>
            <input type="file" id="file4" name="file4">
        </div>

        <!-- 버튼 그룹 -->
        <div class="board-write-button-group">
            <input id="board-write-reset" type="reset" value="초기화">
            <input id="board-write-submit" type="submit" value="작성하기">
        </div>
    </form>
</div>

</body>
</html>
