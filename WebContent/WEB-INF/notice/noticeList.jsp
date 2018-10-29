<%@page import="com.iu.page.Pager"%>
<%@page import="com.iu.board.BoardDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.iu.page.MakePager"%>
<%@page import="com.iu.page.RowNumber"%>
<%@page import="com.iu.notice.NoticeDAO"%>
<%@page import="com.iu.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	List<BoardDTO> ar= (List<BoardDTO>)request.getAttribute("list");
    	Pager pager = (Pager)request.getAttribute("pager");
    
    %>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%@include file="../../tempu/butt.jsp" %>
</head>
<body>
<jsp:include page="../../tempu/head.jsp"></jsp:include>
<div class="container-fluid">
	<div class="row">
		
	</div>
	<div class="row">
		<div>
			<form class="form-inline" action="./noticeList.do">
				<div class="form-group">
				<select class="form-control" id="sel1" name="kind">
			        <option>Title</option>
				       <option>Contents</option>
				       <option>Writer</option>
			      </select>
					
					<input type="text"class="form-control" id="search" placeholder="Enter search" name="search">
				</div>
					
				<button type="submit" class="btn btn-default">Submit</button>
			</form>

		</div>
	
		<table class="table table-striped">
			<tr>
				<td>Num</td>
				<td>Title</td>
				<td>Writer</td>
				<td>Date</td>
				<td>Hit</td>
			</tr>
			<% for(BoardDTO boardDTO : ar){%> 
			<tr>
				<td><%=boardDTO.getNum() %></td>
				<td><a href="./noticeSelectOne.do?num=<%=boardDTO.getNum()%>"><%=boardDTO.getTitle() %></a></td>
				<td><%=boardDTO.getWriter() %></td>
				<td><%=boardDTO.getReg_date() %></td>
				<td><%=boardDTO.getHit() %></td>
			</tr>
			<%} %>
		</table>
		
		<div class="container-fluid">
		<div class="row">
			 
			<ul class="pagination">
			<li><a href="./noticeList.do?curPage=<%= 1%>"><span class="glyphicon glyphicon-backward"></span></a></li>
			<% if(pager.getCurBlock()>1){ %>
    			<li><a href="./noticeList.do?curPage=<%= pager.getStartNum()-1%>"><span class="glyphicon glyphicon-chevron-left"></span></a></li>
    		<%} %>	
				<%for(int i=pager.getStartNum();i<=pager.getLastNum();i++){ %>
					<li><a href="./noticeList.do?curPage=<%=i%>"><%=i%></a></li>
				<%} %>
			<%if(pager.getCurBlock()!=pager.getTotalBlock()){ %>	
				<li><a href="./noticeList.do?curPage=<%=pager.getLastNum()+1%>"><span class="glyphicon glyphicon-chevron-right"></span></a></li>
			<%} %>	
			<li><a href="./noticeList.do?curPage=<%=pager.getTotalPage()%>"><span class="glyphicon glyphicon-forward"></span></a></li>
			</ul>
    		
    			
		</div >
		</div>
	</div>
	
		<div class="container-fluid">
			<div class="row">
			<div class="col-md-1">
			<a href="noticeWriteForm.jsp" class="btn btn-warning">작성</a>
			</div>
			</div>
		</div>
		
</div>

<jsp:include page="../../tempu/footer.jsp"></jsp:include>


</body>
</html>