/*
product_ingmarket_list 페이징 처리 스크립트
*/
$(function() {
	
	//페이지 이동 버튼 클릭
	let actionForm = $("#actionForm");
	$(".page-item a").click(function(e) {
		e.preventDefault();   // a 속성 중지

		//사용자가 선택한 페이지 번호 가져오기
		let pageNum = $(this).attr('href');
		//가져온 번호를 actionForm 안의 pageNum 값으로 대체
		actionForm.find("[name='pageNum']").val(pageNum);
		//actionForm 보내기
		actionForm.submit();

	})

	//페이지 목록 개수가 클릭
	$(".form-control").change(function() {

		//actionForm 안의 amount 값을 변경하기
		actionForm.find("[name='amount']").val($(this).val());

		// amount 값을 변경하면 1페이지로 보내기
		actionForm.find("[name='pageNum']").val(1);


		//actionForm 보내기
		actionForm.submit();

	})
	
	// 장터 이름 타이틀 클릭시
	$(".move").click(function(e){
		e.preventDefault(); //a 태그 기능 중지
		
		//a가 가지고 있는 href 가지고 오기
		let href = $(this).attr("href");		
		
		//actionForm 안에 bno 태그를 추가하기(bno 값은 href가 가지고 있는 값으로)
		//내용 보기에 들어갔을 때 사용자가 리스트 버튼이 아닌 뒤로 가기 버튼을 눌러서
		//목록으로 돌아올때 bno가 계속 추가되는 것 방지
		if(actionForm.find("[name='marketNo']").length != 0){
			
			actionForm.find("[name='marketNo']").val(href);
		
		}else{
		
			actionForm.append("<input type ='hidden' name ='marketNo' value='" +href+ "'>");			
		
		}
		
		//actionForm action 변경
		actionForm.attr("action","/product/product_register");
		
		//actionForm 보내기
		actionForm.submit();
	})

})





