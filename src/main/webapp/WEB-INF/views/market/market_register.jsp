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
						<input class="form-control" name="marketName" required>
					</div>
					<div class="form-group">
						<label>장터 위치</label>
							<button type="button" class="btn btn-outline-primary btn-sm mb-2" onclick="goPopup();">주소검색</button>
							<input class="form-control" name="marketLoc" required>
							<div id="map" class="form-control mt-3" style="height: 200px"></div>
					</div>
					<div class="form-group">
						<label>장터 시작일</label>
						<input class="form-control" type="datetime-local" name="marketSD" required/>
					</div>
					<div class="form-group">
						<label>장터 종료일</label>
						<input class="form-control" type="datetime-local" name="marketED" required/>
					</div>
					<div class="form-group">
						<label>파일 첨부 (셀러 모집-소개 순으로)</label><br>
						<input type="file" name="marketImg" multiple required />
					</div>
					<div class="row justify-content-center">
						<button type="submit" class="btn btn-primary m-2">등록</button>
						<button type="reset" class="btn btn-secondary m-2">뒤로</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

<!-- 네이버 지도 API Script -->
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=bbgkngo31i&submodules=geocoder"></script>

<!-- 주소 검색 -->
<script>
	function goPopup() {
		var pop = window.open("/market/mapPopup", "pop", "width=570,height=420, scrollbars=yes, resizable=yes");
	}
	function jusoCallBack(roadFullAddr) {
		var addr = document.querySelector("#marketLoc");
		addr.value = roadFullAddr;
	}
</script>

<!-- 지도 보여주기 -->
<script>
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

<script>
$(function() {
	// 등록 버튼 클릭 시
	$("[type='submit']").click(function(e) {
		e.preventDefault();
		
		if($("input[name='marketName']") == "" || $("input[name='marketLoc']") == "" || $("input[name='marketSD']") == "" || $("input[name='marketED']") == "" || $("input[name='marketImg']") == "") {
			alert('입력되지 않은 항목이 있습니다.');
			return;
		}
		
		$("form").submit();
	})
	
	// 뒤로가기 버튼 클릭 시
	$("input[type='reset']").click(function() {
		$("form").val() = "";
	})
})
</script>

<%@ include file="../include/manager_footer.jsp"%>