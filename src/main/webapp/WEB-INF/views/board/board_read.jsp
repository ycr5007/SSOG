<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ include file="../include/header.jsp"%>

<!-- 콘텐츠 시작 -->
<section class="bg-dark">
	<div id="bodystyle" style="overflow:auto; width:auto; height:600px; color: white; ">      	
		
				<h1>게시물 조회</h1>
				<form id="" method="post" action="">			        		        
			     
			        	<table class="table table-bordered table-hover"
							style="color: white; width: 800px;">
							<thead>
								<tr>
									<th style="width:200px;">no</th>
									<th><input class="form-control" name="boardNo" value="${dto.boardNo}" readonly /></th>
								</tr>
								<tr>
									<th style="width:200px;">제목</th>
									<th><input class="form-control" name="boardTitle" value="${dto.boardTitle}" readonly /></th>
								</tr>
								<tr>
									<th style="width:200px;">내용</th>
									<th><input class="form-control" style="height: 200px;"  name="boardContent" value="${dto.boardContent}" readonly /></th>
								</tr>
								<tr>
									<th style="width:200px;">작성회원번호</th>
									<th><input class="form-control" name="userNo" value="${dto.userNo}" readonly /></th>
								</tr>
							</thead>
						</table>
			        
			        <button type="button" class="btn btn-secondary" onclick="javascript:history.back()">돌아가기</button>
				</form>
			</div>
	     </div>     
</section>
<%@ include file="../include/footer.jsp"%>












