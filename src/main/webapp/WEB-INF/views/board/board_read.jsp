<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<%@include file="../include/header.jsp" %>
<style>

	.pagination li a{
		display: block;
 	 	text-decoration: none;
 	 	color: white;
	}

</style>
<section class = "bg-dark">
<div id="bodystyle" style="overflow:auto; width:auto; color: white; padding: 20px 20px 20px 20px">    
<div class="contetnt">
	<div class="container border-0 bg-dark mt-4 mb-4 h-75" style="height:auto;  align-content: center">
	<h2 style="color:white text-align:left;">자유게시판</h2>  
	<hr />   
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
	      	<div class="panel-body">
	      		
				<form action="" role="form">
					<input class="form-control" type="hidden" name="boardNo" readonly="readonly" value="${BoardDTO.boardNo } ">                				
					<table class="table" style="color: white;">
	      			<tr>
						<div class="form-group">
							<td style="width: 150px;">제목</td>
							<td style="width: 800px; height: 50px;">
							<input class="form-control" name="boardTitle" readonly="readonly" value="${BoardDTO.boardTitle }">
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
							<textarea class="form-control" rows="12" name="boardContent" readonly>${BoardDTO.boardContent }</textarea>   
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
					<div class="row" >
						<div>
							<sec:authentication property="principal" var="info" />
							<sec:authorize access="isAuthenticated()">
								<c:if test="${BoardDTO.userId == info.username}">
									<button type="button" class="btn btn-primary">수정하기</button>
									<button type="button" data-oper='remove' class="btn btn-danger">글삭제</button>    			
								</c:if>
							</sec:authorize>
							<button type="reset" class="btn btn-info">목록</button>  
						</div>
					</div>
					</br>
				</form>

		</div> 	
	</div>
</div>
<%-- 댓글 리스트 영역 --%>
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading" style="text-align:left">
				<i class="fa fa-comments fa-fw">Reply</i>
				<div>
				<sec:authorize access="isAuthenticated()">
					<button id="addReplyBtn" class="btn" style="background-color:orange; color:white; float: right;">Reply Write</button>
				</sec:authorize>
				</div>
			</div>
			<table class="table" style="background-color:#FAF4B7">
				<thead>
					<tr>
						<th>no</th>
						<th>작성자</th>
						<th>내용</th>
						<th>날짜</th>
					</tr>
				</thead>
				<tbody class="chat">
					<%-- 댓글 내용 --%>
				</tbody>
			</table>
			
			<%-- 댓글 페이지 영역 --%>
			<div class="panel-footer"></div>
		</div>
	</div>
</div>

</div>
</div>
</div>
</div>

<%-- 댓글작성 모달 폼 --%>
<div class="modal" tabindex="-1" id="replyModal" data-rno="1">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h5 class="modal-title">Reply</h5>
			</div>
			<div class="modal-body">
				<div class="form-group">
					<label for="reply">Writer</label>
					<input type="text" name="replyWriter" id="replyWriter" class="form-control"/>
				</div>
				<div class="form-group">
					<label for="replyer">replyContent</label>
					<input type="text" name="replyContent" id="replyContent" class="form-control" placeholder="replyContent" />
				</div>
				<div class="form-group">
					<label for="replydate">Reply Date</label>
					<input type="text" name="replyDate" id="replyDate" class="form-control" placeholder="Replydate" />
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-warning" id="modalRegisterBtn">등록</button>
				<button type="button" class="btn btn-success" id="modalModBtn">수정</button>
				<button type="button" class="btn btn-danger" id="modalRemoveBtn">삭제</button>
				<button type="button" class="btn btn-primary" data-dismiss="modal" id="modalCloseBtn">종료</button>
			</div>
		</div>
	</div>
</div>

</section>
<%-- modify 버튼 클릭시 이동할 form --%>
<form action="/board/board_modify" id="operForm">
	<input type="hidden" name="pageNum" value="${criteria.pageNum }" /> 
	<input type="hidden" name="amount" value="${criteria.amount }" />
	<input type="hidden" name="type" value="${criteria.type }" />
	<input type="hidden" name="keyword" value="${criteria.keyword }" />
	<input type="hidden" name="boardNo" value="${BoardDTO.boardNo }" />
</form>
<script>
	console.log('<sec:authentication property="principal" />')
	// 현재 글 번호
	let boardNo = ${BoardDTO.boardNo};
	
	// Security 적용
 	let replyWriter = null;
	<sec:authorize access="isAuthenticated()">
		replyWriter = '<sec:authentication property="principal.username" />'
	</sec:authorize>
		
	// Script 에서 Csrf 토큰 사용
	let csrfHeaderName = "${_csrf.headerName}";
	let csrfTokenValue = "${_csrf.token}";
	
	
</script>
<script src="/resources/js/board/read.js"></script>
<script src="/resources/js/board/reply.js"></script>
<%@include file="../include/footer.jsp" %>       