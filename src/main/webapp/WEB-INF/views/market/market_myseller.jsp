<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt" prefix="fmt"%>
<%@ include file="../include/manager_header.jsp"%>

<div class="container-fluid">

	<h2 class="mb-3 text-gray-800">장터 판매 상품</h2>
	
	<div class="card shadow mb-4">
		<div class="card-body">
			
			<div class="table-responsive">
				<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
					<thead style="text-align: center">
						<tr class="text-gray-800">
							<th>번 호</th>
							<th>상품명</th>
							<th>판매자</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="product" items="${list}">
							<tr>
								<td>${product.productNo}</td>
								<td><a href="${product.productNo}" class="move">${product.productName}</a></td>
								<td>${product.userNo.userName}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>

				<div class="text-center">
					<!-- start Pagination -->
					<ul class="pagination">
						<c:if test="${pageDTO.prev}">
							<li class="paginate_button previous"><a
								href="${pageDTO.startPage-1}">Previous</a></li>
						</c:if>
						<c:forEach var="index" begin="${pageDTO.startPage}"
							end="${pageDTO.endPage}">
							<li
								class="paginate_button ${pageDTO.criteria.pageNum == index ? 'active' : ''}"><a
								href="${index}">${index}</a></li>
						</c:forEach>
						<c:if test="${pageDTO.next}">
							<li class="paginate_button next"><a
								href="${pageDTO.endPage+1}">Next</a></li>
						</c:if>
					</ul>
				</div>
				<!-- end Pagination -->
			</div>
			<!-- end panel-body -->
		</div>
		<!-- end panel -->
	</div>
</div>
<!-- /.row -->

<!-- 페이지 링크 처리 form -->
<form action="/board/list" id="actionForm">
	<!--
		pageNum, amount, type, keyword 값을 부를 때
		1) pageDTO 사용 - pageDTO.criteria.pageNum
		2) criteria에서 가져다 사용 - criteria.pageNum
	-->
	<input type="hidden" name="pageNum" value="${criteria.pageNum }" /> <input
		type="hidden" name="amount" value="${criteria.amount }" /> <input
		type="hidden" name="type" value="${criteria.type }" /> <input
		type="hidden" name="keyword" value="${criteria.keyword }" />
</form>

<%@ include file="../include/manager_footer.jsp"%>