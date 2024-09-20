let selectedRequestId = null;

function loadRequests() {
    fetch('/api/requests')
        .then(response => response.json())
        .then(data => {
            const requestList = document.getElementById('request-list');
            requestList.innerHTML = ''; // 기존 목록 비우기

            data.requests.forEach(request => {
                const requestItem = document.createElement('div');
                requestItem.className = 'request-item';
                requestItem.innerHTML = `
                    <input type="radio" name="request" value="${request.id}" onclick="selectRequest(${request.id})">
                    <h3>${request.name}</h3>
                    <p>${request.address}</p>
                    <p>${request.phone}</p>
                `;
                requestList.appendChild(requestItem);
            });
        })
        .catch(error => {
            console.error('Error loading requests:', error);
        });
}

function selectRequest(requestId) {
    selectedRequestId = requestId; // 선택된 요청 ID 저장
}

function handleAction(action) {
    if (selectedRequestId === null) {
        alert('선택된 요청이 없습니다.');
        return;
    }

    if (action === 'approve') {
        if (confirm('정말로 이 요청을 수락하시겠습니까?')) {
            fetch(`/api/approve/${selectedRequestId}`, {
                method: 'POST'
            })
            .then(response => response.json())
            .then(result => {
                if (result.success) {
                    alert('요청이 수락되었습니다.');
                    loadRequests(); // 요청 목록 새로고침
                } else {
                    alert('수락 처리 중 오류가 발생했습니다.');
                }
            })
            .catch(error => {
                console.error('Error approving request:', error);
                alert('서버 오류가 발생했습니다.');
            });
        }
    } else if (action === 'reject') {
        if (confirm('정말로 이 요청을 거부하시겠습니까?')) {
            fetch(`/api/reject/${selectedRequestId}`, {
                method: 'POST'
            })
            .then(response => response.json())
            .then(result => {
                if (result.success) {
                    alert('요청이 거부되었습니다.');
                    loadRequests(); // 요청 목록 새로고침
                } else {
                    alert('거부 처리 중 오류가 발생했습니다.');
                }
            })
            .catch(error => {
                console.error('Error rejecting request:', error);
                alert('서버 오류가 발생했습니다.');
            });
        }
    }
}

// 이벤트 리스너 추가
document.getElementById('accept-button').addEventListener('click', () => handleAction('approve'));
document.getElementById('reject-button').addEventListener('click', () => handleAction('reject'));

// 페이지 로드 시 요청 목록을 로드
window.onload = loadRequests;
