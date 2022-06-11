<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/shop_header.jsp" %>


<!-- 판매자 평점 css 적용 안됨. 알아보기-->
<style>
.tar-ratings-fill {
      const score = +this.restaurant.averageScore * 20;
      return score + 1.5;
 }
</style>

<div class="container">
	<br>  <p class="text-center"> <a href="http://bootstrap-ecommerce.com/"></a></p>
<hr>

	
<div class="card">
	<div class="row">
		<aside class="col-sm-5 border-right">
<article class="gallery-wrap"> 

<div class="img-small-wrap">
  <div class="item-gallery"> <img src="https://mdbcdn.b-cdn.net/img/new/standard/nature/111.webp" width="400" height="400"> </div>
</div> <!-- slider-nav.// -->
</article> <!-- gallery-wrap .end// -->
		</aside>
		<aside class="col-sm-7">
<article class="card-body p-5">
	<h3 class="title mb-3">${product.productName}</h3>

<p class="price-detail-wrap"> 
	<span class="price h3 text-warning"> 
		<span class="num">${product.productPrice}</span><span class="currency">원</span>
	</span> 
</p> <!-- price-detail-wrap .// -->
<dl class="item-property">
  <dt>상품 설명</dt>
  <dd><p>한 모금만 마셔도 피로감이 싹~ 지금까지 이런 커피는 없었다..! <br>일단 드셔보세요</p></dd>
</dl>
<dl class="param param-feature">
  <dt>판매자 정보</dt>
  <dd>${product.dummy}</dd>
</dl>  <!-- item-property-hor .// -->
<dl class="param param-feature">
  <dt>판매자 평점</dt>
  <dd>
  	<div class="star-ratings">
	<div 
    class="star-ratings-fill space-x-2 text-lg"
    style="{ width: ratingToPercent + '%' }"
	>
		<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
	</div>
	<!-- <div class="star-ratings-base space-x-2 text-lg">
		<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
	</div> -->
</div>
  </dd>
</dl>  <!-- item-property-hor .// -->
<dl class="param param-feature">
  <dt></dt>
  <dd>Russia, USA, and Europe</dd>
</dl>  <!-- item-property-hor .// -->

<hr>
<div class="input-group mb-3">
          <div class="input-group-prepend">
            <label class="input-group-text" for="inputGroupSelect01">수량</label>
          </div>
          <select class="custom-select" id="inputGroupSelect01">
            <option selected>-- 수량을 선택하세요 --</option>
            <option value="1">1</option>
            <option value="2">2</option>
            <option value="3">3</option>
          </select>
       	</div>
	<!-- <div class="row">
		<div class="col-sm-5">
			<dl class="param param-inline">
			  <dt>수량: </dt>
			  <dd>
			  	<select class="form-control form-control-sm" style="width:70px;">
			  		<option> 1 </option>
			  		<option> 2 </option>
			  		<option> 3 </option>
			  	</select>
			  </dd>
			</dl>  item-property .//
		</div>
	</div> row.// -->
	<hr>
	<a href="#" class="btn btn-lg btn-primary text-uppercase"> 구매 </a>
	<a href="#" class="btn btn-lg btn-outline-primary text-uppercase"> <i class="fas fa-shopping-cart"></i> 장바구니 담기 </a>
</article> <!-- card-body.// -->
		</aside> <!-- col.// -->
	</div> <!-- row.// -->
</div> <!-- card.// -->


</div>
<!--container.//-->


<br><br><br>
<article class="bg-secondary mb-3">  
<div class="card-body text-center">
    <h4 class="text-white">상품 상세</h4>
</div>
<br><br><br>
</article>












<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<%@ include file="../include/footer.jsp" %>