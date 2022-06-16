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
	<div class="card shadow mb-4 col-xl-6">
		<div class="card-body">
			<div class="form-group">
				<input type="file" name="uploadFile" class="custom-file-input form-control" id="customFileLangHTML" style="display: none">
				<label class="custom-file-label form-control" for="customFileLangHTML" data-browse="파일찾기"></label>
				<h5 class="card-title text-center">이미지</h5>
				<div class="card-text text-center uploadResult">
					<ul></ul>
				</div>
			</div>
			<div class="row justify-content-center">
				<button type="button" class="btn btn-outline-primary m-2">등록</button>
			</div>
		</div>
	</div>
	
	<!-- 파일 업로드 -->
	<script>
		let section = "market";
		
		$(".btn-outline-primary").click(function() {
			document.form.submit();
			window.close();
		});
	</script>
	<script src="/resources/js/util/upload.js"></script>
</body>
</html>