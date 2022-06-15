<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/shop_header.jsp" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<!-- 판매자 평점 css 적용 안됨. 알아보기-->
<style>
.tar-ratings-fill {
      const score = +this.restaurant.averageScore * 20;
      return score + 1.5;
 }
 .product_price{
  text-decoration:line-through;
 }
 .sale_price{
 font-color : #FF0000;
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
	<span class="price h6"> 
		<span class="product_price">${product.productPrice}</span><span class="currency">원</span><br>
	</span> 
	<span class="price h2 text-danger"> 
		<span class="sale_price"><fmt:parseNumber value ="${(product.productPrice - (product.productPrice*product.productSale * 0.01))}" integerOnly= "true" />원</span>
	</span> 
</p> <!-- price-detail-wrap .// -->
<dl class="item-property">
  <dt>상품 설명</dt>
  <dd>${product.productContent}</dd>
</dl>
<dl class="param param-feature">
  <dt>판매자 정보</dt>
  <dd>${product.userName}</dd>
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
  <dt>지역</dt>
  <dd>Seoul, 서울</dd>
</dl>  <!-- item-property-hor .// -->

<hr>
<form action="/shop/order" method="get">
	<input type="hidden" name="productNo" value="${product.productNo}" />
	<div class="button">						
		<div class="button_quantity">
			주문수량
			<input type="text" name="orderQN" class="quantity_input" value="1">
			<span>
				<button type="button" class="plus_btn">+</button>
				<button type="button" class="minus_btn">-</button>
			</span>
		</div>
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
	<button class="btn btn-lg btn-primary btn-order"> 구매 </button>
	<button class="btn btn-lg btn-outline-primary btn-cart"> <i class="fas fa-shopping-cart"></i> 장바구니 담기 </button>
</form>
</article> <!-- card-body.// -->
		</aside> <!-- col.// -->
	</div> <!-- row.// -->
</div> <!-- card.// -->


</div>
<!--container.//-->


<br><br><br>




<script>
$(function(){
	// 구매 버튼 클릭시 결제하기 페이지로 이동
	$(".btn-order").click(function() {
				location.assign("/shop/order");
		});

	// 장바구니담기 버튼 클릭 시 장바구니 추가
		$(".btn-cart").click(function() {
			/* var check = confirm("상품이 장바구니에 담겼습니다. 확인하시겠습니까?");
			if (check) {
				location.assign("/shop/cart");
			} */
			form.productQN = $(".quantity_input").val();
			$.ajax({
				url: '/shop/cart/add',
				type: 'POST',
				data: form,
				success: function(result){
					cartAlert(result);
				}
			})
		});
		function cartAlert(result){
			if(result == '0'){
				alert("장바구니에 추가를 하지 못하였습니다.");
			} else if(result == '1'){
				alert("장바구니에 추가되었습니다.");
			} else if(result == '2'){
				alert("장바구니에 이미 추가되어져 있습니다.");
			} else if(result == '5'){
				alert("로그인이 필요합니다.");	
			}
		}
	
	// 수량 버튼
	let quantity = $(".quantity_input").val();
	$(".plus_btn").on("click", function(){	// + 클릭시 +1
		if(quantity < 20){	// 단, 20까지만 구매가능하도록
			$(".quantity_input").val(++quantity);
		}
	});
	$(".minus_btn").on("click", function(){	// - 클릭시 -1
		if(quantity > 1){	// 단, 1보다 클때만 -1 적용
			$(".quantity_input").val(--quantity);
		}
	});
})
// 서버로 전송할 데이터
const form = {
		userNo : '${user.userNo}',
		productNo : '${product.productNo}',
		orderQN : ''
}

</script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<%@ include file="../include/footer.jsp" %>