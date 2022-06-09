<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/admin_header.jsp"%>
<link rel="stylesheet" href="/resources/css/admin.css" />
	<!-- content 시작 -->
	<div class="container-fluid">
	
		<div class="row">
			<div class="col-lg-6">
				<div class="card shadow mb-4">
					<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
						<h6 class="m-0 font-weight-bold text-primary">장터신청</h6>
						<a href="#">more</a>
					</div>
					<div class="card-body list-card">
						<table class="table">
							<tr>
								<th>번호</th>
								<th>장터명</th>
								<th>지역</th>
								<th>운영자</th>
							</tr>
						<c:forEach items="${marketList }" var="marketDTO" varStatus="status">
							<tr>
								<td>${status.count }</td>
								<td>${marketDTO.marketName }</td>
								<td>${marketDTO.marketLoc }</td>
								<td>${marketDTO.dummy }</td>
							</tr>
						</c:forEach>
						</table>
					</div>
				</div>
			</div>
			
			<div class="col-lg-6">
				<div class="card shadow mb-4">
					<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
						<h6 class="m-0 font-weight-bold text-primary">공지사항 신청</h6>
						<a href="#">more</a>
					</div>
					<div class="card-body list-card">
						<table class="table">
							<tr>
								<th>번호</th>
								<th>제목</th>
								<th>작성일</th>
								<th>요청장터</th>
							</tr>
						<c:forEach items="${noticeList }" var="noticeDTO" varStatus="status">
							<tr>
								<td>${status.count }</td>
								<td>${noticeDTO.noticeTitle }</td>
								<td>${noticeDTO.noticeDate }</td>
								<td>${noticeDTO.dummy }</td>
							</tr>
						</c:forEach>
						</table>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-xl-8 col-lg-7">
	             <div class="card shadow mb-4">
	                 <!-- Card Header - Dropdown -->
	                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
	                    <h6 class="m-0 font-weight-bold text-primary">사이트 방문자</h6>
	                </div>
	                <!-- Card Body -->
	                <div class="card-body">
	                    <div class="chart-area">
	                        <canvas id="myAreaChart"></canvas>
	                    </div>
	                </div>
	            </div>
	        </div>
			<!-- Pie Chart -->
			<div class="col-xl-4 col-lg-5">
			    <div class="card shadow mb-4">
			        <!-- Card Header - Dropdown -->
			        <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
			            <h6 class="m-0 font-weight-bold text-primary">회원비율</h6>
			        </div>
			        <!-- Card Body -->
			            <div class="card-body">
			                <div class="chart-pie pt-4 pb-2">
			                    <canvas id="myPieChart"></canvas>
			                </div>
			                <div class="mt-4 text-center small">
			                    <span class="mr-2">
			                        <i class="fas fa-circle text-primary"></i> USER
			                    </span>
			                    <span class="mr-2">
			                        <i class="fas fa-circle text-success"></i> SELLER
			                    </span>
			                    <span class="mr-2">
			                        <i class="fas fa-circle text-info"></i> MANAGER
			                    </span>
			                </div>
			            </div>
			        </div>
			    </div>	
			</div>
		</div>
	<!-- content 종료 -->

</div>
<!-- End of Main Content -->
<script>
	// pie Chart 데이터
	let ratio = "${userRatio }";
	let [user, seller, manager] = ratio.split("/");
	
	// Area Chart 데이터
	let visitDay = ["06-01", "06-02", "06-03", "06-04", "06-05", "06-06", "06-07", "06-08", "06-09", "06-10", "06-11", "06-12"];
	let visitors = [15, 47, 66, 39, 89, 172, 153, 122, 230, 221, 470, 365];
</script>

<%@ include file="../include/admin_footer.jsp"%>