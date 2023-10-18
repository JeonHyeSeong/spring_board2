<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Detail Page</title>
</head>
<body>
	<jsp:include page="../common/header.jsp" />
	<jsp:include page="../common/nav.jsp" />
	
	<table class="table table-dark table-striped">
		<tr>
			<th>#</th>
			<td>${bvo.bno }</td>
		</tr>
		<tr>
			<th>제목</th>
			<td>${bvo.title }</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>${bvo.writer }</td>
		</tr>
		<tr>
			<th>내용</th>
			<td>${bvo.content }</td>
		</tr>
		<tr>
			<th>작성일</th>
			<td>${bvo.regAt }</td>
		</tr>
		<tr>
			<th>수정일</th>
			<td>${bvo.modAt }</td>
		</tr>
		<tr>
			<th>조회수</th>
			<td>${bvo.readCount }</td>
		</tr>
	</table>
	
	<a href="/board/modify?bno=${bvo.bno }"><button type="button" class="btn btn-info">수정</button></a>
	<a href="/board/remove?bno=${bvo.bno }"><button type="button" class="btn btn-danger">삭제</button></a>
	
	<jsp:include page="../common/footer.jsp" />
</body>
</html>