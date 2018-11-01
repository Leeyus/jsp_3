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
	<div class= "row">
  <h2>${message }</h2>
  </div>
  <div class="row">
  <form action="./memberLogin.do" method="post">
    <div class="form-group">
      <label class="control-label col-sm-2" for="id">ID:</label>
      <div class="col-sm-10">
        <input type="text" class="form-control" id="id" placeholder="Enter id" name="id">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="pw">Password:</label>
      <div class="col-sm-10">          
        <input type="password" class="form-control" id="pw" placeholder="Enter pw" name="pw">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="kind">Kind:</label>
      <div class="col-sm-10">          
        <input type="text" class="form-control" id="kind" placeholder="Enter kind" name="kind">
      </div>
    </div>
    <div class="form-group">        
      <div class="col-sm-offset-2 col-sm-10">
        <div class="checkbox">
          <label><input type="checkbox" name="remember"> Remember me</label>
        </div>
      </div>
    </div>
    <div class="form-group">        
      <div class="col-sm-offset-2 col-sm-10">
        <button type="submit" class="btn btn-default">Login</button>
        <button type="submit" class="btn btn-default">Join</button>
      </div>
    </div>
  </form>
  </div>
</div>

<c:import url="../../../tempu/footer.jsp"></c:import>
</body>
</html>