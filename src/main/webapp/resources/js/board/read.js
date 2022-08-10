/**
 * 
 */

$(function(){
	
	let operForm = $("#operForm");
	
	$(":reset").click(function(e){
		e.preventDefault();
		operForm.find("[name='boardNo']").remove();
		operForm.attr("action", "/board/board_list");
		operForm.submit();
	})
	
	$(".btn-primary").click(function(){
		operForm.submit();
	})
	
	$(".btn-danger").click(function(){
		let oper = $(this).data("oper");
		
		if(oper == "remove"){
			if(confirm("해당 글을 삭제하시겠습니까?")){
				operForm.attr('method', 'post');
				operForm.attr('action','/board/board_remove');
			}else{
				return;
			}
		operForm.submit();
		}
	})
})