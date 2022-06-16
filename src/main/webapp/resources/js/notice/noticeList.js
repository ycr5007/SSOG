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
		operForm.attr('action','/notice/notice_list');
		operForm.submit();
	})
	
	$(".notice-row").click(function(){
		let noticeNo = $(".notice-row").data("notice");
		
		str = '<input type="hidden" name="noticeNo" value="' + noticeNo + '"/>'
		operForm.append(str);
		operForm.attr('action', '/notice/notice_read');
		operForm.submit();
	})
})