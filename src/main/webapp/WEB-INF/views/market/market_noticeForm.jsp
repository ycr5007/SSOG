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
					<!-- 버튼 -->
					<div class="row justify-content-center">
						<button type="button" class="btn btn-primary m-2">등록</button>
						<button type="button" class="btn btn-secondary m-2">뒤로</button>
					</div>
					<input type="hidden" name="${_csrf.parameterName }"	value="${_csrf.token }" />
				</form>
			</div>
		</div>
	</div>
</div>

<!-- URL + 페이징 처리 -->
<form action="/market/market_noticeForm" id="actionForm">
	<input type="hidden" name="marketNo" value="${marketNo}" />
	<input type="hidden" name="pageNum" value="${cri.pageNum }" />
	<input type="hidden" name="amount" value="${cri.amount }" />
</form>

<script src="/resources/js/util/upload.js"></script>
<script>
let marketNo = ${marketNo};

$(function() {
	$(".btn-primary").click(function(e) {
		e.preventDefault();		
		
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