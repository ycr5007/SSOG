<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<link rel="stylesheet" href="/resources/css/admin.css" />

<section class="bg-dark">
	<div id="bodystyle" style="overflow:auto; width:auto; height:550px; color: white; padding: 50px 50px 50px 50px">    
<div class="contetnt">
	<div class="container mt-4 mb-4 h-75">
		<table class="table table-striped" style="color: white;">
			<thead>
				<tr class="text-center">
					<th class="col-lg-2">장터</th>
					<th class="col-lg-2">장소</th>
					<th class="col-lg-6">제목</th>
					<th class="col-lg-2">작성일</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list }" var="notice">
					<tr class="notice-row" data-notice="${notice.noticeNo }" style="color: white;">
						<td>${notice.dummy1 }</td>
						<td>${notice.dummy2 }</td>
						<td>${notice.noticeTitle }</td>
						<td><fmt:formatDate value="${notice.noticeDate }" pattern="yyyy-MM-dd"/></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<div class="container mb-4 h-25">
		<!-- 페이징 처리 -->
		<nav aria-label="Page navigation example">
			<ul class="pagination justify-content-center">
				<c:if test="${pageDto.prev }">
					<li class="page-item previous"><a class="page-link" href="${pageDto.startPage - 1 }">Previous</a></li>
				</c:if>
				<c:forEach begin="${pageDto.startPage }" end="${pageDto.endPage }" var="idx">
					<li class="page-item ${pageDto.cri.pageNum == idx ? 'active' : '' }"><a class="page-link" href="${idx }">${idx }</a></li>
				</c:forEach>
				<c:if test="${pageDto.next }">
					<li class="page-item next"><a class="page-link" href="${pageDto.endPage + 1 }">Next</a></li>
				</c:if>
			</ul>
		</nav>
		<!-- 페이징 처리 -->
	</div>
</div>
<form action="" id="operForm">
	<input type="hidden" name="pageNum" value="1"/>
	<input type="hidden" name="amount" value="10"/>
</form>

	</div>
</section> 

<script src="/resources/js/notice/noticeList.js"></script>
<%@ include file="../include/footer.jsp" %>