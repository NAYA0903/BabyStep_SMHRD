window.onload = function () {
          adjustContentPadding(); // 페이지 로드 시 실행

          // 브라우저 크기 변경 시에도 실행
          window.addEventListener('resize', adjustContentPadding);
      };

      function adjustContentPadding() {
          const titleHeight = document.querySelector('.title').offsetHeight; // 타이틀의 높이 계산
          document.querySelector('.main-content').style.paddingTop = titleHeight + 'px'; // 본문에 패딩 적용
      }
 
      // 다크 모드 스위치 동작
      const darkModeToggle = document.getElementById('darkModeToggle');
      darkModeToggle.addEventListener('change', () => {
          document.body.classList.toggle('dark-mode');
          document.body.classList.toggle('light-mode');

          // 로컬 저장소에 사용자가 선택한 모드 저장
          if (document.body.classList.contains('dark-mode')) {
              localStorage.setItem('theme', 'dark');
          } else {
              localStorage.setItem('theme', 'light');
          }
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
		 
	