<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ include file="../include/product_header.jsp"%>

<div class="container-fluid">

	<div class="row">
		<div class="col-lg-12">
			<h2 class="page-header">상품 수정</h2>
		</div>
	</div>
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="form-group">
					<form action="" method="post" role="form">

						<div class="form-group">
							<label>상품명</label>
							<input class="form-control" name="productName" value="${dto.productName}"<%-- '<sec:authentication property="principal.username"/>' --%> readonly>
						</div>

						<div class="custom-form">
							<label>상품 수량</label>
							<input type="radio" name="productQN"  value="50" />50&nbsp;&nbsp;&nbsp;
							<input type="radio" name="productQN" value="100" />100&nbsp;&nbsp;&nbsp;
							<input type="radio" name="productQN" value="150" />150
						</div>

						<div class="form-group">
							<label>상품설명</label>
							<textarea class="form-control" rows="5" name="productContent" style="resize: none">${dto.productContent}</textarea>
						</div>

						<div class="form-group">
							<label>상품가격</label>
							 <input type="text" name="productPrice" id="productPrice" class="form-control" value="${dto.productPrice}" />
						</div>
						
						<div class="form-group">
							<label>상품상태</label>
							 <input type="text" name="productStatus" id="productStatus" class="form-control" value="${dto.productStatus}" readonly/>
						</div>
	


						<button type="submit" class="btn btn-primary" id="modifyBtn">수정</button>
						<button type="button" class="btn btn-danger" id="deleteBtn">취소</button>
						
						<input type="hidden" value="${dto.productNo}" name="productNo" />
						<input type="hidden" value="${userNo}" name="userNo" />
						<input type="hidden" value="${pageDto.pageNum}" name="pageNum" />
						<input type="hidden" value="${pageDto.amount}" name="amount" />

					</form>
				</div>
			</div>
		</div>

	</div>
	<!-- row 종료 -->
</div>
<!-- <div class="container-fluid"> 종료 -->

<script>
$(function(){
	$(".btn-danger").click(function(){
		location.href="/product/product_list";
	})
})
</script>

<%@ include file="../include/manager_footer.jsp"%>