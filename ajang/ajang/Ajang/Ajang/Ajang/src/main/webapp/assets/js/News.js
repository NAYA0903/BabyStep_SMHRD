// URL로 바로 이동하는 함수로 수정
function newsWatchVideo(url) {
    window.open(url, '_blank'); // 새 창으로 URL을 엽니다.
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

// 검색 버튼을 눌렀을 떄 검색 기능을 구현
document.querySelector('.search-button').addEventListener('click', function() {
    const searchTerm = document.querySelector('.search-input').value;
    // 검색 로직을 여기에 추가
    alert("검색어: " + searchTerm);
});
