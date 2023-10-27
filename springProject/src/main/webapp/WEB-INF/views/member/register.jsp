<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Member Register Page</title>
</head>
<body>
	<jsp:include page="../common/header.jsp" />
	<jsp:include page="../common/nav.jsp" />
	<!-- email, pwd, nick_name -->
	<div class="container">
		<form action="/member/register" method="post">
			<h4>Input your Information</h4>
			<div class="mb-3">
			  <label for="e" class="form-label fw-bold">email</label>
			  <input type="email" class="form-control" name="email" id="e" placeholder="example@OOO.com">
			</div>
			<div class="mb-3">
			  <label for="p" class="form-label fw-bold">password</label>
			  <input type="password" class="form-control" name="pwd" id="p" placeholder="password">
			</div>
			<div class="mb-3">
			  <label for="n" class="form-label fw-bold">nick_name</label>
			  <input type="text" class="form-control" name="nickName" id="n">
			</div>
			<button type="submit" class="btn btn-outline-primary">Register</button>
		</form>
	</div>
	
	
	<jsp:include page="../common/footer.jsp" />
</body>
</html>