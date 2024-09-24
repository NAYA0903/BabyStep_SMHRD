<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.Map"%>
<%@ page import="java.util.Calendar"%>
<%@ page import="com.babystep.model.HolidayDTO"%>
<%@ page import="com.babystep.model.HolidayDAO"%>
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
		int currentMonth = calendar.get(Calendar.MONTH) + 1; // Calendar.MONTH는 0부터 시작하므로 1을 더해줌
		int currentDay = calendar.get(Calendar.DAY_OF_MONTH); // 오늘의 날짜

		int year = currentYear;
		int month = currentMonth;

		// URL에서 전달된 연도와 월 가져오기 (없으면 기본값은 오늘)
		try {
			year = Integer.parseInt(request.getParameter("year"));
			month = Integer.parseInt(request.getParameter("month"));
		} catch (Exception e) {
			// 기본값은 현재 연도와 월
		}

		// 월이 0보다 작거나 13 이상일 때 연도 조정
		if (month < 1) {
			year--;
			month = 12;
		} else if (month > 12) {
			year++;
			month = 1;
		}

		// 선택된 달의 첫 날로 Calendar 객체 설정
		calendar.set(Calendar.YEAR, year);
		calendar.set(Calendar.MONTH, month - 1); // Calendar.MONTH는 0부터 시작
		calendar.set(Calendar.DAY_OF_MONTH, 1);

		// 해당 월의 마지막 날 계산
		int lastDay = calendar.getActualMaximum(Calendar.DAY_OF_MONTH);

		// 해당 월의 첫 번째 날의 요일 계산 (0: 일요일, 1: 월요일, ...)
		int start = calendar.get(Calendar.DAY_OF_WEEK) - 1;

		// HolidayDAO를 사용하여 공휴일 데이터를 가져옴
		HolidayDAO holidayDAO = new HolidayDAO();
		List<HolidayDTO> holidays = holidayDAO.getHolidaysByMonth(year, month);

		// 공휴일을 날짜별로 매핑
		Map<Integer, String> holidayMap = new HashMap<>();
		for (HolidayDTO holiday : holidays) {
			Calendar holidayCal = Calendar.getInstance();
			holidayCal.setTime(holiday.getHolidayDate());
			int holidayDay = holidayCal.get(Calendar.DAY_OF_MONTH);
			holidayMap.put(holidayDay, holiday.getHolidayName());
		}
		%>

		<!-- 이전달, 다음달 버튼 -->
		<div class="calendar-title">
			<input type="button" value="이전달"
				onclick="location.href='?year=<%=year%>&month=<%=month - 1%>'">
			<span><%=year%>년 <%=month%>월</span> <input type="button" value="다음달"
				onclick="location.href='?year=<%=year%>&month=<%=month + 1%>'">
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
				// 빈칸 출력 (해당 월의 첫 요일까지 빈칸 출력)
				for (int i = 0; i < start; i++) {
					out.println("<td></td>");
				}

				// 날짜 출력
				for (int day = 1; day <= lastDay; day++) {
					int weekday = (start + day - 1) % 7;
					String dayClass = (weekday == 0) ? "sun" : (weekday == 6) ? "sat" : "day";

					// 오늘 날짜에 "today" 클래스 추가
					if (year == currentYear && month == currentMonth && day == currentDay) {
						dayClass += " today";
					}

					// 공휴일이 있는 경우
					if (holidayMap.containsKey(day)) {
						dayClass += " holiday";
					}

					out.println("<td class='" + dayClass + "' data-day='" + day + "'>");
					out.println(day);

					// 공휴일 이름 출력
					if (holidayMap.containsKey(day)) {
						out.println("<br><span class='holidayName'>" + holidayMap.get(day) + "</span>");
					}

					out.println("</td>");

					// 줄 바꿈 (토요일 다음에는 줄을 바꿈)
					if (weekday == 6) {
						out.println("</tr><tr>");
					}
				}
				%>
			</tr>
		</table>

		<div>
			<button class="calendar-write-btn"
				onclick="toggleCalendarPopup(); return false;">작성하기</button>
			<jsp:include page="CalendarPopup.jsp" />
		</div>
	</div>
	<script>
	
	
    
        document.addEventListener('DOMContentLoaded', function() {
            var dayCells = document.querySelectorAll('td[data-day]');
            
        
            var selectedCell = null;

            dayCells.forEach(function(cell) {
                cell.addEventListener('click', function() {
                	
                    if (selectedCell) {
                        selectedCell.classList.remove('selected'); // 이전 선택된 셀에서 클래스 제거
                    }

                    cell.classList.add('selected'); // 선택된 셀에 클래스 추가
                    selectedCell = cell;

                    var selectedDay = cell.getAttribute('data-day');
                    var year = "<%=year%>";
                    var month = "<%=month%>"
		
					// AJAX 요청을 통해 선택된 날짜를 서버로 전송
					var xhr = new XMLHttpRequest();
					xhr.open("POST", "SaveSelectedDate.jsp", true);
					xhr.setRequestHeader("Content-Type",
							"application/x-www-form-urlencoded");
					xhr.send("year=" + year + "&month=" + month + "&day="
							+ selectedDay);
				});
			});
		});
	</script>
</body>
</html>
