/**
 * 
 */

$(function(){
	// regBtn 이동 설정 ( Controller : /board/board_insert )
	$("#regBtn").click(function(){
		location.href = "/board/board_insert";
	})
	
	// 게시물 등록 시 모달 창 띄우기
	checkModal(result);
	
	/*
		window.history

		history.back()
				forward()
				go(num)
				pushState(state, title[, url]) : 새로운 히스토리 생성
				replaceState() : 기존 히스토리 변경

		stateObj = { foo: "bar"}
		history.replaceState(stateObj, "page 3", "bar2.html");
	*/
	
	history.replaceState({}, null, null);

	function checkModal(result){
		if(result == '' || history.state){
			return;
		}
		if(parseInt(result) > 0){
			$(".modal-body").html("게시물 " + result + " 번이 등록되었습니다.");
		}
		
		$("#myModal").modal("show");
	}
	
	let actionForm = $("#actionForm");
	$(".paginate_button a").click(function(e){
		e.preventDefault();
		
		// boardNo 가 있는 경우 제거
		actionForm.find("[name='boardNo']").remove();
		
		actionForm.attr("action", "/board/board_list");
		
		let page = $(this).attr("href");
		actionForm.find("[name='pageNum']").val(page);
		actionForm.submit();
	})
	
	$("#amount").change(function(){
		actionForm.find("[name='amount']").val($(this).val());
		actionForm.find("[name='pageNum']").val(1);	
		actionForm.submit();
	})
	
	$(".move").click(function(e){
		e.preventDefault();
		let boardNo = $(this).attr("href");
		// 뒤로가기 버튼으로 이동한 경우, 다시한번 append 를 진행하기 때문에 방지
		if(actionForm.find("[name='boardNo']").length == 0){
			actionForm.append("<input type='hidden' name='boardNo' value='" + boardNo + "'>");
		}else{
			// 뒤로가기 버튼을 누른 경우, 이미 append 된 태그가 있기 때문에, 있는 태그의 value 값을 수정
			actionForm.find("[name='boardNo']").val(boardNo);
		}
		actionForm.attr("action", "hitupdate");
		actionForm.submit();
	})
	
	// 검색버튼
	let searchForm = $("#searchForm");
	$(".btn-default").click(function(e){
		e.preventDefault();
		if($("[name='type']").val() == ''){
			alert("기준을 선택해주세요");
			return;
		}else{
			if($("[name='keyword']").val() == ''){
				alert("검색어를 입력해주세요");
				return;
			}
			searchForm.find("[name='pageNum']").val(1);
			searchForm.find("[name='amount']").val(10);
			searchForm.submit();
		}
	})
	
	$(":reset").click(function(e){
		e.preventDefault();
		searchForm.find("[name='type']").val('');
		searchForm.find("[name='keyword']").val('');
		searchForm.submit();
	})
})