<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head><meta charset="UTF-8"><title>글쓰기</title></head>
<body>
<h2>✍ 글쓰기</h2>
<form method="post" action="/board/write">
    제목: <input type="text" name="title"><br>
    내용:<br>
    <textarea name="content" rows="5" cols="40"></textarea><br>
    <button type="submit">등록</button>
</form>
</body>
</html>
