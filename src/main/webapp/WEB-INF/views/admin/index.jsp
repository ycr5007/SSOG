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
						<a href="/admin/market">more</a>
					</div>
					<div class="card-body list-card section">
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
						<a href="/admin/notice">more</a>
					</div>
					<div class="card-body list-card section">
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
								<td><fmt:formatDate value="${noticeDTO.noticeDate }" pattern="yyyy-MM-dd"/></td>
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
	if(!Date.prototype.adjustDate){
	    Date.prototype.adjustDate = function(days){
	        var date;

	        days = days || 0;

	        if(days === 0){
	            date = new Date( this.getTime() );
	        } else if(days > 0) {
	            date = new Date( this.getTime() );

	            date.setDate(date.getDate() + days);
	        } else {
	            date = new Date(
	                this.getFullYear(),
	                this.getMonth(),
	                this.getDate() - Math.abs(days),
	                this.getHours(),
	                this.getMinutes(),
	                this.getSeconds(),
	                this.getMilliseconds()
	            );
	        }
	
	        this.setTime(date.getTime());

	        return this;
	    };
	}
	let visitDay = [];
	for(let i = -12; i < 0; i++){
		var date_subtract = new Date().adjustDate(i);
		let month = date_subtract.getMonth() + 1
		if(month < 10){
			month = "0" + month;
		}
		let day = date_subtract.getDate();
		if(day < 10){
			day = "0" + day;
		}
		visitDay.push(month + "-" + day);
	}
	
	let visitors = ${visitTotal };
</script>
<script src="/resources/js/admin/chart-pie-demo.js"></script>
<script src="/resources/js/admin/chart-area-demo.js"></script>
<%@ include file="../include/manager_footer.jsp"%>