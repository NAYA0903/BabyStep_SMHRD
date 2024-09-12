<%@page import="com.babystep.model.CalendarDAO"%>
<%@page import="com.babystep.model.CalendarDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.Calendar"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>달력</title>
    <link rel="stylesheet" href="assets/css/CalendarMain.css">
</head>
<body>
    <div class="calendar-container">
        <%
            CalendarDAO calendarDAO = new CalendarDAO();
            CalendarDTO today = calendarDAO.getToday();
            int year = today.getYear();
            int month = today.getMonth();

            // URL에서 전달된 연도와 월 가져오기
            try {
                year = Integer.parseInt(request.getParameter("year"));
                month = Integer.parseInt(request.getParameter("month"));
            } catch (Exception e) {
                // 기본값은 현재 연도와 월
            }

            if (month == 0) {
                year--;
                month = 12;
            } else if (month == 13) {
                year++;
                month = 1;
            }

            int lastDay = calendarDAO.getLastDay(year, month); // 해당 월의 마지막 날
            int start = calendarDAO.getWeekDay(year, month, 1); // 1일의 요일
        %>

        <!-- 이전달, 다음달 버튼 -->
        <div class="calendar-title">
            <input type="button" value="이전달" onclick="location.href='?year=<%=year%>&month=<%=month - 1%>'">
            <span><%=year%>년 <%=month%>월</span>
            <input type="button" value="다음달" onclick="location.href='?year=<%=year%>&month=<%=month + 1%>'">
        </div>

        <!-- 달력 -->
        <table>
            <tr>
                <th class="sun">일</th>
                <th>월</th>
                <th>화</th>
                <th>수</th>
                <th>목</th>
                <th>금</th>
                <th class="sat">토</th>
            </tr>
            <tr>
                <%
                    // 빈칸 출력
                    for (int i = 0; i < start; i++) {
                        out.println("<td></td>");
                    }

                    // 날짜 출력
                    for (int day = 1; day <= lastDay; day++) {
                        int weekday = calendarDAO.getWeekDay(year, month, day);
                        String dayClass = (weekday == 0) ? "sun" : (weekday == 6) ? "sat" : "day";
                        out.println("<td class='" + dayClass + "' data-day='" + day + "'>" + day + "</td>");

                        // 줄 바꿈
                        if ((start + day) % 7 == 0) {
                            out.println("</tr><tr>");
                        }
                    }
                %>
            </tr>
        </table>
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            var dayCells = document.querySelectorAll('td[data-day]');
            
            dayCells.forEach(function(cell) {
                cell.addEventListener('click', function() {
                    var selectedDay = cell.getAttribute('data-day');
                    var year = "<%= year %>";
                    var month = "<%= month %>";
                    
                    // AJAX 요청을 통해 선택된 날짜를 서버로 전송
                    var xhr = new XMLHttpRequest();
                    xhr.open("POST", "SaveSelectedDate.jsp", true);
                    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
                    xhr.send("year=" + year + "&month=" + month + "&day=" + selectedDay);

                    // 서버 응답 처리
                    xhr.onreadystatechange = function() {
                        if (xhr.readyState === 4 && xhr.status === 200) {
                        }
                    };
                });
            });
        });
    </script>
</body>
</html>
