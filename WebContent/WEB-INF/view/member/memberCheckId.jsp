<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../../../tempu/butt.jsp"></c:import>
<script type="text/javascript">
	$(function() {//중복확인후 다시 join.jsp에다 값을넣줌
		$("#btn").click(function() {
			//opener.document.getElementById("id").value='${param.id}';
			opener.document.frm.id.value='${param.id}';
			opener.document.frm.idCheck.value='s';
			self.close();
		});
	});
</script>
</head>
<body>
	<h1>Member Check ID</h1>
	<div><!-- 중복확인 -->
		<c:if test="${result eq '1'}">
		<h3>${param.id} 사용 가능한 ID 입니다.</h3>
		<button id="btn">사용하기</button>
		</c:if>
		<c:if test="${result eq '2'}">
		<h3>${param.id} 사용 불가능한 ID 입니다.</h3>
		</c:if>
	</div>
	
	<div>
		<form action="./memberCheckId.do">
			<input type="text" name="id">
			<button>중복확인</button>	
		</form>
	</div>
	
	
	
</body>
</html>