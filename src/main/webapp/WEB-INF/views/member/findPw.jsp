<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
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
<link rel="stylesheet" href="/resources/css/y.css">
<section class="bg-dark">
	<div id="login1"
		style="overflow: auto; width: auto; height: 550px; color: white; padding: 50px 50px 50px 50px">
		<div class="center card mb-1 border-0 bg-dark"
			style="width: auto; height: 420px; align-content: center">
			<h1>비밀번호 찾기</h1>
			<form action="/member/findPw" method="post">
				<div class="txt_field">
					<input type="text" name="userId" id="userId" placeholder = "아이디" required/>
				</div>
				<div class="txt_field">
					<input type="email" name="userMail" id="userMail"
						class="pwmail_input" placeholder = "이메일" required />
					<small id="userMail" class="text-info"></small>
				</div>
				<div class="form-group row justify-content-center">
					<div class="pw_input_box_warn"></div>
					<div class="textForm">
						<div class="pw_check_input_box" id="pw_check_input_box_false">
							<input class="pw_check_input" disabled="disabled">
						</div>
						<div class="pw_check_button">
							<span>임시 비밀번호 발급</span>
						</div>
						<div class="clearfix"></div>
						<span id="pw_check_input_box_warn"></span>
					</div>
				</div>
				<input type="submit" value="임시비밀번호">
				</button>
				<input type="hidden" name="${_csrf.parameterName }"
					value="${_csrf.token }" />
			</form>
		</div>
	</div>
</section>


<script>
	var code = ""; // 인증번호 저장

	$(".pw_check_button").click(function() {

		var userMail = $(".pwmail_input").val(); // 입력한 이메일
		var checkBox = $(".pw_check_input"); // 인증번호 입력란
		var boxWrap = $(".pw_check_input_box"); // 인증번호 입력란 박스

		console.log(userMail);

		$.ajax({

			type : "GET",
			url : "pwMail?userMail= " + userMail,
			success : function(data) {

				// console.log("data :" + data);
				checkBox.attr("disabled", false);
				boxWrap.attr("id", "pw_check_input_box_true");
				code = data;

			}
		});

	});

	//인증번호 비교
	$(".pw_check_input").blur(function() {

		var inputCode = $(".pw_check_input").val(); // 입력코드
		var checkResult = $("#pw_check_input_box_warn"); // 비교결과

		//console.log("inputCode : " + inputCode);

		if (inputCode == code) {
			checkResult.html("인증번호가 일치합니다");
			checkResult.attr("class", "correct");
		} else {
			checkResult.html("인증번호를 다시 확인해주세요");
			checkResult.attr("class", "incorrect");
		}

		console.log(checkResult.attr("class"));
		if (checkResult.attr("class") == "incorrect") {
			$(".send-data").attr("disabled", "disabled");
		}
	});
</script>
<%@include file="../include/footer.jsp"%>
