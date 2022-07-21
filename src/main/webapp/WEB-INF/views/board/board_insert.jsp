<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>

<section class="bg-dark">
	<div id="bodystyle"
		style="overflow: auto; width: auto; height: 550px; color: white; padding: 50px 50px 50px 50px">
		<div class="contetnt">
			<div class="container mt-4 mb-4 h-75">
				<div class="row">
					<div class="col-lg-12">
						<h1 class="font-weight-bolder">커뮤니티</h1>
					</div>
					<!-- /.col-lg-12 -->
				</div>
				<div class="row">
					<div class="col-lg-12">
						<div class="panel panel-default">
							<div>
								<h3>자유 게시판</h3>
							</div>
							<!-- /.panel-heading -->
							<div class="panel-body">
								<form action="/board/board_insert" method="post" role="form">
									<div class="form-group">
										<div>
											<label>제목</label>
										</div>
										<input style="width: 800px; margin-bottom: 10px"
											name="boardTitle" type="text" placeholder="제목을 입력하세요." />
										<div>
											<div>
												<label style="text-align: center;">내용</label>
											</div>
											<!-- Textarea -->
											<textarea name="boardContent"
												style="width: 800px; height: 200px; margin-bottom: 10px"
												id="boardContent" placeholder="내용을 입력하세요."></textarea>
										</div>
									</div>
									<div>
										<button type="submit" class="medium">등록</button>
										<button type="reset" class="medium">취소</button>
									</div>
								</form>
							</div>

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

<%@ include file="../include/footer.jsp"%>