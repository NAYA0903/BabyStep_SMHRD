document.getElementById('register-form').addEventListener('submit', function (event) {
    event.preventDefault();

    const formData = new FormData(this); // FormData 객체 생성

    fetch('/api/createPlace', { // API 경로를 수정
        method: 'POST',
        body: formData
    })
    .then(response => {
        if (!response.ok) {
            throw new Error('Network response was not ok ' + response.statusText);
        }
        return response.json();
    })
    .then(result => {
        if (result.success) {
            alert('장소 등록 요청이 성공적으로 제출되었습니다.'); // 메시지 수정
            window.location.href = '/Ajang/src/main/webapp/PlaceMain.jsp'; // 메인 페이지로 리디렉션
        } else {
            alert('장소 등록 요청에 실패하였습니다. 오류: ' + result.message); // 상세한 오류 메시지 추가
        }
    })
    .catch(error => {
        console.error('Error submitting registration:', error);
        alert('서버 오류가 발생했습니다. 나중에 다시 시도해 주세요.'); // 사용자 친화적인 메시지
    });
});
