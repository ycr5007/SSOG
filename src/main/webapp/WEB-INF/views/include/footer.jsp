<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


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
   	<script src="/resources/js/jquery-3.6.0.min.js"></script> <!-- signup1 -->
    <script src="/resources/js/jquery-migrate-1.2.1.min.js"></script>
    <script src="/resources/js/templatemo.js"></script>
    <script src="/resources/js/custom.js"></script>
    <!-- /bootstrap Script -->

	<!-- 맵 하이라이트 -->
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/maphilight/1.4.2/jquery.maphilight.min.js"></script>
    <script>
      $(document).ready(function(e) {
        $.fn.maphilight.defaults = {
          fill: true,  //이미지맵 링크에 마우스가 올라오면 색을 넣을 건지 여부
          fillColor: 'FFFFFF',  // 색상지정
          fillOpacity: 1,  // 투명도 지정 0~1
          stroke: true,    // border를 넣을건지 여부 false로 설정하면 이하 옵션 무시됨
          strokeColor: 'FFFFFF',  //border 색상
          strokeOpacity: 1,  //border 투명도
          strokeWidth: 10  //border 폭
        }
        $('img[usemap]').maphilight();
      });
    </script>
    <!-- 맵 하이라이트 종료-->
    
    <!-- 마켓리스트 hover 지도 연결 -->
	<script>
      $(function(){

        let area = $("area");

        $("#openmarket li a").hover(function(){
          console.log($(this).html());
          let gu = $(this).data("gu");
           $(area).each(function(idx, element) {
            let title = $(element).attr("title");
            if(gu==title){    
              $(element).trigger("mouseenter");                
            }             
          });
        });
          
        $("#openmarket li a").mouseleave(function(){                   
          console.log($(this).html());
          let gu = $(this).data("gu");       

           $(area).each(function(idx, element) {
             let title = $(element).attr("title");
            if(gu==title){                 
              $(element).trigger("mouseleave");                
             }         
          });
       	});
        
        
        $("#willopenmarket li a").hover(function(){
            console.log($(this).html());
            let gu = $(this).data("gu");
             $(area).each(function(idx, element) {
              let title = $(element).attr("title");
              if(gu==title){    
                $(element).trigger("mouseenter");                
              }             
            });
          });
            
         $("#willopenmarket li a").mouseleave(function(){                   
            console.log($(this).html());
            let gu = $(this).data("gu");       

             $(area).each(function(idx, element) {
               let title = $(element).attr("title");
              if(gu==title){                 
                $(element).trigger("mouseleave");                
               }         
            });
         });
        
      });
    </script>
    <!-- 마켓리스트 hover 지도 연결 종료 -->

	<!-- Start Footer -->
	<section>
	    <footer class="bg-light" id="tempaltemo_footer" style="width:auto; height:auto;">
	      <div class="container">
	        <div class="row">
	           <img
	             src="../resources/img/footerimg.png"
	           />
	        </div>
	      </div>
	    </footer>
    </section>
    <!-- End Footer -->
    
  </body>
</html>