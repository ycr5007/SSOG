<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../include/header.jsp"%>


<section class="bg-dark">
	<div id="bodystyle"
		style="overflow: auto; width: auto; height: 550px; color: white; padding: 50px 50px 50px 50px">
		<div class="panel panel-default">
		<div class="panel-heading">
		
				<h1 class="page-header">커뮤니티</h1>
		</div>
		<!-- /.row -->
						<ul class="nav justify-content-end">
							<li class="nav-item"><a class="nav-link active"
								href="/board/board_insert" style="margin-right:200px;">글쓰기</a></li>
						</ul>
				
					<!-- /.panel-heading -->
					
						<table class="table table-bordered table-hover"
							style="color: white; width: 1000px; margin:auto; ">
							<thead>
								<tr>
									<th>번 호</th>
									<th>제 목</th>
									<th style="width: 150px">작성자 이름</th>
									<th>작성일</th>
									<th>조회수</th>
								</tr>
							</thead>
							<tbody>
								<!-- 게시판 리스트 반복문 -->
								<c:forEach var="dto" items="${list}">
									<tr onclick="javascript:location.href = '/board/board_read?boardNo=${dto.boardNo}'">
										<td>${dto.boardNo}</td>
										<td>${dto.boardTitle}</td>
										<td>${dto.userName}</td>
										<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
												value="${dto.boardDate}" /></td>
										<td>${dto.boardHit}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>

        
        
        </div>
        </div>



</section>
<%@ include file="../include/footer.jsp"%>