<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Modify Page</title>
</head>
<body>
	<jsp:include page="../common/header.jsp" />
	<jsp:include page="../common/nav.jsp" />
	<c:set value="${BoardDTO.flist }" var="flist" />

	<form action="/board/modify" method="post" enctype="multipart/form-data">
		<table class="table table-dark table-striped">
			<tr>
				<th>#</th>
				<td><input type="text" name="bno" value="${bvo.bno }" readonly="readonly"></td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input type="text" name="title" value="${bvo.title }"></td>
			</tr>
			<tr>
				<th>작성자</th>
				<td><input type="text" name="writer" value="${bvo.writer }" readonly="readonly"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea rows="3" cols="30" name="content">${bvo.content }</textarea></td>
			</tr>
			<tr>
				<th>작성일</th>
				<td>${bvo.regAt }</td>
			</tr>
			<tr>
				<th>수정일</th>
				<td>${bvo.modAt }</td>
			</tr>
		</table>
		
		<div>
			<ul class="list-group list-group-flush">
				<c:forEach items="${flist }" var="fvo">
					<li class="list-group-item">
						<c:choose>
							<c:when test="${fvo.fileType > 0 }">
								<div>
									<img alt="그림없음." src="/upload/${fn:replace(fvo.saveDir,'\\','/')}/
									${fvo.uuid}_th_${fvo.fileName}">
								</div>
							</c:when>
						</c:choose>
						<div>
							<div class="fw-bold">${fvo.fileName }</div>
							<span class="badge rounded-pill text-bg-info">${fvo.regAt }</span>
						</div>
						<button type="button" class="btn btn-outline-danger fileDel" data-uuid=${fvo.uuid }>X</button>
					</li>
					
				</c:forEach>
			</ul>
		</div>
		<hr>
		
		<div class="mb-3">
			<input type="file" class="form-control" name="files" id="files" style="display: none;" multiple="multiple">
			<button type="button" id="trigger" class="btn btn-outline-primary">File Upload</button>
		</div>
		<div class="mb-3" id="fileZone">
			
		</div>
		
		<button type="submit" class="btn btn-outline-info" id="regBtn">수정완료</button>
	</form>
	
	
	<script type="text/javascript" src="/resources/js/boardRegister.js"></script>
	<script type="text/javascript" src="/resources/js/boardModify.js"></script>
	<jsp:include page="../common/footer.jsp" />
</body>
</html>