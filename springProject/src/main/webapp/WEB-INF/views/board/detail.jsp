<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Detail Page</title>
<style type="text/css">
	.cmtContainer{
		width: 500px;
		margin-top: 20px;
	}
	.taContainer{
		width: 800px;
		margin-top: 20px;
	}
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp" />
	<jsp:include page="../common/nav.jsp" />
	
	<h3>Detail Page</h3>
	
	<div class="taContainer">
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
	</div>
	
	<!-- 파일 표시 -->
	<c:set value="${BoardDTO.flist }" var="flist"></c:set>
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
				</li>
			</c:forEach>
		</ul>
	</div>
	
	
	<a href="/board/modify?bno=${bvo.bno }"><button type="button" class="btn btn-outline-info">수정</button></a>
	<a href="/board/remove?bno=${bvo.bno }"><button type="button" class="btn btn-outline-danger">삭제</button></a>
	
	<!-- 댓글 라인 -->
	<div class="cmtContainer">
		<!-- 댓글 등록 라인 -->
		<sec:authorize access="isAuthenticated()">
		<sec:authentication property="principal.mvo.email" var="authEmail"/>
		<div class="input-group mb-3">
			<span class="input-group-text" id="cmtWriter">${authEmail }</span>
			<input type="text" class="form-control" id="cmtText" placeholder="Test Comment...">
			<button type="button" class="btn btn-success" id="cmtPostBtn">등록</button>
		</div>
		</sec:authorize>
	</div>
	
	<!-- 댓글 표시 라인 -->
	<ul class="list-group list-group-flush" id="cmtListArea">
		<li class="list-group-item">
			<div class="mb-3">
				<div class="fw-bold">Writer</div>
				Content
			</div>
			<span class="badge rounded-pill text-bg-info">modAt</span>
		</li>
	</ul>
	
	<!-- 댓글 페이징 라인 -->
	<div>
		<div>
			<button type="button" id="moreBtn" data-page="1" 
			class="btn btn-outline-secondary" style="visibility: hidden;">MORE+</button>
		</div>
	</div>
	
	<!-- 모달창 라인 -->
	<div class="modal" id="myModal" tabindex="-1">
	  <div class="modal-dialog">
	    <div class="modal-content">
	    
	      <div class="modal-header">
	        <h5 class="modal-title">Writer</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      
	      <div class="modal-body">
	        <div class="input-group mb-3">
	        	<input type="text" class="form-control" id="cmtTextMod" placeholder="Mod Comment...">
				<button type="button" class="btn btn-success" id="cmtModBtn">Post</button>
	        </div>
	      </div>
	      
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
	      </div>
	      
	    </div>
	  </div>
	</div>
	
	
	<script type="text/javascript">
		let bnoVal = `<c:out value="${bvo.bno}" />`;
		console.log(bnoVal);
	</script>
	<script type="text/javascript" src="/resources/js/boardComment.js"></script>
	
	<script type="text/javascript">
	CommentList(bnoVal);
	</script>
	
	
	<jsp:include page="../common/footer.jsp" />
</body>
</html>