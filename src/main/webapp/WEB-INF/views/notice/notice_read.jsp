<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="../include/header.jsp" %>
<link rel="stylesheet" href="/resources/css/admin.css" />

<section class="bg-dark">
	<div id="login1" class="row justify-content-center align-items-center" style="overflow:auto; width:auto; height:1200px; color: white; padding: 50px 50px 50px 50px">    
		<div class="bg-dark w-75">
			<div class="container mt-4 mb-6 h-50">
				<div class="form-group" style="text-align: left;">
					<label class="col-sm-2 col-form-label">작성일</label>
					<input class="form-control" style="margin-left: 50px;" name="bno" readonly="readonly" value="<fmt:formatDate value='${dto.noticeDate }' pattern='yyyy 년 MM 월 dd 일 hh:mm'/>">               				
				</div> 
				<div class="form-group" style="text-align: left;">
					<label class="col-sm-2 col-form-label">제목</label>
					<input class="form-control" style="margin-left: 50px;" name="bno" readonly="readonly" value="${dto.noticeCategory } : ${dto.noticeTitle }">                				
				</div> 
				<div class="form-group" style="text-align: left;">
					<label class="col-sm-2 col-form-label">공지사항</label>
					<textarea class="form-control" style="margin-left: 50px;" rows="12" name="content" readonly>${dto.noticeContent }</textarea>               				
				</div> 
				<div class="form-group" style="text-align: left;">
					<label class="col-sm-2 col-form-label">공지장터</label>
					<input class="form-control" style="margin-left: 50px;" name="bno" readonly="readonly" value="${dto.market.marketLoc } : ${dto.market.marketName }">                				
				</div> 
			</div>
			<div class="mt-4">
				<button style="width: 100%; margin-left: 50px" type="button" class="btn btn-primary btn-lg">List</button>
			</div>
		</div>
	</div>
</section> 
<form action="/notice/notice_list" id="operForm">
	<input type="hidden" name="pageNum" value="${cri.pageNum }" />
	<input type="hidden" name="amount" value="${cri.amount}" />
</form>
<script>
	let noticeNo = ${dto.noticeNo};
	let section = "notice";
</script>
<script src="/resources/js/notice/noticeRead.js"></script>
<%@ include file="../include/footer.jsp" %>