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
		<h1>ID : ${member.id }</h1>
		<h1>Name : ${member.name }</h1>
		<h1>Email : ${member.email }</h1>
		<img src="../upload/${member.fname} ">
		</div>
		<div class="row">
			<a href = "memberUpdate.do">수정</a>
			<a href = "memberDelete.do">탈퇴</a>
		</div>
	
	</div>



<c:import url="../../../tempu/footer.jsp"></c:import>
</body>
</html>