<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../include/manager_header.jsp"%>

<div class="container-fluid">

	<h2 class="mb-3 text-gray-800">상품 상세</h2>

	<div class="row justify-content-center">
		<div class="card shadow py-3 my-4 col-xl-7">
			<div class="card-body">

				<!-- 상품 상세 form -->
				<form action="" method="post">
					<div class="form-group">
						<label>상품명</label> <input class="form-control" name="productName"
							value="${product.productName}" readonly>
					</div>
					<div class="form-group">
						<label>판매자</label> <input class="form-control" name="userName"
							value="${product.userName}" readonly>
					</div>
					<div class="form-group">
						<label>수량</label> <input class="form-control" name="productQN"
							value="${product.productQN}" readonly>
					</div>
					<div class="form-group">
						<label>가격</label> <input class="form-control" name="productPrice"
							value="${product.productPrice}" readonly>
					</div>
					<div class="form-group">
						<label>신청일</label> <input class="form-control" name="productDate"
							value="<fmt:formatDate value="${product.productDate}" pattern="yyyy-MM-dd HH:mm" />"
							readonly>
					</div>

					<!-- 파일 첨부 -->
					<div class="row">
						<div class="col-lg-12">
							<div class="panel panel-default">
								<div class="panel-heading">첨부파일</div>
								<div class="panel-body">
									<div class="uploadResult">
										<!-- 첨부파일 정보 -->
									</div>
								</div>
							</div>
						</div>
					</div>

					<!-- 버튼 -->
					<div class="row justify-content-center">
						<button type="button" class="btn btn-primary m-2">승인</button>
						<button type="button" class="btn btn-danger m-2">거부</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

<!-- URL + 페이징 처리 -->
<form action="/market/market_receiveDetail" id="actionForm">
	<input type="hidden" name="productNo" value="${product.productNo}" />
	<input type="hidden" name="marketNo" value="${marketNo}" />
	<input type="hidden" name="pageNum" value="${criteria.pageNum }" />
	<input type="hidden" name="amount" value="${criteria.amount }" />
</form>

<script>
let marketNo = ${marketNo};
let productNo = ${product.productNo};

$(function() {
	$(".btn-primary").click(function() {		
		let accept = confirm('승인하시겠습니까?');
		
		if(accept) {
			accept(marketNo, productNo);
		}
	})
	
	$(".btn-danger").click(function() {		
		let deny = confirm('거부하시겠습니까?');
		
		if(deny) {
			deny(marketNo, productNo);
		}
	})
})

function accept(marketNo, productNo) {
	$.ajax({
		url:'/receiveAccept/' + marketNo + '/' + productNo,
		type:'put',
		contentType:'application/json',
		success:function(result) {
			if(result == "success") {
				alert("상품을 승인했습니다.");
				location.href="/market/market_receive"; 
			} else {
				alert("상품 승인 실패. 다시 시도해주세요.");
			}
		}
	});
} /* 상품 승인 종료 */

function deny(marketNo, productNo) {
	$.ajax({
		url:'/receiveDeny/' + marketNo + '/' + productNo,
		type:'put',
		contentType:'application/json',
		success:function(result) {
			if(result == "success") {
				alert("상품을 거부했습니다.");
				location.href="/market/market_receive"; 
			}
		}
	});
} /* 상품 거부 종료 */
</script>

<%@ include file="../include/manager_footer.jsp"%>