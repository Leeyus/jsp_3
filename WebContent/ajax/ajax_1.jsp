<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../tempu/butt.jsp"></c:import>

<script type="text/javascript">
	$(function() {
		$("#btn3").click(function() {
			var title = $("#title").val();
			var writer= $("#writer").val();
			var contents  = $("#contents").val();
			var xhp = new XMLHttpRequest();
			
			xhp.open("POST","../notice/noticeDelete.do");
			xhp.send("title="+title+"&writer"+writer+"&contents"+contents);
			xhp.onreadystatechange = function() {
				if(this.readyState ==4 && this.status==200){
					$("#result").html(this.responseText);
				}
			}
		});
		
		$("#btn2").click(function () {
			var num2 = $("#num").val();
			
			var xhp = new XMLHttpRequest();
			
			xhp.open("GET","../notice/noticeDelete.do?num="+num2);
			xhp.send();
			xhp.onreadystatechange = function() {
				if(this.readyState ==4 && this.status==200){
					$("#result").html(this.responseText);
				}
			}
		});
		
		$("#btn").click(function() {
			var num = $("#num").val();
			
			var xhp = new XMLHttpRequest();//ajax사용 주요한 객체 
			
			xhp.open("GET","../notice/noticeSelectOne.do?num="+num);
			xhp.send();
			xhp.onreadystatechange = function() {
				if(this.readyState ==4 && this.status==200){
					$("#result").html(this.responseText);
				}
			}
			
		});
	});
</script>
</head>
<body>

	<h1>AJAX TEST</h1>
	
	<div>
		<input type="text" id="writer">
		<input type="text" id="title">
		<textarea name="contents" rows="", cols=""></textarea>
		<input type="button" id="btn3" value="writer">
	</div>
	
	
	<input type="number" id = "num">
	<input type="button" id="btn" value="CLICK">
	<input type="button" id="btn2" value="DELETE">
	<div id="result">
		
	</div>

</body>
</html>