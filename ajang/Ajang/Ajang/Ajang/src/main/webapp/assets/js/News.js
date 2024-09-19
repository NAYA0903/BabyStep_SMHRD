function openPopup(title, description) {
    document.getElementById('popup-title1').innerText = title;
    document.getElementById('popup-description1').innerText = description;
    document.getElementById('popup1').style.display = 'block';
    
    // 목록이 다 보이게 스크롤 내리기
    setTimeout(() => {
        const popupHeight = document.getElementById('popup1').offsetHeight; // 팝업 높이
        window.scrollTo({
            top: popupHeight, // 팝업 높이만큼 스크롤
            behavior: 'smooth' // 부드럽게 스크롤
        });
    }, 100); // 팝업이 열리고 나서 약간의 지연 후 스크롤
}

function closePopup() {
    document.getElementById('popup1').style.display = 'none';
}

// 클릭 외부를 클릭 시 팝업 닫기
window.onclick = function(event) {
    const popup = document.getElementById('popup1');
    if (event.target === popup) {
        closePopup();
    }
}
