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

// 스크롤시 자연스럽게 타이틀 사라짐
let lastScrollTop = 0;
const title = document.querySelector('.title');

window.addEventListener('scroll', function () {
    let scrollTop = window.pageYOffset || document.documentElement.scrollTop;

    if (scrollTop > lastScrollTop) {
        // 스크롤을 아래로 내리면 타이틀바를 부드럽게 위로 숨김
        title.style.top = '-150px'; // 타이틀바 높이만큼 위로 이동
    } else {
        // 스크롤을 위로 올리면 타이틀바를 부드럽게 화면 상단에 표시
        title.style.top = '0';
    }

    lastScrollTop = scrollTop;
});