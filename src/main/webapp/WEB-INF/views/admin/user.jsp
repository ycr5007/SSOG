<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../include/admin_header.jsp" %>
	<div class="container-fluid">
		<div class="row">
			<div class="col-lg-12">
				<div class="card shadow mb-4">
					<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
						<h6 class="m-0 font-weight-bold text-primary">장터신청</h6>
						<a href="#">more</a>
					</div>
					<div class="card-body">
						<table class="table">
							<tr>
								<th>권한</th>
								<th>아이디</th>
								<th>이름</th>
								<th>이메일</th>
								<th>인증상태</th>
								<th>회원상태</th>
							</tr>
						<c:forEach items="${list }" var="user">
							<tr>
								<td>${user.userAuth }</td>
								<td>${user.userId }</td>
								<td>${user.userName }</td>
								<td>${user.userMail }</td>
								<td>${user.userVer }</td>
								<td>${user.userStatus }</td>
							</tr>
						</c:forEach>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- End of Main Content -->

<%@ include file="../include/admin_footer.jsp" %>