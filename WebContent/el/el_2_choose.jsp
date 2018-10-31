<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    <%
    	request.setAttribute("level", 3);
    	//1레벨 출입제한
    	//2레벨 열람제한
    	//3레벨 수정제한
    	//4레벨 삭제제한
    	//5레벨 모든 권한
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:choose>
		<c:when test="${level ==2 }">
			<h3>열람 제한</h3>
		</c:when>
		<c:when test="${level==3 }">
			<h3>수정 제한</h3>
		</c:when>
		<c:when test="${level==4 }">
			<h3>삭제 제한</h3>
		</c:when>
		<c:otherwise>
			<h3>출입 제한</h3>
		</c:otherwise>	
	</c:choose>


</body>
</html>