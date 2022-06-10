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
						<input class="form-control" name="marketName">
					</div>
					<div class="form-group">
						<label>장터 위치</label>
						<div id="map" class="form-control" style="height: 200px"></div>
					</div>
					<div class="form-group">
						<label>장터 시작일</label>
						<input class="form-control" type="datetime-local" name="marketSD"/>
					</div>
					<div class="form-group">
						<label>장터 종료일</label>
						<input class="form-control" type="datetime-local" name="marketED"/>
					</div>
					<div class="form-group">
						<label>파일 첨부 (셀러 모집-소개 순으로)</label><br>
						<input type="file" name="marketImg" multiple />
					</div>
					<div class="row justify-content-center">
						<button type="submit" class="btn btn-primary m-2">등록</button>
						<button type="reset" class="btn btn-secondary m-2">취소</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

<!-- 네이버 지도 API Script -->
<!-- <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=bbgkngo31i"></script> -->
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=bbgkngo31i&submodules=geocoder"></script>
<script>
/* naver.maps.Service.geocode({ address: '종각역' }, function(status, response) {
    if (status === naver.maps.Service.Status.ERROR) {
        return alert('Something wrong!');
    }
    var new_position = new naver.maps.LatLng(response.v2.addresses[0].y, response.v2.addresses[0].x)
    map.setCenter(new_position);

    var marker = new naver.maps.Marker({
        position: new naver.maps.LatLng(response.v2.addresses[0].y, response.v2.addresses[0].x),
        map: map
    });
}); */
	/* naver.maps.Service.geocode({ address: '종각역' }, function(status, response) {
	    if (status === naver.maps.Service.Status.ERROR) {
	        return alert('Something wrong!');
	    }
	    var mapOptions = {
    		center : new naver.maps.LatLng(response.v2.addresses[0].y, response.v2.addresses[0].x),
    		zoom : 10,
    	};
    	var map = new naver.maps.Map("map", mapOptions);
    	var markerOptions = {
    		position: new naver.maps.LatLng(response.v2.addresses[0].y, response.v2.addresses[0].x),
    		map: map
    	};
    	var marker = new naver.maps.Marker(markerOptions);
	}); */
	var mapOptions = {
		center : new naver.maps.LatLng(37.3595704, 127.105399),
		zoom : 10,
	};
	var map = new naver.maps.Map("map", mapOptions);
	var markerOptions = {
		position: new naver.maps.LatLng(37.3595704, 127.105399),
		map: map
	};
	var marker = new naver.maps.Marker(markerOptions);
</script>

<%@ include file="../include/manager_footer.jsp"%>