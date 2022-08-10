<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<link rel="stylesheet" href="/resources/css/formctrl.css">

<section class="bg-dark">
	<div id="pwCheck" style="overflow:auto; width:auto; height:550px; color: white; padding: 50px 50px 50px 50px">
	    <div class="container border-0 bg-dark" style="width:300px; height:420px;  align-content: center; padding-top: 50px">
	      <h1>탈퇴 확인</h1>
	      <form action="myPagePwCheck" method="post"  style="padding-top: 20px">
	        <div class="mt-4">
	        	<div class="txt_field mb-4">
		          <input type="text" name="userId" id="userId"  style="text-align:center; font-size:50px;" value='<sec:authentication property="principal.username"/>' />	        	
	        	</div>
	        	<div class="txt_field mb-4">
		          <input type="password" name="userPw" id="userPw" placeholder="비밀번호" style="text-align:center; font-size:35px;"/>        	
	        	</div>
	        </div>
	         <button type="submit" class="btn btn-secondary col-sm-8" id="checkPw">확인</button>
	         <input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
	      </form>
	    </div>
	</div>
</section>


<!--  스크릡트 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/jquery.validate.js"></script>
<script>
	$(function(){
		$('form').submit(function(){
			var userPw = $('#userPw').val();
			var pwLength = userPw.length;
			if(pwLength == 0) {
				alert('비밀번호를 입력해주세요.');
				return false;
			}			
		});
	});
</script>
<!--  스크릡트 종료-->

<%@ include file="../include/footer.jsp" %>