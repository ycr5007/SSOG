<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
<link href="css/style.css" rel="stylesheet">
<link href="css/jehong_css.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="css/park3.css" rel="stylesheet">
</head>
<body>
<header>
  <div class="row">
    <div class="col-3">
      <h1 class="logo">
        <a href="#"><img src ="images/logo.png"></a>
      </h1>
    </div>
    <div class="col-9 justify-content-end align-self-center">
      <div class="row justify-content-end">
        <div class="col">
          <div class="d-flex justify-content-end right-menu">
              <button type="button" class="btn community">커뮤니티</button>
              <!-- <button type="button" class="btn btn-primary">로그인</button> -->
              <button type="button" class="btn add_room">내 숙소 등록하기</button>
              <button type="button" class="btn btn-secondary">회원가입</button>
          </div>
        </div>
      </div>
    </div>
  </div>
</header>
<!--myPageHostCheck / 마이페이지_내 숙소 예약현황-->
<section>
 
    <div class="row flex-nowrap">
      <!--사이드바-->
      <div class="col-3 py-md-5 ">
        <div class="sidebar_menu">
         <h2>마이페이지</h2>
         <a href="#"><h5>- 내 예약 조회</h5></a>
         <a href="#"><h5>- 내 숙소 예약 현황</h5></a>
          <a href="#"><h5>- 회원수정 / 탈퇴</h5></a>
        </div>
       
      </div>
      <!--사이드바 끝-->

      <!--메인-->
      <main class="col-8 py-md-5 pl-md-4 " >
        <div class="total m-0">
          <h1>회원수정</h1>
          <hr>
          <center>
              <form>
                  <table style="width: 600px;">
                      <tr>
                          <th>
                              아이디
                          </th>
                          <td>
                              <input type="text" style="width: 350px;" placeholder=" 아이디" class="p-2">
                          </td>
                          <td>
                              <input type="button" class="btn1" value="중복확인" >
                          </td>
                      </tr>
                      <tr>
                          <th>
                              비밀번호
                          </th>
                          <td>
                              <input type="password" style="width: 350px;" placeholder=" 비밀번호" class="p-2">
                          </td>
                      </tr>
                      <tr>
                          <th>
                              전화번호
                          </th>
                          <td>
                              <input type="text" style="width: 350px;" placeholder=" 01000000000" class="p-2">
                          </td>
                      </tr>
                      <tr>
                          <th>
                              이메일
                          </th>
                          <td>
                              <input type="email" style="width: 350px;" placeholder=" 이메일@이메일주소.com" class="p-2">
                          </td>
                      </tr>
                      <tr>
                          <th></th>
                          <td>
                              <input type="email" style="width: 350px;" placeholder=" 인증번호" class="p-2">
                          </td>
                          <td>
                              <input type="button" class="btn1" value="인증번호 확인">
                          </td>
                      </tr>
                                 
                      
                      <tr>
                          <td></td>
                          <td align="center">
                              <input type="submit" value="회원 정보 수정" class="btn btn2">
                          </td>
                          <td></td>
                      </tr>
                  </table>
              </form>
          </center>
      </div>
      </main>
      <!--메인-->
    </div>
</section>
<footer>
  ⓒ 2021 Nearbnb, Inc. All rights reserved <br>
  개인정보 처리방침 | 이용약관 | 변경된 환불 정책 | 회사 세부정보
</footer>
</body>
</html>