<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@ include file="../include/product_header.jsp"%>
<!-- 상세페이지 -->
		<div class="form-group">
				<form action="" method="post" role="form">
					
			<div class="form-group"">
					<label>상품명</label>
					<input class="form-control" name="product" value='<sec:authentication property="principal.username"/>'	readonly>
			</div>

			<div class="custom-form">
				<label>상품 수량</label> <input type="radio" name="" id="" value="10" />50&nbsp;&nbsp;&nbsp;
				<input type="radio" name="" id="" value="20" />100&nbsp;&nbsp;&nbsp;
				<input type="radio" name="" id="" value="30" />150
			</div>

			<div class="form-group">
				<label>상품설명</label>
				<textarea class="form-control" rows="5" name="content"
					style="resize: none"></textarea>
			</div>

			<div class="form-group">
				<label>상품가격</label> <input type="text" name="title" id="title"
					class="form-control" />
			</div>
			
			
			<!-- 파일첨부 -->
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading">파일첨부</div>
						<div class="panel-body">
							<div class="form-group uploaddiv">
								<input type="file" name="uploadFile" id="" multiple />
							</div>
						</div>
					</div>
				</div>
			</div>
			<button type="button" class="btn btn-warning" id="registerBtn">목록</button>
			<button type="button" class="btn btn-primary" id="modifyBtn">수정</button>
			<button type="button" class="btn btn-danger" id="deleteBtn">삭제</button>
			</form>
			</div>

<%@ include file="../include/manager_footer.jsp"%>