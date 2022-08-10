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
	
	
	
})