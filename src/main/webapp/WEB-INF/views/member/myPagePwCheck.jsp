<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
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
<link rel="stylesheet" href="/resources/css/y.css">
<div class="wrapper">
    <div class="center">
      <h2>비밀번호 재확인</h2>
      <form action="myPagePwCheck" method="post">
        <div class="txt_field">
          <input type="text" name="userId" id="userId" value='<sec:authentication property="principal.username"/>' />
          <input type="password" name="userPw" id="userPw" placeholder="비밀번호"  />
        </div>
        <button type="submit" id="checkPw">비밀번호 확인</button>
         <input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
      </form>
    </div>
</div>
<%@ include file="../include/footer.jsp" %>