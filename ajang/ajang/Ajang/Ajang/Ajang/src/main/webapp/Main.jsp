<%@page import="com.babystep.model.DiaryPopupDTO"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@page import="com.babystep.model.HolidayDAO"%>
<%@page import="com.babystep.model.HolidayDTO"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="assets/css/Main.css">
    <title>걸음마</title>
</head>
<style>



</style>
<body>
    <!-- 타이틀 부분 -->
    <jsp:include page="Title.jsp" />

    <%
        // 오늘 날짜 가져오기
        Calendar calendar = Calendar.getInstance();
        int currentYear = calendar.get(Calendar.YEAR); // 현재 연도
        int currentMonth = calendar.get(Calendar.MONTH) + 1; // 현재 월 (0부터 시작하므로 1 더함)

        int year = currentYear; // 기본값은 현재 연도
        int month = currentMonth; // 기본값은 현재 월

        // URL에서 연도와 월 가져오기
        try {
            year = Integer.parseInt(request.getParameter("year"));
            month = Integer.parseInt(request.getParameter("month"));
        } catch (Exception e) {
            // 예외 발생 시 기본값 유지
        }

        // HolidayDAO를 사용하여 공휴일 데이터를 가져옴
        HolidayDAO holidayDAO = new HolidayDAO();
        List<HolidayDTO> holidays = holidayDAO.getHolidaysByMonth(year, month);

        // 공휴일을 날짜별로 매핑
        Map<Integer, String> holidayMap = new HashMap<>();
        if (holidays != null && !holidays.isEmpty()) {
            for (HolidayDTO holiday : holidays) {
                Calendar holidayCal = Calendar.getInstance();
                holidayCal.setTime(holiday.getHolidayDate());
                int holidayDay = holidayCal.get(Calendar.DAY_OF_MONTH);
                holidayMap.put(holidayDay, holiday.getHolidayName());
            }
        }

        // holidayMap을 JavaScript에서 사용할 수 있도록 JSON으로 변환
        String holidayMapJson = new com.google.gson.Gson().toJson(holidayMap);

        List<DiaryPopupDTO> diaryList = (List<DiaryPopupDTO>) request.getAttribute("diaryList");
    %>

    <!-- 좌우 4:6 레이아웃의 메인 컨텐츠 -->
    <div class="main-content">
        <!-- 왼쪽 4 부분 (캘린더 API 통합 예정) -->
        <div class="left-section">
            <jsp:include page="CalendarMain.jsp" />
            
        </div>

        <!-- 오른쪽 6 부분 -->
        <div class="right-section">
            <!-- 날짜 표시 영역 -->
            <div class="date-section">
               <span id="selectedDateDisplay">선택된 날짜가 없습니다.</span>
                <!-- 공휴일 이름을 표시할 영역 -->
                <span id="holidayNameDisplay"></span>
                <!-- 일정을 표시할 영역 -->
                <p id="ScheduleDisplay">일정이 없습니다.</p>
                <!-- 백신을 표시할 영역 -->
                <span id="VaccineDisplay"></span>
                
                
            </div>

            <!-- To-do 리스트 -->
            <div class="todo-section">
                <h3>오늘의 ToDo!</h3>
                <div id="todoList">
                    <p>할 일이 없습니다.</p>
                </div>
                <button class="todo-write-btn" onclick="toggleTodoPopup(); return false;">작성하기</button>
                <!-- TodoPopup.jsp 와 연결 -->
                <jsp:include page="TodoPopup.jsp" />
            </div>

            <!-- 이미지 업로드와 일기 작성 섹션 -->
            <div class="upload-diary-container">
                <!-- 이미지 업로드 섹션 -->
                <div class="image-upload-section" id="image-upload-section">
                    <h3>이미지</h3>
                </div>

                <!-- 일기 메모 작성 섹션 -->
                <div class="diary-section" id="diary-section">
                    <h3>일기</h3>
                </div>
            </div>
            <div id = "BabyAge">
            
            </div>
                <button class='diary-write-btn' onclick='toggleDiaryPopup(); return false;'>작성하기</button>

            <jsp:include page="DiaryPopup.jsp" />
        </div>
    </div>

    <script>
        // JavaScript로 holidayMap 데이터를 가져옴
        var holidayMap = <%= holidayMapJson %>;

        // 페이지가 로드된 후 오늘 날짜를 자동으로 표시
        document.addEventListener('DOMContentLoaded', function () {
            var todayCell = document.querySelector('td.today');

            if (todayCell) {
                var year = document.querySelector('.calendar-title span').textContent.split('년')[0].trim();
                var month = document.querySelector('.calendar-title span').textContent.split('년')[1].split('월')[0].trim();
                var day = todayCell.getAttribute('data-day'); // 오늘 날짜

                document.getElementById('selectedDateDisplay').textContent = year + "년 " + month + "월 " + day + "일";

                // 공휴일이 있는지 확인하고, 있으면 공휴일 이름 표시
                if (holidayMap[day]) {
                    document.getElementById('holidayNameDisplay').textContent = holidayMap[day];
                } else {
                    document.getElementById('holidayNameDisplay').textContent = "";
                }

                loadTodoList(year, month, day); // To-do 리스트 로드
                loadimageList(year, month, day); // Diary 리스트 로드
                loadDiaryList(year, month, day); // Diary 리스트 로드
                loadScheduleList(year, month, day); // 일정 리스트 로드
                loadVaccineList(year, month, day); // 백신 리스트 로드
                loadBabyAgeList(year, month, day); // 아기 개월 리스트 로드
            }

            // 날짜를 클릭했을 때, 선택된 날짜를 실시간으로 갱신
            var dayCells = document.querySelectorAll('td[data-day]');
            dayCells.forEach(function (cell) {
                cell.addEventListener('click', function () {
                    var selectedDay = cell.getAttribute('data-day');
                    var year = document.querySelector('.calendar-title span').textContent.split('년')[0].trim();
                    var month = document.querySelector('.calendar-title span').textContent.split('년')[1].split('월')[0].trim();

                    document.getElementById('selectedDateDisplay').textContent = year + "년 " + month + "월 " + selectedDay + "일";

                    // 선택된 날짜가 공휴일인지 확인하고 표시
                    if (holidayMap[selectedDay]) {
                        document.getElementById('holidayNameDisplay').textContent = holidayMap[selectedDay];
                    } else {
                        document.getElementById('holidayNameDisplay').textContent = "";
                    }

                    loadTodoList(year, month, selectedDay); // 선택된 날짜의 To-do 리스트 로드
                    loadimageList(year, month, selectedDay); // 선택된 날짜의 일기 리스트 로드
                    loadDiaryList(year, month, selectedDay); // 선택된 날짜의 일기 리스트 로드
                    loadScheduleList(year, month, selectedDay); // 선택된 날짜의 일정 리스트 로드
                    loadVaccineList(year, month, selectedDay); // 선택된 날짜의 백신 리스트 로드
                    loadBabyAgeList(year, month, selectedDay); // 선택된 날짜의 아기 개월 리스트 로드
                });
            });
        });

        // 선택된 날짜에 맞는 TODO 리스트를 서버에서 불러오는 함수
        function loadTodoList(year, month, day) {
            var xhr = new XMLHttpRequest();
            xhr.open("GET", "TodoListServlet?year=" + year + "&month=" + month + "&day=" + day, true);
            xhr.onreadystatechange = function () {
                if (xhr.readyState == 4 && xhr.status == 200) {
                    document.getElementById("todoList").innerHTML = xhr.responseText;
                }
            };
            xhr.send();
        }


        // 선택된 날짜에 맞는 image 리스트를 서버에서 불러오는 함수
        function loadimageList(year, month, day) {
            var xhr = new XMLHttpRequest();
            xhr.open("GET", "ImageDiaryServlet?year=" + year + "&month=" + month + "&day=" + day, true);
            xhr.onreadystatechange = function () {
                if (xhr.readyState == 4 && xhr.status == 200) {
                    document.getElementById("image-upload-section").innerHTML = xhr.responseText;
                }
            };
            xhr.send();
        }
        // 선택된 날짜에 맞는 Diary 리스트를 서버에서 불러오는 함수
        function loadDiaryList(year, month, day) {
            var xhr = new XMLHttpRequest();
            xhr.open("GET", "DetailDiaryServlet?year=" + year + "&month=" + month + "&day=" + day, true);
            xhr.onreadystatechange = function () {
                if (xhr.readyState == 4 && xhr.status == 200) {
                    document.getElementById("diary-section").innerHTML = xhr.responseText;
                }
            };
            xhr.send();
        }
        
        // 선택된 날짜에 맞는 일정 리스트를 서버에서 불러오는 함수
        function loadScheduleList(year, month, day) {
            var xhr = new XMLHttpRequest();
            xhr.open("GET", "ScheduleListServlet?year=" + year + "&month=" + month + "&day=" + day, true);
            xhr.onreadystatechange = function () {
                if (xhr.readyState == 4 && xhr.status == 200) {
                    document.getElementById("ScheduleDisplay").innerHTML = xhr.responseText;
                }
            };
            xhr.send();
        }
        
        // 선택된 날짜에 맞는 백신 정보 불러오는 함수
        function loadVaccineList(year, month, day) {
            var xhr = new XMLHttpRequest();
            xhr.open("GET", "VaccineServlet?year=" + year + "&month=" + month + "&day=" + day, true);
            xhr.onreadystatechange = function () {
                if (xhr.readyState == 4 && xhr.status == 200) {
                    document.getElementById("VaccineDisplay").innerHTML = xhr.responseText;
                }
            };
            xhr.send();
        }
        
        // 선택된 날짜에 맞는 아기 개월 정보 불러오는 함수
        function loadBabyAgeList(year, month, day) {
            var xhr = new XMLHttpRequest();
            xhr.open("GET", "BabyAgeServlet?year=" + year + "&month=" + month + "&day=" + day, true);
            xhr.onreadystatechange = function () {
                if (xhr.readyState == 4 && xhr.status == 200) {
                    document.getElementById("BabyAge").innerHTML = xhr.responseText;
                }
            };
            xhr.send();
        }
    </script>
</body>

</html>
