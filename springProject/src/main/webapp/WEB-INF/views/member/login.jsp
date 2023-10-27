<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page</title>
<style type="text/css">
	.container{
		display: flex;
		justify-content: center;
	}
	.h3{
		text-align: center;
	}
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp" />
	<jsp:include page="../common/nav.jsp" />
	
	<h3 class="h3">Custom Login Page</h3>
	<div class="container">
		<form action="/member/login" method="post">
			<div class="mb-3">
				<label for="e" class="form-label fw-bold">email</label>
				<input type="email" class="form-control input" name="email" id="e" placeholder="example@OOO.com">
			</div>
			<div class="mb-3">
				<label for="p" class="form-label fw-bold">password</label>
				<input type="password" class="form-control input" name="pwd" id="p" placeholder="password">
			</div>
			<button type="submit" class="btn btn-outline-primary">Login</button>
		</form>
	</div>



	<jsp:include page="../common/footer.jsp" />
</body>
</html>