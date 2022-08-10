/**
 * 
 */
$(function(){
	
	let operForm = $("#operForm");
	
	$("button").click(function(e){
		e.preventDefault();
		
		// 현재 눌러진 "data-xxx" 값을 가져오기
		let oper = $(this).data("oper");
		
		if(oper == "modify"){
			operForm = $("[role='form']");
			
			// 첨부파일 목록 가져가기
			let str = "";
		
			// li 태그 정보 수집하기
			$(".uploadResult ul li").each(function(idx, obj){
				var job = $(obj);
				
				str += "<input type='hidden' name='attachList[" + idx + "].uuid' value='" + job.data("uuid") + "'>";	
				str += "<input type='hidden' name='attachList[" + idx + "].uploadPath' value='" + job.data("path") + "'>";	
				str += "<input type='hidden' name='attachList[" + idx + "].fileName' value='" + job.data("filename") + "'>";	
			});
			
			console.log("form 태그 삽입 전 : " + str);
			
			operForm.append(str);
			
		}else if(oper == "list"){
			operForm.find("[name='boardNo']").remove();
			operForm.attr('action', '/board/board_list');
		}
		
		operForm.submit();
	})
	

	
})

/*
	파일첨부 포함 게시글 수정 시 경우의 수
		1 ) 기존 첨부파일 삭제
		2 ) 첨부파일 추가
		3 ) history.back() 할 경우
		
	과정
		=> bno에 해당하는 첨부물 삭제
		=> 현재 첨부파일 목록 삽입
	
	
	잘못 업로드 된 파일 삭제
	첨부파일 저장 폴더와 DB가 일치하지 않는 상황
	
	어제 날짜로 등록된 첨부 파일의 목록 구하기
	어제 업로드가 되었지만 데이터베이스에는 존재하지 않는 파일 찾아, 비교 후 삭제
	
	Spring batch : 대용량 데이터를 주기적으로 읽고 쓰는 작업에 주로 사용
	스케쥴러를 이용해 작업 가능
*/