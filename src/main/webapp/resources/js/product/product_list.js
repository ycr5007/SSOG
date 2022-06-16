/**
 * product_list.jsp 스크립트
 */
$(function(){
		
	//페이지 이동 버튼 클릭
	//actionForm 가져오기
	let actionForm = $("#actionForm");
	
	$(".page-item a").click(function(e){
		e.preventDefault(); //a속성 중지
		
		//productNo가 있는 경우 제거
		actionForm.find("[name='productNo']").remove();
		
		//action 수정
		actionForm.attr("action","/product/product_list");
			
		//사용자가 선택한 페이지 번호 가져오기
		let pageNum = $(this).attr('href');
		
		//가져온 번호를 actionForm 안의 pageNum 값으로 대체
		actionForm.find("[name='pageNum']").val(pageNum);
		
		
		//actionForm 보내기
		actionForm.submit();
		
	})
	
	//페이지 목록 개수가 클릭
	$(".form-control").change(function(){
		
	//actionForm 안의 amount 값을 변경하기
	actionForm.find("[name='amount']").val($(this).val());	
	
	// amount 값을 변경하면 1페이지로 보내기
	actionForm.find("[name='pageNum']").val(1);	
	

	//actionForm 보내기
	actionForm.submit();
	
	})
	
	//타이틀 클릭시
	$(".move").click(function(e){
		e.preventDefault(); //a 태그 기능 중지
		
		//a가 가지고 있는 href 가지고 오기
		let href = $(this).attr("href");		
		
		//actionForm 안에 
		if(actionForm.find("[name='productNo']").length != 0){
			
			actionForm.find("[name='productNo']").val(href);
		
		}else{
		
			actionForm.append("<input type ='hidden' name ='productNo' value='" +href+ "'>");			
		
		}
		
		//actionForm action 변경(/product/product_read)
		actionForm.attr("action","/product/product_read");
		
		//actionForm 보내기
		actionForm.submit();
	})
	
	
	
	
	

})