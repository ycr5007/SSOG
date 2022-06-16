<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ include file="../include/market_header.jsp"%>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous"/>
<script
      src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
      integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
      crossorigin="anonymous"
    ></script>
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF"
      crossorigin="anonymous"
    ></script>

<div class="row justify-content-center align-items-center">

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
		<div class="card mb-2" id="marketImg">
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
										src="https://cdn.pixabay.com/photo/2017/01/06/18/28/essential-oils-1958550_960_720.jpg"
										alt="Card image cap">
									<div class="card-body">
										<h4 class="card-title">에센셜 오일</h4>
										<p class="card-text">10,000원</p>
										<p class="card-text">판매자 김모씨</p>
									</div>
								</div>
							</div>
	
							<div class="col-md-4 clearfix d-none d-md-block">
								<div class="card mb-2">
									<img class="card-img-top"
										src="https://cdn.pixabay.com/photo/2018/09/14/11/12/food-3676796_960_720.jpg"
										alt="Card image cap">
									<div class="card-body">
										<h4 class="card-title">한 입 스테이크</h4>
										<p class="card-text">20,000원</p>
										<p class="card-text">판매자 이모씨</p>
									</div>
								</div>
							</div>
	
							<div class="col-md-4 clearfix d-none d-md-block">
								<div class="card mb-2">
									<img class="card-img-top"
										src="https://cdn.pixabay.com/photo/2016/03/27/19/31/fashion-1283863_960_720.jpg"
										alt="Card image cap">
									<div class="card-body">
										<h4 class="card-title">스트라이프 니트</h4>
										<p class="card-text">19,900원</p>
										<p class="card-text">판매자 박모씨</p>
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
										src="https://cdn.pixabay.com/photo/2018/04/17/11/03/cocktail-3327242_960_720.jpg"
										alt="Card image cap">
									<div class="card-body">
										<h4 class="card-title">칵테일</h4>
										<p class="card-text">8,000원</p>
										<p class="card-text">판매자 최모씨</p>
									</div>
								</div>
							</div>
	
							<div class="col-md-4 clearfix d-none d-md-block">
								<div class="card mb-2">
									<img class="card-img-top"
										src="https://cdn.pixabay.com/photo/2016/11/22/19/08/hangers-1850082_960_720.jpg"
										alt="Card image cap">
									<div class="card-body">
										<h4 class="card-title">예쁜 옷 많아요</h4>
										<p class="card-text">10,000원</p>
										<p class="card-text">판매자 황모씨</p>
									</div>
								</div>
							</div>
	
							<div class="col-md-4 clearfix d-none d-md-block">
								<div class="card mb-2">
									<img class="card-img-top"
										src="https://cdn.pixabay.com/photo/2018/01/04/19/43/paper-3061485_960_720.jpg"
										alt="Card image cap">
									<div class="card-body">
										<h4 class="card-title">반지 만들기</h4>
										<p class="card-text">20,000원</p>
										<p class="card-text">판매자 양모씨</p>
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
										src="https://cdn.pixabay.com/photo/2017/08/01/00/40/mobile-2562332_960_720.jpg"
										alt="Card image cap">
									<div class="card-body">
										<h4 class="card-title">갤럭시 vs 아이폰</h4>
										<p class="card-text">12,000원</p>
										<p class="card-text">판매자 정모씨</p>
									</div>
								</div>
							</div>
	
							<div class="col-md-4 clearfix d-none d-md-block">
								<div class="card mb-2">
									<img class="card-img-top"
										src="https://cdn.pixabay.com/photo/2019/01/14/17/25/mango-3932597_960_720.jpg"
										alt="Card image cap">
									<div class="card-body">
										<h4 class="card-title">쫀득쫀득 젤라또</h4>
										<p class="card-text">6,000원</p>
										<p class="card-text">판매자 주모씨</p>
									</div>
								</div>
							</div>
	
							<div class="col-md-4 clearfix d-none d-md-block">
								<div class="card mb-2">
									<img class="card-img-top"
										src="https://cdn.pixabay.com/photo/2014/04/13/20/49/cat-323262_960_720.jpg"
										alt="Card image cap">
									<div class="card-body">
										<h4 class="card-title">고앵이 물품 팔아요</h4>
										<p class="card-text">20,000원</p>
										<p class="card-text">판매자 곽모씨</p>
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
	<div class="container my-3 col-xl-7 px-xl-5">
		<div class="card border-light">
			<h4 class="card-title">장터 위치</h4>
				<div class="card-body" id="marketLoc">
					${marketLoc}
				<div id="map" class="mb-3" style="width: 100%; height: 300px"></div>
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
					<a href="/market/market_detailReview?marketNo=${marketDTO.marketNo}" onclick="marketReivew(${marketDTO.marketNo})" style="text-decoration:none">more</a>
				</div>
				<!-- body -->
				<div class="card-body">
					<h4 class="card-title mb-3">
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
						<fmt:formatNumber value="${marketRate}" pattern="#.#"/>
					</h4>
					<ul>
						<c:forEach var="review" items="${review}" end="5">
							<li style="list-style:circle; text-align:left; line-height:40px">
								${fn:substring(review.reviewContent, "0", "13")}...
							</li>
						</c:forEach>
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

<!-- 장터 이미지 불러오기 -->
<script>
	$.ajax({
		url : '/display/' + market
		type : 'get',
		processData : false,
		contentType : false,
		data : formData,
		dataType : 'json',
		success : function(result){
			showUploadFile(result);
		}
	})
	
	function showUploadFile(result){
		let marketImg = $('#marketImg');
		
		let str = "";
		
		$(result).each(function(idx, obj){
			// 원본파일 이미지 경로
			let oriPath = obj.uploadPath + "\\" + obj.uuid + "_" + obj.fileName;
			oriPath = oriPath.replace(new RegExp(/\\/g), "/");
			
			str += "<img class='img' src='/display/market?fileName=" + oripath + "' width='800' height='1000'>";
		})
		marketImg.append(str);
	}
</script>

<!-- 캐러셀 슬라이드 넘어가는 시간 조절 -->
<script>
	$("#multi-item-example").carousel(
		interval:1000
	);
</script>

<!-- 네이버 지도 API Script -->
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=bbgkngo31i&submodules=geocoder"></script>
<script src="/resources/js/jquery.min.js"></script>
<script src="/resources/js/bootstrap.bundle.min.js"></script>
<script>
	var y = "37.565474690";
	var x = "126.977199586";
	
	move(x, y);
	
	<!-- 주소 → 좌표 변환 -->
	<!-- 좌표에 해당하는 지점 마크 -->
	$.ajax({
		url : '/map',
		type : 'post',
		data : {
			'address' : $("#marketLoc").val()
		},
		dataType : 'json',
		success : function(data) {
			x = data[0];
			y = data[1];
			console.log(x);
			console.log(y);
			move(x, y);
		},
	});
	
	function move(x,y) {
		var mapOptions = {
			center : new naver.maps.LatLng(37.5568904, 126.9236743),
			zoom : 15,
		};
		var map = new naver.maps.Map("map", mapOptions);
		var markerOptions = {
			position : new naver.maps.LatLng(37.5568904, 126.9236743),
			map : map
		};
		var marker = new naver.maps.Marker(markerOptions);
	}
	
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