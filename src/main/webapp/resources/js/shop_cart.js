$(function(){
	// 구매 버튼 클릭시 결제하기 페이지로 이동
	$(".btn-order").click(function() {
			location.assign("/shop/order");
		});

	
	$(".btn-cart").click(function() {
			var check = confirm("상품이 장바구니에 담겼습니다. 확인하시겠습니까?");
			if (check) {
				location.assign("/shop/cart");
			} 
		});
})


