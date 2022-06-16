<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<link rel="stylesheet" href="/resources/css/formctrl.css">

<section class="bg-dark">
	<div id="findId" style="overflow:auto; width:auto; height:550px; color: white; padding: 50px 50px 50px 50px">
	    <div class="container border-0 bg-dark" style="width:300px; height:420px;  align-content: center; padding-top: 50px">
			<h1>비밀번호 찾기</h1>
			<form action="/member/findPwResult" method="post">
				<div class="txt_field">
					<input type="text" name="userId" id="userId" placeholder = "아이디" required/>
				</div>
				<div class="txt_field">
					<input type="email" name="userMail" id="userMail"
						class="pwmail_input" placeholder = "이메일" required />
					<small id="userMail" class="text-info"></small>
				</div>
				
				<input type="submit" value="임시비밀번호 발급" />
				<input type="hidden" name="${_csrf.parameterName }"
					value="${_csrf.token }" />
			</form>
		</div>
	</div>
</section>


<!--  스크릡트 -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/jquery.validate.js"></script>
<script>
	$(function() {
		$('form').submit(function() {
			var idLength = $('#userId').val().length;
			var mailLength = $('#userMail').val().length;
			if (idLength == 0) {
				alert('아이디를 입력해주세요.');
				return false;
			}
			if (mailLength == 0) {
				alert('이메일을 입력해주세요.');
				return false;
			}
		});
	});
</script>
<script>
let csrfHeaderName = "${_csrf.headerName}";
let csrfTokenValue = "${_csrf.token}";

	var code = ""; // 인증번호 저장

	$(".pw_check_button").click(function() {

		var userMail = $(".pwmail_input").val(); // 입력한 이메일
		var checkBox = $(".pw_check_input"); // 인증번호 입력란
		var boxWrap = $(".pw_check_input_box"); // 인증번호 입력란 박스

		console.log(userMail);

		$.ajax({

			type : "POST",
			url : "pwMail?userMail= " + userMail,
			beforeSend : function(xhr){
				xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
			},
			success : function(data) {

				// console.log("data :" + data);
				checkBox.attr("disabled", false);
				boxWrap.attr("id", "pw_check_input_box_true");
				code = data;

			}
		});

	});

</script>
<!--  스크릡트 -->
<%@include file="../include/footer.jsp"%>
