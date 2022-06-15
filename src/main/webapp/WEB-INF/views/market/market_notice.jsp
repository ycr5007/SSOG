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
			<a href="/market/market_noticeForm?marketNo=${marketNo}&pageNum=${pageNum}&amount=${amount}" class="btn btn-outline-primary btn-icon-split btn-sm">
				<span class="text">공지 작성하기</span>
			</a>
			
			<!-- 공지 / 이벤트 게시판 -->
			<div class="table-responsive">
				<table class="table table-bordered mt-3" id="dataTable" width="100%" cellspacing="0" style="text-align: center">
					<thead>
						<tr class="text-gray-800">
							<th class="col-lg-1">번 호</th>
							<th class="col-lg-3">제 목</th>
							<th class="col-lg-5">내 용</th>
							<th class="col-lg-2">작성일</th>
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
				
				<!-- 페이징 -->
				<div class="row justify-content-center align-items-center container-fluid">
					<nav aria-label="Page navigation example">
						<ul class="pagination">
							<c:if test="${pageDTO.prev}"> <!-- prev가 true면 이전 버튼 활성화 -->
								<li class="paginate_button previous">
									<a class="page-link" href="${pageDTO.startPage-1}" aria-label="Previous">
										<span aria-hidden="true">&laquo;</span>
										<span class="sr-only">Previous</span>
									</a>
								</li>
							</c:if>
	
							<c:forEach var="idx" begin="${pageDTO.startPage}" end="${pageDTO.endPage}">
								<!-- 선택한 페이지 번호 색 채우기 -->
								<li class="page-item ${pageDTO.criteria.pageNum==idx?'active':''}">
									<a class="page-link" href="${idx}">${idx}</a>
								</li>
							</c:forEach>
	
							<c:if test="${pageDTO.next}"> <!-- next가 true면 다음 버튼 활성화 -->
								<li class="paginate_button next">
									<a class="page-link" href="${pageDTO.endPage+1}" aria-label="Next">
										<span aria-hidden="true">&raquo;</span>
										<span class="sr-only">Next</span>
									</a>
								</li>
							</c:if>
						</ul>
					</nav>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- URL + 페이징 처리 -->
<form action="/market/market_notice" id="actionForm">
	<input type="hidden" name="marketNo" value="${marketNo}" />
	<input type="hidden" name="pageNum" value="${criteria.pageNum }" />
	<input type="hidden" name="amount" value="${criteria.amount }" />
</form>

<%@ include file="../include/manager_footer.jsp"%>