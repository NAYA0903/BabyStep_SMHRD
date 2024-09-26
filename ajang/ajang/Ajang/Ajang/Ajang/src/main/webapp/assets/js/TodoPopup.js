function toggleTodoPopup() {

			var popup = document.getElementById('TodoPopup');
			var overlay = document.getElementById('TodoOverlay');

			var selectedDate = document.getElementById('selectedDateDisplay').textContent; // 선택한 날짜 가져오기

			// 팝업 폼에 선택한 날짜를 설정
			if (selectedDate) {
				document.getElementById('todoDate').value = selectedDate; // 선택한 날짜를 설정
				console.log("선택한 날짜 : ", selectedDate)
			}

			var isHidden = popup.style.display === 'none'
					|| popup.style.display === '';
			popup.style.display = isHidden ? 'block' : 'none';
			overlay.style.display = isHidden ? 'block' : 'none';
		}