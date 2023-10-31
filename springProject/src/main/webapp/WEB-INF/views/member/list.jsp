<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Member List</title>
</head>
<body>
	<jsp:include page="../common/header.jsp" />
	<jsp:include page="../common/nav.jsp" />


	<sec:authentication property="principal.mvo.authList" var="auths"/>
	<div class="container">
		<table class="table table-dark table-striped">
			<thead>
				<tr>
					<th>email</th>
					<th>password</th>
					<th>nickName</th>
					<th>lastLogin</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list }" var="mvo">
					<tr>
						<td>${mvo.email }</td>
						<td>${mvo.pwd }</td>
						<td>${mvo.nickName }</td>
						<td>${mvo.lastLogin }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	
	
	<jsp:include page="../common/footer.jsp" />
</body>
</html>