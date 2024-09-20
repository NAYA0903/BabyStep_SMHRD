<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>커스텀 색상 선택기</title>
    <style>
        /* 커스텀 색상 버튼 스타일 */
        .custom-color-picker {
            display: inline-block;
            width: 40px;
            height: 40px;
            background-color: #ffcc00;
            border: 2px solid #ccc;
            border-radius: 5px;
            cursor: pointer;
        }

        /* 실제 input[type="color"]는 숨김 */
        #color {
            display: none;
        }

        .color-label {
            font-size: 14px;
            margin-left: 10px;
        }
    </style>
</head>
<body>

    <!-- 색상 선택 커스텀 버튼 -->
    <label for="color" class="custom-color-picker" id="customColorPicker"></label>
    <span class="color-label">색상 선택</span>

    <!-- 기본 색상 선택 input (숨김 처리) -->
    <input type="color" id="color">

    <script>
        // 커스텀 색상 선택 버튼 클릭 시 input[type="color"] 실행
        const colorInput = document.getElementById('color');
        const customColorPicker = document.getElementById('customColorPicker');

        customColorPicker.addEventListener('click', function() {
            // 기본 색상 선택 창을 클릭
            colorInput.click();
        });

        // 색상 변경 시 커스텀 버튼의 배경색을 변경
        colorInput.addEventListener('input', function() {
            customColorPicker.style.backgroundColor = colorInput.value;
        });
    </script>

</body>
</html>
