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
		operForm.attr('action','/admin/user');
		operForm.submit();
	})
})


// 회원 상세정보 보여주기 ( ajax )
function getDetailUser(userNo){
	$.getJSON({
		url:'/admin/user/' + userNo,
		success:function(result){
			$('.userid').html(result.userId)
			$('.authority').html(result.authorities.length > 1 ? result.authorities[1].authority : result.authorities[0].authority)
			$('.status').html((result.userStatus > 0 ? '회원' : '탈퇴'))
			var imgSrc = "/display/user/" + userNo
			$('.profile-img > img').attr('src', imgSrc)
			$('.profile').html(result.userProfile == null ? '' : result.userProfile)
			$('.username').html(result.userName)
			$('.phone').html(result.userPhone)
			$('.address').html(result.userAddress)
			$('.email').html(result.userMail)
			$('#userModal').modal("show");
		}
	})
}


function deleteUserData(userNo){
	console.log('HELP ME !!')
		$.ajax({
			url:'/admin/deleteUser/' + userNo,
			type: 'delete',
			beforeSend : function(xhr){
				xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
			},
			success: function(result){
				returnDetail();
				alert(result + " 번 회원 정보가 삭제되었습니다.");
			}
		})
}


