<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ include file="../include/market_header.jsp"%>

<div class="row justify-content-center">
	<div class="row col-xl-10 my-5">
	
		<!-- 마켓 이미지 -->
		<div class="col-xl-6 px-xl-5">
			<div class="card">
				<img src="/ori_display/market/${marketNo}" />
			</div>
		</div>

		<!-- 후기 -->
		<div class="card col-xl-6">
			<div class="card-header py-3">
				<h6 class="m-0">장터 후기</h6>
			</div>
			<div class="card-body">
				<!-- 장터 평점 -->
				<h4 class="card-title">
					<c:choose>
							<c:when test="${marketRate == 0.0}">
								<i class="far fa-fw fa-star"></i><i class="far fa-fw fa-star"></i><i class="far fa-fw fa-star"></i><i class="far fa-fw fa-star"></i><i class="far fa-fw fa-star"></i>
							</c:when>
							<c:when test="${marketRate > 0.0 && marketRate < 1.0}">
								<i class="fas fa-fw fa-star-half-alt"></i><i class="far fa-fw fa-star"></i><i class="far fa-fw fa-star"></i><i class="far fa-fw fa-star"></i><i class="far fa-fw fa-star"></i>
						    </c:when>
						    <c:when test="${marketRate == 1.0}">
								<i class="fas fa-fw fa-star"></i><i class="far fa-fw fa-star"></i><i class="far fa-fw fa-star"></i><i class="far fa-fw fa-star"></i><i class="far fa-fw fa-star"></i>
						    </c:when>
						    <c:when test="${marketRate > 1.0 && marketRate < 2.0}">
								<i class="fas fa-fw fa-star"></i><i class="fas fa-fw fa-star-half-alt"></i><i class="far fa-fw fa-star"></i><i class="far fa-fw fa-star"></i><i class="far fa-fw fa-star"></i>
						    </c:when>
						    <c:when test="${marketRate == 2.0}">
								<i class="fas fa-fw fa-star"></i><i class="fas fa-fw fa-star"></i><i class="far fa-fw fa-star"></i><i class="far fa-fw fa-star"></i><i class="far fa-fw fa-star"></i>
						    </c:when>
						    <c:when test="${marketRate > 2.0 && marketRate < 3.0}">
								<i class="fas fa-fw fa-star"></i><i class="fas fa-fw fa-star"></i><i class="fas fa-fw fa-star-half-alt"></i><i class="far fa-fw fa-star"></i><i class="far fa-fw fa-star"></i>
						    </c:when>
						    <c:when test="${marketRate == 3.0}">
								<i class="fas fa-fw fa-star"></i><i class="fas fa-fw fa-star"></i><i class="fas fa-fw fa-star"></i><i class="far fa-fw fa-star"></i><i class="far fa-fw fa-star"></i>
						    </c:when>
						    <c:when test="${marketRate > 3.0 && marketRate < 4.0}">
								<i class="fas fa-fw fa-star"></i><i class="fas fa-fw fa-star"></i><i class="fas fa-fw fa-star"></i><i class="fas fa-fw fa-star-half-alt"></i><i class="far fa-fw fa-star"></i>
						    </c:when>
						     <c:when test="${marketRate == 4.0}">
								<i class="fas fa-fw fa-star"></i><i class="fas fa-fw fa-star"></i><i class="fas fa-fw fa-star"></i><i class="fas fa-fw fa-star"></i><i class="far fa-fw fa-star"></i>
						    </c:when>
						    <c:when test="${marketRate > 4.0 && marketRate < 5.0}">
								<i class="fas fa-fw fa-star"></i><i class="fas fa-fw fa-star"></i><i class="fas fa-fw fa-star"></i><i class="fas fa-fw fa-star"></i><i class="fas fa-fw fa-star-half-alt"></i>
						    </c:when>
						     <c:when test="${marketRate == 5.0}">
								<i class="fas fa-fw fa-star"></i><i class="fas fa-fw fa-star"></i><i class="fas fa-fw fa-star"></i><i class="fas fa-fw fa-star"></i><i class="fas fa-fw fa-star"></i>
						    </c:when>
						</c:choose>
					<span class="marketRate"><fmt:formatNumber value="${marketRate}" pattern="#.#"/></span>
				</h4>
				<hr />
				<form action="" method="post" class="mt-2" id="reviewForm">
					<!-- 평점 선택 -->
					<select name="reviewRate" id="reviewRate" class="mb-2">
						<option value="1">★☆☆☆☆ 1점</option>
						<option value="2">★★☆☆☆ 2점</option>
						<option value="3">★★★☆☆ 3점</option>
						<option value="4">★★★★☆ 4점</option>
						<option value="5">★★★★★ 5점</option>
					</select>
					<!-- 후기 작성 및 등록 버튼 -->
					<div>
						<input class="p-2" type="text" name="reviewContent" id="reviewContent" placeholder="이 장터 어떠셨나요?" size="40"/>
						<button class="btn btn-outline-primary btn-icon-split btn-sm" type="button">등록</button>
					</div>
				</form>
				<!-- 장터 후기 목록 -->
				<ul class="reviewList mt-4" style="overflow-y:scroll">
					<c:forEach var="review" items="${review}">
						<li class="mb-2 px-2 align-items-left" style="float:left; list-style:none; text-align:left">
							<c:choose>
							    <c:when test="${review.reviewRate == 1.0}">
									★☆☆☆☆
							    </c:when>
							    <c:when test="${review.reviewRate == 2.0}">
									★★☆☆☆
							    </c:when>
							    <c:when test="${review.reviewRate == 3.0}">
									★★★☆☆
							    </c:when>
							     <c:when test="${review.reviewRate == 4.0}">
									★★★★☆
							    </c:when>
							     <c:when test="${review.reviewRate == 5.0}">
									★★★★★
							    </c:when>
							</c:choose>
							${review.reviewRate}<br>
							${review.reviewContent}&nbsp;&nbsp;<fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${review.reviewDate}" />
						</li>
					</c:forEach>
				</ul>
				<!-- 후기 목록 페이징 -->
				<div class="review-footer"></div>
			</div>
		</div>
	</div>
</div>

<script src="/resources/js/jquery.min.js"></script>
<script src="/resources/js/bootstrap.bundle.min.js"></script>
<script>
	// 등록 버튼 클릭 시
	$(".btn-outline-primary").click(function(e) {
		e.preventDefault();
		
		if($("#reviewContent").val() == "") {
			alert('후기를 작성해주세요.');
			return;
		}
		
		$("#reviewForm").submit();
	});
</script>
<%@ include file="../include/footer.jsp"%>