<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<link rel="stylesheet" href="/resources/css/formctrl.css">
<link rel="stylesheet" href="/resources/css/upload.css">


<!-- 콘텐츠 시작 -->
<section class="bg-dark">
	<div id="bodystyle" style="overflow:auto; width:auto; height:550px; color: white; ">      	
		<div class="container border-0 bg-dark" style="width:550px; height:auto; align-content: center; padding: 10px 10px 10px 10px" >
				<img src="../resources/img/mypagelogo.png"/>
				
				<!-- seller or manager -->
				<div class="mb-3" style="text-align:center;">
					<sec:authorize access="!hasAnyRole({'ROLE_SELLER','ROLE_MANAGER','ROLE_ADMIN'})">
						<button type="button" class="btn btn-primary send-data">SELLER</button>
						<button type="button" class="btn btn-success send-data">MANAGER</button>
						<button type="button" class="btn btn-danger updatePw1" >비밀번호변경</button>
						<button type="button" class="btn btn-warning update1" >기타정보수정</button>
					</sec:authorize>
				</div>
				
				<form id="regist1" method="post" action="" role="form">
			        <!-- 아이디 -->
			        <sec:csrfInput/>
			        <div class="form-group row justify-content-center">
			          <label for="userid" class="col-sm-5 col-form-label">아이디</label>
			          <div class="textForm col-sm-7">
							<input type="text" name="userId" id="userId" class="form-control"
								value='<sec:authentication property="principal.username"/>'
								readonly />
							<small id="userId" class="text-info"></small>
			          </div>
			        </div>
					
			        <!-- 이름 -->
			        <div class="form-group row justify-content-center">
			          <label for="name" class="col-sm-5 col-form-label">이름 </label>
			          <div class="textForm col-sm-7">
							<input type="text" name="userName" id="userName" class="form-control"
								value='<c:out value="${user.userName }"  />' readonly />
							<small id="userName" class="text-info"></small>
						</div>
					</div>
					
			        <!-- 핸드폰 -->
			        <div class="form-group row justify-content-center">
			          <label for="phone" class="col-sm-5 col-form-label">핸드폰 </label>
			          <div class="textForm col-sm-7">
							<input type="text" name="userPhone" id="userPhone" class="form-control"
								value='<c:out value="${user.userPhone }" />' readonly  />
							<small id="userPhone" class="text-info"></small>
						</div>
					</div>
					
			        <!-- 이메일 -->
			        <div class="form-group row justify-content-center">
			          <label for="email" class="col-sm-5 col-form-label">이메일 </label>
			          <div class="textForm col-sm-7">
							<input type="text" name="userMail" id="userMail" class="form-control"
								value='<c:out value="${user.userMail }"  />' readonly />
							<small id="userMail" class="text-info"></small>
						</div>
					</div>
	
			        <!-- 주소 -->
					<div class="form-group row justify-content-center">
							<label for="adress" class="col-sm-5 col-form-label">
								<button type="button" class="btn btn-info" onClick="goPopup();">주소변경</button>
							</label>
					<!--  <label for="email" class="col-sm-5 col-form-label">주소 </label> -->
						<div class="textForm col-sm-7">
							<input type="text" name="userAddress" id="userAddress" class="form-control"
							value='<c:out value="${user.userAddress }"  /> ' />
							<small id="userAddress" class="text-info"></small>
						</div>
					</div>

				<!-- 프로필 -->		
			        <div class="form-group row justify-content-center mb-2">
						<label for="userprofile" class="col-sm-5 col-form-label">프로필</label>
						<div class="textForm col-sm-7">
							<input type="text" name="userProfile" id="userProfile" class="form-control"
								style="width:299px; height:150px;"
								value='<c:out value="${user.userProfile }"  />' /> 
							<small id="userProfile" class="text-info"></small>
						</div>
					</div>
				<!-- 프로필 사진 업로드 -->
					<div class="form-group row justify-content-center mb-2">
						<label for="userprofile" class="col-sm-5 col-form-label">파일업로드</label>
						<div class="textForm col-sm-7 mb-2">
							<input type="file" name="uploadFile" class="custom-file-input" id="customFileLangHTML">
							<label class="custom-file-label" for="customFileLangHTML" data-browse="파일찾기"></label>
							<div class="card-body">
								<h5 class="card-title text-center">업로드 사진</h5>
								<div class="card-text text-center uploadResult">
									<ul></ul>
								</div>
							</div>
						</div>
					</div>
			        <!-- 정보수정 회원탈퇴 -->
					<div class="pb-2" style="text-align:center;">
						<button type="button" class="btn btn-secondary send-data update-user">정보수정</button>
						<button type="button" class="btn btn-danger" data-toggle="modal" data-target="#exampleModal">회원탈퇴</button>
					</div>
			</form>
			
			<form id="regist2" method="post" action="updatePw" role="form" style="display:none">
			        <!-- 아이디 -->
			        <sec:csrfInput/>
			        <div class="form-group row justify-content-center">
			          <label for="userid" class="col-sm-5 col-form-label">아이디</label>
			          <div class="textForm col-sm-7">
							<input type="text" name="userId" id="userId" class="form-control"
								value='<sec:authentication property="principal.username"/>'
								readonly />
							<small id="userId" class="text-info"></small>
			          </div>
			        </div>
			        
				        <!-- 비밀번호 -->					
				        <div class="form-group row justify-content-center">
				          	<label for="pass1" class="col-sm-5 col-form-label">새 비밀번호</label>
				        	<div class="textForm col-sm-7">
								<input type="password" name="userPw" id="userPw"
									class="form-control" placeholder="변경할 비밀번호를 입력하세요" /> 
								<small id="userPw" class="text-info"></small>
							</div>
						</div>
						
						 <!-- 비밀번호확인 -->					
				        <div class="form-group row justify-content-center">
				          <label for="pass1" class="col-sm-5 col-form-label">새 비밀번호 확인</label>
				         	<div class="textForm col-sm-7">
								<input type="password" name="userPwCheck" id="userPwCheck"
									class="form-control" placeholder="변경할 비밀번호를 입력하세요" /> 
								<small id="userPwCheck" class="text-info"></small>
								<button class="checkPw" style="background-color:yellow; float:right;">변경</button>
							</div>	
						</div>

			</form>
				
			<%-- <form action="" method="post" id="authForm">
					<input type="hidden" name="userId"
						value='<sec:authentication property="principal.username"/>' />
					<input type="hidden" name="authority" value="" />
			</form> --%>
			
					
		</div>
	</div>
