<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/jquery.validate.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/css/y.css">
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
<form action="myPageEdit" method="POST">
<section>
  <div class="row">
    <div class="col d-flex flex-column align-items-center justify-content-center">
      <h2 class="mb-5">비밀번호 재확인</h2>
      <span>안전한 사용을 위해 비밀번호를 다시 한 번 입력해주세요.</span><br>
      <script>
      </script>
  	  <input type="text" id="userId" name="userId" value="${userId}" class="p-2" style="width: 300px;" readonly /><br>
      <input type="password" id="userPw" name="userPw" placeholder="비밀번호" class="p-2" style="width: 300px;">
      <div class="btn-group-vertical mt-3">
        <button type="submit" id="checkPw" class="btn btn-third w-100">비밀번호 확인</button>
      </div>
    </div>
    
  </div>
</section>
</form>