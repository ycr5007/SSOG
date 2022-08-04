/**
 * read.jsp 댓글 스크리브
 */

// 모듈화 ( 서버 쪽으로 ajax 요청을 모아 둔 함수)
let replyService = (function(reply, callback){	
	function add(reply, callback){
		console.log('add 메소드 실행');
		$.ajax({
			url : '/replies/new',
			type : 'post',
			contentType : 'application/json',
			beforeSend : function(xhr){
				xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
			},
			data : JSON.stringify(reply),
			success : function(result){
				if(callback){
					callback(result);
				}
			}
		})
	} // add 종료
	
	function getList(param, callback){
		
		let boardNo = param.boardNo;
		let page = param.page;
		console.log(boardNo + " / " + page)
		
		/*$.getJSON("/replies/pages/" + boardNo + "/" + page,{							
			success : function(replydata){
				console.log(replydata);
				if(callback){
					callback(replydata.replyCnt, replydata.list);
				}
			}
		})*/
		
		$.ajax({
			url : "/replies/pages/" + boardNo + "/" + page,
			type : 'get',			
			dataType:'json',			
			success : function(result){
				console.log("===========>"+result);
				
				if(callback){
					//callback(result);
					callback(result.replyCnt, result.list);
				}
			}
		})

		
	} // getList 종료
	
	function get(replyNo, callback){
		/*$.getJSON({
			url : '/replies/' + replyNo,
			success : function(result){
				if(callback){
					callback(result);
				}
			}
		})*/
		
		$.ajax({
			url : '/replies/' + replyNo,
			type : 'get',			
			dataType:'json',			
			success : function(result){
				console.log("===========>"+result);
				
				if(callback){
					//callback(result);
					callback(result);
				}
			}
		})
	} // get 종료
	
	function update(reply, callback){
		$.ajax({
			url : '/replies/' + reply.replyNo,
			type : 'put',
			
			beforeSend : function(xhr){
				xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
			},
			contentType : 'application/json',
			data : JSON.stringify(reply),
			success : function(result){
				if(callback){
					callback(result);
				}
			}
		})
	} // update 종료
	
	function remove(replyNo, replyWriter, callback){
		$.ajax({
			url : '/replies/' + replyNo,
			type : 'delete',
			beforeSend : function(xhr){
				xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
			},
			contentType : 'application/json',
			data : JSON.stringify({replyWriter : replyWriter}),
			success : function(result){
				if(callback){
					callback(result);
				}
			}
		})
	} // remove 종료
	
	function displayTime(timeValue){
		// ms 단위 변환
		// 댓글 단 날짜가 오늘이라면 시·분·초 / 오늘이 아니라면 연·월·일
		let today = new Date();
		
		let gap = today.getTime() - timeValue;
		let dateObj = new Date(timeValue);
		
		let str = "";
		
		if(gap < (1000 * 60 * 60 * 24)){
			let hh = dateObj.getHours();
			let mi = dateObj.getMinutes();
			let ss = dateObj.getSeconds();
			
			return [(hh > 9 ? '' : '0') + hh, ':', (mi > 9 ? '' : '0') + mi, ':', (ss > 9 ? '' : '0') + ss].join('');
		}else{
			let yy = dateObj.getFullYear();
			let mm = dateObj.getMonth() + 1;
			let dd = dateObj.getDate();
			
			return [yy,'/',(mm > 9 ? '' : '0') + mm, '/', (dd > 9 ? '' : '0') + dd].join('');
		}
	} // displayTime
	
	
	return {
		add:add,
      	getList:getList,
		get:get,
		update:update,
		remove:remove,
		displayTime:displayTime,
	}
	
})();

