<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@include file="../include/header.jsp" %>
<section class = "bg-dark">
<div id="bodystyle" style="overflow:auto; width:auto; height:550px; color: white; padding: 20px 20px 20px 20px">    
<div class="contetnt">
	<div class="container border-0 bg-dark mt-4 mb-4 h-75" style="height:auto;  align-content: center">
	<h2 style="color:white text-align:left;">글쓰기</h2>  
	<hr />          
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-body">
				<form action="" method="post" role="form" id="insertForm">
					<table class="table" style="color: white;">
					<tr>
						<div class="form-group">
							<td style="width: 150px;">제목</td>
							<td style="width: 800px; height: 50px;">
								<input class="form-control" name="boardTitle">
							</td>                				
						</div>
					</tr>
					<tr>
						<div class="form-group">
							<td style="width: 150px;">작성자</td>
							<td style="width: 800px; height: 50px;">
								<input class="form-control" name="userId" value="${user.userId }" readonly>
							</td>                				
						</div>
					</tr>
					<tr>
						<div class="form-group">
							<td style="width: 150px;">내용</td>
							<td style="width: 800px; height: 50px;">
								<textarea class="form-control" name="boardContent"></textarea>
							</td>                				
						</div>
					</tr>
					<tr>
							<td style="width: 150px;">파일첨부</td>
							<td style="width: 800px; height: 50px;">
								<div class="card mb-3" style="width: 100%;">
          					 	<input type="file" name="uploadFile" class="custom-file-input form-control" id="customFileLangHTML" style="display:none" required>
            					<label class="custom-file-label form-control" for="customFileLangHTML" data-browse="파일찾기">파일찾기</label>
            					<div class="card-body">
       						        <p class="card-title text-center">
                   					<div class="card-text text-center pt-5 uploadResult">  
                     				업로드 사진              
                      				<ul class="showhFileImg"> </ul>
                       				</div> 
              						</p>
        					    </div>  
        					    </div>
            				</td>
            		</tr>

						<input type="hidden" name="userNo" value="${user.userNo }" />
						<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
					</table>
						<button type="submit" class="btn btn-primary">가입</button>              			
						<button type="reset" class="btn btn-secondary">취소</button>
				</form>
			</div>
		</div>
	</div>
</div>

		</div>
	</div>
</div>
</section>
<script type="text/javascript">
	// Script 에서 Csrf 토큰 사용
	let csrfHeaderName = "${_csrf.headerName}";
	let csrfTokenValue = "${_csrf.token}";
	let section = "board";
</script>
<script src="/resources/js/util/upload.js"></script>
<script>
	let insertForm = $("#insertForm")
	$(function(){
		$('[type="submit"]').click(function(e){
			e.preventDefault()
			let insertfile = $(".showhFileImg li")
			let str = "";
			str += '<input type="hidden" name="attach.uuid"  value="'+ insertfile.data("uuid") +'" />';
			str += '<input type="hidden" name="attach.uploadPath"  value="'+ insertfile.data("path") +'" />';
			str += '<input type="hidden" name="attach.fileName"  value="'+ insertfile.data("filename") +'" />';
			
			insertForm.append(str);
			
			insertForm.submit();
		})
	})
</script>
<%@include file="../include/footer.jsp" %>       