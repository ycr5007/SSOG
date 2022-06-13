/*
shop/index.jsp 스크립트
*/
$(function(){

//페이지 이동 버튼 클릭
	let actionForm = $("#actionForm");
	$(".page-item a").click(function(e){
		e.preventDefault();   // a 속성 중지
		
		//사용자가 선택한 페이지 번호 가져오기
		let pageNum = $(this).attr('href');		
		//가져온 번호를 actionForm 안의 pageNum 값으로 대체
		actionForm.find("[name='pageNum']").val(pageNum);		
		//actionForm 보내기
		actionForm.submit();
	
	})
	
	
	// 상품보기 클릭시
	$(".btn btn-outline-primary").click(function(e){
		e.preventDefault();	//a 태그 기능 중지
		
		// a가 가지고 있는 href 가지고 오기. - 위에서 let actionForm 있음.
		let href = $(this).attr("href")
		// actionForm 안에 productNo 태그를 추가하기(값은 href가 가지고 있는 값으로)
		actionForm.append("<input type='hidden' name='productNo' value='"+ href +"'>");
		
		// actionForm action 변경(/shop/detail)
		actionForm.attr("action","/shop/detail");
		//actionForm 보내기
		actionForm.submit();
		
	})
	
	
	
	

})


















