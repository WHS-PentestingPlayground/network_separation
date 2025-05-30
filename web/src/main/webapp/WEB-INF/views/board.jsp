<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head><meta charset="UTF-8"><title>게시판</title></head>
<body>
<h2>📋 게시판</h2>
<a href="/board/write">글쓰기</a>
<a href="/">홈으로 </a>
<ul>
    <c:forEach var="post" items="${posts}">
        <li>
            <a href="/board/view?id=${post.ID}">${post.TITLE}</a>
        </li>
    </c:forEach>
</ul>
</body>
</html>
