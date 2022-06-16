<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<link rel="stylesheet" href="/resources/css/formctrl.css">
<!-- validation 사용자 작성 코드 삽입-->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/jquery.validate.js"></script>
<script>
<script src="/resources/js/register.js"></script>

<!-- 콘텐츠 시작 -->
<section class="bg-dark">
	<div id="bodystyle" style="overflow:auto; width:auto; height:600px; color: white; ">      	
		<div class="container border-0 bg-dark" style="width:550px; height:420px; align-content: center; padding: 10px 10px 10px 10px" >
				<img src="../resources/img/signup_logo.png"/>
				
				<form id="regist" method="post" action="/member/regist">
			        
			        <!-- 아이디 -->
			        <div class="form-group row justify-content-center">
			          <label for="userid" class="col-sm-5 col-form-label">아이디</label>
			          <div class="textForm col-sm-7">
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
			        
			        <!-- 비밀번호 -->
			        <div class="form-group row justify-content-center">
			          <label for="pass1" class="col-sm-5 col-form-label">비밀번호</label>
			          <div class="textForm col-sm-7">
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
			        
			        <!-- 비밀번호 확인 -->
			        <div class="form-group row justify-content-center">
			          <label for="pass2" class="col-sm-5 col-form-label"
			            >비밀번호 확인
			          </label>
			          <div class="textForm col-sm-7">
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
			        
			        <!-- 이름 -->
			        <div class="form-group row justify-content-center">
			          <label for="name" class="col-sm-5 col-form-label">이름 </label>
			          <div class="textForm col-sm-7">
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
			        
			        <!-- 핸드폰-->
			        <div class="form-group row justify-content-center">
			          <label for="phone" class="col-sm-5 col-form-label">핸드폰 </label>
			          <div class="textForm col-sm-7">
			              <input
			                type="text"
			                id="userPhone"
			                name="userPhone"
			                class="form-control"
			                placeholder="010 0000 0000"
			              />
			              <small id="userPhone" class="text-info"></small>
			          </div>
			        </div>
			        
			        <!-- 이메일 -->
			        <div class="form-group row justify-content-center">
			          <label for="email" class="col-sm-5 col-form-label">이메일 </label>
			          <div class="textForm col-sm-7">
			            <input
			              type="email"
			              name="userMail"
			              id="userMail"
			              class="form-control mail_input"
			              placeholder="example@mail.com"
			              required
			            />
			            <small id="userMail" class="text-info"></small>
			          </div>
			        </div>
			        
			        <!-- 인증번호 전송 -->
			        <div class="form-group row justify-content-center">
			        	<label for="confirmemail" class="mail_check_button col-sm-5 col-form-label">
									<button type="button" class="btn btn-info">인증번호전송</button>
			        	</label>			        	
						<div class="textForm col-sm-7">
			            	<div class="mail_input_box_warn form-control">	
								<div class="mail_check_input_box" id="mail_check_input_box_false">
									<input class="mail_check_input" disabled="disabled">
								</div>
								<div class="clearfix"></div>
									<span id="mail_check_input_box_warn"></span>
							</div>
						</div>
					</div>
					
					<!-- 주소검색 + 주소입력 -->
					<div class="form-group row justify-content-center">
						<label for="adress" class="col-sm-5 col-form-label">
							<button type="button" class="btn btn-info" onClick="goPopup();">주소검색</button>
						</label>
						<div class="textForm col-sm-7">
				        	<input type="text" name="userAddress" id="userAddress" class="form-control" placeholder="상세주소입력" required readonly>
			        	</div>
			        </div>
			        
			        <!-- 가입하기-->
			        <div class="form-group text-center">
			          <button type="submit" class="btn btn-primary send-data">가입하기</button>
			          <button type="reset" class="btn btn-secondary">취소</button>
			        </div>
			        <input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
			        
				</form>
			</div>
	     </div>     
</section>
<!-- 콘텐츠 종료 -->
     
     
<!-- 스크립트 시작 -->     
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
		
		console.log(checkResult.attr("class"));
		if(checkResult.attr("class")=="incorrect"){
			$(".send-data").attr("disabled","disabled");
		}
	});
</script>

<script>
    function goPopup(){
    	// 주소검색을 수행할 팝업 페이지를 호출합니다.
    	// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(https://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.

    	var pop = window.open("/member/jusoPopup","pop","width=570,height=420, scrollbars=yes, resizable=yes");
    }
    function jusoCallBack(roadFullAddr){

    	var addr = document.querySelector("#userAddress");
    	addr.value = roadFullAddr;
    }
</script>

<%@ include file="../include/footer.jsp" %>