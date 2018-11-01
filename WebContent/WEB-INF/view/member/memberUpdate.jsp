<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../../../tempu/butt.jsp"></c:import>
</head>
<body>
<c:import url="../../../tempu/head.jsp"></c:import>


<div class="container-fluid">
		<div class="row">
			<form action="./memberUpdate.do" method="post" enctype="multipart/form-data">
				<div class="form-group">
					<label for="id">ID:</label> <input type="text" value="${member.id }" readonly="readonly"
						class="form-control" id="id" placeholder="Enter id"
						name="id">
				</div>		
				
				<div class="form-group">
					<label for="pw">PW:</label> <input type="password"
						class="form-control" id="pw" value="${member.pw }" placeholder="Enter pw"
						name="pw">
				</div>
				<div class="form-group">
					<label for="name">NAME:</label> <input type="text"
						class="form-control" id="name" value="${member.name }" placeholder="Enter name"
						name="name">
				</div>
				<div class="form-group">
					<label for="email">email:</label> <input type="email"
						class="form-control" id="email" value="${member.email }" placeholder="Enter email"
						name="email">
				</div>
				
				
				<div class="form-group">
					<label for="file">file:</label> <input type="file"
						class="form-control" id="file"  name="f1" >
				</div>
				
				<button type="submit" class="btn btn-default">Update</button>
			</form>

		</div>

</div>



<c:import url="../../../tempu/footer.jsp"></c:import>
</body>
</html>