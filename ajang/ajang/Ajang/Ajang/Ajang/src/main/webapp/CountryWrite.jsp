<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>맘들의 중고나라</title>

<style>
/* 기본적인 body 스타일 */
body {
    margin-top: 150px; /* 타이틀의 높이만큼 마진 추가 */
}

/* 컨테이너 설정 */
.container {
	width: 100%;
	max-width: 500px;
	margin: 0 auto;
	padding: 0;
	box-sizing: border-box;
}

/* 카드 스타일 */
.card {
	border: 0;
	background-color: #ffffff;
	border-radius: 30px;
	padding: 0;
	margin-bottom: 1.875rem;
	border: 2px solid black;
}

/* 제목 스타일 */
h2 {
	text-align: left;
	padding: 20px;
	font-size: 1.5rem;
	color: #000;
}

/* 이미지 업로드 버튼 */
.upload-btn {
	display: flex;
	justify-content: center;
	align-items: center;
	width: 100px;
	height: 100px;
	border: 2px solid #eee;
	font-size: 1.2rem;
	color: #888;
	cursor: pointer;
	background: #f9f9f9;
	border-radius: 15px;
	position: relative;
	flex-direction: column;
	margin-bottom: 20px;
	margin-left: 20px;
}

.upload-btn i {
	font-size: 2rem;
	color: #888;
}

.upload-btn .upload-counter {
	font-size: 0.9rem;
	color: #888;
	margin-top: 5px;
}

/* 폼 디자인 */
.form-group {
	margin-bottom: 15px;
	padding: 0 20px;
}

.form-group label {
	font-size: 1rem;
	margin-bottom: 5px;
	display: block;
}

.form-group input, .form-group textarea {
	width: 100%;
	padding: 10px;
	font-size: 1rem;
	border-radius: 5px;
	border: 1px solid #ddd;
	background: #fff;
	margin-bottom: 10px;
	box-sizing: border-box;
}

/* 거래 방식 버튼 */
.transaction-type {
	display: flex;
	justify-content: space-between;
	margin: 0 20px 20px;
}

.transaction-type button {
	flex: 1;
	padding: 15px;
	border: none;
	background-color: #f1f1f1;
	color: #333;
	cursor: pointer;
	border-radius: 10px;
	font-size: 1rem;
	margin-right: 10px;
}

.transaction-type button:last-child {
	margin-right: 0;
}

.transaction-type button.active {
	background-color: #000;
	color: #fff;
}

/* 가격 제안 받기 체크박스 */
.checkbox {
	display: flex;
	align-items: center;
	margin: 0 20px;
}

.checkbox input {
	margin-right: 10px;
}

/* 자주 쓰는 문구 버튼 */
#common-phrases {
	margin: 20px;
	padding: 10px;
	background-color: #f1f1f1;
	border: none;
	width: calc(100% - 40px);
	text-align: center;
	font-size: 1rem;
	border-radius: 10px;
	cursor: pointer;
}

/* 작성하기 버튼 */
#submit {
	width: calc(100% - 40px);
	height: 45px;
	background-color: #ff6600;
	color: white;
	border: none;
	cursor: pointer;
	border-radius: 10px;
	font-size: 1rem;
	margin: 20px;
}

/* 반응형 설정 */
@media ( max-width : 768px) {
	.container {
		width: 100%;
	}
}
</style>
</head>
<body>

	<div class="menu-container">
		<jsp:include page="Title.jsp" />
	</div>

	<div class="container">
		<form action="CountryService" method="post"
			enctype="multipart/form-data">
			<div class="card">
				<h2>내 물건 팔기</h2>

				<!-- 파일 업로드 -->
				<div class="form-group">
					<label for="file1">첨부 파일 1</label> <input type="file" id="file1"
						name="file1"> <label for="file2">첨부 파일 2</label> <input
						type="file" id="file2" name="file2"> <label for="file3">첨부
						파일 3</label> <input type="file" id="file3" name="file3"> <label
						for="file4">첨부 파일 4</label> <input type="file" id="file4"
						name="file4">
				</div>
				<div class="form-group">
					<label for="title">제목</label> <input type="text" id="title"
						name="title" placeholder="제목" required>
				</div>

				<!-- 거래 방식 선택 -->
				<div class="transaction-type">
					<button type="button" class="active">판매하기</button>
					
				</div>

				<div class="form-group">
					<input type="number" id="price" name="price"
						placeholder="₩ 가격을 입력해주세요." required>
				</div>

		

				<div class="form-group">
					<label for="content">상세한 설명</label>
					<textarea id="content" name="content"
						placeholder="중고나라에 올릴 게시글 내용을 작성해 주세요." required></textarea>
				</div>

				<!-- 자주 쓰는 문구 버튼 -->
				<button id="common-phrases" type="button">자주 쓰는 문구</button>

				<!-- 작성하기 버튼 -->
				<input id="submit" type="submit" value="작성 완료">
			</div>
		</form>
	</div>

</body>
</html>
