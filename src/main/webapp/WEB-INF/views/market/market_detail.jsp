<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@ include file="../include/header.jsp"%>

<div class="row justify-content-center">

	<!-- 마켓 상세페이지 상단 공지사항 -->
	<div class="col-xl-7 mt-3 pt-3 px-xl-5">
		<div class="card shadow mb-4">
			<div class="card-body">
				<div class="chart-area" style="text-align:left; padding-left: 10px;">
					<span style="color:red; font-weight:bold; font-size:15px;">공지</span><br />
					<span style="font-size:13px;">[운영 시간 변경 안내] 6월 17일부터 운영 시간이 변경됩니다.</span>
				</div>
			</div>
		</div>
	</div>
	<!-- 마켓 상세페이지 상단 공지사항 끝 -->

	<!-- 마켓 이미지 -->
	<div class="col-xl-7 px-xl-5">
		<div class="card mb-2">
				<img src="/resources/img/market_detail.jpg" />
		</div>
	</div>
	<!-- 마켓 이미지 끝 -->

	<!-- 판매 상품 리스트 -->
	<div class="container my-5 col-xl-7 px-xl-5">
		<div class="card border-light">
			<h4 class="card-title">판매 상품</h4>
		
			<!-- carousel 시작 -->
			<div id="multi-item-example" class="carousel slide carousel-multi-item" data-ride="carousel">
	
				<!-- 슬라이드 -->
				<div class="carousel-inner" role="listbox">
					
					<!-- First slide -->
					<div class="carousel-item active">
	
						<div class="row">
							<div class="col-md-4">
								<div class="card mb-2">
									<img class="card-img-top"
										src="https://mdbootstrap.com/img/Photos/Horizontal/Nature/4-col/img%20(34).jpg"
										alt="Card image cap">
									<div class="card-body">
										<h4 class="card-title">Card title</h4>
										<p class="card-text">Some quick example text to build on
											the card title and make up the bulk of the card's content.</p>
									</div>
								</div>
							</div>
	
							<div class="col-md-4 clearfix d-none d-md-block">
								<div class="card mb-2">
									<img class="card-img-top"
										src="https://mdbootstrap.com/img/Photos/Horizontal/Nature/4-col/img%20(18).jpg"
										alt="Card image cap">
									<div class="card-body">
										<h4 class="card-title">Card title</h4>
										<p class="card-text">Some quick example text to build on
											the card title and make up the bulk of the card's content.</p>
									</div>
								</div>
							</div>
	
							<div class="col-md-4 clearfix d-none d-md-block">
								<div class="card mb-2">
									<img class="card-img-top"
										src="https://mdbootstrap.com/img/Photos/Horizontal/Nature/4-col/img%20(35).jpg"
										alt="Card image cap">
									<div class="card-body">
										<h4 class="card-title">Card title</h4>
										<p class="card-text">Some quick example text to build on
											the card title and make up the bulk of the card's content.</p>
									</div>
								</div>
							</div>
						</div>
	
					</div>
					<!--/.First slide-->
	
					<!--Second slide-->
					<div class="carousel-item">
	
						<div class="row">
							<div class="col-md-4">
								<div class="card mb-2">
									<img class="card-img-top"
										src="https://mdbootstrap.com/img/Photos/Horizontal/City/4-col/img%20(60).jpg"
										alt="Card image cap">
									<div class="card-body">
										<h4 class="card-title">Card title</h4>
										<p class="card-text">Some quick example text to build on
											the card title and make up the bulk of the card's content.</p>
									</div>
								</div>
							</div>
	
							<div class="col-md-4 clearfix d-none d-md-block">
								<div class="card mb-2">
									<img class="card-img-top"
										src="https://mdbootstrap.com/img/Photos/Horizontal/City/4-col/img%20(47).jpg"
										alt="Card image cap">
									<div class="card-body">
										<h4 class="card-title">Card title</h4>
										<p class="card-text">Some quick example text to build on
											the card title and make up the bulk of the card's content.</p>
									</div>
								</div>
							</div>
	
							<div class="col-md-4 clearfix d-none d-md-block">
								<div class="card mb-2">
									<img class="card-img-top"
										src="https://mdbootstrap.com/img/Photos/Horizontal/City/4-col/img%20(48).jpg"
										alt="Card image cap">
									<div class="card-body">
										<h4 class="card-title">Card title</h4>
										<p class="card-text">Some quick example text to build on
											the card title and make up the bulk of the card's content.</p>
									</div>
								</div>
							</div>
						</div>
	
					</div>
					<!--/.Second slide-->
	
					<!--Third slide-->
					<div class="carousel-item">
	
						<div class="row">
							<div class="col-md-4">
								<div class="card mb-2">
									<img class="card-img-top"
										src="https://mdbootstrap.com/img/Photos/Horizontal/Food/4-col/img%20(53).jpg"
										alt="Card image cap">
									<div class="card-body">
										<h4 class="card-title">Card title</h4>
										<p class="card-text">Some quick example text to build on
											the card title and make up the bulk of the card's content.</p>
									</div>
								</div>
							</div>
	
							<div class="col-md-4 clearfix d-none d-md-block">
								<div class="card mb-2">
									<img class="card-img-top"
										src="https://mdbootstrap.com/img/Photos/Horizontal/Food/4-col/img%20(45).jpg"
										alt="Card image cap">
									<div class="card-body">
										<h4 class="card-title">Card title</h4>
										<p class="card-text">Some quick example text to build on
											the card title and make up the bulk of the card's content.</p>
									</div>
								</div>
							</div>
	
							<div class="col-md-4 clearfix d-none d-md-block">
								<div class="card mb-2">
									<img class="card-img-top"
										src="https://mdbootstrap.com/img/Photos/Horizontal/Food/4-col/img%20(51).jpg"
										alt="Card image cap">
									<div class="card-body">
										<h4 class="card-title">Card title</h4>
										<p class="card-text">Some quick example text to build on
											the card title and make up the bulk of the card's content.</p>
									</div>
								</div>
							</div>
						</div>
	
					</div>
					<!--/.Third slide-->
	
				</div>
				<!--/.Slides-->
				
				<div class="controls-top">
					<a href="#multi-item-example" data-slide="prev"><i class="fas fa-fw fa-chevron-left"></i></a>
					<a href="#multi-item-example" data-slide="next"><i class="fas fa-fw fa-chevron-right"></i></a>
				</div>
	
			</div>
			<!-- carousel 종료 -->
			
		</div>
	</div>
	<!-- 판매 상품 리스트 끝 -->
	
	<!-- 장터 위치 (네이버 지도 API) -->
	<div class="container my-5 col-xl-7 px-xl-5">
		<div class="card border-light">
			<h4 class="card-title">장터 위치</h4>
				<div class="card-body">
					<div id="map" style="width: 100%; height: 400px"></div>
				</div>
			</div>
	</div>
	
	<div class="row col-xl-7 px-xl-5">
		<!-- 장터 한 줄 리뷰 -->
		<div class="col-xl-5">
			<div class="card mb-5">
				<!-- header -->
				<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
					<h6 class="m-0 font-weight-bold">장터 후기</h6>
					<a href="/market/market_detailReview" style="text-decoration: none">more</a>
				</div>
				<!-- body -->
				<div class="card-body">
					<h4 class="card-title">
						<c:if test="reviewRate ">
							
						</c:if>
						<i class="fas fa-fw fa-star"></i>
						<i class="fas fa-fw fa-star"></i>
						<i class="fas fa-fw fa-star"></i>
						<i class="fas fa-fw fa-star-half-alt"></i>
						<i class="far fa-fw fa-star"></i>
						3.8
					</h4>
					<ul>
						<%-- <c:forEach var="review" items="${list}" end=4>
							<li>${review.reviewContent }</li>
						</c:forEach> --%>
					</ul>
				</div>
			</div>
		</div>
		
		<!-- 플리마켓 유튜브 영상 -->
		<div class="col-xl-7">
			<div class="card mb-5">
                 <!-- header -->
				<div class="card-header py-3 d-flex flex-row justify-content-between">
					<h6 class="m-0 font-weight-bold">관련 영상</h6>
				</div>
				<!-- body -->
				<div class="card-body">
					<div id="player">
						<!-- Youtube 영상으로 대체될 부분 -->
					</div>
				</div>
             </div>
		</div>
	</div>
