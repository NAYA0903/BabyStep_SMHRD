<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%><!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>중고나라 게시판</title>

    <style>
        /* 기본적인 body 스타일 */
        body {
            margin: 0;
            padding: 0;
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f9;
            color: #333;
        }

        .container {
            width: 100%;
            max-width: 600px; /* 모바일 화면 크기에 맞게 조정 */
            margin: 0 auto;
            padding: 10px;
        }

        /* 상품 카드 스타일 */
        .product-card {
            display: flex;
            align-items: center;
            background-color: #fff;
            border-radius: 12px;
            padding: 15px;
            margin-bottom: 15px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.05);
            border: 1px solid #eaeaea;
        }

        .product-card img {
            width: 80px;
            height: 80px;
            object-fit: cover;
            border-radius: 10px;
            margin-right: 15px;
        }

        .product-info {
            flex-grow: 1;
        }

        .product-info h3 {
            margin: 0;
            font-size: 1rem;
            font-weight: bold;
            color: #333;
        }

        .product-info p {
            margin: 5px 0;
            font-size: 0.8rem;
            color: #999;
        }

        .product-info .price {
            font-size: 1.1rem;
            font-weight: bold;
            color: #ff6600;
        }

        .product-icons {
            display: flex;
            align-items: center;
            font-size: 0.8rem;
            color: #999;
        }

        .product-icons span {
            margin-right: 10px;
            display: flex;
            align-items: center;
        }

        .product-icons span i {
            margin-right: 5px;
        }

        /* 고정된 글쓰기 버튼 */
        .write-button {
            position: fixed;
            bottom: 20px;
            right: 20px;
            background-color: #ff6600;
            color: white;
            border: none;
            border-radius: 50px;
            width: 60px;
            height: 60px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.5rem;
            cursor: pointer;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .write-button:hover {
            background-color: #ff4500;
        }

        /* 반응형 스타일 */
        @media (max-width: 768px) {
            .product-card {
                flex-direction: column;
                align-items: flex-start;
            }

            .product-card img {
                margin-bottom: 10px;
            }
        }
    </style>
</head>
<body>

<div class="container">
<h2>중고나라</h2>
    <!-- 상품 카드 -->
    <div class="product-card">
        <img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyNDAxMjNfMjkz%2FMDAxNzA1OTY5OTg1NTk4._qK5enFOgKYEvgxoqy61l6Ue2jsYlZ9ztoBUTAOabaEg.5ykZ5Tq-UR7_rBAdVBQxppKPVMlqJNREnojG6KTTHTcg.JPEG.h_lim%2F20240123%25A3%25DF083536.jpg&type=a340" alt="상품 이미지">
        <div class="product-info">
            <h3>아기 장난감</h3>
            <p>오포2동 · 30분 전</p>
            <div class="price">15,000원</div>
        </div>
        <div class="product-icons">
            <span><i>❤️</i> 1</span>
            <span><i>💬</i> 2</span>
        </div>
    </div>

    <div class="product-card">
        <img src="https://search.pstatic.net/sunny/?src=https%3A%2F%2Fcdn.011st.com%2F11dims%2Fresize%2F600x600%2Fquality%2F75%2F11src%2Fproduct%2F586082648%2FB.jpg%3F818000000&type=a340" alt="상품 이미지">
        <div class="product-info">
            <h3>기저귀함 아기 신생아 버스켓 물품 서랍</h3>
            <p>탄벌동 · 8시간 전</p>
            <div class="price">20,000원</div>
        </div>
        <div class="product-icons">
            <span><i>❤️</i> 0</span>
            <span><i>💬</i> 2</span>
        </div>
    </div>

    <div class="product-card">
        <img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fcafefiles.naver.net%2FMjAxODA1MjdfMTI5%2FMDAxNTI3NDIyMTMyMzE5.n1Tx90RRXRJmwR0gn2FEs3aVQZqGLRzKL5G0xhR1YlEg.GQD82b7m0eXtR8Bl9Pc1CjcLW2dpdiVcnZ8hl5VatK8g.JPEG.meng1110%2FexternalFile.jpg&type=sc960_832" alt="상품 이미지">
        <div class="product-info">
            <h3>타이미러브모빌</h3>
            <p>역동 · 19분 전</p>
            <div class="price">17,000원</div>
        </div>
        <div class="product-icons">
            <span><i>❤️</i> 1</span>
            <span><i>💬</i> 4</span>
        </div>
    </div>

    <div class="product-card">
        <img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fshop1.phinf.naver.net%2F20210803_26%2F1627942194801yShOz_JPEG%2F29078029621480506_1783666306.jpg&type=a340" alt="상품 이미지">
        <div class="product-info">
            <h3>애기 딸랑이</h3>
            <p>역동 · 1시간 전</p>
            <div class="price">2,000원</div>
        </div>
        <div class="product-icons">
            <span><i>❤️</i> 4</span>
            <span><i>💬</i> 2</span>
        </div>
    </div>
</div>

<!-- 글쓰기 버튼 -->
<a href="CountryWrite.jsp"><button class="write-button">+</button></a>

</body>
</html>
