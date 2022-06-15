<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ include file="../include/product_header.jsp"%>

<div class="container-fluid">

	<div class="row">
		<div class="col-lg-12">
			<h2 class="page-header">재고 상점 등록</h2>
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
							<input type="radio" name="productQN"  value="5" />5 &nbsp;&nbsp;&nbsp;
							<input type="radio" name="productQN" value="10" />10 &nbsp;&nbsp;&nbsp;
							<input type="radio" name="productQN" value="20" />20
						</div>

						<div class="form-group">
							<label>상품설명</label>
							<textarea class="form-control" rows="5" name="productContent" style="resize: none" readonly>${dto.productContent}</textarea>
						</div>

						<div class="form-group">
							 <label>상품가격</label>
							 <input type="text" name="productPrice" id="productPrice" class="form-control" value="${dto.productPrice}" readonly/>
						</div>
						
						<div class="form-group">
							 <label>할인율</label>
							 <input type="text" name="productSale" id="productSale" class="form-control" value="${dto.productSale}" />
						</div>
	


						<button type="submit" class="btn btn-primary" id="modifyBtn">등록</button>
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
		location.href="/product/product_remain_list";
	})
})
</script>

<%@ include file="../include/manager_footer.jsp"%>