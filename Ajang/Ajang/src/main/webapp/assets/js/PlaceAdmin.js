function approveRequest(requestId) {
    fetch(`/api/approve/${requestId}`, {
        method: 'POST'
    })
    .then(response => response.json())
    .then(result => {
        if (result.success) {
            alert('요청이 수락되었습니다.');
            window.location.href = 'admin.html'; // 관리자 페이지로 리디렉션
        } else {
            alert('수락 처리 중 오류가 발생했습니다.');
        }
    })
    .catch(error => {
        console.error('Error approving request:', error);
        alert('서버 오류가 발생했습니다.');
    });
}

function rejectRequest(requestId) {
    fetch(`/api/reject/${requestId}`, {
        method: 'POST'
    })
    .then(response => response.json())
    .then(result => {
        if (result.success) {
            alert('요청이 거부되었습니다.');
            window.location.href = 'admin.html'; // 관리자 페이지로 리디렉션
        } else {
            alert('거부 처리 중 오류가 발생했습니다.');
        }
    })
    .catch(error => {
        console.error('Error rejecting request:', error);
        alert('서버 오류가 발생했습니다.');
    });
}

// 페이지 로드 시 요청 목록을 로드
window.onload = loadRequests;
