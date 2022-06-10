<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>
  <head>
    <meta charset="UTF-8" />
    <title>회원가입</title>
        <!--<link rel="stylesheet" href="/resources/css/sign.css"> -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/jquery.validate.js"></script>
    <!-- resources 앞에 / 를 붙일때는 context path가 없는 경우일 때 -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="/resources/css/y.css">

    <link rel="stylesheet" href="/resources/css/y.css">
    <!-- validation 사용자 작성 코드 삽입-->
    <script src="/resources/js/register.js"></script>
  </head>
  <body style="background-color: #f5f5f5">
    <div class="container" style="margin-top: 40px">
      <form id="regist" method="post" action="/member/regist">
        <div class="form-group row justify-content-center">
          <label for="userid" class="col-sm-2 col-form-label">아이디</label>
          <div class="textForm">
            <input
              type="text"
              name="userId"
              id="userId"
              class="form-control"
              placeholder="아이디를 입력하세요"
            />
            <small id="userId" class="text-info"></small>
          </div>
        </div>
        <div class="form-group row justify-content-center">
          <label for="pass1" class="col-sm-2 col-form-label">비밀번호</label>
          <div class="textForm">
            <input
              type="password"
              name="userPw"
              id="userPw"
              class="form-control"
              placeholder="비밀번호를 입력하세요"
            />
            <small id="userPwd" class="text-info"></small>
          </div>
        </div>
        <div class="form-group row justify-content-center">
          <label for="pass2" class="col-sm-2 col-form-label"
            >비밀번호 확인
          </label>
          <div class="textForm">
            <input
              type="password"
              name="userPwCheck"
              id="userPwCheck"
              class="form-control"
              placeholder="비밀번호를 다시 입력하세요"
            />
            <small id="userPwCheck" class="text-info"></small>
          </div>
        </div>
        <div class="form-group row justify-content-center">
          <label for="name" class="col-sm-2 col-form-label">이름 </label>
          <div class="textForm">
            <input
              type="text"
              name="userName"
              id="userName"
              class="form-control"
              placeholder="이름을 입력하세요"
            />
            <small id="userName" class="text-info"></small>
          </div>
        </div>
        <div class="form-group row justify-content-center">
          <label for="phone" class="col-sm-2 col-form-label">핸드폰 </label>
          <div class="textForm">
              <input
                type="text"
                id="userPhone"
                name="userPhone"
                class="form-control"
                placeholder="010 xxxx xxxx"
              />
              <small id="userPhone" class="text-info"></small>
          </div>
        </div>
   		<div class="form-group row justify-content-center">
          <label for="email" class="col-sm-2 col-form-label">이메일</label>
          <div class="textForm">
            <input
              type="email"
              name="userMail"
              id="userMail"
              class="mail_input"
              placeholder="example@gmail.com"
            />
            <small id="userMail" class="text-info"></small>
          </div>
        </div>
        <div class="form-group row justify-content-center">
            <div class="mail_input_box_warn">	</div>
				<div class="textForm">
					<div class="mail_check_input_box" id="mail_check_input_box_false">
						<input class="mail_check_input" disabled="disabled">
					</div>
					<div class="mail_check_button">
						<span>인증번호 전송</span>
					</div>
					<div class="clearfix"></div>
						<span id="mail_check_input_box_warn"></span>
				</div>
				
		</div>
        <div class="form-group text-center">
          <button type="submit" class="btn btn-primary">가입하기</button>
          <button type="reset" class="btn btn-secondary">취소</button>
        </div>
     </form>
     </div>
<script>
var code = ""; // 인증번호 저장

$(".mail_check_button").click(function(){

	var userMail = $(".mail_input").val(); 	// 입력한 이메일
	var checkBox = $(".mail_check_input");		// 인증번호 입력란
	var boxWrap = $(".mail_check_input_box");	// 인증번호 입력란 박스
	
	console.log(userMail);
	

	
	$.ajax({
		
		type: "GET",
		url: "mailCheck?userMail= " + userMail,
		success:function(data){
		
			// console.log("data :" + data);
			checkBox.attr("disabled",false);
			boxWrap.attr("id","mail_check_input_box_true");
			code = data;
			
		}	
	});

});

//인증번호 비교
$(".mail_check_input").blur(function(){
	
	var inputCode = $(".mail_check_input").val();		// 입력코드
	var checkResult = $("#mail_check_input_box_warn");	// 비교결과
	
	//console.log("inputCode : " + inputCode);
	
	if(inputCode == code){
		checkResult.html("인증번호가 일치합니다");
		checkResult.attr("class","correct");
	}else{
		checkResult.html("인증번호를 다시 확인해주세요");
		checkResult.attr("class","incorrect");
	}
	
});


</script>

</body>

</html>


