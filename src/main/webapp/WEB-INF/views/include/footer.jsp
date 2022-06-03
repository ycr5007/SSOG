<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!-- Start Footer -->
    <footer class="bg-light" id="tempaltemo_footer">
      <div class="container">
        <div class="row">
          <div class="col-md-4 pt-5">
            <h3 class="h3 text-success border-bottom pb-3 border-light logo">
              쏠마켓
            </h3>
            <ul class="list-unstyled text-dark footer-link-list">
              <li>
                <i class="fas fa-map-marker-alt fa-fw"></i>
                서울시 중구
              </li>
              <li>
                <i class="fa fa-phone fa-fw"></i>
                <a
                  class="text-decoration-none text-dark"
                  href="tel:010-020-0340"
                  >010-020-0340</a
                >
              </li>
              <li>
                <i class="fa fa-envelope fa-fw"></i>
                <a
                  class="text-decoration-none text-dark"
                  href="mailto:info@company.com"
                  >info@company.com</a
                >
              </li>
            </ul>
          </div>

          <div class="col-md-4 pt-5">
            <h3 class="h3 text-dark border-bottom pb-3 border-light">
              커뮤니티
            </h3>
            <ul class="list-unstyled text-dark footer-link-list">
              <li>
                <a class="text-decoration-none text-dark" href="#">공지사항</a>
              </li>
              <li>
                <a class="text-decoration-none text-dark" href="#">게시판</a>
              </li>
            </ul>
          </div>

          <div class="col-md-4 pt-5">
            <h3 class="h3 text-dark border-bottom pb-3 border-light">
              문의사항
            </h3>
            <ul class="list-unstyled text-light footer-link-list">
              <li>
                <a class="text-decoration-none text-dark" href="#"
                  >마켓등록문의</a
                >
              </li>
              <li>
                <a class="text-decoration-none text-dark" href="#">회원문의</a>
              </li>
            </ul>
          </div>
        </div>
      </div>
    </footer>
    <!-- End Footer -->

    <!-- jquery cdn -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
   
    <!-- 반응형 이미지 맵 스크립트 : jquery 1.9.1에서만 동작-->
    <script src="http://mattstow.com/experiment/responsive-image-maps/jquery.rwdImageMaps.min.js"></script>
    <script>
      $(function(){
        $('img[usemap]').rwdImageMaps();
        $("#img").width("100%");
      });
    </script>
    <!-- 반응형 이미지 맵 스크립트 종료-->
    
    <!-- bootstrap Script -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
    <script src="/resources/js/jquery-migrate-1.2.1.min.js"></script>
    <script src="/resources/js/templatemo.js"></script>
    <script src="/resources/js/custom.js"></script>
    <!-- /bootstrap Script -->
   
  </body>
</html>