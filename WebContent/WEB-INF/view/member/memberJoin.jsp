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
	$(function() {
		$("#id").change(function() {
			$("#idCheck").val('f');
		});
		
		$("#join").click(function() {
			var check =$("#idCheck").val();
			if(check == 's'){
				alert("OK");
			}else{
				alert("중복확인 체크");
			}
		});
		
		
		$("#btn").click(function() {
			//var id = $("#id").val();
			var id=document.frm.id.value;
			window.open("./memberCheckId.do?id="+id,"","width=600, height=500, top=300, left=500");
		});
		
	});

</script>
</head>
<body>
<c:import url="../../../tempu/head.jsp"></c:import>


<div class="container-fluid">
		<div class="row">
			<form name="frm" action="./memberJoin.do" method="post" enctype="multipart/form-data">
				<input type ="hidden" value="f" name="idCheck" id="idCheck">
			
			
				<div class="form-group">
					<label for="id">ID:</label> <input type="text"
						class="form-control"  id="id" placeholder="Enter id"
						name="id">
						<input type="button" id ="btn" class="btn btn-danger" value="중복확인">
				</div>
				<div class="form-group">
					<label for="pw">PW:</label> <input type="password"
						class="form-control" id="pw" placeholder="Enter pw">
				</div>
				<div class="form-group">
					<label for="pw">PW:</label> <input type="password"
						class="form-control" id="pw2" placeholder="Enter pw"
						name="pw">
				</div>
				<div class="form-group">
					<label for="name">NAME:</label> <input type="text"
						class="form-control" id="name" placeholder="Enter name"
						name="name">
				</div>
				<div class="form-group">
					<label for="email">email:</label> <input type="email"
						class="form-control" id="email" placeholder="Enter email"
						name="email">
				</div>
				<div class="form-group">
					<label class="radio-inline"> <input type="radio"
						name="kind" value="S" checked="checked">Student
					</label> <label class="radio-inline"> <input type="radio"
						name="kind" value="T">Teacher
					</label>
				</div>
				
				<div class="form-group">
					<label for="classmate">ClassMate:</label> <input type="text"
						class="form-control" id="classmate" placeholder="Enter classmate"
						name="classmate">
				</div>
				<div class="form-group">
					<label for="file">file:</label> <input type="file"
						class="form-control" id="file"  name="f1" >
				</div>
				
				<input type="button" id="join" class="btn btn-default" value="JOIN">
			</form>

		</div>

</div>



<c:import url="../../../tempu/footer.jsp"></c:import>
</body>
</html>