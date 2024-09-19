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
    background-color: #f8f9fa; /* 밝은 회색 배경 */
    color: #333;
}

/* 컨테이너 설정 */
.container {
    width: 80%;
    max-width: 1000px;
    margin: 0 auto;
    padding: 20px;
    box-sizing: border-box;
}

/* 기본적인 카드 스타일 */
.card {
    border: 0;
    box-shadow: 0px 0px 15px 0px rgba(0, 0, 0, 0.1); /* 약간의 그림자 추가 */
    background-color: #ffffff; /* 밝은 흰색 배경 */
    border-radius: 10px;
    padding: 40px 30px;
    margin-bottom: 1.875rem;
}

/* 게시판 제목 */
h2 {
    text-align: center;
    margin-bottom: 20px;
    font-size: 2.5rem;
    color: block; /* 밝은 회색 느낌의 제목 색상 */
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
    color: #495057; /* 짙은 회색 색상 */
}

.form-group input, .form-group textarea, .form-group select {
    padding: 0.85rem;
    font-size: 1rem;
    border-radius: 8px;
    border: 1px solid #ced4da;
    background: #f1f3f5; /* 밝은 회색 입력 필드 */
    color: #495057;
}

textarea {
    resize: vertical;
    min-height: 150px;
}

/* 버튼 그룹을 flex로 한 줄에 정렬 */
.button-group {
    display: flex;
    justify-content: flex-end;
    gap: 10px; /* 버튼 사이 간격 설정 */
    margin-top: 20px;
}

/* 작성하기 버튼 */
#submit {
    width: 120px;
    height: 45px;
    background-color: #adb5bd; /* 밝은 회색 버튼 */
    color: white;
    border: none;
    cursor: pointer;
    border-radius: 8px;
    font-size: 1rem;
    transition: background-color 0.3s ease;
}

#submit:hover {
    background-color: #868e96; /* 버튼에 호버 시 어두운 회색 */
}

/* 초기화 버튼 */
#reset {
    width: 120px;
    height: 45px;
    background-color: #e9ecef; /* 밝은 회색 초기화 버튼 */
    color: #495057; /* 다크 회색 텍스트 */
    border: none;
    cursor: pointer;
    border-radius: 8px;
    font-size: 1rem;
    transition: background-color 0.3s ease;
}

#reset:hover {
    background-color: #ced4da; /* 초기화 버튼 호버 시 */
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
    <form action="BoardService" method="post" enctype="multipart/form-data">
        <!-- 제목 입력 -->
        <div class="form-group">
            <label for="title">제목</label>
            <input type="text" id="title" name="title" placeholder="제목을 입력하세요" required>
        </div>

        <!-- 내용 입력 -->
        <div class="form-group">
            <label for="content">내용</label>
            <textarea id="content" name="content" placeholder="내용을 입력하세요" required></textarea>
        </div>

        <!-- 파일 업로드 -->
        <div class="form-group">
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
        <div class="button-group">
            <input id="reset" type="reset" value="초기화">
            <input id="submit" type="submit" value="작성하기">
        </div>
    </form>
</div>


</body>
</html>
