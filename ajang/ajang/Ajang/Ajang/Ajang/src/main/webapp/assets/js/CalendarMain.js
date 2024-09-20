    document.addEventListener('DOMContentLoaded', function() {
        var dayCells = document.querySelectorAll('td[data-day]');
        var selectedCell = null;

        // 페이지 로드 시 오늘 날짜 자동 선택
        var todayCell = document.querySelector('td.today');
        if (todayCell) {
            todayCell.classList.add('selected'); // 오늘 날짜에 'selected' 클래스 추가
            document.getElementById('selectedDateDisplay').textContent = "<%= currentYear %>년 <%= currentMonth %>월 <%= currentDay %>일"; // 오른쪽에 오늘 날짜 표시
        }

        // 날짜 선택 시 동작
        dayCells.forEach(function(cell) {
            cell.addEventListener('click', function() {
                if (selectedCell) {
                    selectedCell.classList.remove('selected'); // 이전 선택된 셀에서 클래스 제거
                }

                cell.classList.add('selected'); // 선택된 셀에 클래스 추가
                selectedCell = cell;

                var selectedDay = cell.getAttribute('data-day');
                var year = "<%= year %>";
                var month = "<%= month %>";

                // 오른쪽에 선택된 날짜 표시
                document.getElementById('selectedDateDisplay').textContent = year + "년 " + month + "월 " + selectedDay + "일";
                
                // AJAX 요청을 통해 선택된 날짜를 서버로 전송
                var xhr = new XMLHttpRequest();
                xhr.open("POST", "SaveSelectedDate.jsp", true);
                xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
                xhr.send("year=" + year + "&month=" + month + "&day=" + selectedDay);
            });
        });
    });
