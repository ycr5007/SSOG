<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../include/shop_header.jsp"%>
<style>
body{
	background-color: #eee;
}
.card{
	background-color: #fff;
    width: 300px;
    border: none;
    border-radius: 16px;
    

}

.info{
      line-height: 19px;
}

.name{
	color: #4c40e0;
    font-size: 18px;
    font-weight: 600;
}

.order{
	font-size: 14px;
	font-weight: 400;
	color: #b7b5b5;
}
.detail{

	line-height:19px;
}

.summery{

	color: #d2cfcf;
    font-weight: 400;
    font-size: 13px;
}
   
}

.text{

	line-height:20px;
}
.new{

	color: #000;
	font-size: 14px;
	font-weight: 600;
}
.money{


	font-size: 14px;
	font-weight:500;
}
.address{

color: #d2cfcf;
	font-weight:500;
	font-size:14px;
}

.last{

	font-size: 10px;
	font-weight: 500;

}


.address-line{
	color: #4C40E0;
    font-size: 11px;
    font-weight: 700;
}
</style>

<div class="container mt-5 d-flex justify-content-center">
       <div class="card p-4 mt-3">
          <div class="first d-flex justify-content-between align-items-center mb-3">
            <div class="info">
                <span class="d-block name">감사합니다. 주문 완료 </span><br>
                <span class="order">주문번호 - 4554645</span>
                 
            </div>
           
             <img src="https://i.imgur.com/NiAVkEw.png" width="40"/>
              

          </div>
              <div class="detail">
          <span class="d-block summery">주문이 발송되었습니다. 고객님의 소중한 상품을 배달하고 있습니다.</span>
              </div>
          <hr>
          <div class="text">
        <span class="d-block new mb-1" >Alex Dorlew</span>
         </div>
        <span class="d-block address mb-3">672 Conaway Street Bryantiville Massachusetts 02327</span>
          <div class="  money d-flex flex-row mt-2 align-items-center">
            <img src="https://i.imgur.com/ppwgjMU.png" width="20" />
        
            <span class="ml-2">Cash on Delivery</span> 

               </div>
               <div class="last d-flex align-items-center mt-3">
                <span class="address-line">주문목록 혹은 배송정보변경은 마이페이지에서가능합니다.</span>

               </div>
        </div>
    </div>