<%@page import="java.util.List"%>
<%@page import="com.iu.file.FileDTO"%>
<%@page import="com.iu.file.FileDAO"%>
<%@page import="javafx.scene.layout.Border"%>
<%@page import="com.iu.board.BoardDTO"%>
<%@page import="com.iu.notice.NoticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%-- <%	
    	BoardDTO boardDTO = (BoardDTO)request.getAttribute("dto");
    	//List<FileDTO> ar = (List<FileDTO>)request.getAttribute("files");
    	String board = (String) request.getAttribute("board");
    %> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="../../../tempu/butt.jsp" %>
</head>
<body>
<jsp:include page="../../../tempu/head.jsp"></jsp:include>
<div class="container-fluid">
<div class="row">
	<h1>${board } View</h1>
	
</div>
<div class="row">
	<h1>Title : ${dto.title }</h1>
	<h1>Writer :${dto.writer }</h1>
	<h1>Contents : ${dto.contents} </h1>
	
	<div>
		<a href="./${reqestScope.board} List.do">List</a>
		<a href="./${reqestScope.board}Update.do?num=${dto.num}">update</a>
		<a href="./${reqestScope.board}Delete.do?num=${dto.num}">delete</a>
	</div>
	</div>
</div>


<jsp:include page="../../../tempu/footer.jsp"></jsp:include>
</body>
</html>