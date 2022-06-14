<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../include/manager_header.jsp"%>

<div class="container-fluid">

	<h2 class="mb-3 text-gray-800">장터 공지/이벤트 작성</h2>

	<div class="row justify-content-center">
		<div class="card shadow py-3 my-4 col-xl-7">
			<div class="card-body">

				<!-- 공지 작성 form -->
				<form action="" method="post" id="noticeForm">
					<div class="form-group">
						<label>카테고리</label>
						<select name="noticeCategory" id="noticeCategory">
							<option value="공지">공지</option>
							<option value="이벤트">이벤트</option>
						</select>
					</div>
					<div class="form-group">
						<label>제목</label>
						<input class="form-control" name="noticeTitle" id="noticeTitle">
					</div>
					<div class="form-group">
						<label>내용</label>
						<textarea class="form-control" rows="3" name="noticeContent" id="noticeContent"></textarea>
					</div>

					<!-- 파일 첨부 -->
					<div class="row">
						<div class="col-lg-12">
							<div class="panel panel-default">
								<div class="panel-heading">파일첨부</div>
								<div class="panel-body">
									<div class="form-group uploaddiv">
										<input type="file" name="marketImg" id="marketImg" />
									</div>
									<div class="uploadResult">
										<!-- 첨부파일 정보 -->
									</div>
								</div>
							</div>
						</div>
					</div>
					
					<!-- 버튼 -->
					<div class="row justify-content-center">
						<button type="button" class="btn btn-primary m-2">등록</button>
						<button type="button" class="btn btn-secondary m-2">취소</button>
					</div>
				</form>
				<!-- form 종료 -->
				
			</div>
		</div>
	</div>
</div>

<!-- URL + 페이징 처리 -->
<form action="/market/market_noticeForm" id="actionForm">
	<input type="hidden" name="marketNo" value="${marketNo}" />
	<input type="hidden" name="pageNum" value="${criteria.pageNum }" />
	<input type="hidden" name="amount" value="${criteria.amount }" />
</form>

<script>
let marketNo = ${marketNo};

$(function() {
	$(".btn-primary").click(function(e) {
		e.preventDefault();
		
		console.log("등록 버튼 클릭");
		
		if($("#noticeTitle").val() == "" || $("#noticeContent").val() == "") {
			alert('입력되지 않은 항목이 있습니다.');
			return;
		}
		
		$("#noticeForm").submit();
	});
	
	$(".btn-secondary").click(function() {
		location.href = "/market/market_notice?marketNo=${marketNo}&pageNum=1&amount=10";
	});
})
</script>

<%@ include file="../include/manager_footer.jsp"%>