<!-- 회원비활성화 Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">회원 비활성화</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
        <form action="leaveResult" method="post">
      <div class="modal-body">
        	<div class="form-group">
        		<input type="text" name="userId" id="userId" class="form-control" readonly value="${user.userId }" />
        	</div>
        	<div class="form-group">
        		<p>회원을 비활성화 하시겠습니까?</p>
        	</div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
        <button type="submit" class="btn btn-danger">비활성화</button>
      </div>
        </form>
    </div>
  </div>
</div>
</section>
<!-- 콘텐츠 종료 -->


<!-- 스크립트 -->
	<script>
		let section = "user";
		let userNo = "${user.userNo}";
	</script>
	<script src="/resources/js/util/upload.js"></script>
	<script>
		$(function() {
			let authForm = $("#authForm")

			$(".btn-primary").click(function() {
				if (!confirm("판매자 신청을 하시겠습니까 ?")) {
					return;
				}
				authForm.find("[name='authority']").val("ROLE_SELLER");
				authForm.attr('action', '/member/updateAuthResult');
				authForm.submit();
			})

			$(".btn-success").click(function() {
				if (!confirm("마켓운영자 신청을 하시겠습니까 ?")) {
					return;
				}
				authForm.find("[name='authority']").val("ROLE_MANAGER");
				authForm.attr('action', '/member/updateAuthResult');
				authForm.submit();
			})

		})
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
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/jquery.validate.js"></script>
<script src="/resources/js/member/modify.js"></script>
<!-- 스크립트 종료-->

<%@ include file="../include/footer.jsp"%>

