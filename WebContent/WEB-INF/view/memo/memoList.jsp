<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../../../tempu/butt.jsp"></c:import>
<script type="text/javascript">
	$(function() {
		var curPage = 1;
		$("#del").click(function() {
			var p = "?";
			$(".del").each(function() {
				if($(this).prop("checked")){
					p=p+"num="+$(this).val()+"&";
					
					/* $.get("./memoDelete.do?num="+$(this).val()); */
				}
					
			});
			
			$.get("./memoDelete.do"+p);
				 $.get("./memoMore.do?", function(data) {
					$("#result").html(data.trim())
			}); 
		});
		
		$("#more").click(function() {
			curPage++
			$.get("./memoMore.do?curPage="+curPage, function(data) {
				$("#result").append(data.trim());
				
			});
		});
		
		
		$("#write").click(function() {
			var writer = $("#writer").val();
			var contents = $("#contents").val();
			$.post("./memoWrite.do",{writer:writer,contents:contents}, function(data) {
				/* alert(data); 이것도 가능
				location.reload(); */
				$.get("./memoMore.do", function(data) {
					$("#result").html(data.trim());
				});
			});
		});
	});
</script>
</head>
<body>
<c:import url="../../../tempu/head.jsp"></c:import>
	<div class="container-fluid">
	<div class="row">
		<div class="form-group">
			<label for="writer">Writer:</label>
			<input type="text" class="form-control" id="writer"  placeholder="Enter writer" name="writer" >
		</div>
		<div class="form-group">
			<label for="contents">contents:</label>
      		<textarea class="form-control" rows="20" id="contents" name="contents"></textarea>
		</div>
			<input type= "button" id="write" value="Write">
	</div>
				
	<div class="row">
		<table class="table table-hover">
			<tr>
				<td></td>
				<td>Num</td>
				<td>Contents</td>
				<td>Writer</td>
				<td>Date</td>
			</tr>
			<tbody id="result">
			<c:forEach items="${list}" var="m">
			<tr>
				<td><input type = "checkbox" name="del" class="del" value="${m.num}" id="${m.num} "></td>
				<td>${m.num}</td>
				<td>${m.contents}</td>
				<td>${m.writer }</td>
				<td>${m.reg_date }</td>
			</tr>
			</c:forEach>
			</tbody>
			
		</table>
		<button id="more">더보기</button>
		
	</div>
		
		<div class="row">
			<!-- <input type= "button" id= "btn"> -->
			<button id="del">DEL</button>
		</div>
	
	</div>

<c:import url="../../../tempu/footer.jsp"></c:import>
</body>
</html>