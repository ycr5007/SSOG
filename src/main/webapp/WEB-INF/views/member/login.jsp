<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/jquery.validate.js"></script>
<script>
	$(function(){	
		
		// submit 전 이벤트
		$('form').submit(function(){	
			var idLength = $('#userId').val().length;
			var pwLength = $('#userPw').val().length;
			if(idLength == 0) {
				alert('아이디를 입력하세요.');
				return false;
			}
			if(pwLength == 0) {
				alert('비밀번호를 입력하세요.');
				return false;
			}
		});
	});
</script>

<link rel="stylesheet" href="/resources/css/y.css">
<div class="wrapper">
	<div class="center">
      <h1>SolMarket</h1>
      <form action="login" method="post">
        <div class="txt_field">
          <input type="text" name="username" id="username" placeholder="ID" required />
        </div>
        <div class="txt_field">
          <input type="password" name="password" id="password" placeholder="Password" required />
        </div>
        <div>
        	<a class="pass" href="findId">Forgot ID?</a> / 
        	<a class="pass" href="findPw">Forgot Password?</a>
        </div>
        <input type="submit" value="Login" />
        <input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
        <div class="signup_link">Not a member? <a href="#">Sign up</a></div>
      </form>
    </div>
</div>
<script>
$(function(){
	let error = ${error};
	if(!error){
		alert(error);
	}
})
</script>
<%@ include file="../include/footer.jsp" %>