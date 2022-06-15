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
				<img src="/resources/img/market_detail.jpg" />
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
					<i class="fas fa-fw fa-star"></i>
					<i class="fas fa-fw fa-star"></i>
					<i class="fas fa-fw fa-star"></i>
					<i class="fas fa-fw fa-star-half-alt"></i>
					<i class="far fa-fw fa-star"></i>
					<span class="marketRate">${marketRate}</span>
				</h4>
				<hr />
				<!-- 평점 선택 -->
				<select name="reviewRate" id="reviewRate">
					<option value="1">★☆☆☆☆ 1점</option>
					<option value="2">★★☆☆☆ 2점</option>
					<option value="3">★★★☆☆ 3점</option>
					<option value="4">★★★★☆ 4점</option>
					<option value="5">★★★★★ 5점</option>
				</select>
				<!-- 후기 작성 및 등록 버튼 -->
				<div>
					<form action="/" method="post" class="mt-2" id="reviewForm">
						<input class="p-2" type="text" name="reviewContent" id="reviewContent" placeholder="이 장터 어떠셨나요?" size="50"/>
						<button class="btn btn-primary btn-icon-split btn-sm" type="submit">등록</button>
					</form>
				</div>
				<!-- 장터 후기 목록 -->
				<ul class="reviewList mt-4" style="overflow-y:auto">
					<c:forEach var="review" items="${review}">
						<li class="mb-2 px-2" style="float:left">
							${review.userName}&nbsp;&nbsp;${review.reviewRate}<br>
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

<script>
	// 등록 버튼 클릭 시
	$(".btn-primary").click(function(e) {
		e.preventDefault();		
		
		let message = '${error}';
		
		if(message != "") {
			alert(error); // 후기 작성한 이력이 있는 사용자인 경우, "후기를 작성한 이력이 있습니다." 경고창 띄우기
		}else {
			if($('#reviewContent') == null) {
				alert('후기를 작성해주세요.');
				return;
			}
			
			form.attr('action', '/market/market_detailReview');
			
			form.submit();
		}
		
		if($("#reviewContent").val() == "") {
			alert('입력되지 않은 항목이 있습니다.');
			return;
		}
		
		$("#reviewForm").submit();
	});
	
	$(function() {
		let form = $("#reviewForm");
		
		let error = '${error}';
		
		if(error != '') {
			alert(error);
		}
		
		$(":submit").click(function(e) {
			e.preventDefault(); // submit 속성 막기
			
			let message = '${error}';
			
			if(message != "") {
				// 후기 작성한 이력이 있는 사용자인 경우, "후기를 작성한 이력이 있습니다." 경고창 띄우기
				alert(error);
			}else {
				
				if($('#reviewContent') == null) {
					alert('후기를 작성해주세요.');
					return;
				}
				
				form.attr('action', '/market/market_detailReview');
				
				form.submit();
			}
		}
	}
</script>