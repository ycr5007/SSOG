<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../include/header.jsp" %>
<link rel="stylesheet" href="/resources/css/formctrl.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/jquery.validate.js"></script>


<section class="bg-dark">
	<div id="findId" style="overflow:auto; width:auto; height:550px; color: white; padding: 50px 50px 50px 50px">
	    <div class="container border-0 bg-dark" style="width:300px; height:420px;  align-content: center; padding-top: 50px">
      <h3>아이디 찾기 결과</h3>
      <br>
        <div class="txt_field">
        	<c:if test="${!empty userId }">
	      		<p>조회하신 아이디는 <span class="id-result">${userId}</span>입니다.</p>
     		</c:if>
      		<c:if test="${empty userId }">
	      		<p>아이디 조회 결과가 없습니다.</p>
      		</c:if>
      	</div>
      	<br>
      	<button type="button" class="btn btn-secondary" onclick="location.href='/member/findPw'">비밀번호찾기</button>
      	<button type="button" class="btn btn-secondary" onclick="location.href='/member/login'">로그인</button>
      	<button type="button" class="btn btn-secondary" onclick="location.href='/member/findId'">뒤로</button>

	    </div>
	</div>
</section>

<%@ include file="../include/footer.jsp" %>