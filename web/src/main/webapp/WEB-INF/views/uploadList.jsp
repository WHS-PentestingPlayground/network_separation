<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<html>
<head>
  <title>📂 업로드된 파일 목록</title>
</head>
<body>
<h2>📂 업로드된 파일 목록</h2>

<!-- 업로드/삭제 결과 메시지 출력 -->
<c:if test="${not empty message}">
  <p style="color:green;">${message}</p>
</c:if>

<!-- 파일 목록 테이블 -->
<table border="1" cellpadding="8">
  <thead>
  <tr>
    <th>ID</th>
    <th>파일명</th>
    <th>업로드 시각</th>
    <th>사용자 ID</th>
    <th>동작</th>
  </tr>
  </thead>
  <tbody>
  <c:forEach var="file" items="${files}">
    <tr>
      <td>${file.id}</td>
      <td>${file.filename}</td>
      <td>${file.uploadedAt}</td>
      <td>${file.uploadedBy}</td>
      <td>
        <a href="/download?id=${file.id}">📥 다운로드</a>
        &nbsp;|&nbsp;
        <form action="/delete" method="post" style="display:inline;">
          <input type="hidden" name="id" value="${file.id}" />
          <input type="submit" value="🗑️ 삭제" />
        </form>
      </td>
    </tr>
  </c:forEach>
  </tbody>
</table>

<br>
<a href="/upload">⬆️ 파일 업로드로 이동</a> |
<a href="/">🏠 홈으로</a>
</body>
</html>
