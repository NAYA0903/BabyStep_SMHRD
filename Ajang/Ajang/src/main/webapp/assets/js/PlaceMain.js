let currentPage = 1;
let isLoading = false;

function loadPlaces(page) {
    if (isLoading) return;
    isLoading = true;

    fetch(`/api/places?page=${page}`)
        .then(response => response.json())
        .then(data => {
            if (data.places.length === 0) {
                document.getElementById('loading').style.display = 'none';
                return;
            }

            const placeList = document.getElementById('place-list');
            data.places.forEach(place => {
                const placeCard = document.createElement('div');
                placeCard.className = 'place-card';
                placeCard.innerHTML = `
                    <a href="${place.homepage}">
                        <img src="${place.photo}" alt="${place.name}">
                        <h2>${place.name}</h2>
                        <p>${place.address}</p>
                        <p>${place.phone}</p>
                        <p>${place.sns}</p>
                    </a>
                    <button class="like-button" data-place-id="${place.idx}">찜하기</button> <!-- 수정되었음. -->
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

function likePlace(placeId) { // 수정되었음.
    fetch(`/api/favorites`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({ placeIdx: placeId }) // 직접변경: 요청에 필요한 데이터 형식 맞춤.
    })
    .then(response => {
        if (!response.ok) {
            throw new Error('Failed to like place');
        }
        alert('찜한 장소에 추가되었습니다!'); // 수정되었음.
    })
    .catch(error => {
        console.error('Error liking place:', error);
    });
}

window.addEventListener('scroll', () => {
    if (window.innerHeight + window.scrollY >= document.body.offsetHeight - 100) {
        document.getElementById('loading').style.display = 'block';
        loadPlaces(currentPage);
    }
});

window.onload = () => {
    loadPlaces(currentPage);
    document.getElementById('place-list').addEventListener('click', (event) => {
        if (event.target.classList.contains('like-button')) { // 수정되었음.
            const placeId = event.target.getAttribute('data-place-id');
            likePlace(placeId);
        }
    });
};
