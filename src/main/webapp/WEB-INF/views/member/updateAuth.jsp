<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/css/y.css">
<section>
 
    <div class="row d-flex justify-content-around">
      <!--메인-->
		<main class="col-7 py-md-5 pl-md-4 ">

			<h1>마이페이지</h1>
			<hr>
			<input type="radio" id="authority1" name="authority" />SELLER 
			<input type="radio" id="authority2" name="authority" />MANAGER

			<button type="submit">등록</button>
			<button type="button" onclick="javascript:history.back()">돌아가기</button>
		</main>
		<!--메인-->
    </div>
</section>