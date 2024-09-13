<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create Chat Room</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        .form-group {
            margin-bottom: 10px;
        }
    </style>
</head>
<body>
    <h1>옹알이방 개설하기</h1>
    
    <form action="createChatRoom.do" method="post">
        <div class="form-group">
            <label for="roomTitle">Room Title:</label>
            <input type="text" id="roomTitle" name="roomTitle" required>
        </div>
        <div class="form-group">
            <label for="roomLimit">Room Limit:</label>
            <input type="number" id="roomLimit" name="roomLimit" min="1" required>
        </div>
        <div class="form-group">
            <label for="roomImg">Room Image URL (optional):</label>
            <input type="text" id="roomImg" name="roomImg">
        </div>
        <button type="submit">Create Room</button>
    </form>
</body>
</html>
