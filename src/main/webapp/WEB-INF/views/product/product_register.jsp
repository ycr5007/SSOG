<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@ include file="../include/product_header.jsp"%>
<script src="/resources/js/jquery.min.js"></script>
<style>
	.custom-form{
	display: inline-block;
	margin-right: 50px;
	}
</style>
<!-- content 시작 -->
<div class="container-fluid">

	<div class="row">
		<div class="col-lg-12">
			<h2 class="page-header">장터 신청 및 상품 등록</h2>
		</div>
	</div>

		<div class="form-group">
			<form action="/product/product_register" method="post" role="form">
				<div class="form-group"">
					<label>판매자</label>
					<input class="form-control" name="seller" value=<%-- '<sec:authentication property="principal.username"/>' --%>"${userName}"	readonly>
				</div>
				<div class="form-group"">
					<label>장터</label>
					<input class="form-control" name="market" value=<%-- '<sec:authentication property="principal.username"/>' --%>"${marketName}"	readonly>
				</div>
				
				<div class="form-group"">
						<div class="custom-form">
							<label>상품 카테고리</label>
							<select class="category1" name="categoryNo">
								<option value="">----</option>
								<option value="1">패션잡화</option>
								<option value="2">의류</option>
								<option value="3">푸드</option>
								<option value="4">캔들/디퓨저/방향제</option>
								<option value="5">문구/팬시</option>
								<option value="6">향수/화장품/뷰티</option>
								<option value="7">기타</option>
							</select> 
						</div>
						
						<div class="custom-form">
							<label>상품 수량</label>
							
							<input type="radio" name="productQN" value="50" checked/>50&nbsp;&nbsp;&nbsp;
							<input type="radio" name="productQN" value="100"/>100&nbsp;&nbsp;&nbsp;
							<input type="radio" name="productQN" value="150"/>150
						</div>
						<button type="button" class="btn btn-primary" id="addProductBtn">상품 추가</button>
				</div>

			<div class="form-group">
				<label>상품명</label>
				<input class="form-control" name="productName">
			</div>
			

			<div class="form-group">
				<label>상품설명</label>
				<textarea class="form-control" rows="5" name="productContent" style="resize: none"></textarea>
			</div>

			<div class="form-group">
				<label>상품가격</label>
				<input type="text" name="productPrice" id="productPrice" class="form-control"/>
			</div>

			

			<!-- 상품이미지 -->
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading">상품 이미지 등록</div>
						<div class="panel-body">
							<div class="form-group uploaddiv">
								<input type="file" name="uploadFile" id="" multiple />
							</div>
						</div>
					</div>
				</div>
			</div>		
			<div class="row">
			<div class="col-lg-12">
			<!-- 상품 추가시 추가되는 테이블 -->
			
			<table class="table table-bordered" style="display:none">
				<thead>
				    <tr>
				      <th scope="col">카테고리</th>
				      <th scope="col">상품 수량</th>
				      <th scope="col">상품명</th>
				      <th scope="col"> # </th>
				    </tr>
			  	</thead>
				<tbody>
				<!-- 스크립트 동작 -->
				</tbody>	
			</table>
			</div><!--  -->	
			</div><!-- table 감싸기 -->
			<input type="hidden" name="marketNo" value="${marketNo}" />
			<input type="hidden" name="userNo" value="${userNo }"/>
			
			<button type="submit" class="btn btn-warning" id="registerBtn">등록</button>
			<button type="button" class="btn btn-danger" id="deleteBtn">취소</button>
		</form>
	</div>
</div>						
<!-- content 종료 -->
<script>
$(function(){
	$(".btn-danger").click(function(){
		location.href="/product/product_list";
	})
})
</script>






<script src="/resources/js/product_register.js"></script>
<%@ include file="../include/manager_footer.jsp"%>