<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@ include file="../include/product_header.jsp"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!-- 페이지 제목 -->
<div class="container">
	<div class="row">
		<div class="col-lg-12 pl-2">
			<h1 class="page-header">상품 목록</h1>
		</div>
		<!-- /.col-lg-12 -->
	</div>
	<!-- /.row -->


	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">Product List Page</div>
				<!-- /.panel-heading 종료-->

				<div class="panel-body">
					<table class="table table-striped table-bordered table-hover">
						<thead>
							<tr>
								<th>판매장터</th>
								<th>상품명</th>
								<th>가 격</th>
								<th>등록일</th>
								<th>상품 상태</th>
							</tr>
						</thead>
						<!-- thead 종료 -->

						<tbody>
							<!-- 게시판 리스트 반복문 -->
							<c:forEach var="dto" items="${list}" varStatus="status">
								<tr>
									<td>${dto.userName}</td>
									<td><a href="${dto.productNo}" class="move">${dto.productName}</a></td>
									<td>${dto.productPrice}</td>
									<td>${dto.productDate}</td>
									<td>${dto.productStatus}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>

					<div class="row">
						<div class="col-md-2 col-md-offset-2">
							<!--페이지 목록 갯수 지정하는 폼-->
							<select name="perPage" id="amount" class="form-control">
								<option value="10"
									<c:out value="${cri.amount == 10? 'selected':''}"/>>10</option>
								<option value="20"
									<c:out value="${cri.amount == 20? 'selected':''}"/>>20</option>
								<option value="30"
									<c:out value="${cri.amount == 30? 'selected':''}"/>>30</option>
								<option value="40"
									<c:out value="${cri.amount == 40? 'selected':''}"/>>40</option>
							</select>
						</div>
					</div>
					<!-- 페이지 목록 지정 종료 -->


					<!-- pagination start -->
					<nav aria-label="Page navigation example">
						<ul	class="pagination row justify-content-center align-items-center">
							<!-- row justify-content-center align-items-center : 가운데 정렬 -->
							<c:if test="${pageDto.prev}">
								<!-- prev가 true여야 이전버튼 활성화 -->
								<li class="paginate_button previous">
									<a class="page-link" href="${pageDto.startPage-1}" aria-label="Previous">
										<span aria-hidden="true">&laquo;</span>
										<span class="sr-only">Previous</span>
									</a>
								</li>
							</c:if>

							<c:forEach var="idx" begin="${pageDto.startPage}" end="${pageDto.endPage}">
								<!-- 활성화 중인 페이지 번호에 색으로 표시 -->
								<li class="page-item ${pageDto.cri.pageNum==idx?'active':''}">
									<a class="page-link" href="${idx}">${idx}</a>
								</li>
							</c:forEach>

							<c:if test="${pageDto.next}">
								<li class="paginate_button next">
									<a class="page-link" href="${pageDto.endPage+1}" aria-label="Next">
										<span aria-hidden="true">&raquo;</span>
										<span class="sr-only">Next</span>
									</a>
								</li>
							</c:if>
						</ul>
					</nav>
					<!-- pagination close -->
				</div>
				<!-- /.panel-body  종료-->
			</div>
			<!-- panel panel-default 종료 -->
		</div>
		<!-- col-lg-12 종료 -->
	</div>

	<%-- URL + 페이지 링크 처리할 폼 --%>
	<form action="/product/product_list" id="actionForm">
		<!-- pageNum, amount, type, keyword 값을 부를 때
			①pageDto(pageDto.cri.pageNum)
			②cri(criteria.pageNum( @ModelAttribute가 사용 안된 경우), cri.pageNum)
			 
		  -->
		<input type="hidden" name="userNo" value="${dto.userNo}" />
		<input type="hidden" name="pageNum" value="${pageDto.cri.pageNum}" />
		<input type="hidden" name="amount" value="${pageDto.cri.amount}" />
	</form>

</div>
<!-- div class="panel-body" 종료 -->



<script src="/resources/js/product/product_list.js"></script>
<%@ include file="../include/manager_footer.jsp"%>