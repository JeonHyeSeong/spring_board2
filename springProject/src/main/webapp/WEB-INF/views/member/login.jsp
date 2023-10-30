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
			<c:if test="${not empty param.errorMsg }">
				<div class="text-danger mb-3">
					<c:choose>
						<c:when test="${param.errorMsg eq 'Bad credentials' }">
							<c:set var="errText" value="이메일 & 비밀번호가 일치하지 않습니다." />
						</c:when>
						<c:otherwise>
							<c:set var="errText" value="관리자에게 문의해주세요." />
						</c:otherwise>
					</c:choose>
					${errText }
				</div>
			</c:if>
			
			<button type="submit" class="btn btn-outline-primary">Login</button>
		</form>
	</div>


	<jsp:include page="../common/footer.jsp" />
</body>
</html>