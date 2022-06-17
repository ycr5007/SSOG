<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
<script src="/resources/js/jquery.min.js"></script>
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
      <td class="form-buyer">곽승환</td>
    </tr>
    <tr>
      <th scope="row">이메일</th>
      <td class="form-mail" data-order="hihi@naver.com">ksh7353@naver.com</td>
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
      <td class="form-name" data-order="ㅂㅇㅂㅇ">ㅂㅇㅂㅇ</td>
    </tr>
    <tr>
      <th scope="row">배송주소</th>
      <td class="form-addr" data-order="서울 중구">서울 중구 </td>
    </tr>
    <tr>
      <th scope="row">연락처</th>
      <td class="form-phone" data-order="010-1234-1234">010-1234-1234</td>
    </tr>
    <tr>
      <th scope="row">요청사항</th>
      <td class="form-request" data-order="ㅎㅇㅎㅇ">문앞에 놔둬주세요</td>
    </tr>
  </tbody>
</table>
<table class="table">
  <thead class="thead-light">
    <tr>
      <th scope="col">결제 상품 정보</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th scope="row">상품명</th>
      <td>${product.productName}</td>
    </tr>
    <tr>
      <th scope="row">수량</th>
      <td>${orderQN}</td>
    </tr>
    <tr>
      <th scope="row">결제 금액</th>
      <td class="form-pay" data-order="<fmt:parseNumber value ="${(product.productPrice - (product.productPrice*product.productSale * 0.01))* orderQN}" integerOnly= "true" />"><fmt:parseNumber value ="${(product.productPrice - (product.productPrice*product.productSale * 0.01))* orderQN}" integerOnly= "true" />원</td>
    </tr>
  </tbody>
</table>
<button type="button" class="btn btn-primary">결제</button>

<form action="/shop/iamport" method="post" id="orderForm">
	
</form>

<script>
	$(function(){
		let name = $(".form-name").data("order");
		let mail = $(".form-mail").data("order");
		let phone = $(".form-phone").data("order");
		let addr = $(".form-addr").data("order");
		let request = $(".form-request").data("order");	
		let orderPay = $(".form-pay").data("order");	
		let orderForm = $("#orderForm");
		
		$(".btn-primary").click(function(){
			
			console.log(name);
			console.log(mail);
			console.log(phone);
			console.log(addr);
			console.log(request);
			console.log(orderPay);
			str = ""
			str += '<input type="hidden" name="userName" value="' + name + '" />';
			str += '<input type="hidden" name="userMail" value="' + mail + '" />'
			str += '<input type="hidden" name="userPhone" value="' + phone + '" />'
			str += '<input type="hidden" name="userAddress" value="' + addr +'" />'
			str += '<input type="hidden" name="orderPay" value="' + orderPay + '" />'
			
			
			orderForm.append(str);
			orderForm.submit();
		})
		
		$(".form-name").click(function(){
			var change_data = prompt("변경할 이름을 입력해주세요");
			let formName = $(".form-name");
			formName.text(change_data);
			formName.attr("data-order", change_data);
		})

		$(".form-addr").click(function(){
			var change_data = prompt("변경할 배송주소 입력해주세요");
			let formName = $(".form-addr");
			formName.text(change_data);
			formName.attr("data-order", change_data);
		})
		$(".form-phone").click(function(){
			var change_data = prompt("변경할 번호를 입력해주세요");
			let formName = $(".form-phone");
			formName.text(change_data);
			formName.attr("data-order", change_data);
		})
		$(".form-request").click(function(){
			var change_data = prompt("변경할 요청사항을 입력해주세요");
			let formName = $(".form-request");
			formName.text(change_data);
			formName.attr("data-order", change_data);
		})
	})
</script>



<%@ include file="../include/footer.jsp" %>