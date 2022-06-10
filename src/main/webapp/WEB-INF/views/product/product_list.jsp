<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@ include file="../include/product_header.jsp"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!-- 페이지 제목 -->
<div class="row">
  <div class="col-lg-12">
    <h1 class="page-header">상품 목록</h1>
  </div>
  <!-- /.col-lg-12 -->
</div>
<!-- /.row -->


<div class="row">
  <div class="col-lg-12">
    <div class="panel panel-default">
      <div class="panel-heading">
        Product List Page
      </div>
     <!-- /.panel-heading 종료-->
      
      <div class="panel-body">
        <table class="table table-striped table-bordered table-hover">
          <thead>
            <tr>
              <th>번 호</th>
              <th>판매장터</th>
              <th>상품명</th>
              <th>가 격</th>
              <th>등록일</th>
            </tr>
          </thead>
          <!-- thead 종료 -->
          
         <tbody>
          <!-- 게시판 리스트 반복문 -->
          	<c:forEach var="dto" items="${list}">
         	 <tr>
          		<td>${dto.productNo}</td>          		
          		<td>${dto.marketNo}</td>
          		<td>
          			<a href="/product/product_read?productNo=${dto.productNo}" class="move">${dto.productName}</a>
         	 	</td>
          		<td>${dto.productPrice}</td>
          		<%-- <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${dto.regdate}"/></td> --%>
         	 </tr>
          	</c:forEach>
          </tbody>
         </table>
       
		
		<div class="row">
            <div class="col-md-2 col-md-offset-2">
              <!--페이지 목록 갯수 지정하는 폼-->
              <select name="" id="amount" class="form-control">
              	<option value="10" <c:out value="${cri.amount == 10? 'selected':''}"/>>10</option>
              	<option value="20" <c:out value="${cri.amount == 20? 'selected':''}"/>>20</option>
              	<option value="30" <c:out value="${cri.amount == 30? 'selected':''}"/>>30</option>
              	<option value="40" <c:out value="${cri.amount == 40? 'selected':''}"/>>40</option>
              </select>
            </div>
          </div>
          <!-- 페이지 목록 지정 종료 -->
         
       
        <!-- start Pagination -->
        <div class="text-center">
          <ul class="pagination">
          <c:if test="${pageDto.prev}">
            <li class="paginate_button previous"><a href="${pageDto.startPage-1}">Previous</a></li>
          </c:if>
           
           <c:forEach var="idx" begin="${pageDto.startPage}" end="${pageDto.endPage}">
            <li class="paginate_button ${pageDto.cri.pageNum==idx?'active':''}"><a href="${idx}">${idx}</a></li>
          </c:forEach>
          
          <c:if test ="${pageDto.next}">
            <li class="paginate_button next"><a href="${pageDto.endPage+1}">Next</a></li>
         </c:if>
          </ul>
        </div>
   		<!-- end Pagination -->
   	</div>
	<!-- /.panel-body  종료-->
	</div>
	<!-- panel panel-default 종료 -->
	</div><!-- col-lg-12 종료 -->
	</div> <!-- div class="row"종료 -->

<%--페이지 링크 처리할 폼 --%>
<form action="/board/list" id="actionForm">
	<!-- pageNum, amount, type, keyword 값을 부를 때
		①pageDto(pageDto.cri.pageNum)
		②cri(criteria.pageNum( @ModelAttribute가 사용 안된 경우), cri.pageNum)
		 
	  -->
	<input type="hidden" name="pageNum" value="${cri.pageNum}" />
	<input type="hidden" name="amount" value="${cri.amount}" />
	<input type="hidden" name="type" value="${cri.type}" />
	<input type="hidden" name="keyword" value="${cri.keyword}" />
</form>





<script src="/resources/js/product_list.js"></script>
<%@ include file="../include/manager_footer.jsp"%>