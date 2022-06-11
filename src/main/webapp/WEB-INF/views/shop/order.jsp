<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>쏠마켓</title>
<link rel="stylesheet" href="/resources/css/bootstrap.min.css" />
<style>
	th{
	width: 150px;
	font-size: 16px;
	}
</style>
</head>
<body>
	<div class="nognb">
		<div class="logo">
			<a id="headerLogo" class="icon" href="/shop/index"> <img
				src="/resources/img/ssol_logo.png" alt="쏠마켓">
			</a>
		</div>
	</div>
	<table class="table">
  <thead class="thead-light">
    <tr>
      <th scope="col">구매자 정보</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th scope="row">이름</th>
      <td>${user.userName}</td>
    </tr>
    <tr>
      <th scope="row">이메일</th>
      <td>${user.userMail}</td>
    </tr>
  </tbody>
</table>

<table class="table">
  <thead class="thead-light">
    <tr>
      <th scope="col">받는사람정보</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th scope="row">이름</th>
      <td>${user.userName}</td>
    </tr>
    <tr>
      <th scope="row">배송주소</th>
      <td>${user.userAddress}</td>
    </tr>
    <tr>
      <th scope="row">연락처</th>
      <td>${user.userPhone}</td>
    </tr>
    <tr>
      <th scope="row">요청사항</th>
      <td>문앞에 놔둬주세요</td>
    </tr>
  </tbody>
</table>
<button type="button" class="btn btn-primary">결제</button>




<%@ include file="../include/footer.jsp" %>