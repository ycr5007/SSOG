<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
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

<link rel="stylesheet" href="/resources/css/y.css">
<div class="wrapper">
    <div class="center">
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

<%@ include file="../include/footer.jsp" %>