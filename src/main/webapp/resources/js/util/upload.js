/**
 * uploadform_ajax 스크립트
	
	<!-- 파일 업로드 INPUT 카드 -->
	<div class="card" style="width: 18rem;">
		<input type="file" name="uploadFile" class="custom-file-input" id="customFileLangHTML">
		<label class="custom-file-label" for="customFileLangHTML" data-browse="파일찾기"></label>
		<div class="card-body">
			<h5 class="card-title text-center">업로드 사진</h5>
			<div class="card-text text-center uploadResult">
				<ul></ul>
			</div>
		</div>
	</div>
 */

$(function(){
	
	$(".custom-file-input").change(function(){
		// form 객체 생성
		let formData = new FormData();
		
		// 첨부파일 목록 가져오기
		let inputFile = $("[name='uploadFile']");

		let files = inputFile[0].files;
		$(".custom-file-label").text(files[0].name);
		
		// form 객체에 첨부파일들 추가
		for(let i = 0; i < files.length; i++){
			if(!checkExtension(files[i].name, files[i].size)){
				return false;
			}
			formData.append("uploadFile", files[i]);
		}
		
		// form 객체 ajax 전송
		$.ajax({
			url : '/uploadAjax/' + section, // section : 파일 업로드할 경로
			type : 'post',
			processData : false, // processData : false >> 데이터를 일반적인 쿼리 스트링 형태로 변환할 것인지 결정 (Default : true > x-www-form-urlencoded)
			contentType : false, // contentType : false >> (Default : true)
			data : formData,
			dataType : 'json',
			success : function(result){
				$(":file").val("");
				showUploadFile(result);
			}
		})
	}) // uploadBtn.click 종료
	
	// 이미지 삭제 시
	$(".uploadResult").on("click", "span", function() {
		// span 태그 data- 속성 가져오기
		let targetFile = $(this).data("file");
		let type = $(this).data("type");

		// span 태그가 속해 있는 li 태그 가져오기
		let targetLi = $(this).closest("li");		
		$.ajax({
			url:'/deleteFile/' + section,
			data:{
				fileName: targetFile,
				type:type
			},
			type:'post',
			success:function(result) {
				$(".form-filename").val("");
				$(".custom-file-label").text("");
				targetLi.remove();
			}
		})
	})
})

function showUploadFile(result){
	let uploadResult = $('.uploadResult ul');
	
	let str = "";
	
	$(result).each(function(idx, obj){
		
		// 썸네일 이미지 보여주기
		let fileCallPath = encodeURIComponent(obj.uploadPath + "\\s_" + obj.uuid + "_" + obj.fileName);
		
		// 원본파일 이미지 경로
		let oriPath = obj.uploadPath + "\\" + obj.uuid + "_" + obj.fileName;
		oriPath = oriPath.replace(new RegExp(/\\/g), "/");
		
		str += "<li>";
		str += "<img class='img-thumbnail' src='/display/" + section +"?fileName=" + fileCallPath + "'>";
		str += "<div class='form-filename'>" + obj.fileName;
		str += "<span data-file='" + fileCallPath + "'><button type='button' class='btn btn-danger btn-sm m-2'>삭제</button></span></div></li>"
	})
	uploadResult.append(str);
} 

// 첨부파일 확장자 및 사이즈 확인
function checkExtension(fileName, fileSize){
	let regex = new RegExp("(.*?)\.(png|gif|jpg)$");
	
	// 파일크기
	let maxSize = 3145728; // 3MB
	if(!regex.test(fileName)){
		alert("해당 종류의 파일은 업로드 할 수 없습니다.");
		return false;
	}
	
	if(fileSize > maxSize){
		alert("파일 용량을 초과했습니다.");
		return false;
	}
	return true;
}