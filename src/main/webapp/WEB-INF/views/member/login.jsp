<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<link rel="stylesheet" href="/resources/css/formctrl.css">

<section class="bg-dark">
	<div id="bodystyle" style="overflow:auto; width:auto; height:550px; color: white; padding: 50px 50px 50px 50px">      	
		<div class="container border-0 bg-dark" style="width:400px; height:420px;  align-content: center">
			<form action="login" method="post">
				<img src="../resources/img/login_logo.png"/>
		        <div class="txt_field">
		          <input type="text" name="username" id="username" placeholder="아이디" required />
		        </div>
		        <div class="txt_field">
		          <input type="password" name="password" id="password" placeholder="비밀번호" required />
		        </div>
		        <div>
		        	<a class="pass" href="findId">아이디찾기</a> / 
		        	<a class="pass" href="findPw">비밀번호찾기</a>
		        </div>
		        <input type="submit" value="Login" />
		        <input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
		        <div class="signup_link">회원이 아니신가요? <a href="/member/signUp1">회원가입</a></div>
			</form>
	    </div>
	</div>
</section>     
     

<!-- script css 시작 -->

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/jquery.validate.js"></script> 
 
<script>
	let msg = "${msg}";
	if(msg != ""){
		alert(msg);
	}
	
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

<%@ include file="../include/footer.jsp" %>