<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<link rel="stylesheet" href="/resources/css/formctrl.css">


<!-- 콘텐츠 시작 -->
<section class="bg-dark">
	<div id="bodystyle" style="overflow:auto; width:auto; height:750px; color: white; ">      	
		<div class="container border-0 bg-dark" style="width:550px; height:700px; align-content: center; padding: 10px 10px 10px 10px" >
				<img src="../resources/img/mypagelogo.png"/>
				
				<!-- seller or manager -->
				<div class="mb-3" style="text-align:center;">
					<sec:authorize access="hasRole('ROLE_USER')">
						<button type="button" class="btn btn-primary send-data">SELLER</button>
						<button type="button" class="btn btn-success send-data">MANAGER</button>
					</sec:authorize>
				</div>
				
				<form id="edit" method="post" action="/member/update">
			        <!-- 아이디 -->
			        <div class="form-group row justify-content-center">
			          <label for="userid" class="col-sm-5 col-form-label">아이디</label>
			          <div class="textForm col-sm-7">
							<input type="text" name="userId" id="userId" class="form-control"
								value='<sec:authentication property="principal.username"/>'
								readonly />
			          </div>
			        </div>
					
			        <!-- 비밀번호 -->					
			        <div class="form-group row justify-content-center">
			          <label for="pass1" class="col-sm-5 col-form-label">비밀번호</label>
			          <div class="textForm col-sm-7">
							<input type="password" name="userPw" id="userPw"
								class="form-control" placeholder="변경할 비밀번호를 입력하세요" /> <small
								id="userPwd" class="text-info"></small>
						</div>
					</div>
					
			        <!-- 이름 -->
			        <div class="form-group row justify-content-center">
			          <label for="name" class="col-sm-5 col-form-label">이름 </label>
			          <div class="textForm col-sm-7">
							<input type="text" name="userName" id="userName" class="form-control"
								value='<c:out value="${user.userName }"  />' readonly />
						</div>
					</div>
					
			        <!-- 핸드폰 -->
			        <div class="form-group row justify-content-center">
			          <label for="phone" class="col-sm-5 col-form-label">핸드폰 </label>
			          <div class="textForm col-sm-7">
							<input type="text" name="userPhone" id="userPhone" class="form-control"
								value='<c:out value="${user.userPhone }"  />' readonly />
						</div>
					</div>
					
			        <!-- 이메일 -->
			        <div class="form-group row justify-content-center">
			          <label for="email" class="col-sm-5 col-form-label">이메일 </label>
			          <div class="textForm col-sm-7">
							<input type="text" name="userMail" id="userMail" class="form-control"
								value='<c:out value="${user.userMail }"  />' readonly />
						</div>
					</div>
	
			        <!-- 주소 -->
			        <div class="form-group row justify-content-center">
			          <label for="email" class="col-sm-5 col-form-label">주소 </label>
			          <div class="textForm col-sm-7">
						<input type="text" name="userAddress" id="userAddress" class="form-control"
							value='<c:out value="${user.userAddress }"  /> ' readonly />
						</div>
					</div>
						
			        <!-- 프로필 -->		
			        <div class="form-group row justify-content-center mb-5">
						<label for="userprofile" class="col-sm-5 col-form-label">프로필</label>
						<div class="textForm col-sm-7">
							<input type="text" name="userProfile" id="userProfile" class="form-control"
								style="width:299px; height:150px;"
								value='<c:out value="${user.userProfile }"  />' /> <small
								id="userProfile" class="text-info"></small>
						</div>
					</div>
				</form>
	
			        <!-- 정보수정 회원탈퇴 -->
					<div class="mb-2" style="text-align:center;">
						<button type="submit" class="btn btn-secondary send-data"
							formaction="/member/update">정보수정</button>
						<button type="submit" class="btn btn-secondary"
							formaction="/member/leave">회원탈퇴</button>
					</div>	
					<input type="hidden" name="${_csrf.parameterName }"
						value="${_csrf.token }" />

					<form action="" method="post" id="authForm">
						<input type="hidden" name="userId"
							value='<sec:authentication property="principal.username"/>' /> <input
							type="hidden" name="authority" value="" />
					</form>
		</div>
	</div>
</section>
<!-- 콘텐츠 종료 -->

<!-- validation 사용자 작성 코드 삽입-->
	<script src="/resources/js/register.js"></script>
<!-- 스크립트 -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/jquery.validate.js"></script>
	<script>
		$(function() {
			let authForm = $("#authForm")

			$(".btn-primary").click(function() {
				if (!confirm("판매자 신청을 하시겠습니까 ?")) {
					return;
				}
				authForm.find("[name='authority']").val("ROLE_SELLER");
				authForm.attr('action', '/member/updateAuthResult');
				authForm.submit();
			})

			$(".btn-success").click(function() {
				if (!confirm("마켓운영자 신청을 하시겠습니까 ?")) {
					return;
				}
				authForm.find("[name='authority']").val("ROLE_MANAGER");
				authForm.attr('action', '/member/updateAuthResult');
				authForm.submit();
			})

		})
	</script>
<!-- 스크립트 종료-->

<%@ include file="../include/footer.jsp"%>

