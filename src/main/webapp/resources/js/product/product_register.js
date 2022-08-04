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
			let qn = $("input[name='productQN']").val();	
			// 상품명 
			let productName = $("input[name='productName']").val();
			// 상품 설명 : textarea
			let productContent = $("#productContent").val();
			// 상품 가격
			let productPrice = $("input[name='productPrice']").val();			
			
			// 비어있는란이 있다면 경고창 띄워주기
			if(category  == ''){
				alert("카테고리을 선택해주세요");
				return;
			}
			if(qn  == ''){
				alert("수량을 입력해주세요");
				return;
			}
			if(!/^[0-9]+/.test(qn)){
				alert("숫자만 입력해주세요");
				return 
			} 
			if(productName  == ''){
				alert("상품명을 입력해주세요");
				return;
			}
			if(productContent  == ''){
				alert("상품 설명을 입력해주세요");
				return;
			}
			if(productPrice  == ''){
				alert("상품 가격을 입력해주세요");
				return;
			}
			if(!/^[0-9]+/.test(productPrice)){
				alert("숫자만 입력해주세요");
				return 
			}
			
			table.css("display","table");	
			
			str = ""
			console.log(fileData)
			str +="<tr><td><img src='/display/product?fileName=" + fileCallPath + "'/></td>";
			str +="<td>"+ category + "</td>";
			str += "<td>" + qn +"</td>";
			str += "<td>" + productName + "</td>";
			str += "<td class='invisible'>" + productContent +"</td>";
			str += "<td class='invisible'>" + productPrice +"</td>";
			//이미지 등록
			str += "<td class='invisible file-data' data-path='" + fileData[0].uploadPath + "' data-uuid='" + fileData[0].uuid + "' data-filename='" + fileData[0].fileName + "' data-target='"+ fileCallPath +"'></td>";
			str += "<td><button type='button' id='removeBtn'>X</button></td></tr>";
			table.find("tbody").append(str);
			
			// 상품 추가 버튼 클릭시 페이지 정보 지워주기
			// 카테고리
			$("select").val("");
			//상품수량
			$("input[name='productQN']").val("");	
			//상품명 
			$("input[name='productName']").val("");
			//상품 설명
			$("#productContent").val("");
			//상품 가격
			$("input[name='productPrice']").val("");
			// 업로드 사진
			$("input[name='uploadFile']").val("");
			//label 
			$(".custom-file-label").html("")
			$(".showFileImg").html("")
				
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
			
			var categoryNo = tr.find("td").eq(1).html();   
	        var productQN = tr.find("td").eq(2).text();
	        var productName = tr.find("td").eq(3).text();
	        var productContent = tr.find("td").eq(4).text();
	        var productPrice = tr.find("td").eq(5).text();
			// 이미지 등록 
			var fileD = tr.find("td").eq(6);
			
			var uuid = fileD.data("uuid");
			var path = fileD.data("path");
			var filename = fileD.data("filename");
			
			console.log(categoryNo,productQN,productName,productContent,productPrice);
			
			let data = "";
			data += "<input type='hidden' name='proList["+idx+"].marketNo' value='" + marketNo + "'/>";
			data += "<input type='hidden' name='proList["+idx+"].userNo' value='" + userNo + "'/>";			
			data += "<input type='hidden' name='proList["+idx+"].categoryNo' value='" + categoryNo + "'/>";
			data += "<input type='hidden' name='proList["+idx+"].productQN' value='" + productQN + "'/>";
			data += "<input type='hidden' name='proList["+idx+"].productName' value='" + productName + "'/>";
			data += "<input type='hidden' name='proList["+idx+"].productContent' value='" + productContent + "'/>";
			data += "<input type='hidden' name='proList["+idx+"].productPrice' value='" + productPrice + "'/>";	
			
			data += '<input type="hidden" name="proList['+idx+'].attach.uuid" value="' + uuid + '" />';
			data += '<input type="hidden" name="proList['+idx+'].attach.uploadPath" value="' + path + '" />';
			data += '<input type="hidden" name="proList['+idx+'].attach.fileName" value="' + filename + '" />';
			//data += '<input type="hidden" name="proList['+idx+'].attach.no" value="' +  + '" />';
			
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
		// 파일 사진 삭제
		var img = $(this).closest("tr").find(".file-data")
		
		let target = img.data("target");
		let type = $(this).data("type");
		
		$.ajax({
			url:'/deleteFile/product',
			data:{
				fileName: target,
				type:type
			},
			type:'post',
			success:function(result) {
				console.log(result)
			}
		})
		
		// 상품추가 클릭시 보여지는 테이블 관련 삭제
		// console.log($(this).closest("tr"))
		$(this).closest("tr").remove();
		index --;
		let table = $("table");		
		if(index < 1 ){
			table.css("display","none");
		}
	})

	//취소 버튼 클릭시
	$(".btn-danger").click(function() {
		location.href = "/product/product_list";
	})	
	
})
