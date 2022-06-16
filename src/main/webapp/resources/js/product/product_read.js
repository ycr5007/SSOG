/**
 * product_read.jsp 스크립트
 */
$(function(){
	//read.jsp에서 operForm 가져오기
	let operForm = $("#operForm");
	
	// 목록버튼 클릭시 실행
	$(".btn-info").click(function(){
				
		// attr() :  operForm에 있는 속성을 변경
		// 읽어올 때 attr("속성명") 
		// attr("속성명", "변경값");
		operForm.attr("action", "/product/product_list");
		
		// 버튼을 클릭하면 attr에 준 값으로 보냄.
		// controller로 이동
		operForm.submit();
	})
	
	//modify 버튼 클릭시 operForm 지정해놓은 modify로 이동
	$(".btn-primary").click(function(){
		// form에서 지정한 action url로 데이터 보냄.
		operForm.submit();
	})

})