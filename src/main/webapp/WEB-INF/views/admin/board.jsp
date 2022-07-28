<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/admin_header.jsp" %>
<style>
	.hiddenRow {
	    padding: 0 !important;
	}
</style>
	<div class="container-fluid">
		<div class="row">
			<div class="col-lg-12">
				<div class="card shadow mb-4">
					<form action="" id="operForm">
						<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
							<h6 class="m-0 font-weight-bold text-primary">게시판 관리</h6>
							<div class="col-auto my-1">
								<label class="mr-sm-2 sr-only" for="inlineFormCustomSelect">Preference</label>
							</div>
						</div>
						<div class="card-body">
							<table class="table">
								<tr class="column-header">
									<th class="col-lg-2">글번호</th>
									<th class="col-lg-6">글제목</th>
									<th class="col-lg-2">작성자</th>
									<th class="col-lg-2">작성일</th>
								</tr>
								<c:forEach items="${list }" var="board">
									<tr data-toggle="collapse" data-target="#board_${board.boardNo}" class="accordion-toggle list-select">
										<td>${board.boardNo }</td>
										<td>${board.boardTitle }</td>
										<td>${board.userName }</td>
										<td><fmt:formatDate value="${board.boardDate }" pattern="yyyy-MM-dd"/> </td>
									</tr>
									<tr>
							            <td colspan="6" class="hiddenRow">
							            	<div id="board_${board.boardNo}" class="accordian-body collapse form-group">
					            				<textarea name="boardContent" id="boardContent" class="form-control" cols="30" rows="10" readonly>${board.boardContent }</textarea>
							            		<div style="padding-top: 5px;"></div>
							            		<button type="button" class="btn btn-danger btn-lg float-right" style="margin: 10px 25px 10px 0;" value="${board.boardNo }">DELETE</button>
							            	</div>
							            </td>
							        </tr>
								</c:forEach>
							</table>
						<!-- 페이징 처리 -->
							<nav aria-label="Page navigation example">
								<ul class="pagination justify-content-center">
									<c:if test="${pageDto.prev }">
										<li class="page-item previous"><a class="page-link" href="${pageDto.startPage - 1 }">Previous</a></li>
									</c:if>
									<c:forEach begin="${pageDto.startPage }" end="${pageDto.endPage }" var="idx">
										<li class="page-item ${pageDto.cri.pageNum == idx ? 'active' : '' }"><a class="page-link" href="${idx }">${idx }</a></li>
									</c:forEach>
									<c:if test="${pageDto.next }">
										<li class="page-item next"><a class="page-link" href="${pageDto.endPage + 1 }">Next</a></li>
									</c:if>
								</ul>
							</nav>
						<!-- 페이징 처리 -->
						</div>
						<input type="hidden" name="pageNum" value="1" />
						<input type="hidden" name="amount" value="10" />
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- End of Main Content -->
<script src="/resources/js/admin/manage_board.js"></script>
<%@ include file="../include/manager_footer.jsp" %>