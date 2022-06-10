<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@ include file="../include/header.jsp"%>

<div class="row justify-content-center">
	<div class="row col-xl-10 my-5">
	
		<!-- 마켓 이미지 -->
		<div class="col-xl-6 px-xl-5">
			<div class="card">
				<img src="/resources/img/market_detail.jpg" />
			</div>
		</div>

		<!-- 후기 목록 -->
		<div class="card col-xl-6">
			<div class="card-header py-3">
				<h6 class="m-0">장터 리뷰</h6>
			</div>
			<div class="card-body">
				<h4 class="card-title">
					<i class="fas fa-fw fa-star"></i>
					<i class="fas fa-fw fa-star"></i>
					<i class="fas fa-fw fa-star"></i>
					<i class="fas fa-fw fa-star-half-alt"></i>
					<i class="far fa-fw fa-star"></i>
					<span class="marketRate">${marketRate}</span>
				</h4>
				<hr />
				<select name="reviewRate" id="reviewRate">
					<option value="1">★☆☆☆☆ 1점</option>
					<option value="2">★★☆☆☆ 2점</option>
					<option value="3">★★★☆☆ 3점</option>
					<option value="4">★★★★☆ 4점</option>
					<option value="5">★★★★★ 5점</option>
				</select>
				<div>
					<input class="p-2" type="text" name="reviewContent" id="reviewContent" placeholder="이 장터 어떠셨나요?" size="50"/>
					<button class="btn btn-primary btn-icon-split btn-sm" type="submit">등록</button>
				</div>
				<ul>
					<c:forEach var="review" items="${review}">
						<li>
							${review.userName}&nbsp;&nbsp;${review.reviewRate}<br>
							${review.reviewContent}&nbsp;&nbsp;${review.reviewDate}
						</li>
					</c:forEach>
				</ul>
			</div>
		</div>
		
	</div>
</div>

<%@ include file="../include/footer.jsp"%>