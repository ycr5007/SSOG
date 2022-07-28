<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@ include file="../include/product_header.jsp"%>

<div class="container-fluid">
<!-- 상세페이지 -->
		<div class="form-group">
			<form action="" method="post" role="form">
				
				<div>
					<img src="/display/product/${dto.productNo}" class="rounded mx-auto d-block"/>
				</div>
				
				
				<div class="form-group"">
						<label>상품명</label>
						<input class="form-control" name="product" value="${dto.productName}"<%-- '<sec:authentication property="principal.username"/>' --%>	readonly>
				</div>

				<%-- <div class="custom-form">
					<label>상품 수량</label>					
						<input type="radio" ${dto.productQN==50 ? 'checked': ''} name="productQN" value="50" onclick="return(false);"/>50&nbsp;&nbsp;&nbsp;
						<input type="radio" ${dto.productQN==100 ? 'checked': ''} name="productQN" value="100" onclick="return(false);"/>100&nbsp;&nbsp;&nbsp;
						<input type="radio" ${dto.productQN==150 ? 'checked': ''} name="productQN" value="150" onclick="return(false);"/>150
				</div> --%>
				
				<div class="form-group">
                  <label>상품 수량</label>                 
                  <input type="text" class="form-control" name="productQN" value="${dto.productQN}" readonly />
               </div>
	
				<div class="form-group">
					<label>상품설명</label>
					<textarea class="form-control" rows="5" name="productcontent" style="resize: none" readonly>${dto.productContent}</textarea>
				</div>
	
				<div class="form-group">
					<label>상품가격</label>
					<input type="text" name="productprice" value="${dto.productPrice}" class="form-control" readonly />
				</div>
				
				
					<div class="form-group">
						<label>상품상태</label>
						<input type="text" name="productStatus" id="productStatus" class="form-control" value="${dto.productStatus}" readonly />
					</div>
				

			
				<button type="button" class="btn btn-info" id="registerBtn">목록</button>
				<c:if test="${dto.productStatus == 4}">
					<button type="button" class="btn btn-primary" id="modifyBtn">온라인 상품 등록</button>
				</c:if>
			
		</form>
	</div>
</div>



<%-- 수정 버튼 클릭시 이동할 폼 --%>
<form action="/product/product_modify" id="operForm">
	<input type="hidden" value="${userNo}" name="userNo" />
	<input type="hidden" value="${dto.productNo}" name="productNo" />
	<input type="hidden" value="${pageNum}" name="pageNum" />
	<input type="hidden" value="${amount}" name="amount" />
</form>


<script src="/resources/js/util/upload.js"></script>
<script src="/resources/js/product/product_read.js"></script>
<%@ include file="../include/manager_footer.jsp"%>