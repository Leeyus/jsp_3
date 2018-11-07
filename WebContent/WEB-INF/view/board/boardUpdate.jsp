
<%@page import="com.iu.notice.NoticeDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.iu.notice.NoticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <!-- Theme Made By www.w3schools.com - No Copyright -->
  <title>Bootstrap Theme Company Page</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  
  <c:import url="../../../tempu/butt.jsp"></c:import>
  <script type="text/javascript">
  	$(function() {
		$(".del").click(function() {
			 var fnum=$(this).attr("id");
			 var fname = $(this).attr("title")
			$.post("../file/fileDelete.do",{fnum:fnum, fname:fname}, function(data) {
				if(data=='1'){
					alert("Success");
					$("#p"+fnum).remove();
				}else{
					alert("Fail");
				}
			}); 
			
		});
	});
  </script>
 
</head>
<body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="60">

<c:import url="../../../tempu/head.jsp"></c:import>


<div class="container-fluid">
	<div class="row">
		<h1>${board } Update</h1>
	</div>

		<div class="row">
			<form action="./${board}Update.do" method="post" enctype="multipart/form-data">
			<input type="hidden" name="num" value="${dto.num }">
				<div class="form-group">
					<label for="title">Title:</label> <input type="text"
						class="form-control" value="${dto.title }" id="title" placeholder="Enter Title"
						name="title">
				</div>
				<div class="form-group">
					<label for="writer">Writer:</label> <input type="text"
						class="form-control" id="writer" disabled="disabled" value="${dto.writer }" placeholder="Enter writer"
						name="writer" >
				</div>
				<div class="form-group">
				<label for="contents">contents:</label>
      			<textarea class="form-control" rows="20" id="contents" name="contents">${dto.contents } </textarea>
				</div>
				
				<c:forEach items="${files}" var = "file" varStatus="i">
				<div class="form-group" id="p${file.fnum }">
					<span>${file.oname }</span>
					<span class="del" id="${file.fnum }" title="${file.fname }">X</span>
				</div>
				</c:forEach>
				
				
				
				<button type="submit" class="btn btn-default">Writer</button>
			</form>

		</div>
	

</div>
<c:import url="../../../tempu/footer.jsp"></c:import>

</body>
</html>
