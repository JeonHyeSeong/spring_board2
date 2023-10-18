<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board List Page</title>
</head>
<body>
	<jsp:include page="../common/header.jsp" />
	<jsp:include page="../common/nav.jsp" />
	
	<table class="table table-dark table-striped">
		<thead>
			<tr>
				<th>#</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>수정일</th>
				<th>조회수</th>
				<th>댓글개수</th>
				<th>파일개수</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list }" var="bvo">
				<tr>
					<td>${bvo.bno }</td>
					<td><a href="/board/cntdetail?bno=${bvo.bno }">${bvo.title }</a></td>
					<td>${bvo.writer }</td>
					<td>${bvo.regAt }</td>
					<td>${bvo.modAt }</td>
					<td>${bvo.readCount }</td>
					<td>${bvo.cmtQty }</td>
					<td>${bvo.hasFile }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

	<jsp:include page="../common/footer.jsp" />
</body>
</html>