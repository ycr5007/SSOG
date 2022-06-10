<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/jquery.validate.js"></script>
<script>
	$(function(){
		$('form').submit(function(){
			var idLength = $('#userId').val().length;
			var mailLength = $('#userMail').val().length;
			if(idLength == 0) {
				alert('아이디를 입력해주세요.');
				return false;
			}
			if(mailLength == 0) {
				alert('이메일을 입력해주세요.');
				return false;
			}
		});
	});
</script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/css/y.css">
<form action="" method="POST">
<section>
  <div class="row">
    <div class="col d-flex flex-column align-items-center justify-content-center">
      <h2 class="mb-5">비밀번호 찾기</h2>
      <input type="text" id="userId" name="userId" placeholder="아이디" class=" p-2" style="width: 300px;"><br>
      <input type="email" id="userMail" name="userMail" placeholder="가입시 입력한 이메일" class="p-2" style="width: 300px;">
  
      <div class="btn-group-vertical mt-3">
        <button type="submit" class="btn btn-third w-100">비밀번호 찾기</button>
      </div>
    </div>
    
  </div>
</section>
</form>
