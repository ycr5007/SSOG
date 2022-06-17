<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script scr="/resources/js/bootstrap.bundle.min.js"></script>
<script src="/resources/js/jquery.min.js"></script>
<link href="/resources/css/sb-admin-2.min.css" rel="stylesheet">
<link rel="stylesheet" href="/resources/css/upload.css" />
<title>Insert title here</title>
</head>
<body>
	<!-- 파일 업로드 INPUT 카드 -->
	<form action="" id="recruitForm">
		<div class="card mb-3">
			<input type="file" name="uploadFile" class="custom-file-input form-control" id="customFileLangHTML" style="display: none" required>
			<label class="custom-file-label form-control" for="customFileLangHTML" data-browse="파일찾기"></label>
			<div class="card-body">
				<p class="card-title text-center">
					<div class="card-text text-center pt-5 uploadResult">
						업로드 사진
						<ul>
						</ul>
					</div>
				</p>
				<div class="row justify-content-center">
					<button type="submit" class="btn btn-outline-primary m-2">등록</button>
				</div>
			</div>
		</div>
	</form>

	<!-- 파일 업로드 -->
	<script>
		let section = "recruit";
		
		$("[type='submit']").click(function(e) {
			e.preventDefault();
			
			let str = "";
			
			// li 태그 정보 수집하기
			$(".uploadResult ul li").each(function(idx, obj) {
				var img = $(obj);
				
				str += "<input type='hidden' name='attachList[" + idx + "].uuid' value='" + img.data("uuid") + "'>";
				str += "<input type='hidden' name='attachList[" + idx + "].uploadPath' value='" + img.data("path") + "'>";
				str += "<input type='hidden' name='attachList[" + idx + "].fileName' value='" + img.data("filename") + "'>";
				str += "<input type='hidden' name='attachList[" + idx + "].no' value='" + ${marketNo} + "'>";
			})
			
			console.log("form 태그 삽입 전 : " + str);
			
			// form 보내기
			$("#recruitForm").append(str).submit();
		});
	</script>
	<script src="/resources/js/util/upload.js"></script>
</body>
</html>