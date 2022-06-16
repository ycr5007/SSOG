<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ include file="../include/admin_header.jsp" %>

<style>
	.authority{
		overflow-y: scroll; 
	}
</style>
<link rel="stylesheet" href="/resources/css/admin.css" />
	<div class="row contetnt" style="height: 800px;">
		<div class="container mt-4 mb-4 h-75 col-lg-5 authority section">
			<p class="h4 ml-3"><b>ROLE_SELLER</b></p>
			<table class="table table-striped">
				<thead>
					<tr class="text-center">
						<th class="col-lg-3">아이디</th>
						<th class="col-lg-3">승인</th>
						<th class="col-lg-3">거부</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${sellerList }" var="auth">
						<tr class="auth-row text-center" data-auth="${auth.userId }">
							<td>${auth.userId }</td>
							<td><button type="button" class="btn btn-outline-primary btn-sm access" value="${auth.userId }">승인</button></td>
							<td><button type="button" class="btn btn-outline-danger btn-sm refuse" value="${auth.userId }">거부</button></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		
		<div class="container mt-4 mb-4 h-75 col-lg-5 authority section">
			<p class="h4 ml-3"><b>ROLE_MANAGER</b></p>
			<table class="table table-striped">
				<thead>
					<tr class="text-center">
						<th class="col-lg-3">아이디</th>
						<th class="col-lg-3">승인</th>
						<th class="col-lg-3">거부</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${managerList }" var="auth">
						<tr class="auth-row text-center" data-auth="${auth.userId }">
							<td>${auth.userId }</td>
							<td><button type="button" class="btn btn-outline-primary btn-sm access" value="${auth.userId }">승인</button></td>
							<td><button type="button" class="btn btn-outline-danger btn-sm refuse" value="${auth.userId }">거부</button></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	<form action="" id="operForm" method="post">
		<input type="hidden" name="${_csrf.headerName}" value="${_csrf.token}" />
		<input type="hidden" name="userId" value="" />
	</form>
</div>
<!-- End of Main Content -->
<script src="/resources/js/admin/reqAuthList.js"></script>
<%@ include file="../include/manager_footer.jsp" %>