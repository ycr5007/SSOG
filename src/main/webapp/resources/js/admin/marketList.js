/**
 * 
 */
$(function(){
	// 페이징 처리
	let operForm = $("#operForm");
	
	$(".page-item a").click(function(e){
		e.preventDefault();
		
		let keyword = operForm.find("[name='keyword']");
		if(keyword.val() == ''){
			keyword.remove();
		}
		
		let page = $(this).attr('href');
		operForm.find("[name='pageNum']").val(page);
		operForm.attr('action','/admin/market');
		operForm.submit();
	})
	
	
	$(".access").click(function(){
		operForm.append("<input type='hidden' name='marketNo' value='" + $(this).val() + "' />")
		operForm.find("[name='pageNum']").remove();
		operForm.find("[name='amount']").remove();
		operForm.attr('action', '/admin/marketAccess');
		operForm.attr('method', 'post');
		operForm.submit();
	})

	$(".refuse").click(function(){
		operForm.append("<input type='hidden' name='marketNo' value='" + $(this).val() + "' />")
		operForm.find("[name='pageNum']").remove();
		operForm.find("[name='amount']").remove();
		operForm.attr('action', '/admin/marketRefuse');
		operForm.attr('method', 'post');
		operForm.submit();
	})
})



