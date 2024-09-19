<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <!-- 파비콘 -->
    <link rel="icon" href="img/BabyStepLogo.ico" sizes="128x128" type="image/x-icon">
    <title>걸음마</title>
    
    <!-- css 연결 -->
    <link rel="stylesheet" href="assets/css/TeamInfo.css">
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

</head>
<body>

    <div class="select">
        <div id="image">
            <img src="img/Baby_logo.png" alt="Baby_logo" onclick="location.href='Main.jsp'">
        </div>
        <div class="item" id="main">
            <a href="Info.jsp" > 걸음마 소개 </a>
            <a href="TeamInfo.jsp" > 팀원 소개 </a>
            <a href="#" > 기능 소개 </a>
            <a href="#" > 뭔 소개 </a>
            <a href="#" > 쉽지않다 </a>

        </div>
        <div class="btn-group" role="group" aria-label="Basic example" id="login">
            <button type="button" class="btn btn-primary" onclick="location.href='#'">버튼</button>

        </div>
        

    </div>
    
    
        <div class="main">
    	
    	 	<div>
    			<img class="info_img" alt="info1" src="img/TeamInfo1.PNG">
    		</div>
    		
    		<div>
    			<img class="info_img_sub" alt="info2" src="img/TeamInfo2.PNG">
    		</div>
    		
    		<div>
    			<img class="info_img_sub" alt="info3" src="img/TeamInfo3.PNG">
    		</div>
    		
        </div>

</body>
</html>