
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
  <script src="https://cdn.ckeditor.com/4.10.1/standard/ckeditor.js"></script>
  <script type="text/javascript">
  	$(function () {
  		
  		CKEDITOR.replace("contents");//엔터키를 적용시킴
  		
  		
		$("#btn").click(function() { //title이 공백이면 메세지가나옴
			var title = $("#title").val();
			if(title != ''){
				$("#frm").submit();
			}else{
				alert("Title을 입력");
			}
		});
		
		var count = 1;
		var index = 0;
		$("#add").click(function() {//파일을 추가하는 기능 
			if(count<6){
			var r = '<div class="form-group" id="f'+index+'">';
			r = r + '<label for="file">file:</label>';
			r = r + '<input type="file"class="form-control" id="file"  name="f'+index+'" >';
			r= r + '<span class="remove" title="'+index+'">X</span>';
			r = r + '</div>';
			$("#file").append(r);
			count++;
			index++;
			}else{
				alert("파일은 5개 까지 가능");
			}
		});
		$("#file").on("click", ".remove", function() {//파일 삭제기능
			var t = $(this).attr("title");
			$("#f"+t).remove();
			count--;
		});
	});
  </script>
</head>
<body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="60">

<c:import url="../../../tempu/head.jsp"></c:import>

<div class="container-fluid">
		<div class="row">
			<form action="./${board }Write.do" id="frm" method="post" enctype="multipart/form-data">
				<div class="form-group">
					<label for="title">Title:</label> <input type="text"
						class="form-control" id="title" placeholder="Enter Title"
						name="title">
				</div>
				<div class="form-group">
					<label for="writer">Writer:</label> <input type="text"
						class="form-control" id="writer" value="${member.id }" readonly="readonly" placeholder="Enter writer"
						name="writer" >
				</div>
				<div class="form-group">
				<label for="contents">contents:</label>
      			<textarea class="form-control" rows="20" id="contents" name="contents"></textarea>
				</div>
				
				<!-- <div class="form-group">
					<label for="file">file:</label>
					 <input type="file"class="form-control" id="file"  name="f1" >
				</div> -->
				
				<input type= "button" id="add" value="File Add">
				<div class="files" id="file">
				
				</div>
				
				<input type="button" id="btn" value="Write" class="btn btn-default">
			</form>

		</div>
	

</div>

<c:import url="../../../tempu/footer.jsp"></c:import>
</body>
</html>
