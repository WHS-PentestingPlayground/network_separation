<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
  <title>로그인</title>
</head>
<body>
<h2>로그인</h2>
<form method="post" action="/login">
  <label for="id">ID:</label>
  <input type="text" name="id" id="id" required /><br><br>

  <label for="pw">PW:</label>
  <input type="password" name="pw" id="pw" required /><br><br>

  <button type="submit">Login</button>
</form>
</body>
</html>
