	/**
 * register.html 폼 유효성 검증
 * jquery validation plug-in 사용
 */
$(function () {
  $("#regist").validate({
    //rules 정하기-유효성 검증 규칙 지정
    //폼 요소 이름 사용
    rules: {
      userId: {
        required: true,
        validId: true,
      },
      userPw: {
        required: true,
        validPwd: true,
      },
      userPwCheck: {
        required: true,
        validPwd: true,
        equalTo: "#userPw", //현재 요소가 어떤 요소랑 값이 같아야 하는가?(아이디 사용)
      },
	  userName:{
		required: true,
	  },
      userPhone: {
        required: true,
		validPhone: true,
      },
      userMail: {
        required: true,
        email: true,
		validMail: true,
        remote:{  //ajax
			url:'/member/checkMail',
			type:'post',
			data:{
				email:function(){
					return $("#userMail").val();
				}
			}
		}
      },
      userAddress: {
      	required: true,
	  },
    }, //rules 종료

    //규칙이 맞지 않을 경우 보여줄 메세지 작성
    messages: {
      userId: {
        required: "아이디는 필수 입력 요소입니다.",
		remote:"아이디는 사용 중입니다."
      },
      userPw: {
        required: "비밀번호는 필수 입력 요소입니다.",
      },
      userPwCheck: {
        required: "비밀번호는 필수 입력 요소입니다.",
        equalTo: "이전 비밀번호와 다릅니다.",
      },
	  userName: {
        required: "이름은 필수 입력 요소입니다.",
      },
      userPhone: {
        required: "핸드폰은 필수 입력 요소입니다.",
      },
      userMail: {
        required: "이메일은 필수 입력 요소입니다.",
        remote: "이메일은 사용 중입니다.",
        email: "이메일 형식을 확인해 주세요",
      }
     
    },

    errorPlacement:function(error,element){
   		$(element).closest("form")
                  .find("small[id='"+ element.attr('id') +"']")
                  .append(error);	
    },
  });
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

