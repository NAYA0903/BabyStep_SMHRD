/**
 * 
 */
document.getElementById('register-form').addEventListener('submit', function (event) {
    event.preventDefault();

    const formData = new FormData(this);
    const data = {
        category: formData.get('category'),
        photo: formData.get('photo'),
        name: formData.get('name'),
        address: formData.get('address'),
        phone: formData.get('phone'),
        sns: formData.get('sns'),
        comment: formData.get('comment')
    };

    fetch('/api/register', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(data)
    })
    .then(response => response.json())
    .then(result => {
        if (result.success) {
            alert('등록 요청이 성공적으로 제출되었습니다.');
            window.location.href = 'PlaceMain.jsp'; // 메인 페이지로 리디렉션
        } else {
            alert('등록 요청에 실패하였습니다. 다시 시도해 주세요.');
        }
    })
    .catch(error => {
        console.error('Error submitting registration:', error);
        alert('서버 오류가 발생했습니다.');
    });
});
