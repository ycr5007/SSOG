<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../include/admin_header.jsp" %>
<link rel="stylesheet" href="/resources/css/admin.css" />
	<div class="container-fluid">
		<div class="row">
			<div class="col-lg-12">
				<div class="card shadow mb-4">
					<form action="" id="operForm">
						<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
							<h6 class="m-0 font-weight-bold text-primary">장터신청목록</h6>
							<div class="col-auto my-1">
								<label class="mr-sm-2 sr-only" for="inlineFormCustomSelect">Preference</label>
							</div>
						</div>
						<div class="card-body">
							<table class="table">
								<tr class="column-header">
									<th class="col-lg-1">번호</th>
									<th class="col-lg-3">장터명</th>
									<th class="col-lg-2">운영자</th>
									<th class="col-lg-2">지역</th>
									<th class="col-lg-1">시작일</th>
									<th class="col-lg-1">종료일</th>
									<th class="col-lg-1">승인</th>
									<th class="col-lg-1">거부</th>
								</tr>
							<c:forEach items="${list }" var="market" varStatus="status">
								<tr class="row-data">
									<td>${status.count }</td>
									<td style="text-align: left; text-indent: 10px;">${market.marketName }</td>
									<td>${market.dummy }</td>
									<td>${market.marketLoc }</td>
									<td><fmt:formatDate value="${market.marketSD }" pattern="MM-dd"/></td>
									<td><fmt:formatDate value="${market.marketED }" pattern="MM-dd"/></td>
									<td><button type="button" class="btn btn-outline-primary btn-sm approval" value="${market.marketNo }">승인</button></td>
									<td><button type="button" class="btn btn-outline-danger btn-sm refusal" value="${market.marketNo }">거부</button></td>
								</tr>
							</c:forEach>
							</table>
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
						<input type="hidden" name="pageNum" value="1" />
						<input type="hidden" name="amount" value="25" />
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- End of Main Content -->
<%@ include file="../include/manager_footer.jsp" %>