<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head><meta charset="UTF-8"><title>글 상세</title></head>
<body>
<h2>📝 ${post.title}</h2>
<p>${post.content}</p>
<a href="/board/delete?id=${post.ID}">삭제</a> |
<a href="/board">목록</a>
</body>
</html>
