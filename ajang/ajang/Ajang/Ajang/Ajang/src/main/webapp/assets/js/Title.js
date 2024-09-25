document.addEventListener('DOMContentLoaded', adjustContentPadding);

// 브라우저 크기 변경 시에도 실행
window.addEventListener('resize', adjustContentPadding);

function adjustContentPadding() {
	const title = document.querySelector('.title');
	const mainContent = document.querySelector('.main-content');
	if (title && mainContent) {
		const titleHeight = title.offsetHeight;
		mainContent.style.paddingTop = titleHeight + 'px'; // 패딩 설정
	}
}

// 다크 모드 토글 스위치
document.addEventListener('DOMContentLoaded', function() {
    const darkModeToggle = document.getElementById('darkModeToggle');
    const body = document.body;
    const logoImage = document.getElementById('logoImage'); // 로고 이미지 태그
    const modeImage = document.getElementById('modeImage'); // PNG 이미지 태그

    // 저장된 다크 모드 상태가 있는지 확인하고 적용
    if (localStorage.getItem('darkMode') === 'enabled') {
        body.classList.add('dark-mode');
        darkModeToggle.checked = true;
        logoImage.src = 'img/MainLogoDark.png'; // 다크 모드일 때 로고 이미지 설정
        modeImage.src = 'img/darkmode.png'; // 다크 모드일 때 PNG 이미지 설정
        modeImage.style.right = 'calc(100% - 30px)'; // 다크 모드일 때 우측으로 이동
        modeImage.style.left = 'auto'; // 좌측 초기화
    } else {
        logoImage.src = 'img/MainLogo.png'; // 라이트 모드일 때 로고 이미지 설정
        modeImage.src = 'img/lightmode.png'; // 라이트 모드일 때 PNG 이미지 설정
        modeImage.style.left = 'calc(100% - 30px)'; // 라이트 모드일 때 좌측 배치
        modeImage.style.right = 'auto'; // 우측 초기화
    }

    // 다크 모드 토글 동작
    darkModeToggle.addEventListener('change', function() {
        if (darkModeToggle.checked) {
            body.classList.add('dark-mode');
            localStorage.setItem('darkMode', 'enabled'); // 다크 모드 상태 저장
            logoImage.src = 'img/MainLogoDark.png'; // 다크 모드일 때 로고 이미지 변경
            modeImage.src = 'img/darkmode.png'; // 다크 모드일 때 PNG 이미지 변경
            modeImage.style.right = 'calc(100% - 30px)'; // 다크 모드일 때 우측으로 이동
            modeImage.style.left = 'auto'; // 좌측 초기화
        } else {
            body.classList.remove('dark-mode');
            localStorage.setItem('darkMode', 'disabled'); // 라이트 모드 상태 저장
            logoImage.src = 'img/MainLogo.png'; // 라이트 모드일 때 로고 이미지 변경
            modeImage.src = 'img/lightmode.png'; // 라이트 모드일 때 PNG 이미지 변경
            modeImage.style.left = 'calc(100% - 30px)'; // 라이트 모드일 때 좌측 배치
            modeImage.style.right = 'auto'; // 우측 초기화
        }
    });
});




// 사용자의 이전 선택 기억 (로컬 저장소)
const savedTheme = localStorage.getItem('theme');
if (savedTheme) {
	document.body.classList.add(savedTheme === 'dark' ? 'dark-mode' : 'light-mode');
	darkModeToggle.checked = savedTheme === 'dark';
} else {
	document.body.classList.add('light-mode'); // 기본 모드는 라이트 모드
}


function openChatRoomPopup() {
	// 팝업 창을 열기 위한 window.open() 함수 사용
	var popupWidth = 400;
	var popupHeight = 600;
	var popupX = (window.screen.width / 2) - (popupWidth / 2);
	var popupY = (window.screen.height / 2) - (popupHeight / 2);

	window.open(
		'chatRoomList.jsp', // 열고자 하는 페이지 경로
		'채팅방 리스트', // 팝업 창 이름
		'status=no, location=no, height=' + popupHeight + ', width=' + popupWidth + ', left=' + popupX + ', top=' + popupY + ', resizable=yes'
	);
}