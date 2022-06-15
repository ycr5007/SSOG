<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>  
<%@ taglib uri="http://www.springframework.org/security/tags"  prefix="sec" %> 
   
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>쏠마켓</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <link rel="stylesheet" href="/resources/css/bootstrap.min.css" />
    <link rel="stylesheet" href="/resources/css/templatemo.css" />
    <link rel="stylesheet" href="/resources/css/custom.css" />

    <!-- Load fonts style after rendering the layout styles -->
    <link
      rel="stylesheet"
      href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap"
    />
    <link rel="stylesheet" href="/resources/css/fontawesome.min.css" />
    
    <style>
      div {
        text-align: center;
      }
      .card {
        max-width: 500px;
      }
      
      #marketlist {
          overflow: auto;
      }
 
      
      #marketlist::-webkit-scrollbar {
          width: 5px; /*스크롤바의 너비*/
      }
      
      #marketlist::-webkit-scrollbar {
          width: 5px; /*스크롤바의 너비*/
      }

      #marketlist::-webkit-scrollbar-thumb {
          background-color: black; /*스크롤바의 색상*/
      }

      #marketlist::-webkit-scrollbar-track {
          background-color: skyblue; /*스크롤바 트랙 색상*/
      }
      
    </style>
  </head>
  <body>
    <!-- Header -->
    <section>
	    <nav class="navbar navbar-expand-lg navbar-light shadow">
	      <div class="container d-flex justify-content-between align-items-center">
	        <a class="navbar-brand text-success logo" href="/">
	          <img
	            src="/resources/img/ssol_logo.png"
	            class="market_logo"
	            style="display: block; margin: 20px auto; width: auto; height: auto"
	          />
	        </a>
	
	        <button
	          class="navbar-toggler border-0"
	          type="button"
	          data-bs-toggle="collapse"
	          data-bs-target="#templatemo_main_nav"
	          aria-controls="navbarSupportedContent"
	          aria-expanded="false"
	          aria-label="Toggle navigation"
	        >
	          <span class="navbar-toggler-icon"></span>
	        </button>
	
	        <div
	          class="align-self-center collapse navbar-collapse flex-fill d-lg-flex justify-content-lg-between"
	          id="templatemo_main_nav"
	        >
	          <div class="flex-fill">
	            <ul
	              class="nav navbar-nav d-flex justify-content-between mx-lg-auto"
	            >
	              <li class="nav-item">
	                <a class="nav-link" href="/">홈</a>
	              </li>
	              <li class="nav-item">
	                <a class="nav-link" href="notice.html">공지사항</a>
	              </li>
	              <li class="nav-item">
	                <a class="nav-link" href="about.html">커뮤니티</a>
	              </li>
	              <li class="nav-item">
	                <a class="nav-link" href="/shop/index">재고상점</a>
	              </li>
	            </ul>
	          </div>
	          <div class="navbar align-self-center d-flex">
	            <div
	              class="d-lg-none flex-sm-fill mt-3 mb-4 col-7 col-sm-auto pr-3"
	            >
	              <div class="input-group">
	                <input
	                  type="text"
	                  class="form-control"
	                  id="inputMobileSearch"
	                  placeholder="Search ..."
	                />
	                <div class="input-group-text">
	                  <i class="fa fa-fw fa-search"></i>
	                </div>
	              </div>
	            </div>
	            
	            
				<!-- Search form -->
				<form action="/product/product_search" method="get">
					<div class="active-cyan-2">
					  <input class="form-control" type="text" name="productName" placeholder="상품명 입력" aria-label="Search">
					</div>
					
		            <!-- 검색 icon -->
		            <button type="submit" class="btn btn-outline-primary">
		              <i class="fa fa-fw fa-search text-dark mr-2"></i>
		            </button>
				</form>	
				
	            <!-- 마이메뉴 icon + 드롭다운창 -->
	            <div class="dropdown show">
	              <a
	                class="nav-icon position-relative text-decoration-none dropdown-toggle"
	                href="#"
	                data-toggle="dropdown"
	              >
	                <i class="fa fa-fw fa-user text-dark mr-3"></i>
	              </a>
	              <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
	               <sec:authorize access="isAnonymous()">
	                <a class="dropdown-item" href="/member/signUp1">회원가입</a>
	                <a class="dropdown-item" href="/member/login">로그인</a>
	              </sec:authorize>
	              <sec:authorize access="isAuthenticated()">
	               	<a class="dropdown-item" href="/member/logout">로그아웃</a>
	                <a class="dropdown-item" href="/member/myPage">마이페이지</a>
	              </sec:authorize>
	             	<a class="dropdown-item" href="#">장바구니</a>
	              </div>
	            </div>
	              
	          </div>
	        </div>
	      </div>
	    </nav>
    </section>
    <!-- Close Header -->
