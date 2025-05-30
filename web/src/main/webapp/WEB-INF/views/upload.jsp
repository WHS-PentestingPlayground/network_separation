<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>파일 업로드</title>
</head>
<body>
<h2>📤 파일 업로드</h2>

<form method="post" enctype="multipart/form-data" action="upload">
    <label for="userId">사용자 ID:</label>
    <input type="text" id="userId" name="userId" required />
    <br><br>

    <label for="file">업로드할 파일 선택:</label>
    <input type="file" id="file" name="file" required />
    <br><br>

    <input type="submit" value="업로드" />
</form>

<br>
<a href="index.jsp">🏠 홈으로 돌아가기</a>
</body>
</html>
