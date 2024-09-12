    document.addEventListener('DOMContentLoaded', function() {
        var dayCells = document.querySelectorAll('td.day, td.sun, td.sat');
        var selectedCell = null;

        dayCells.forEach(function(cell) {
            cell.addEventListener('click', function() {
                if (selectedCell) {
                    selectedCell.classList.remove('selected');
                }

                cell.classList.add('selected');
                selectedCell = cell;

                var dayValue = cell.getAttribute('data-day');
                var year = year 
                var month = month 

                // 선택한 날짜를 세션에 저장 (AJAX 요청)
                var xhr = new XMLHttpRequest();
                xhr.open("POST", "SaveSelectedDate.jsp", true);
                xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                xhr.send("year=" + year + "&month=" + month + "&day=" + dayValue);
            });
        });
    });
