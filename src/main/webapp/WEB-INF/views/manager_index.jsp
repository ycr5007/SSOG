<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="./include/manager_header.jsp"%>

		<div class="container-fluid">
		
			<!-- 등록된 장터가 없는 경우 장터 등록 버튼이 보이도록 (장터 상태가 0 or 3인 경우) -->
			<!-- SELECT * FROM market WHERE market_status = 3 OR NULL -->
			<c:if test="${marketStatus == null}">
				<div class="col-xl-12 col-lg-7">
					<div class="card mb-4">
						<div class="card-body">
							<p>등록된 장터가 없습니다</p>
							<a class="btn btn-primary" href="/market/market_register" role="button">장터 등록하기</a>
						</div>
					</div>
				</div>
			</c:if>
			
			<!-- 장터 승인 전인 경우, 승인 요청 중이라는 문구가 뜨도록 -->
			<!-- SELECT * FROM market WHERE market_status = 0 -->
			<c:if test="${marketStatus == 0}">
				<div class="col-xl-12 col-lg-7">
					<div class="card mb-4">
						<div class="card-body">
							<p>장터 승인 요청을 기다리는 중입니다</p>
						</div>
					</div>
				</div>
			</c:if>

			<!-- 장터 상태가 1 or 2인 경우 -->			
			<!-- 장터 이미지 -->
			<c:if test="${marketStatus != null}">
				<div class="col-xl-12 col-lg-7">
					<div class="card mb-4">
						<div class="card-body">
							<div class="chart-area">
								<a href="/market/market_detail?marketNo=${marketNo}">
									<!-- marketNo에 해당하는 이미지 가져오기 -->
									<img src="/resources/img/market.PNG" style="width: 100%; height: 100%" />
								</a>
							</div>
						</div>
					</div>
				</div>
			</c:if>
			
			<div class="row col-xl-12 px-xl-5">
				<!-- 장터 참여 신청 리스트 -->
				<div class="col-xl-6 col-lg-5">
					<div class="card mb-4">
						<div
							class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
							<h6 class="m-0 font-weight-bold text-primary text-gray-800">참여 신청 목록</h6>
							<a href="/market/market_receive">more</a>
						</div>
						<div class="card-body">
							<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0" style="text-align: center">
								<thead>
									<tr class="text-gray-800">
										<th>상품명</th>
										<th>판매자</th>
										<th>가 격</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="receive" items="${receive}" end="5">
										<tr>
											<td>${receive.productName}</td>
											<td>${receive.userName}</td>
											<td>${receive.productPrice}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>

				<!-- 장터 공지 -->
				<div class="col-xl-6 col-lg-5">
					<div class="card mb-4">
						<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
							<h6 class="m-0 font-weight-bold text-primary text-gray-800">장터 공지</h6>
							<a href="/market/market_notice">more</a>
						</div>
						<div class="card-body">
							<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0" style="text-align: center">
								<thead>
									<tr class="text-gray-800">
										<th>제 목</th>
										<th>등록일</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="notice" items="${notice}" end="5">
										<tr>
											<td>${notice.noticeTitle}</td>
											<td><fmt:formatDate pattern="MM-dd" value="${notice.noticeDate}" /></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		
			<div class="row col-xl-12 px-xl-5">
				<!-- 장터 판매 상품 리스트 -->
				<div class="col-xl-6 col-lg-5">
					<div class="card mb-4">
						<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
							<h6 class="m-0 font-weight-bold text-primary text-gray-800">장터 판매 상품</h6>
							<a href="/market/market_myseller">more</a>
						</div>
						<div class="card-body">
							<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0" style="text-align: center">
								<thead>
									<tr class="text-gray-800">
										<th>상품명</th>
										<th>판매자</th>
										<th>가 격</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="product" items="${product}" end="5">
										<tr>
											<td>${product.productName}</td>
											<td>${product.userName}</td>
											<td>${product.productPrice}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
		
				<!-- 장터 한 줄 리뷰 -->
				<div class="col-xl-6 col-lg-5">
					<div class="card mb-4">
						<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
							<h6 class="m-0 font-weight-bold text-primary text-gray-800">장터 리뷰</h6>
							<a href="/market/market_review">more</a>
						</div>
						<div class="card-body">
							<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0" style="text-align: center">
								<thead>
									<tr class="text-gray-800">
										<th>내 용</th>
										<th>작성자</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="review" items="${review}" end="5">
										<tr>
											<td>${review.reviewContent}</td>
											<td>${review.userName}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>						
						</div>
					</div>
				</div>
			</div>
		</div>
		
<!-- URL + 페이징 처리 -->
<form action="/manager_index" id="actionForm">
	<input type="hidden" value='<c:out value="${userNo}"  />'/>
	<input type="hidden" name="marketNo" value="${marketNo}" />
	<input type="hidden" name="pageNum" value="${criteria.pageNum }" />
	<input type="hidden" name="amount" value="${criteria.amount }" />
	<input type="hidden" name="${_csrf.parameterName }"	value="${_csrf.token }" />
</form>	
		
<script>
$(function() {
	if(${marketNo} == null) {
		alert('장터 등록 후 이용해주세요.');
		location.href = "/market/market_register";
	}
})
</script>
	
<%@ include file="./include/manager_footer.jsp"%>