document.getElementById('register-form').addEventListener('submit', function (event) {
    event.preventDefault();

    const formData = new FormData(this); // FormData 객체 생성

    fetch('/api/createPlace', { // API 경로
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
            alert('장소 등록 요청이 성공적으로 제출되었습니다.'); 
            window.location.href = '/Ajang/src/main/webapp/PlaceMain.jsp'; 
        } else {
            alert('장소 등록 요청에 실패하였습니다. 오류: ' + result.message);
        }
    })
    .catch(error => {
        console.error('Error submitting registration:', error);
        alert('서버 오류가 발생했습니다. 나중에 다시 시도해 주세요.'); 
    });
});
