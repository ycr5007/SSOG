/**
 상품 등록 스크립트
 상품 2개 이상 추가 시 사용
 */

$(function(){	
	
	// 데이터 전송 될 폼 불러오기
	let registerForm = $("#registerForm");
	
	
	// 3개 한도 정하기	
	let index = 0;
	
	
	//상품 추가 버튼 클릭시 
	$("#addProductBtn").click(function(){
		
		//table 태그에 값 가져온거 보여주기 ==> tbody안에 넣기
		let table = $("table");		
		let tbody = table.find("tbody");
		
		// 상품 추가 시 index 값 ++
		// 한번에 입력 3개까지 가능
		if(index < 3){
			//register.jsp에서 값 가지고 오기
			
			// 카테고리
			let category = $("select").val();
			// 상품수량
			let qn = $("input[name='productQN']:checked").val();	
			// 상품명 
			let productName = $("input[name='productName']").val();
			// 상품 설명 : textarea
			let productContent = $("#productContent").val();
			// 상품 가격
			let productPrice = $("input[name='productPrice']").val();
			
			str = ""
			
			str +="<tr><td>"+ category + "</td>";
			str += "<td>" + qn +"</td>";
			str += "<td>" + productName + "</td>";
			str += "<td class='invisible'>" + productContent +"</td>";
			str += "<td class='invisible'>" + productPrice +"</td>";
			str += "<td><button type='button' id='removeBtn'>X</button></td></tr>";
			table.find("tbody").append(str);
			
			// 상품 추가 버튼 클릭시 페이지 정보 지워주기
			// 카테고리
			$("select").val("");
			//상품수량
			$("input[name='productQN']:checked").val("50");	
			//상품명 
			$("input[name='productName']").val("");
			//상품 설명
			$("#productContent").val("");
			//상품 가격
			$("input[name='productPrice']").val("");
			
			table.css("display","block");		
		}else{
			return
		}
		index++;		
	})
	
	//등록 버튼
	$(".btn-warning").click(function(e){
		e.preventDefault();
		
		//registerForm 추가 - 테이블 내용 수집		
		$("table > tbody > tr").each(function(idx, td){
			
			var tr = $(this);    
			
			var categoryNo = tr.find("td").eq(0).html();   
	        var productQN = tr.find("td").eq(1).text();
	        var productName = tr.find("td").eq(2).text();
	        var productContent = tr.find("td").eq(3).text();
	        var productPrice = tr.find("td").eq(4).text();

			console.log(categoryNo,productQN,productName,productContent,productPrice);
			
			let data = "";
			data += "<input type='hidden' name='proList["+idx+"].marketNo' value='" + marketNo + "'/>";
			data += "<input type='hidden' name='proList["+idx+"].userNo' value='" + userNo + "'/>";			
			data += "<input type='hidden' name='proList["+idx+"].categoryNo' value='" + categoryNo + "'/>";
			data += "<input type='hidden' name='proList["+idx+"].productQN' value='" + productQN + "'/>";
			data += "<input type='hidden' name='proList["+idx+"].productName' value='" + productName + "'/>";
			data += "<input type='hidden' name='proList["+idx+"].productContent' value='" + productContent + "'/>";
			data += "<input type='hidden' name='proList["+idx+"].productPrice' value='" + productPrice + "'/>";	
			
			data += '<input type="hidden" name="proList['+idx+'].attach.uuid" value="' + fileData[0].uuid + '" />';
			data += '<input type="hidden" name="proList['+idx+'].attach.uploadPath" value="' + fileData[0].uploadPath + '" />';
			data += '<input type="hidden" name="proList['+idx+'].attach.fileName" value="' + fileData[0].fileName + '" />';
			data += '<input type="hidden" name="proList['+idx+'].attach.no" value="' + 0 + '" />';
			
			registerForm.append(data);	
		})
		
		
		
		//추가된 상품 확인
		console.log(registerForm.html());
		registerForm.attr('action', '/product/product_register')
		//registerForm 전송
		registerForm.submit();
		
	})
	
	
	// 스크립트 동작 후 tbody안에 값이 생성 되면 버튼 기능 활성화.(x버튼)
	$("tbody").on("click","#removeBtn",function(){
		console.log($(this).closest("tr"))
		$(this).closest("tr").remove();
		index --;
	})


	//취소 버튼 클릭시
	$(".btn-danger").click(function() {
		location.href = "/product/product_list";
	})
})

 
 