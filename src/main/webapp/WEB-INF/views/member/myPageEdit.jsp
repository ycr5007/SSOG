<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags"  prefix="sec" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>

<html>
  <head>
    <meta charset="UTF-8" />

    <title>회원가입</title>
        <!--<link rel="stylesheet" href="/resources/css/sign.css"> -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/jquery.validate.js"></script>
    <!-- resources 앞에 / 를 붙일때는 context path가 없는 경우일 때 -->
    <link rel="stylesheet" href="/resources/css/y.css">

    <!-- validation 사용자 작성 코드 삽입-->
    <script src="/resources/js/register.js"></script>
  </head>
  <body style="background-color: #f5f5f5">
    <div class="container" style="margin-top: 40px">
		<form id="edit" method="post" action="/member/update">
			<div class="form-group row justify-content-center">
				<label for="userid" class="col-sm-2 col-form-label">아이디</label>
				<div class="textForm">
					<input type="text" name="userId" id="userId"
						value='<sec:authentication property="principal.username"/>'
						readonly />
				</div>
			</div>
			<div class="form-group row justify-content-center">
				<label for="pass1" class="col-sm-2 col-form-label">변경할 비밀번호</label>
				<div class="textForm">
					<input type="password" name="userPw" id="userPw"
						class="form-control" placeholder="변경할 비밀번호를 입력하세요" />
					<small id="userPwd" class="text-info"></small>
				</div>
			</div>
			<div class="form-group row justify-content-center">
				<label for="name" class="col-sm-2 col-form-label">이름 </label>
				<div class="textForm">
					<input type="text" name="userName" id="userName"
						value='<c:out value="${user.userName }"  />' readonly />
				</div>
			</div>
			<div class="form-group row justify-content-center">
				<label for="phone" class="col-sm-2 col-form-label">핸드폰 </label>
				<div class="textForm">
					<input type="text" name="userPhone" id="userPhone"
						value='<c:out value="${user.userPhone }"  />' readonly />
				</div>
			</div>
			<div class="form-group row justify-content-center">
				<label for="email" class="col-sm-2 col-form-label">이메일</label>
				<div class="textForm">
					<input type="text" name="userMail" id="userMail"
						value='<c:out value="${user.userMail }"  />' readonly />
				</div>
			</div>

			<div class="d-flex justify-content-end">

				<input type="text" name="userAddress" id="userAddress"
					value='<c:out value="${user.userAddress }"  /> ' readonly />
			</div>
			<div class="form-group row justify-content-center">
				<label for="userprofile" class="col-sm-2 col-form-label">프로필</label>
				<div class="textForm">
					<input type="text" name="userProfile" id="userProfile"
						value='<c:out value="${user.userProfile }"  />' readonly />
					<small id="userProfile" class="text-info"></small>
				</div>
			</div>


			<div class="form-group text-center">
				<button type="submit" class="btn btn-primary2 send-data" formaction="/member/update">정보수정</button>
				<button type="submit" class="btn btn-secondary" formaction="/member/leave">회원탈퇴</button>
			</div>

			<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
		</form>
		<sec:authorize access="hasRole('ROLE_USER')">
			<button type="button" class="btn btn-primary send-data">SELLER</button>
			<button type="button" class="btn btn-success send-data">MANAGER</button>
		</sec:authorize>
		<form action="" method="post" id="authForm">
			<input type="hidden" name="userId"
				value='<sec:authentication property="principal.username"/>' /> <input
				type="hidden" name="authority" value="" />
		</form>
	</div>
     
     <script>
						$(function() {
							let authForm = $("#authForm")

							$(".btn-primary").click(
									function() {
										if (!confirm("판매자 신청을 하시겠습니까 ?")) {
											return;
										}
										authForm.find("[name='authority']")
												.val("ROLE_SELLER");
										authForm.attr('action',
												'/member/updateAuthResult');
										authForm.submit();
									})

							$(".btn-success").click(
									function() {
										if (!confirm("마켓운영자 신청을 하시겠습니까 ?")) {
											return;
										}
										authForm.find("[name='authority']")
												.val("ROLE_MANAGER");
										authForm.attr('action',
												'/member/updateAuthResult');
										authForm.submit();
									})

						})
					</script>
     
</body>
</html>


