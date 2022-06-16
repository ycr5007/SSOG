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
			console.log(result);
			showDetail(result);
		}
	})
}

function showDetail(data){
	let str = "";
	str += "<div class='row' style='width: 50%'>";
	str += "<div class='col-lg-12'>";
	str += "<div class='card shadow m-5 h-75 w-75'>";
	str += "<div class='card-header py-3 d-flex flex-row align-items-center justify-content-between'><h6 class='m-0 font-weight-bold text-primary'>회원정보</h6></div>"
	str += "<div class='card-body'><table class='table table-bordered text-center'>"
	str += "<tr><th class='col-lg-2'>아이디</th>"
	str += "<td class='col-lg-2'>" + data.userId + "</td>"
	str += "<th class='col-lg-2'>권한</th>"
	str += "<td class='col-lg-2'>" + (data.authorities.length > 1 ? data.authorities[1].authority : data.authorities[0].authority) + "</td>"
	str += "<th class='col-lg-2'>상태</th>"
	str += "<td class='col-lg-2'>" + (data.userStatus > 0 ? '회원' : '탈퇴') + "</td></tr>"
	str += "<tr><td rowspan='2' colspan='2'><img src='https://via.placeholder.com/150x200'></td>"
	str += "<th colspan='4' class='col-height'>프로필 문구</th></tr>"
	str += "<tr><td colspan='4'>" + (data.userProfile == null ? '' : data.userProfile) + "</td></tr>"
	str += "<tr><th colspan='2'>이름</th>"
	str += "<td colspan='4'>" + data.userName + "</td></tr>"
	str += "<tr><th colspan='2'>주소</th>"
	str += "<td colspan='4'>" + data.userAddress + "</td></tr>"
	str += "<tr><th colspan='2'>핸드폰</th>"
	str += "<td colspan='4'>" + data.userPhone + "</td></tr>"
	str += "<tr><th colspan='2'>이메일</th>"
	str += "<td colspan='4'>" + data.userMail + "</td></tr>"
	str += "<tr><td colspan='3'><button type='button' class='delete-btn btn btn-danger' onclick='deleteUserData(" + data.userNo + ")'>데이터 삭제</button></td>";
	str += "<td colspan='3'><button type='button' class='return-btn btn btn-primary' onclick='returnDetail()'>돌아가기</button></td></tr>";
	str += "</table>"
	str += "</div></div></div></div>";
	
	str += "<div class='row' style='width: 50%'>";
	str += "<div class='col-lg-12'>";
	str += "<div class='card shadow m-5 h-75 w-75'>";
	str += "<div class='card-header py-3 d-flex flex-row align-items-center justify-content-between'><h6 class='m-0 font-weight-bold text-primary'>최근활동 ( 미완 )</h6></div>"
	str += "<div class='card-body'><table class='table table-bordered'>"
	str += "<tr><th class='col-lg-2'>분류</th>"
	str += "<th class='col-lg-7'>내용...</th>"
	str += "<th class='col-lg-3'>활동일</th></tr>"
	str += "<tr><td>게시판</td><td>잘 부탁드리...</td><td>22-06-11</td></tr>"
	str += "<tr><td>댓글</td><td>좋은 생각인거 같...</td><td>22-06-11</td></tr>"
	str += "<tr><td>리뷰</td><td>너무 재밌었습니...</td><td>22-06-11</td></tr>"
	str += "<tr><td>게시판</td><td>집 보내주세요 ...</td><td>22-06-11</td></tr>"
	str += "</table>"
	str += "</div></div></div></div>";	
	$(".data-wrapper").css("display", "flex").show();
	$(".detail-data").css("width", "100%");
	$(".detail-data").css("height", "880px");
	$(".detail-data").html(str);
}

function returnDetail(){
	$(".detail-data").css("width", "0");
	$(".detail-data").css("height", "0");
	$(".data-wrapper").hide();
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


