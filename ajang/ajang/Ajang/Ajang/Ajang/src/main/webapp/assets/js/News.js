

// 목록이 다 보이게 스크롤 내리기
setTimeout(() => {
	const popupHeight = document.getElementById('popup1').offsetHeight; // 팝업 높이
	window.scrollTo({
		top: popupHeight, // 팝업 높이만큼 스크롤
		behavior: 'smooth' // 부드럽게 스크롤
	});
}, 100); // 팝업이 열리고 나서 약간의 지연 후 스크롤


function openPopup(title, description, url) {
	document.getElementById('popup-title1').innerText = title;
	document.getElementById('popup-description1').innerText = description;
	// 팝업에 URL을 링크 형태로 추가
	document.getElementById('popup-url').innerHTML = `<a href="${url}" target="_blank">${url}</a>`;
	document.getElementById('popup1').style.display = 'block';
}

function closePopup() {
	document.getElementById('popup1').style.display = 'none';
}

window.onclick = function(event) {
	const popup = document.getElementById('popup1');
	if (event.target === popup) {
		closePopup();
	}
}

// 목록 필터링 기능 추가
function filterItems() {
	const searchInput = document.getElementById('search-input').value; // 입력값 그대로 사용 (한국어 지원)
	const items = document.querySelectorAll('.item'); // 모든 아이템 선택

	items.forEach((item) => {
		const itemText = item.innerText; // 각 아이템의 텍스트
		// 입력값이 아이템 텍스트에 포함되면 보여주고, 그렇지 않으면 숨김
		if (itemText.includes(searchInput)) {
			item.style.display = 'block'; // 일치하면 표시
		} else {
			item.style.display = 'none'; // 불일치하면 숨김
		}
	});
}


