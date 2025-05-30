  <%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ page session="true" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

  <html>
  <head><meta charset="UTF-8"><title>로그인</title></head>
  <body>

  <!--  로그인 상태 -->
  <c:if test="${not empty sessionScope.loginId}">
    <p>${sessionScope.loginId}님 환영합니다!</p>
    <a href="/board">게시판 가기</a><br>
    <a href="/logout">로그아웃</a>
    <a href="/upload">업로드</a>
    <a href="/upload-list">업로드 리스트</a>
  </c:if>

  <c:if test="${sessionScope.loginId eq 'admin'}">
    <a href="/admin/users">유저 목록 보기</a>
  </c:if>

  <!--  비로그인 상태 -->
  <c:if test="${empty sessionScope.loginId}">
    <form method="post" action="/login">
      ID: <input name="id"><br>
      PW: <input name="pw" type="password"><br>
      <button type="submit">Login</button>
    </form>
    <a href="/register">회원가입</a>
  </c:if>



