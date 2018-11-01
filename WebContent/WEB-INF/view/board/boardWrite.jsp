
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
</head>
<body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="60">

<c:import url="../../../tempu/head.jsp"></c:import>

<div class="container-fluid">
		<div class="row">
			<form action="./${board }Write.do" method="post" enctype="multipart/form-data">
				<div class="form-group">
					<label for="title">Title:</label> <input type="text"
						class="form-control" id="title" placeholder="Enter Title"
						name="title">
				</div>
				<div class="form-group">
					<label for="writer">Writer:</label> <input type="text"
						class="form-control" id="writer"  placeholder="Enter writer"
						name="writer" >
				</div>
				<div class="form-group">
				<label for="contents">contents:</label>
      			<textarea class="form-control" rows="20" id="contents" name="contents"></textarea>
				</div>
				
				<div class="form-group">
					<label for="file">file:</label> <input type="file"
						class="form-control" id="file"  name="f1" >
				</div>
				
				<div class="form-group">
					<label for="file">file:</label> <input type="file"
						class="form-control" id="file"  name="f2" >
				</div>
				
				
				<button type="submit" class="btn btn-default">Writer</button>
			</form>

		</div>
	

</div>

<c:import url="../../../tempu/footer.jsp"></c:import>
</body>
</html>