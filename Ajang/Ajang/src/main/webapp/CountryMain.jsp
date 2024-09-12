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
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f5f5f5;
        }

        .container {
            max-width: 800px;
            margin: 20px auto;
            padding: 20px;
            background-color: white;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .card {
            margin-bottom: 20px;
            padding: 15px;
            border: 1px solid #ddd;
            border-radius: 10px;
            background-color: white;
            display: flex;
            align-items: center;
        }

        .card img {
            width: 100px;
            height: 100px;
            object-fit: cover;
            border-radius: 10px;
            margin-right: 15px;
        }

        .card .title {
            font-size: 18px;
            font-weight: bold;
            color: #333;
        }

        .card .name, .card .date {
            font-size: 14px;
            color: #999;
        }

        .form table {
            width: 100%;
            border-collapse: collapse;
        }

        .form table tr {
            border-bottom: 1px solid #ddd;
        }

        .form table td {
            padding: 10px;
        }

        .write-button {
            position: fixed;
            bottom: 20px;
            right: 20px;
            background-color: #ff5722;
            color: white;
            font-size: 24px;
            border: none;
            border-radius: 50%;
            width: 60px;
            height: 60px;
            cursor: pointer;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        .write-button:hover {
            background-color: #e64a19;
        }

        a {
            text-decoration: none;
            color: inherit;
        }
    </style>
</head>
<body>

<% 
    List<CountryDTO> countrys = new CountryDAO().allCountry(); 
    System.out.print(countrys.size());
    pageContext.setAttribute("countrys", countrys); 
%>

<div class="container">
    <h2>중고나라</h2>

    <div class="form">
        <c:forEach var="c" items="${countrys}">
            <div class="card">
                <img src="<%=request.getContextPath()%>/file/${c.USED_IMG1}" alt="Item Image">
                <div>
                    <div class="title"><a href="CountryDetail.jsp?num=${c.USED_IDX}">${c.USED_TITLE}</a></div>
                    <div class="name">${c.USER_ID}</div>
                    <div class="date">${c.CREATED_AT}</div>
                </div>
            </div>
        </c:forEach>
    </div>

    <!-- 글쓰기 버튼 -->
    <a href="CountryWrite.jsp">
        <button class="write-button">+</button>
    </a>
</div>

</body>
</html>