$(function(){
	
	// 댓글 리스트 영역 가져오기
	let replyUl = $(".chat");
	
	// 댓글 페이지 영역 가져오기
	let pageFooter = $(".panel-footer");
	// 현재 페이지 정보
	let pageNum = 1;
		
	// 댓글 List 가져오기 호출
	showList(1);
	
	// Modal 영역 가져오기
	let modal = $("#replyModal");
	
	// Modal 창 안에 있는 input 요소 찾기
	let modalInputreplyWriter = modal.find("input[name='replyWriter']");
	let modalInputReplyContent = modal.find("input[name='replyContent']");
	let modalInputReplyDate = modal.find("input[name='replyDate']");
	
	// 댓글 등록 클릭시 >> Modal 창 호출
	$("#addReplyBtn").click(function(){
		// input 태그가 갖고 있는 val 지우기
		modal.find("input").val("");
		
		// Security : Login 사용자 보여주기
		modalInputreplyWriter.val(replyWriter);
		modalInputreplyWriter.attr('readonly', true);
		
		// 날짜 input 숨기기 ( closest : 가장 가까운 부모태그 선택 )
		modalInputReplyDate.closest("div").hide();
		
		// 등록, 닫기 버튼만 보여주기
		// 닫기 버튼을 제외한 모든 버튼 숨기기
		modal.find("button[id!='modalCloseBtn']").hide();
		// 등록 버튼 보여주기
		modal.find("#modalRegisterBtn").show();
		
		
		// Modal 창 보여주기
		modal.modal("show");
	})
	
	// 댓글 Modal 창 등록버튼 클릭 시 
	$("#modalRegisterBtn").click(function(){
		replyService.add({boardNo:boardNo, replyWriter:modalInputreplyWriter.val(), replyContent:modalInputReplyContent.val()}, 
				function(result){
				console.log(result);
			if(result){
				console.log(result);
				
				// 댓글 등록 성공 시,
				// modal input 에 들어있는 내용 지우기
				modal.find("input").val("");
				// 모달 창 종료
				modal.modal("hide");
				// showList 호출
				
				// 댓글 페이지 구현 이전
				//showList(1);
				
				// 페이지 나누기 구현 이후
				showList(-1);
			}
		});
	})
	
	function showList(page){
		
		// page:page||x >> page 변수값이 들어오면 사용, 들어오지 않을경우 x (default 값 지정)

		replyService.getList({boardNo:boardNo, page:page||1}, function(total, list){
			
			// 새 댓글 등록 시 ( 마지막 번호에 대해 값을 구한 후 showList 호출 )
			if(page == -1){
				pageNum = Math.ceil(total / 10.0);
				showList(pageNum);
				return;
			}
			
			if(list == null || list.length == 0){
				replyUl.html("");
				return;
			}
			
			let str = "";
			for(var i = 0; i < list.length; i++){
				str += '<tr>';
				str += '<td width="5%">' + list[i].replyNo + '</td>';
		//		str += '<li class="left clearfix" data-replyno="' + list[i].replyNo + '">';
				str += '<td width="10%">' + list[i].replyWriter + '</td>';
				str += '<td width="50%">' + list[i].replyContent + '</td>';
				str += '<td width="10%">' + replyService.displayTime(list[i].replyDate) + '</td>';
				str += '</tr>';
			}
			replyUl.html(str);
			
			// 페이지 나누기를 위한 함수 호출
			showReplyPage(total);
		});
	}
	
	// 댓글 페이지 나누기 함수
	function showReplyPage(total){
		let endPage = Math.ceil(pageNum / 10.0) * 10;
		let startPage = endPage - 9;
		let prev = startPage != 1;
		let next = false;
		
		if(endPage * 10 >= total) {
			endPage = Math.ceil(total / 10.0);
		}
		
		if(endPage * 10 < total){
			next = true;
		}
		
		let str = '';
		str += '<ul class="pagination pull-right" style="justify-content: center; padding: 20px;">'
		if(prev){
			str += '<li class="paginate_button previous">';
			str += '<a class="btn" href="' + (startPage - 1) + '">Previous</a></li>';
		}
		for(let i = startPage; i <= endPage; i++){
			let active = pageNum == i ? 'active' : '';
			
			str += '<li class="paginate_button ' + active + '">';
			str += '<a class="btn" href="' + i + '">' + i + '</a></li>';
		}
		if(next){
			str += '<li class="paginate_button next">';
			str += '<a class="btn" href="' + (endPage + 1) + '">Next</a></li>';
		}
		str += '</ul>';
		
		pageFooter.html(str);
	}
	
	// 댓글 페이지 나누기 클릭 시
	pageFooter.on("click", "li a", function(e){
		e.preventDefault();
		pageNum = $(this).attr("href");
		showList(pageNum);
	})
	
	
	// 댓글 클릭 이벤트 - 이벤트 위임(chat을 이용해 이벤트를 걸고 실제 이벤트의 대상은 li 태그가 되는 형태)
	$(".chat").on("click", "li", function(){
		let replyNo = $(this).data("replyno");
		console.log(replyNo)
		replyService.get(replyNo, function(data){
			console.log(data);
			
			// 도착한 댓글을 모달 창에 보여주기			
			modalInputreplyWriter.val(data.replyWriter)
							.attr("readonly", "readonly");
			modalInputReplyContent.val(data.replyContent);
			modalInputReplyDate.val(replyService.displayTime(data.replyDate))
							.attr("readonly", "readonly");
			modalInputReplyDate.closest("div").show();
			
			// replyNo 값을 추가
			modal.data("replyNo", data.replyNo);
			
			modal.find("button[id!='modalCloseBtn']").hide();
			modal.find("#modalModBtn").show();
			modal.find("#modalRemoveBtn").show();
			
			modal.modal("show");
		});
	})
	
	
	// Modal 내 수정버튼 클릭
	$("#modalModBtn").click(function(){
		// security : 
		if(!replyWriter){
			alert('로그인이 필요한 작업입니다.');
			modal.modal('hide');
			return;
		}
		
		if(modalInputreplyWriter.val() != replyWriter){
			alert('로그인 정보가 일치하지 않습니다.');
			modal.modal('hide');
			return;
		}
		
		let modifyReply = {
			replyNo : modal.data("replyNo"),
			replyContent : modalInputReplyContent.val(),
			replyWriter : modalInputreplyWriter.val()
		};
		
		replyService.update(modifyReply, function(result){
			if(result){
				alert(result);
				modal.modal("hide");
				
				// 페이지 나누기 구현 이전
				// showList(1);

				// 페이지 나누기 구현 이후
				showList(pageNum);
			}
		});
	})
	
	// Modal 내 삭제버튼 클릭
	$("#modalRemoveBtn").click(function(){
		
		// Security : replyWriter 값을 갖고 있는지 확인 
		if(!replyWriter){ // null 인경우 false 로 인식
			alert('로그인이 필요한 작업입니다.');
			modal.modal('hide');
			return;
		}
		
		// Security : 로그인 사용자와 댓글 작성자가 일치하는 지 확인
		if(replyWriter != modalInputreplyWriter.val()){
			alert('로그인 정보가 일치하지 않습니다.');
			modal.modal('hide');
			return;
		}
		
		replyService.remove(modal.data("replyNo"), replyWriter, function(result){
			if(result){
				alert(result);
				modal.modal("hide");

				// 페이지 나누기 구현 이전
				//showList(1);

				// 페이지 나누기 구현 이후 ㅂ
				showList(pageNum);
			}
		})
	})
	
	
})


/*
	자바스크립트 이벤트 연동 방법 ( callback 방식 )
		태그 on ~~~ 방식
			<li on[evnet]="function(){}">	
		
		
		JQuery
			$("a").[event](function(){})
			$("a").on("[event]", function(){})
			
			이벤트 위임 >> $("a").on("[event]", "li", function(){})
*/