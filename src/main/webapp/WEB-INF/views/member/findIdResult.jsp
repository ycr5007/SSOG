<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/jquery.validate.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/css/y.css">
<section>
  <div class="row">
    <div class="col d-flex flex-column align-items-center justify-content-center">
      <h2 class="mb-5">아이디 찾기</h2>
      <c:if test="${!empty userId }">
	      <p>조회하신 아이디는 <span class="id-result">${userId}</span>입니다.</p>
      </c:if>
      <c:if test="${empty userId }">
	      <p>아이디 조회 결과가 없습니다.</p>
      </c:if>
  
      <div class="underline mt-4">
        <a href="findPw">비밀번호 찾기</a>
      </div>
  
      <div class="btn-group-vertical mt-3">
        <button type="button" class="btn btn-third w-100" onclick="location.href='/member/signIn'">로그인</button>
      </div>
    </div>
  </div>
</section>