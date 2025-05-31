<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head><meta charset="UTF-8"><title>유저 목록</title></head>
<body>
<h2>모든 사용자 정보</h2>
<table border="1">
    <tr>
        <th>ID</th>
        <th>비밀번호</th>
    </tr>
    <c:forEach var="user" items="${users}">
        <tr>
            <td>${user.name}</td>
            <td>${user.pw}</td>
        </tr>
    </c:forEach>
</table>

<br>
<a href="/">홈으로</a>
</body>
</html>
