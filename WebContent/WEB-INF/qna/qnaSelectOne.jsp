<%@page import="java.util.List"%>
<%@page import="com.iu.file.FileDTO"%>
<%@page import="com.iu.file.FileDAO"%>
<%@page import="javafx.scene.layout.Border"%>
<%@page import="com.iu.board.BoardDTO"%>
<%@page import="com.iu.notice.NoticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%	
    	BoardDTO boardDTO = (BoardDTO)request.getAttribute("dto");
    	
    	
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="../../tempu/butt.jsp" %>
</head>
<body>
<jsp:include page="../../tempu/head.jsp"></jsp:include>
<div class="container-fluid">
<div class="row">
	<h1>Title : <%=boardDTO.getTitle() %></h1>
	<h1>Writer : <%=boardDTO.getWriter() %></h1>
	<h1>Contents : <%=boardDTO.getContents() %></h1>
	
	<div>
		<a href="./qnaList.do">List</a>
		<a href="./qnaUpdateForm.do">update</a>
		<a href="./qnaDelete.do">delete</a>
	</div>
	</div>
</div>


<jsp:include page="../../tempu/footer.jsp"></jsp:include>
</body>
</html>