</div>

<input type="hidden" name="marketNo" />

<!-- 네이버 지도 API Script -->
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=bbgkngo31i"></script>
<script>
	var mapOptions = {
		center : new naver.maps.LatLng(37.3595704, 127.105399),
		zoom : 10,
	};

	var map = new naver.maps.Map("map", mapOptions);
</script>

<!-- Youtube API Script -->
<script>
	// Youtube IFrame Player API code 가져오기
	var tag = document.createElement('script');
	tag.src = "https://www.youtube.com/iframe_api";
	var firstScriptTag = document.getElementsByTagName('script')[0];
	firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);
	
	// API code 로드 후, <div id="player"> 생성
	var player;
	function onYouTubeIframeAPIReady() {
		player = new YT.Player('player', {
			height : '300',
			width : '400',
			videoId : 'SwDgqx0QSJ8',
			events : {
				'onReady' : onPlayerReady,
				'onStateChange' : onPlayerStateChange
			}
		});
	}
	
	// 비디오 플레이어가 준비되면 호출되는 메소드
	function onPlayerReady(event) {
		event.target.playVideo();
	}
	
	// 플레이어 상태가 변경될 때 호출되는 메소드
	// 비디오를 재생할 때(상태=1) 플레이어는 6초간 재생 후 중지
	var done = false;
	function onPlayerStateChange(event) {
		if (event.data == YT.PlayerState.PLAYING && !done) {
			setTimeout(stopVideo, 6000);
			done = true;
		}
	}
	function stopVideo() {
		player.stopVideo();
	}
</script>

<%@ include file="../include/footer.jsp"%>