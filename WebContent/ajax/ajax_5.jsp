<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../tempu/butt.jsp"></c:import>
<script type="text/javascript">
	$(function() {
		$("#btn").click(function() {
			var id = $(this).val();
			var name = $(this).val();
			var email = $(this).val();
			$.ajax({
				url : "../a/memberInfo.do",
				type : "GET",
				data :{
					id:"iu",
					pw:"iu",
					kind:"S"
				},
				success:function(data){
					data=data.trim();
					data=JSON.parse(data);
					alert(data.id);
					alert(data.name);
					alert(data.email);
				}
			});
		});
		
		
		
		
		$("#id").blur(function() {
			var id= $(this).val();
			$.ajax({
				url:"../a/memberCheckId2.do", 
				type:"POST", 
				data : {
					id : id
				},
				success:function(data){
					data = data.trim();
					data = JSON.parse(data);
					alert(data.result);
					alert(data.m);
				},
				error:function(){
					$("#id").val('');
					alert("error 발생");
				}
				
			});
		});
	});
	
</script>
</head>
<body>
	<input type="text" id="id">
	<button id="btn">CLICK</button>
	<div id="result"></div>



</body>
</html>