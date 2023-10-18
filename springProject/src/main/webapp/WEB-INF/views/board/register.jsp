<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register Page</title>
</head>
<body>
	<jsp:include page="../common/header.jsp" />
	<jsp:include page="../common/nav.jsp" />

	<form action="/board/register" method="post">
		<div class="mb-3">
		  <label for="exampleFormControlInput1" class="form-label">title</label>
		  <input type="text" class="form-control input" name="title" id="exampleFormControlInput1">
		</div>
		<div class="mb-3">
		  <label for="exampleFormControlInput1" class="form-label">writer</label>
		  <input type="text" class="form-control input" name="writer" id="exampleFormControlInput1">
		</div>
		<div class="mb-3">
		  <label for="exampleFormControlTextarea1" class="form-label">content</label>
		  <textarea class="form-control input" name="content" id="exampleFormControlTextarea1" rows="3"></textarea>
		</div>
		<button type="submit" class="btn btn-primary">등록</button>
	</form>
	
	<jsp:include page="../common/footer.jsp" />
</body>
</html>