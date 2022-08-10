<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/security/tags"  prefix="sec"%>
<%@include file="../include/header.jsp" %>
<section class = "bg-dark">
<div id="bodystyle" style="overflow:auto; width:auto; height:550px; color: white; padding: 20px 20px 20px 20px">    
<div class="contetnt">
	<div class="container border-0 bg-dark mt-4 mb-4 h-75" style="height:auto;  align-content: center">
	<h2 style="color:white text-align:left;">수정</h2>           
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">
			</div> <!-- /.panel-heading -->
			<div class="panel-body">
				<form action="" method="post" role="form" id="modifyForm">
					<input class="form-control" type="hidden" name="boardNo" readonly="readonly" value="${BoardDTO.boardNo }">                				
					<table class="table" style="color: white;">
	      				      			<tr>
						<div class="form-group">
							<td style="width: 150px;">제목</td>
							<td style="width: 800px; height: 50px;">
								<input class="form-control" name="boardTitle" value="${BoardDTO.boardTitle }">
							</td>                				
						</div>
					</tr>
					<tr>
						<div class="form-group">
							<td style="width: 150px;">작성자</td>
							<td style="width: 800px; height: 50px;">
								<input class="form-control" name="writer" readonly="readonly" value="${BoardDTO.userId }">          				
						</div>
					</tr>
					<tr>
						<div class="form-group">
							<td style="width: 150px;">내용</td>
							<td style="width: 800px; height: 50px;">
								<textarea class="form-control" rows="12" name="boardContent">${BoardDTO.boardContent }</textarea>   
							</td>            				
						</div> 
					</tr>
					<tr>
						<div class="form-group">
						<td style="width: 150px;">첨부파일</td>
						<td style="width: 800px; height: 50px;">
						<div class="card">
							<div class="card-body">
								<img src="/display/board/${BoardDTO.boardNo }" alt="" />														
							</div>
						</div>
						</td>                				
						</div>
					</tr>
					</table>		
				</form>
			</div>
		</div>
	</div>
</div>

					<sec:authentication property="principal" var="info" />
					<sec:authorize access="isAuthenticated()">
						<c:if test="${BoardDTO.userId == info.username}">
							<button type="submit" data-oper='modify' class="btn btn-secondary">Modify</button>              			
							<button type="submit" data-oper='remove' class="btn btn-danger">Remove</button>              			
						</c:if>
					</sec:authorize>
					<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
					<button type="submit" data-oper='list' class="btn btn-info">List</button>          
<%-- remove와 list를 위한 폼--%>
<form action="/board/board_modify" id="operForm">
	<input type="hidden" name="boardNo" value="${BoardDTO.boardNo }" />
	<input type="hidden" name="writer" value="${BoardDTO.userId }" />
	<input type="hidden" name="pageNum" value="${criteria.pageNum }" />
	<input type="hidden" name="amount" value="${criteria.amount }" />
	<input type="hidden" name="type" value="${criteria.type }" />
	<input type="hidden" name="keyword" value="${criteria.keyword }" />
</form>
</section>
<%-- 스크립트 --%>
<script>
	let boardNo = ${BoardDTO.boardNo };
	let section = "board";
	// Script 에서 Csrf 토큰 사용
	let csrfHeaderName = "${_csrf.headerName}";
	let csrfTokenValue = "${_csrf.token}";
</script>
<script>
	let modifyfile = $(".showfIleImg li")
	let modifyForm = $("#modifyForm")
	$(function(){
		$('[type="submit"]').click(function(e){
			e.preventDefault()
			
			let str = "";
			str += '<input type="hidden" name="attach.uuid" value="'+ modifyfile.data("uuid") +'" />';
			str += '<input type="hidden" name="attach.uploadPath" value="'+ modifyfile.data("path") +'" />';
			str += '<input type="hidden" name="attach.fileName" value="'+ modifyfile.data("filename") +'" />';
			
			modifyForm.append(str);
			
			modifyForm.submit();
		})
		$('[type="file"]').change(function(){
			modifyfile.remove()
			
			// form 객체 ajax 전송
			$.ajax({
				url : '/uploadAjax/' + section, // section : 파일 업로드할 경로
				type : 'post',
				processData : false, // processData : false >> 데이터를 일반적인 쿼리 스트링 형태로 변환할 것인지 결정 (Default : true > x-www-form-urlencoded)
				contentType : false, // contentType : false >> (Default : true)
				data : formData,
				dataType : 'json',
				success : function(result){
					fileData = result;
					$(":file").val("");
					showUploadFile(result);
			}
		})
		})
	})
</script>
<script src="/resources/js/board/board_modify.js"></script>
<script src="/resources/js/util/upload.js"></script>
<%@include file="../include/footer.jsp" %>       