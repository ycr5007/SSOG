<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<link rel="stylesheet" href="/resources/css/formctrl.css">

<section class="bg-dark">
	<div id="findId" style="overflow:auto; width:auto; height:550px; color: white; padding: 50px 50px 50px 50px">
	    <div class="container border-0 bg-dark" style="width:300px; height:420px;  align-content: center; padding-top: 50px">
	      <h1>아이디 찾기</h1>
	      <form action="/member/findId" method="post">
	        <div class="txt_field">
	          <input type="text" name="userName" id="userName" placeholder="Name" required />
	        </div>
	        <div class="txt_field">
	          <input type="email" name="userMail" id="userMail" placeholder="Email" required />
	        </div>
	        <input type="submit" value="아이디 찾기" />
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
			var nameLength = $('#userName').val().length;
			var mailLength = $('#userMail').val().length;
			if(nameLength == 0) {
				alert('이름을 입력해주세요.');
				return false;
			}
			if(mailLength == 0) {
				alert('이메일을 입력해주세요.');
				return false;
			}
		});
	});
</script>
<!--  스크릡트 종료-->
<%@ include file="../include/footer.jsp" %>