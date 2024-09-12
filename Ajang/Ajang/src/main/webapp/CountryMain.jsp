	 <%@page import="com.babystep.model.CountryDAO"%>
	<%@page import="com.babystep.model.CountryDTO"%>
	<%@page import="java.util.List"%>
	<%@ page language="java" contentType="text/html; charset=UTF-8"
	   pageEncoding="UTF-8" isELIgnored="false" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   <!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>중고나라 게시판</title>
    
    
    
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f9;
            color: #333;
        }

        .container {
            width: 100%;
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
        }

        .product-card {
            display: flex;
            border: 1px solid #e0e0e0;
            border-radius: 10px;
            overflow: hidden;
            margin-bottom: 20px;
            background-color: #fff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .product-image {
            width: 150px;
            height: 150px;
            overflow: hidden;
            flex-shrink: 0;
        }

        .product-image img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .product-details {
            padding: 15px;
            flex-grow: 1;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }

        .product-title {
            font-size: 1.1rem;
            font-weight: bold;
            margin-bottom: 10px;
        }

        .product-location-time {
            font-size: 0.9rem;
            color: #888;
        }

        .product-price {
            font-size: 1.4rem;
            font-weight: bold;
            color: #ff4500;
            margin-top: 10px;
        }

        .product-actions {
            display: flex;
            align-items: center;
            margin-top: 15px;
        }

        .product-actions i {
            margin-right: 5px;
        }

        .product-actions span {
            font-size: 1rem;
            color: #666;
        }

        .product-heart {
            margin-left: auto;
            display: flex;
            align-items: center;
            font-size: 1.2rem;
            color: #ff6666;
        }

        .product-heart i {
            margin-right: 5px;
        }

        /* 반응형 처리 */
        @media (max-width: 768px) {
            .product-card {
                flex-direction: column;
                align-items: center;
            }

            .product-image {
                width: 100%;
                height: auto;
            }

            .product-details {
                align-items: center;
            }

            .product-actions {
                justify-content: center;
            }
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
        
    </style>
</head>
<body>


<% 
    // BoardDAO 객체를 통해 데이터베이스의 모든 게시글을 조회하여 List<BoardDTO> 객체에 저장
	  
    List<CountryDTO> countrys = new CountryDAO().allCountry(); 

	
// 조회된 게시글 리스트의 크기를 출력하여, 게시글의 개수를 확인 (디버깅용)
    System.out.print(countrys.size());
    // 조회된 게시글 리스트를 JSP 페이지의 pageContext에 저장하여 이후 페이지에서 사용 가능하게 설정
    pageContext.setAttribute("countrys", countrys); 
%>

   
    <div class="container">
        <div class="product-card">
            <div class="product-image">
                <img src="./file/${USED_IMG1}" alt="상품 이미지">
            </div>
            <div class="product-details">
                <div>
                    <div class="product-title">${USED_TITLE} <span style="color:#ff66b2;">💖</span></div>
                    <div class="product-location-time">${CREATED_AT}</div>
                </div>
                <div class="product-price">${USED_PRICE}원</div>
                <div class="product-actions">
                    <div><i>💬</i> <span>댓글 1</span></div>
                    <div class="product-heart"><i>❤</i> <span>1</span></div>
                </div>
            </div>
        </div>
    </div>	

    <!-- 글쓰기 버튼 -->
    <a href="CountryWrite.jsp"><button class="write-button">+</button></a>

</body>
</html>