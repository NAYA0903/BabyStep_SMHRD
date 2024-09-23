<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<link rel="icon" href="img/BabyStepLogo.ico" sizes="128x128" type="image/x-icon">
<title>걸음마</title>
<link rel="stylesheet" href="assets/css/RegisterLogin.css">
</head>
				
<body>

	
	<div class="container" id="container">
		<div class="form-container sign-up-container">
			<form action="RegisterService" method="post" id="registerForm">
				
				<!-- 회원가입 -->
				
				<h1>회원가입</h1>
				
				<!-- API로그인 연동 공간 -->
				<div class="social-container">
					<a href="javascript:loginWithKakao()" class="social-kakao"><img alt="KakaoLogo" class="Kakao" src="img/kakao.png"></a>
					<div id="button_area">
					<div id="naverIdLogin"></div>
					</div>
				</div>
				<span>걸음마 계정으로 가입하기</span>
				
				<!-- 회원가입 입력란 -->
				 <input type="hidden" name="action" value="register" />
				 <!-- 닉네임 입력란 -->
				 <input type="text" name="nickname" placeholder="닉네임" />
				 <!-- 아이디 입력란 -->
				 <input type="text" name="id" placeholder="아이디" /> 
				 <!-- 비밀번호 입력란 -->
				 <input type="password" name="pw" placeholder="비밀번호" />
				 <!-- 주소 입력란 -->
				 <input type="text" name="addr" placeholder="주소" />
				
				<button class="font">회원가입</button>
				
			</form>
		</div>
		
		
		<div class="form-container sign-in-container">
			<form action="LoginService" method="post">
			
			
				<!-- 로그인 -->
				
				<h1>로그인</h1>
				<div class="social-container">
					<a href="javascript:loginWithKakao()" class="social-kakao"><img alt="KakaoLogo" class="Kakao" src="img/kakao.png"></a>
					<a href="naverLogin.html" class="social-naver"><img alt="NaverLogo" class="Naver" src="img/NaverLogo.png"></a>
				</div>
				<span>걸음마 계정으로 로그인하기</span> 
				<input type="hidden" name="action" value="login" />
				<input type="text" name="id" placeholder="아이디" /> 
				<input type="password" name="pw" placeholder="비밀번호" /> 
				<br>
				<button type="submit" class="font">로그인</button>
				
				<!-- 아이디 또는 비밀번호가 일치하지 않습니다. -->
				<% String errorMessage = (String) request.getAttribute("errorMessage"); %>
				<% if (errorMessage != null) { %>
    				<div class="error">
        				<p><%= errorMessage %></p>
    				</div>
				<% } %>
				
			</form>
		</div>
		
		
		<!-- 사이드 ? -->
		<div class="overlay-container">
			<div class="overlay">
				<div class="overlay-panel overlay-left">
					<img alt="BabyStepLogo" class="logo" src="img/BabyStepLogo.png">
					<p>육아 기록 웹서비스 "걸음마"</p>
					<button class="ghost" id="signIn">로그인</button>
				</div>
				<div class="overlay-panel overlay-right">
					<img alt="BabyStepLogo" class="logo" src="img/BabyStepLogo.png">
					<p>오늘도 한걸음 "걸음마"</p>
					<button class="ghost" id="signUp" >회원가입</button>
				</div>
			</div>
		</div>
	</div>

	<script src="assets/js/RegisterLogin.js"></script>
	
	<!-- kakao 로그인 API -->
	<script src="https://t1.kakaocdn.net/kakao_js_sdk/2.1.0/kakao.min.js" integrity="sha384-dpu02ieKC6NUeKFoGMOKz6102CLEWi9+5RQjWSV0ikYSFFd8M3Wp2reIcquJOemx" crossorigin="anonymous"></script>
	<script>
		Kakao.init('9a52835cd6bdda610b62d36bc22609b8'); // 여기에 실제 앱의 JavaScript 키 입력
	</script>
	
	<!-- Naver 로그인 API -->
	<script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>
	
	<script>
		function loginWithKakao() {
			Kakao.Auth.authorize({
				redirectUri : 'http://localhost:8083/Ajang/RegisterSuccess.jsp',
			});
		}

		$.ajax({
			type : "POST",
			url : 'https://kauth.kakao.com/oauth/token',
			data : {
				grant_type : 'authorization_code',
				client_id : '9a52835cd6bdda610b62d36bc22609b8',
				redirect_uri : 'http://localhost:8083/Ajang/RegisterSuccess.jsp',
				code : 'RECEIVED_AUTHORIZATION_CODE'
			},
			contentType : 'application/x-www-form-urlencoded;charset=utf-8',
			success : function(response) {
				Kakao.Auth.setAccessToken(response.access_token);
			},
			error : function(jqXHR, error) {
				console.error('Failed to get access token', error);
			}
		});
		
		// URL에서 인가 코드 추출
		function getQueryParameter(name) {
		  var regex = new RegExp('[?&]' + name + '=([^&]*)');
		  var results = regex.exec(window.location.search);
		  return results === null ? '' : decodeURIComponent(results[1].replace(/\+/g, ' '));
		}

		// 인가 코드 가져오기
		var authorizationCode = getQueryParameter('code');

		
		function requestUserInfo() {
			  Kakao.API.request({
			    url: '/v2/user/me',
			  })
			  .then(function(res) {
			    alert(JSON.stringify(res));
			  })
			  .catch(function(err) {
			    alert('failed to request user information: ' + JSON.stringify(err));
			  });
			}

	</script>
	
	<script type="text/javascript">
        const naverLogin = new naver.LoginWithNaverId({
            clientId: "k7LDeMWz_5i_Ge1mhbY4",
            callbackUrl: "http://localhost:8083/Ajang/RegisterSuccess.jsp",
            loginButton: { color: "green", type: 1, height: 40 }
        });

        naverLogin.init();
        naverLogin.getLoginStatus(function(status) {
            if (status) {
                const nickName = naverLogin.user.getNickName();
                const age = naverLogin.user.getAge();
                const email = naverLogin.user.getEmail();

                if (!nickName) {
                    alert("별명이 필요합니다. 정보제공을 동의해주세요.");
                    naverLogin.reprompt();
                    return;
                } else {
                    setLoginStatus();
                }
            }
        });

        function setLoginStatus() {
            const message_area = document.getElementById('message');
            message_area.innerHTML = `
                <h3>Login 성공</h3>
                <div>user Nickname : ${naverLogin.user.getNickName()}</div>
                <div>user Age(범위) : ${naverLogin.user.getAge()}</div>
                <div>user Email : ${naverLogin.user.getEmail()}</div>
            `;

            const button_area = document.getElementById('button_area');
            button_area.innerHTML = "<button id='btn_logout'>로그아웃</button>";

            const logout = document.getElementById('btn_logout');
            logout.addEventListener('click', () => {
                naverLogin.logout();
                location.replace("http://localhost:8083/Ajang/RegisterSuccess.jsp");
            });
        }
    </script>
	

</body>

</html>