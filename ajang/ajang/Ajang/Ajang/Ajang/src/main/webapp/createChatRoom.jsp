<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <link rel="icon" href="img/OngalLogoPabi.png" sizes="128x128">
    <title>옹알이방</title>
    
    <style>
        body {
            font-family: Arial, sans-serif;
            padding: 20px;
        }
        
       	.Logo {
       		margin-bottom: 30px;
       	}
       	
       	
        .form-group {
            margin-bottom: 10px;
        }
        
        .input-container {
    		display: flex;
   			flex-direction: column;
    		gap: 20px;
    		margin-bottom: 30px;
		}

		.input-box {
    		position: relative;
    		display: flex;
    		align-items: center;
		}

		input[type="text"] {
    		width: 100%;
    		padding: 10px;
    		font-size: 14px;
    		border: none;
    		border-bottom: 1px solid #ccc;
    		outline: none;
    		background-color: transparent;
		}

		input[type="text"]::placeholder {
    		color: #999;
		}
		
		input[type="number"] {
    		width: 100%;
    		padding: 10px;
    		font-size: 14px;
    		border: none;
    		border-bottom: 1px solid #ccc;
    		outline: none;
    		background-color: transparent;
		}

		input[type="number"]::placeholder {
    		color: #999;
		}
		
		

		.char-count {
    		position: absolute;
    		right: 0;
    		bottom: 10px;
    		font-size: 12px;
    		color: #aaa;
		}
		
		.form-group {
    		display: flex;
    		justify-content: flex-end; /* 버튼을 오른쪽으로 정렬 */
		}
		
		button.btn {
    		font-size: 16px;
    		background-color: white;
    		color: black ;
    		border: 1px solid;
    		border-radius: 5px;
    		cursor: pointer;
		}
		
		button.btn:hover {
   	 		background-color: #A7A7A7;
		}
		
		
    </style>
</head>

<body>
    
    <!-- 로고 div -->
    <div class="Logo">
    	<img src="img/OngalRoomLogo.png" class="LogoImg">
   	</div>
    
    <form action="createChatRoom.do" method="post">
    <div class="input-container">
        <div class="input-box">
            <input type="text" id="roomTitle" name="roomTitle" placeholder="옹알이방 이름을 입력해주세요." maxlength="30" oninput="updateCount('name-count', this)" autocomplete="off" required>
            <span class="char-count" id="name-count">0/30</span>
        </div>

        <div class="input-box">
            <input type="number" id="roomLimit" name="roomLimit" placeholder="옹알이방 제한인원을 정해주세요." maxlength="3" oninput="updateCount('desc-count', this)" autocomplete="off" required>
            <span class="char-count" id="desc-count">0/3</span>
        </div>
        
        <div class="input-box">
            <input type="text" id="roomImg" name="roomImg" placeholder="옹알이방 대표 이미지를 정해주세요.(URL)" maxlength="300" oninput="updateCount('url-count', this)" autocomplete="off">
            <span class="char-count" id="url-count">0/300</span>
        </div>
    </div>
    
     <div class="form-group">
        <button type="submit" class="btn">생성하기</button>
     </div>
     
    </form>
    
    <script>
        function updateCount(id, element) {
            document.getElementById(id).textContent = element.value.length + '/' + element.maxLength;
        }
    </script>
</body>
</html>
