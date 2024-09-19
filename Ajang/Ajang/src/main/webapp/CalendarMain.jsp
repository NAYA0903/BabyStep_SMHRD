<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.Map"%>
<%@ page import="java.util.Calendar"%>
<%@ page import="com.babystep.model.HolidayDTO"%>
<%@ page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
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
            // 오늘 날짜 가져오기
            Calendar calendar = Calendar.getInstance();
            int currentYear = calendar.get(Calendar.YEAR);
            int currentMonth = calendar.get(Calendar.MONTH) + 1;
            int currentDay = calendar.get(Calendar.DAY_OF_MONTH);

            // URL에서 전달된 연도와 월 가져오기 (없으면 기본값은 현재 월)
            String yearParam = request.getParameter("year");
            String monthParam = request.getParameter("month");

            int year = (yearParam != null) ? Integer.parseInt(yearParam) : currentYear;
            int month = (monthParam != null) ? Integer.parseInt(monthParam) : currentMonth;

            // 전달된 공휴일 목록을 받아옴
            @SuppressWarnings("unchecked")
            List<HolidayDTO> holidays = (List<HolidayDTO>) request.getAttribute("holidays");

            System.out.println(holidays);
            
            // 공휴일을 날짜별로 매핑
            Map<Integer, String> holidayMap = new HashMap<>();
            if (holidays != null) {
                for (HolidayDTO holiday : holidays) {
                    Calendar holidayCal = Calendar.getInstance();
                    holidayCal.setTime(holiday.getHolidayDate());
                    int holidayDay = holidayCal.get(Calendar.DAY_OF_MONTH);
                    holidayMap.put(holidayDay, holiday.getHolidayName());
                }
            }

            // 선택된 달의 첫 날로 Calendar 설정
            calendar.set(Calendar.YEAR, year);
            calendar.set(Calendar.MONTH, month - 1);
            calendar.set(Calendar.DAY_OF_MONTH, 1);

            int lastDay = calendar.getActualMaximum(Calendar.DAY_OF_MONTH);
            int start = calendar.get(Calendar.DAY_OF_WEEK) - 1;
        %>

        <div class="calendar-title">
            <input type="button" value="이전달" onclick="location.href='HolidayController?year=<%=year%>&month=<%=month - 1%>'">
            <span><%=year%>년 <%=month%>월</span>
            <input type="button" value="다음달" onclick="location.href='HolidayController?year=<%=year%>&month=<%=month + 1%>'">
        </div>

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
                    for (int i = 0; i < start; i++) {
                        out.println("<td></td>");
                    }

                    for (int day = 1; day <= lastDay; day++) {
                        int weekday = (start + day - 1) % 7;
                        String dayClass = (weekday == 0) ? "sun" : (weekday == 6) ? "sat" : "day";

                        if (year == currentYear && month == currentMonth && day == currentDay) {
                            dayClass += " today";
                        }

                        if (holidayMap.containsKey(day)) {
                            dayClass += " holiday";
                        }

                        out.println("<td class='" + dayClass + "' data-day='" + day + "'>");
                        out.println(day);

                        if (holidayMap.containsKey(day)) {
                            out.println("<br>" + holidayMap.get(day));
                        }

                        out.println("</td>");

                        if (weekday == 6) {
                            out.println("</tr><tr>");
                        }
                    }
                %>
            </tr>
        </table>
    </div>
</body>
</html>
