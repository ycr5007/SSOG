/**
 * 
 */
$(function(){
	
	let operForm = $("#operForm");
		
	$(".access").click(function(){
		if(!confirm("해당 유저의 권한 요청을 승인하시겠습니까 ? ")){
			return;
		}
		operForm.find("[name='userId']").val($(this).val());
		operForm.attr('action', '/admin/authAccess');
		operForm.submit();
	})

	$(".refuse").click(function(){
		if(!confirm("해당 유저의 권한 요청을 취소하시겠습니까 ? ")){
			return;
		}
		operForm.find("[name='userId']").val($(this).val());
		operForm.attr('action', '/admin/authRefuse');
		operForm.submit();
	})
})



