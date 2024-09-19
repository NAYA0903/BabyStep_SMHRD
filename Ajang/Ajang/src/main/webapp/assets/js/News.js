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