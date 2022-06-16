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

})





