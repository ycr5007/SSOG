<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> 
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
		<img src="../resources/img/board.png"/>
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="justify-content-between d-flex">
				<div class="col-xs-1">
						<!--페이지 목록 갯수 지정하는 폼-->
						<select name="" id="amount" class="form-control">
							<option value="10" ${criteria.amount == "10" ? 'selected' : '' }>10</option>
							<option value="25" ${criteria.amount == "25" ? 'selected' : '' }>25</option>
							<option value="50" ${criteria.amount == "50" ? 'selected' : '' }>50</option>
							<option value="100" ${criteria.amount == "100" ? 'selected' : '' }>100</option>
						</select>
				</div>
				<div>
			    <button id="regBtn" type="button" class="btn btn-xs pull-right" style="float: right; background-color: blue; color: white; !important">
			    	글쓰기
			    </button>
			    </div>
			</div>
			<div class="panel-body">
				<table class="table" style="color: white;">
					<thead>
						<tr class="text-center">
							<th class='col-lg-1'>번 호</th>
							<th class='col-lg-5'>제 목</th>
							<th class='col-lg-2'>작성자</th>
							<th class='col-lg-2'>작성일</th>
							<th class='col-lg-1'>조 회</th>
							<th class='col-lg-1'>댓 글</th>
						</tr>
					</thead>
				  	<!-- 게시판 리스트 반복문 (完) -->
					<tbody>
						<c:forEach var="dto" items="${list }">
							<tr>
								<td>${dto.boardNo }</td>
								<td style="text-align: left; width: 30%;"><a href="${dto.boardNo }" class="move">${dto.boardTitle } </a></td>
								<td>${dto.userId }</td>
								<td><fmt:formatDate value="${dto.boardDate }" pattern="yyyy-MM-dd HH:mm" /></td>
								<td>${dto.boardHit }</td>
								<td>${dto.boardRepl }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				
				<!-- start search -->
					<form action="" method="get" id="searchForm" >
						<input type="hidden" name="pageNum" value="${criteria.pageNum }" />
						<input type="hidden" name="amount" value="${criteria.amount }" />
						<div class="row d-flex justify-content-center">
						<div class="col col-md-1">
						<select name="type" class="form-control">
							<option value="" <c:out value="${criteria.type == '' ? 'selected' : '' }"/>>──────</option>
							<option value="T" <c:out value="${criteria.type == 'T' ? 'selected' : '' }"/>>제목</option>
							<option value="C" <c:out value="${criteria.type == 'C' ? 'selected' : '' }"/>>내용</option>
							<option value="W" <c:out value="${criteria.type == 'W' ? 'selected' : '' }"/>>작성자</option>
							<option value="TC" <c:out value="${criteria.type == 'TC' ? 'selected' : '' }"/>>제목 / 내용</option>
							<option value="TW" <c:out value="${criteria.type == 'TW' ? 'selected' : '' }"/>>제목 / 작성자</option>
							<option value="TCW" <c:out value="${criteria.type == 'TCW' ? 'selected' : '' }"/>>모두</option>
						</select>
						</div>
						<div class="col col-md-6">
						<input type="text" name="keyword" class="form-control" value="${criteria.keyword }"/>
						</div>
						<div class="col col-md-2">
						<button type="submit" class="btn btn-primary">Search</button>
						<button type="reset" class="btn btn-danger"">초기화</button>
						</div>
						</div><!-- end search -->
					</form>
				
				<div class="text-center">
				<!-- start Pagination -->
					<ul class="pagination" style="justify-content: center; padding: 20px;">
						<c:if test="${pageDTO.prev }">
							<li class="paginate_button previous"><a href="${pageDTO.startPage - 1 }">Previous</a></li>
						</c:if>
						<c:forEach begin="${pageDTO.startPage }" end="${pageDTO.endPage }" var="idx">
							<li class="paginate_button ${pageDTO.cri.pageNum == idx ? 'active' : '' }"><a class="btn" href="${idx }">${idx }</a></li>
						</c:forEach>
						<c:if test="${pageDTO.next }">
							<li class="paginate_button next"><a href="${pageDTO.endPage + 1 }">Next</a></li>
						</c:if>
					</ul>
				</div> <!-- end Pagination -->
			</div> <!-- end panel-body -->
		</div> <!-- end panel -->
	</div>
</div> <!-- /.row -->
</div>
</div>
	
<!-- 페이지링크 처리 form -->
<form action="/board/board_list" id="actionForm">
	<!-- 
		변수 값 가져오는 방법
			model.modelAttribute 를 통해 저장된 DTO 에서 값 가져오기 ( ex, pageDTO.cri.pageNum )
			(@ModelAttribute([default : criteria]) Controller 의 Criteria (도메인) 객체를 통해 값 가져오기 ( ex, criteria.pageNum )
	 -->
	<input type="hidden" name="pageNum" value="${criteria.pageNum }" />
	<input type="hidden" name="amount" value="${criteria.amount }" />
	<input type="hidden" name="type" value="${criteria.type }" />
	<input type="hidden" name="keyword" value="${criteria.keyword }" />
</form>
<!-- 모달 추가 -->
<div class="modal" tabindex="-1" id="myModal">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">Register Board</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<p>글 등록</p>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>
</section>
<!-- 스크립트 -->
<script type="text/javascript">
	// 게시글 작성 성공 후 result 값 확인
	let result = '${result}';
</script>
<script src="/resources/js/board/list.js"></script>
<%@include file="../include/footer.jsp" %>