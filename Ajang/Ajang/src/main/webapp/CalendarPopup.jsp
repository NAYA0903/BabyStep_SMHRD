<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>커스텀 팝업</title>
    <style>
        body {
            font-family: 'Noto Sans', sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        /* 팝업 오픈 버튼 스타일 */
        .open-btn {
            display: inline-block;
            padding: 10px 20px;
            background-color: #007BFF;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            margin: 20px;
            transition: background-color 0.3s ease;
        }

        .open-btn:hover {
            background-color: #0056b3;
        }

        /* 팝업 창 기본 스타일 */
        .popup {
            display: none;
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            width: 320px;
            background: #fff;
            border-radius: 12px;
            padding: 20px;
            box-sizing: border-box;
            box-shadow: 0 12px 24px rgba(0, 0, 0, 0.2);
            z-index: 1000;
            opacity: 0;
            transition: opacity 0.3s ease, transform 0.3s ease;
        }

        /* 팝업이 보일 때 스타일 */
        .popup.active {
            display: block;
            opacity: 1;
            transform: translate(-50%, -50%) scale(1);
        }

        /* 팝업 배경 오버레이 */
        .popup-overlay {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.6);
            z-index: 999;
            opacity: 0;
            transition: opacity 0.3s ease;
        }

        /* 오버레이가 보일 때 */
        .popup-overlay.active {
            display: block;
            opacity: 1;
        }

        /* 팝업 내 각 항목 스타일 */
        .popup h3 {
            margin: 10px 0;
            font-size: 22px;
            color: #333;
            border-bottom: 2px solid #007BFF;
            padding-bottom: 8px;
        }

        .popup label {
            font-size: 14px;
            color: #555;
            margin-bottom: 5px;
            display: block;
        }

        .popup input[type="text"],
        .popup input[type="date"] {
            width: calc(100% - 12px);
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ddd;
            border-radius: 6px;
            font-size: 14px;
            box-sizing: border-box;
            transition: border-color 0.3s ease;
        }

        .popup input[type="text"]:focus,
        .popup input[type="date"]:focus {
            border-color: #007BFF;
            outline: none;
        }

        .popup .color-section {
            display: flex;
            align-items: center;
            margin-bottom: 15px;
        }

        .popup .color-section label {
            margin-right: 10px;
        }

        .popup .color-section input[type="checkbox"] {
            width: 20px;
            height: 20px;
        }

        /* 팝업 닫기 버튼 스타일 */
        .popup .close-btn {
            display: inline-block;
            margin-top: 10px;
            padding: 10px 20px;
            background-color: #FF3E4D;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            width: 100%;
            text-align: center;
            transition: background-color 0.3s ease;
        }

        .popup .close-btn:hover {
            background-color: #d32f2f;
        }
    </style>
    <script>
        function togglePopup() {
            var popup = document.getElementById('popup');
            var overlay = document.getElementById('overlay');

            popup.classList.toggle('active');
            overlay.classList.toggle('active');
        }
    </script>
</head>
<body>

    <!-- 팝업 열기 버튼 -->
    <button class="open-btn" onclick="togglePopup()">팝업 열기</button>

    <!-- 팝업 창 -->
    <div id="popup" class="popup">
        <h3>팝업 창</h3>

        <label for="title">제목</label>
        <input type="text" id="title" placeholder="제목을 입력하세요">

        <label for="content">내용</label>
        <input type="text" id="content" placeholder="내용을 입력하세요">

        <label for="start">시작 날짜</label>
        <input type="date" id="start">

        <label for="end">종료 날짜</label>
        <input type="date" id="end">

        <div class="color-section">
            <label for="color">색상</label>
            <jsp:include page="Popcolor.jsp" />
        </div>

        <button class="close-btn" onclick="togglePopup()">닫기</button>
    </div>

    <!-- 팝업 배경 오버레이 -->
    <div id="overlay" class="popup-overlay" onclick="togglePopup()"></div>

</body>
</html>
