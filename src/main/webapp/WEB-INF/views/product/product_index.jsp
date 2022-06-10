<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@ include file="../include/product_header.jsp"%>

		<!-- content 시작 -->
		<div class="container-fluid">
		
			<!-- 현재 참여중인 장터 -->
			<div class="col-xl-12 col-lg-7">
				<div class="card shadow mb-4">
					<div class="card-body">
						<!-- header -->
						<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
							<h6 class="m-0 font-weight-bold text-primary">참여중인 장터</h6>
							<a href="#">more</a>
						</div>
						<!-- body -->
						<div class="card-body">
							<div class="chart-pie pt-4 pb-2">
								<canvas id="myPieChart"></canvas>
							</div>
						</div>						
					</div>
				</div>
			</div>
		
			<div class="row">
				<!-- 현재 진행 중인 장터 정보 -->
				<div class="col-xl-6 col-lg-5">
					<div class="card shadow mb-4">
						<!-- header -->
						<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
							<h6 class="m-0 font-weight-bold text-primary">오픈예정 장터</h6>
							<a href="#">more</a>
						</div>
						<!-- body -->
						<div class="card-body">
							<div class="chart-pie pt-4 pb-2">
								<canvas id="myPieChart"></canvas>
							</div>
						</div>
					</div>
				</div>
		
				<!-- 가지고 있는 상품 -->
				<div class="col-xl-6 col-lg-5">
					<div class="card shadow mb-4">
						<!-- header -->
						<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
							<h6 class="m-0 font-weight-bold text-primary">상품 목록</h6>
							<a href="#">more</a>
						</div>
						<!-- body -->
						<div class="card-body">
							<div class="chart-pie pt-4 pb-2">
								<canvas id="myPieChart"></canvas>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- content 종료 -->
	
	</div>
	<!-- End of Main Content -->

<%@ include file="../include/manager_footer.jsp"%>