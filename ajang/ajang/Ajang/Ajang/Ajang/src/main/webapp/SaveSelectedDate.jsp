<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
    // 전달받은 파라미터로 날짜를 세션에 저장
    String year = request.getParameter("year");
    String month = request.getParameter("month");
    String day = request.getParameter("day");

    // 세션에 날짜 저장
    session.setAttribute("selectedDate", year + "-" + month + "-" + day);

%>
