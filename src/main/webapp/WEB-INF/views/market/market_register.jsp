<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="../include/manager_header.jsp"%>

<div class="container-fluid">

	<h2 class="mb-3 text-gray-800">장터 등록</h2>
	
	<div class="row justify-content-center">
		<div class="card shadow mb-4 col-xl-7">
			<div class="card-body">
				
				<form action="" method="post">
					<div class="form-group">
						<label>장터 이름</label>
						<input class="form-control" name="marketName" id="marketName" required>
					</div>
					<div class="form-group">
						<label>장터 위치</label>
							<button type="button" class="btn btn-outline-primary btn-sm mb-2" onclick="goPopup();">주소검색</button>
							<input class="form-control" name="marketLoc" id="marketLoc" onchange="mapMark();" required>
							<div id="map" class="form-control mt-3" style="height: 200px"></div>
					</div>
					<div class="form-group">
						<label>장터 시작일</label>
						<input class="form-control" type="datetime-local" name="marketSD" id="marketSD" required/>
					</div>
					<div class="form-group">
						<label>장터 종료일</label>
						<input class="form-control" type="datetime-local" name="marketED" id="marketED" required/>
					</div>
			</div>
		</div>
		<div class="card shadow mb-4 col-xl-7">
			<div class="card-body">
					<div class="form-group">
						<label>이미지 첨부</label><br>
						<input type="file" name="uploadFile" class="custom-file-input form-control" id="customFileLangHTML" style="display:none" required>
						<label class="custom-file-label form-control" for="customFileLangHTML" data-browse="파일찾기"></label>
							<h5 class="card-title text-center">업로드 사진</h5>
							<div class="card-text text-center uploadResult">
								<ul></ul>
							</div>
					</div>
					<div class="row justify-content-center">
						<button type="button" class="btn btn-primary m-2">등록</button>
						<button type="button" class="btn btn-secondary m-2">뒤로</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

<!-- 파일 업로드 -->
<script>
	let section = "market";
</script>
<script src="/resources/js/util/upload.js"></script>

<!-- 네이버 지도 API Script -->
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=bbgkngo31i&submodules=geocoder"></script>
<script src="/resources/js/jquery.min.js"></script>
<script src="/resources/js/bootstrap.bundle.min.js"></script>
<script>
	var y = "";
	var x = "";

	<!-- 주소 검색 팝업창 호출 -->
	function goPopup() {
		var pop = window.open("/market/mapPopup", "pop", "width=570,height=420");
	}
	
	<!-- 주소 → 좌표 변환 -->
	<!-- 좌표에 해당하는 지점 마크 -->
	function jusoCallBack(roadFullAddr) {
		var addr = document.querySelector("#marketLoc");
		addr.value = roadFullAddr;

		$.ajax({
			type : 'post',
			data : {
				'address' : encodeURIComponent(roadFullAddr)
			},
			dataType : 'json',
			error : function(x, e) {
				console.log(x);
				alert('주소를 다시 확인해주세요.');
			},
			success : function(data) {
				console.log(data);
				x = data.result.addresses[0].x;
				y = data.result.addresses[0].y;
				console.log(x);
				console.log(y);
			}
		});
	}
	
	var mapOptions = {
		center : new naver.maps.LatLng(37.565474690, 126.977199586),
		zoom : 15,
	};
	var map = new naver.maps.Map("map", mapOptions);
	var markerOptions = {
		position : new naver.maps.LatLng(y, x),
		map : map
	};
	var marker = new naver.maps.Marker(markerOptions);
</script>

<script>
$(function() {
	// 등록 버튼 클릭 시
	$(".btn-primary").click(function(e) {
		e.preventDefault();
				
		if($("#marketName").val() == "" || $("#marketLoc").val() == "" || $("#marketSD").val() == "" || $("#marketED").val() == "" || $("#marketImg").val() == "") {
			alert('입력되지 않은 항목이 있습니다.');
			return;
		}
		
		$("form").submit();
	});
	
	// 뒤로가기 버튼 클릭 시
	$(".btn-secondary").click(function() {
		location.href = "/manager_index";
	});
})
</script>

<%@ include file="../include/manager_footer.jsp"%>