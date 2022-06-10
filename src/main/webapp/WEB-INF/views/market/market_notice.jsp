<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../include/manager_header.jsp"%>

<div class="container-fluid">

	<h2 class="mb-3 text-gray-800">장터 공지/이벤트</h2>
	
	<div class="card shadow mb-4">
		<div class="card-body">
		
			<!-- 공지 작성 버튼 -->
			<a href="/market/market_noticeForm" class="btn btn-primary btn-icon-split btn-sm mb-3">
				<span class="text">공지 작성하기</span>
			</a>
			
			<!-- 공지 / 이벤트 게시판 -->
			<div class="table-responsive">
				<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
					<thead style="text-align: center">
						<tr class="text-gray-800">
							<th>번 호</th>
							<th>제 목</th>
							<th>내 용</th>
							<th>작성일</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="notice" items="${notice}" varStatus="status">
							<tr>
								<td>${status.count}</td>
								<td>${notice.noticeTitle}</td>
								<td style="overflow: hidden;">${notice.noticeContent}</td>
								<td><fmt:formatDate value="${notice.noticeDate}" pattern="yyyy-MM-dd HH:mm" /></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				
			</div>
		</div>
	</div>
</div>

<script>
	/* dataTables jQuery 불러오기 */
	$(document).ready(function() {
		$('#dataTable').DataTable();
	});
</script>

<script src="/resources/js/jquery.dataTables.min.js"></script>

<%@ include file="../include/manager_footer.jsp"%>