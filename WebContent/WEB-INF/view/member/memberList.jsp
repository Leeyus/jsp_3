<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../../../tempu/butt.jsp"></c:import>
</head>
<body>
<c:import url="../../../tempu/head.jsp"></c:import>
	<div class="container-fluid">
		<div class="row">
		<!-- 로그인 후 -->
		<c:choose>
		<c:when test="${not empty member}">
			<h3>${member.id} 님 환영합니다!!</h3>
			<a href="./memberLogout.do">Logout</a>
			<a href="./memberMyPage.do">MyPage</a>
		</c:when>
		<c:otherwise>
		<!-- 로그인 전 -->
			<a href="./memberLogin.do">Login</a>
			<a href="./memberJoin.do">Join</a>
		</c:otherwise>
		</c:choose>
		</div>
	
	
	</div>



<c:import url="../../../tempu/footer.jsp"></c:import>
</body>
</html>