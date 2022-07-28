/**
 * 
 */

$(function(){
	// 페이징 처리
	let operForm = $("#operForm");
	
	$(".page-item a").click(function(e){
		e.preventDefault();
		
		let page = $(this).attr('href');
		operForm.find("[name='pageNum']").val(page);
		operForm.attr('action','/admin/board');
		operForm.submit();
	})
	
	$(".btn-danger").click(function(){
		let boardNo = $(this).val()
		
		if(!confirm(boardNo + "번 글을 삭제하시겠습니까 ? ")){
			return;
		}
		
		operForm.attr('action', '/admin/board_delete');
		operForm.attr('method', 'post')
		operForm.append("<input type='hidden' name='boardNo' value='" + boardNo + "'/>");
		operForm.submit();
	})
})