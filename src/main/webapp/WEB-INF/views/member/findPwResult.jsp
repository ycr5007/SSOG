<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../include/header.jsp" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/jquery.validate.js"></script>
<link rel="stylesheet" href="/resources/css/y.css">

<div class="wrapper">
    <div class="center">
      <h3>비밀번호 찾기 결과</h3>
      <br>
        <div class="txt_field">
        	<c:if test="${!empty userPw }">
	      		<p>조회하신 비밀번호는 <span class="pw-result">${userPw}</span>입니다.</p>
     		</c:if>
      	</div>
      	<br>
      	<button type="button" onclick="location.href='/member/login'">로그인</button>
    </div>
</div>
<%@ include file="../include/footer.jsp" %>