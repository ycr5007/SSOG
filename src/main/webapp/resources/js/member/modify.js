	/**
 * register.html 폼 유효성 검증
 * jquery validation plug-in 사용
 */
$(function () {
	$("#regist2").validate({
    //rules 정하기-유효성 검증 규칙 지정
    //폼 요소 이름 사용
    rules: {
            userPw: {
        validPwd: true,
      },
      userPwCheck: {
        validPwd: true,
        equalTo: "#userPw", //현재 요소가 어떤 요소랑 값이 같아야 하는가?(아이디 사용)
      },
    }, //rules 종료

    //규칙이 맞지 않을 경우 보여줄 메세지 작성
    messages: {
      userPw: {
        required: "비밀번호는 필수 입력 요소입니다.",
      },
      userPwCheck: {
        required: "비밀번호는 필수 입력 요소입니다.",
        equalTo: "이전 비밀번호와 다릅니다.",
      },

    errorPlacement:function(error,element){
   		$(element).closest("form")
                  .find("small[id='"+ element.attr('id') +"']")
                  .append(error);	
   			},
  		},
	})

	let registForm = $("#regist1");
	$(".update-user").click(function(){
		
		console.log(fileData);
		
		//첨부 파일 수집하기 => 첨부 파일이 있는 경우만
		
		str = "";
		if(fileData != undefined){
			str += '<input type="hidden" name="uuid" value="' + fileData[0].uuid + '" />';
			str += '<input type="hidden" name="uploadPath" value="' + fileData[0].uploadPath + '" />';
			str += '<input type="hidden" name="fileName" value="' + fileData[0].fileName + '" />';
			str += '<input type="hidden" name="no" value="' + userNo + '" />';
			console.log(str);
			registForm.append(str);			
		}
		
		registForm.attr("action", "/member/update");
		registForm.submit();
	})
});

$.validator.addMethod(
  "validId",
  function (data) {
    const regId = /^(?=.*[A-Za-z])(?=.*[0-9])[A-Za-z0-9]{6,12}$/;
    return regId.test(data);
  },
  "아이디는 영문자,숫자의 조합으로 6~12자리로 만들어야 합니다"
);

$.validator.addMethod(
  "validPwd",
  function (data) {
    const regPwd =
      /^(?=.*[A-Za-z])(?=.*[0-9])(?=.*[!@#$%^&*])[A-Za-z0-9!@#$%^&*]{8,15}$/;
    return regPwd.test(data);
  },
  "비밀번호는 영문자,숫자,특수문자의 조합으로 8~15자리로 만들어야 합니다"
);

$.validator.addMethod(
	"validPhone",
	function (data) {
		const regPhone = /^\d{3}-\d{3,4}-\d{4}$/;
		return regPhone.test(data);
		
	},
	"휴대폰 양식에 맞춰주세요"
);

$.validator.addMethod(
	"validMail",
	function (data){
		const regMail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		return regMail.test(data);
	}
)


$(".updatePw1").click(function(){
	$("#regist1").css("display", "none");	
	$("#regist2").css("display", "block");	
})

$(".update1").click(function(){
	$("#regist2").css("display", "none");	
	$("#regist1").css("display", "block");	
})
