// 팝업 열기 함수
function newsOpenPopup(title, description, url) {
    document.getElementById('news-popup-title').innerText = title;
    document.getElementById('news-popup-description').innerText = description;
    document.getElementById('news-popup-url').innerHTML = `<a href="${url}" target="_blank">${url}</a>`;
    document.getElementById('news-popup').style.display = 'block';
}

// 팝업 닫기 함수
function newsClosePopup() {
    document.getElementById('news-popup').style.display = 'none';
}

// 검색 필터 함수
function newsFilterItems() {
    const searchInput = document.getElementById('news-search-input').value.toLowerCase();
    const items = document.querySelectorAll('.item');

    items.forEach((item) => {
        const itemText = item.innerText.toLowerCase();
        if (itemText.includes(searchInput)) {
            item.style.display = 'flex';
        } else {
            item.style.display = 'none';
        }
    });
}
