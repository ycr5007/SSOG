<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./include/header.jsp" %>

<section class="bg-dark">
            <div id="searchlist" style="overflow:auto; width:auto; height:550px; color: white; padding: 50px 50px 50px 50px">      	
            	<img src="../resources/img/productlist_logo.png" style="max-width: 100%; height: auto; align-content: center"/>
					<table class="table table-dark" style="color: white">
						  <thead>
						    <tr>
						      <th scope="col">상품명</th>
						      <th scope="col">판매자</th>
						      <th scope="col">판매장터</th>
						      <th scope="col">장터상태</th>
						      <th scope="col"></th>
						    </tr>
						  </thead>
						  <tbody>
						   	<c:forEach var="dto" items='${list}'>
						  		<tr>
						  			<td> ${dto.productName}</td>
						  			<td> ${dto.seller}</td>
						  			<td> ${dto.marketNo}</td>
						  			<td> ${dto.marketStatus}</td>
						  		</tr>
						  	</c:forEach>
						  </tbody>
				  	</table> 	
		    	</div>
</section>

  
<%@ include file="./include/footer.jsp" %>