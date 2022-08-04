<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="../include/product_header.jsp"%> 
<link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
      integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn"
      crossorigin="anonymous"
    />
<!-- <script
      src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
      integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
      crossorigin="anonymous"
    ></script>
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF"
      crossorigin="anonymous"
    ></script> -->
  <style>  
     .carousel-inner > .item > img {
      top: 0;
      left: 0;
      min-width: 100%;
      min-height: 400px;
    } 
</style>

	<!-- content 시작 -->
	<div class="container-fluid">
		<!-- 현재 참여중인 장터 -->
		<div class="col-xl-12">
			<div class="card shadow mb-4">
				<div class="card-body">
					<!-- header -->
					<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
						<h6 class="m-0 font-weight-bold text-primary">오픈 예정 장터</h6>
						<a href="/product/product_market_list">more</a>
					</div>
					<!-- body -->
				<div class="card-body">
					<div class="panel-body">
						<div id="carouselExampleCaptions" class="carousel slide" data-ride="carousel">
							<ol class="carousel-indicators">
								<li data-target="#carouselExampleCaptions" data-slide-to="0" class="active"></li>
								<li data-target="#carouselExampleCaptions" data-slide-to="1"></li>
								<li data-target="#carouselExampleCaptions" data-slide-to="2"></li>
							</ol>
							<div class="carousel-inner">
								<c:forEach var="dto" items="${oList}" end="3"  varStatus="status">													
									<div class='carousel-item <c:out value="${status.count == 1? 'active':''}"/>'>
										<img src="/display/market/${dto.marketNo}" onerror="src='/resources/img/market.PNG'" class="d-block w-100" alt="..." />
										<div class="carousel-caption d-none d-md-block">
											<h5>${dto.marketName}</h5>
											<p>${dto.marketSD}</p>
										</div>
									</div>
								</c:forEach>								
							</div>
							<button class="carousel-control-prev" type="button" data-target="#carouselExampleCaptions" data-slide="prev">
								<span class="carousel-control-prev-icon" aria-hidden="true"></span>
								<span class="sr-only">Previous</span>
							</button>
							<button class="carousel-control-next" type="button" data-target="#carouselExampleCaptions" data-slide="next">
								<span class="carousel-control-next-icon" aria-hidden="true"></span>
								<span class="sr-only">Next</span>
							</button>
						</div>
					</div>
				</div>
			</div>
			</div>
		</div>
	
		<!-- row 안에 오픈 예정 장터, 상품 목록을 보여줌 -->
		<div class="row">
			<!-- 참여 예정 장터 start -->
			<div class="col-lg-6">
				<div class="card shadow mb-4">
					<!-- header -->
					<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
						<h6 class="m-0 font-weight-bold text-primary">참여 중인 장터</h6>
						<a href="/product/product_ingmarket_list">more</a>
					</div>
					<!-- card body start -->
					<div class="card-body" style="height:250px; overflow-y:scroll;">
						<div class="panel-body">
							<table class="table table-striped table-bordered table-hover">								
								<thead>
									<tr>
										<th>장터명</th>
										<th>장터 종료일</th>
										<th>장터 위치</th>
									</tr>
								</thead>								
								<!-- tbody 시작 -->
								<tbody>
									<!-- 리스트 반복문 -->
									<c:forEach var="dto" items="${mList}" end="4">
										<tr>
											<td>${dto.marketName}</td>
											<td>${dto.marketSD}</td>
											<td>${dto.marketLoc}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>	
						</div><!-- <div class="panel-body"> end -->
					</div><!-- card - body end -->
				</div>
			</div><!-- 오픈 예정 장터 end -->
			

			<!-- 상품 리스트 start-->
			<div class="col-lg-6">
				<div class="card shadow mb-4">
					<!-- header -->
					<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
						<h6 class="m-0 font-weight-bold text-primary">상품 목록</h6>
						<a href="/product/product_list">more</a>
					</div>
					<!-- body -->
					<div class="card-body" style="height:250px; overflow-y:scroll;">
						<div class="panel-body">
							<table class="table table-striped table-bordered table-hover">
								<thead>
									<tr>
										<th>상품명</th>
										<th>상품가격</th>
									</tr>
								</thead>
								<tbody>
									<!-- 리스트 반복문 -->
									<c:forEach var="dto" items="${pList}" end="4">
										<tr>
											<td>${dto.productName}</td>
											<td>${dto.productPrice}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div> <!-- <div class="panel-body"> 종료 -->
					</div><!-- <div class="card-body"> 종료 -->
				</div>
			</div><!-- 상품 리스트 end -->
		</div> <!-- <div class="row"> 종료 -->
		
	</div> <!-- Content 종료 -->
<%@ include file="../include/manager_footer.jsp"%> 