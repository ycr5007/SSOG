<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@ include file="./include/manager_header.jsp"%>

		<!-- content 시작 -->
		<div class="container-fluid">
		
			<!-- 등록된 장터가 없는 경우 장터 등록 버튼이 보이도록 (장터 상태가 0 or 3인 경우) -->
			<div class="col-xl-12 col-lg-7">
				<div class="card mb-4">
					<div class="card-body">
						<p>등록된 장터가 없습니다</p>
						<a class="btn btn-primary" href="/market/market_register" role="button">장터 등록하기</a>
					</div>
				</div>
			</div>
			
			<!-- 장터 승인 전인 경우, 승인 요청 중이라는 문구가 뜨도록 -->
			<div class="col-xl-12 col-lg-7">
				<div class="card mb-4">
					<div class="card-body">
						<p>장터 승인 요청을 기다리는 중입니다</p>
					</div>
				</div>
			</div>

			<!-- 장터 상태가 1 or 2인 경우 -->			
			<!-- 장터 이미지 -->
			<div class="col-xl-12 col-lg-7">
				<div class="card mb-4">
					<div class="card-body">
						<div class="chart-area">
							<a href="/market/market_detail">
								<!-- marketNo에 해당하는 이미지 가져오기 -->
								<img src="/resources/img/market.PNG" style="width: 100%; height: 100%" />
							</a>
						</div>
					</div>
				</div>
			</div>
			
			<div class="row col-xl-12 px-xl-5">
				<!-- 장터 참여 신청 리스트 -->
				<div class="col-xl-6 col-lg-5">
					<div class="card mb-4">
						<!-- header -->
						<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
							<h6 class="m-0 font-weight-bold text-primary text-gray-800">장터 참여 접수</h6>
							<a href="/market/market_receive">more</a>
						</div>
						<!-- body -->
						<div class="card-body">
							
						</div>
					</div>
				</div>
		
				<!-- 장터 공지 -->
				<div class="col-xl-6 col-lg-5">
					<div class="card mb-4">
						<!-- header -->
						<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
							<h6 class="m-0 font-weight-bold text-primary text-gray-800">장터 공지</h6>
							<a href="/market/market_notice">more</a>
						</div>
						<!-- body -->
						<div class="card-body">
							
						</div>
					</div>
				</div>
			</div>
		
			<div class="row col-xl-12 px-xl-5">
				<!-- 장터 판매 상품 리스트 -->
				<div class="col-xl-6 col-lg-5">
					<div class="card mb-4">
						<!-- header -->
						<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
							<h6 class="m-0 font-weight-bold text-primary text-gray-800">장터 판매 상품</h6>
							<a href="/market/market_myseller">more</a>
						</div>
						<!-- body -->
						<div class="card-body">
							
						</div>
					</div>
				</div>
		
				<!-- 장터 한 줄 리뷰 -->
				<div class="col-xl-6 col-lg-5">
					<div class="card mb-4">
						<!-- header -->
						<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
							<h6 class="m-0 font-weight-bold text-primary text-gray-800">장터 리뷰</h6>
							<a href="/market/market_review">more</a>
						</div>
						<!-- body -->
						<div class="card-body">
							
						</div>
					</div>
				</div>
			</div>
			
		</div>
		<!-- content 종료 -->
	
	</div>
	<!-- End of Main Content -->

<%@ include file="./include/manager_footer.jsp"%>