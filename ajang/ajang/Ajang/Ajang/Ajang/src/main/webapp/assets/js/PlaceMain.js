let currentPage = 1;
let isLoading = false;
let showFavorites = false; // 수정됨.

function loadPlaces(page) {
    if (isLoading) return;
    isLoading = true;

    const url = showFavorites ? `/api/favorites?page=${page}` : `/api/places?page=${page}`; // 수정됨.

    fetch(url)
        .then(response => response.json())
        .then(data => {
            if (data.places.length === 0) {
                document.getElementById('loading').style.display = 'none';
                return;
            }

            const placeList = document.getElementById('place-list');
            placeList.innerHTML = ''; // 기존 목록 초기화

            data.places.forEach(place => {
                const placeCard = document.createElement('div');
                placeCard.className = 'place-card';
                const heartIcon = place.isFavorited ? '❤️' : '🤍'; // 수정됨.
                placeCard.innerHTML = `
                    <a href="PlaceDetail.jsp?placeId=${place.idx}"> <!-- 수정됨. -->
                        <img src="${place.photo}" alt="${place.name}">
                        <h2>${place.name}</h2>
                        <p>${place.address}</p>
                        <p>${place.phone}</p>
                        <p>${place.sns}</p>
                    </a>
                    <button class="like-button" data-place-id="${place.idx}">
                        ${heartIcon} <!-- 수정됨. -->
                    </button>
                `;
                placeList.appendChild(placeCard);
            });

            isLoading = false;
            currentPage++;
        })
        .catch(error => {
            console.error('Error loading places:', error);
            isLoading = false;
        });
}

function likePlace(placeId) { // 수정됨.
    fetch(`/api/favorites`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({ placeIdx: placeId }) // 직접수정필요: 요청에 필요한 데이터 형식 맞춤.
    })
    .then(response => {
        if (!response.ok) {
            throw new Error('찜하기 실패');
        }
        alert('찜한 장소에 추가되었습니다!'); // 수정됨.
        loadPlaces(currentPage); // 수정됨: 즉시 목록 갱신.
    })
    .catch(error => {
        console.error('Error liking place:', error);
    });
}

document.getElementById('toggle-favorites').addEventListener('click', () => { // 수정됨.
    showFavorites = !showFavorites; // 수정됨.
    currentPage = 1; // 수정됨: 페이지 리셋
    loadPlaces(currentPage); // 수정됨.
});

window.addEventListener('scroll', () => {
    if (window.innerHeight + window.scrollY >= document.body.offsetHeight - 100) {
        document.getElementById('loading').style.display = 'block';
        loadPlaces(currentPage);
    }
});

window.onload = () => {
    loadPlaces(currentPage);
    document.getElementById('place-list').addEventListener('click', (event) => {
        if (event.target.classList.contains('like-button')) { // 수정됨.
            const placeId = event.target.getAttribute('data-place-id');
            likePlace(placeId);
        }
    });
};
