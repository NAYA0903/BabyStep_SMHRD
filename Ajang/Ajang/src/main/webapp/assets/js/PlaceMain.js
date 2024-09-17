/**
 * 
 */
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

window.addEventListener('scroll', () => {
	if (window.innerHeight + window.scrollY >= document.body.offsetHeight - 100) {
		document.getElementById('loading').style.display = 'block';
		loadPlaces(currentPage);
	}
});

window.onload = () => {
	loadPlaces(currentPage);
};
