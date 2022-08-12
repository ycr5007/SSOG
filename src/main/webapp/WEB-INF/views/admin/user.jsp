<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ include file="../include/admin_header.jsp" %>
<link rel="stylesheet" href="/resources/css/admin.css" />
	<div class="container-fluid">
		<div class="row">
			<div class="col-lg-12">
				<div class="card shadow mb-4">
					<form action="" id="operForm">
						<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
							<h6 class="m-0 font-weight-bold text-primary">회원목록</h6>
							<div class="col-auto my-1">
								<label class="mr-sm-2 sr-only" for="inlineFormCustomSelect">Preference</label>
							</div>
						</div>
						<div class="card-body">
							<table class="table">
								<tr class="column-header">
									<th>권한</th>
									<th>아이디</th>
									<th>이름</th>
									<th>이메일</th>
									<th>회원상태</th>
								</tr>
							<c:forEach items="${list }" var="user">
								<tr class="list-select row-data" onclick="getDetailUser(${user.userNo})">
									<td>
										<c:choose>
											<c:when test="${fn:length(user.authorities) > 1 }">${user.authorities[1].authority }</c:when>
											<c:otherwise>${user.authorities[0].authority }</c:otherwise>
										</c:choose>
									</td>
									<td>${user.userId }</td>
									<td>${user.userName }</td>
									<td>${user.userMail }</td>
									<td>${user.userStatus }</td>
									
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
						<input type="hidden" name="pageNum" value="${cri.pageNum }" />
						<input type="hidden" name="amount" value="10" />
					</form>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="userModal" tabindex="-1" aria-labelledby="userModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-xl">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="userModalLabel">회원정보</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<table class="table table-bordered text-center">
						<tr>
							<th class="col-lg-2">아이디</th>
							<td class="col-lg-2 userid"></td>
							<th class="col-lg-2">권한</th>
							<td class="col-lg-2 authority"></td>
							<th class="col-lg-2">상태</th>
							<td class="col-lg-2 status"></td>								
						</tr>
						<tr>
							<td colspan="2" class="profile-img"><img src="" onerror='this.src="/resources/img/default.png"' width="150" height="150"/></td>
							<th class="align-middle">프로필 문구</th>
							<td colspan="3" class="profile"></td>
						</tr>
						<tr>
							<th colspan="2">이름</th>
							<td class="username" colspan="4"></td>
						</tr>
						<tr>
							<th colspan="2">주소</th>
							<td class="address" colspan="4"></td>
						</tr>
						<tr>
							<th colspan="2">휴대전화</th>
							<td class="phone" colspan="4"></td>
						</tr>
						<tr>
							<th colspan="2">이메일</th>
							<td class="email" colspan="4"></td>
						</tr>
					</table>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-danger">Delete User</button>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- End of Main Content -->
<script>
	let csrfHeaderName = "${_csrf.headerName}";
	let csrfTokenValue = "${_csrf.token}";
</script>
<script src="/resources/js/admin/userList.js"></script>
<%@ include file="../include/manager_footer.jsp" %>