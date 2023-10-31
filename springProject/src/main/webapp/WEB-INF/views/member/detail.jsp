<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Member Detail Page</title>
<style type="text/css">
	h3{
		text-align: center;
	}
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp" />
	<jsp:include page="../common/nav.jsp" />
	
	<h3>Member Detail Page</h3>
	<form action="/member/detail" method="post">
		<div class="container">
			<table class="table table-dark table-striped">
				<tr>
					<th>email</th>
					<td><input type="email" name="email" value="${mvo.email }" readonly="readonly"></td>
				</tr>
				<tr>
					<th>password</th>
					<td><input type="password" name="pwd" value=""></td>
				</tr>
				<tr>
					<th>nickname</th>
					<td><input type="text" name="nickName" value="${mvo.nickName }"></td>
				</tr>
			</table>
			<button type="submit" class="btn btn-outline-info">수정</button>
			<a href="/member/remove?email=${mvo.email }"><button type="button" class="btn btn-outline-danger">탈퇴</button></a>
		</div>
	</form>
	
	
	
	<jsp:include page="../common/footer.jsp" />
</body>
</html>