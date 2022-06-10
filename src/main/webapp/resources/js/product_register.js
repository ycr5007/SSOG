/**
 상품 등록 스크립트
 상품 2개 이상 추가 시 사용
 */

$(function(){
	
	//table 태그에 값 가져온거 보여주기 ==> tbody안에 넣기
	let table = $("table");
	
	let tbody = table.find("tbody");
	
	// 3개 한도 정하기	
	let index = 0;
	
	
	//상품 추가 버튼 클릭시 
	$("#addProductBtn").click(function(){
		
		// 상품 추가 시 index 값 ++
		// 한번에 입력 3개까지 가능
		if(index < 3){
			//register.jsp에서 값 가지고 오기
			// 카테고리
			let category = $("select").val();
			//상품수량
			let qn = $("input[name='qn']:checked").val();	
			//상품명 
			let productname = $("input[name='productname']").val();
			
			str = ""
			
			str +="<tr><td>" + category + "</td>";
			str += "<td>" + qn +"</td>";
			str += "<td>" + productname + "</td>";
			str += "<td><button type='button' id='removeBtn'>X</button></td></tr>";
			
			table.find("tbody").append(str);
			table.css("display","block");
						
		}else{
			return
		}
		index++;
		
		
	})
	// 스크립트 동작 후 tbody안에 값이 생성 되면 버튼 기능 활성화.
	$(tbody).on("click","#removeBtn",function(){
		$(this).closest("tr").remove();
		index --;
	})
	

})

 
 