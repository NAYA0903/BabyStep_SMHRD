function openPopup(title, description) {
    document.getElementById('popup-title1').innerText = title;
    document.getElementById('popup-description1').innerText = description;
    document.getElementById('popup1').style.display = 'block';
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
