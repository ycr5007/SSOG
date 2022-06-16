<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>쏠마켓</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" href="/resources/css/bootstrap.min.css" />
<link rel="stylesheet" href="/resources/css/templatemo.css" />

<!-- Load fonts style after rendering the layout styles -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap" />
<link rel="stylesheet" href="/resources/css/fontawesome.min.css" />
<style>
	div {
		text-align: center;
	}
</style>
</head>
<body>
	<!-- Header 시작-->
	<section>
		<nav class="navbar navbar-expand-lg navbar-light shadow">
			<div
				class="container d-flex justify-content-between align-items-center">
				<div
					class="container flex-fill d-lg-flex justify-content-lg-between"
					id="templatemo_main_nav">
					<!-- 마켓로고 -->
					<div class="flex-fill" style="padding-top: 9px">
						<a class="navbar-brand text-success logo" href="/"> <img
							src="/resources/img/ssol_logo.png" class="market_logo"
							style="display: block; margin: 20px auto; width: auto; height: auto" />
						</a>
					</div>
					<!-- 마켓로고 종료 -->

					<!-- nav 메뉴 -->
					<div class="flex-fill" style="padding: 50px">
						<ul
							class="nav navbar-nav flex-fill justify-content-between mx-lg-auto">
							<li class="nav-item"><a class="nav-link" href="/">홈</a></li>
							<li class="nav-item"><a class="nav-link"
								href="/notice/notice_list">공지사항</a></li>
							<li class="nav-item"><a class="nav-link"
								href="/board/board_list">커뮤니티</a></li>
							<li class="nav-item"><a class="nav-link" href="/shop/index">재고상점</a>
							</li>
						</ul>
					</div>
					<!-- nav 메뉴 종료-->

					<div class="navbar align-self-center d-flex">

						<!-- Search form -->
						<form action="/product/product_search" method="get"
							class="form-inline" style="margin-left: 30px">
							<!-- 검색 창 -->
							<div class="active-cyan row">
								<div class="col-9">
									<input class="form-control" type="text" name="productName"
										placeholder="상품명 입력" aria-label="Search">
								</div>
								<!--   검색 icon -->
								<div class="col-1">
									<button type="submit" class="btn">
										<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
											fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
									<path
												d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z" />
								</svg>
									</button>
								</div>
							</div>
						</form>
						<!-- Search form 종료 -->

						<!-- 마이메뉴 icon + 드롭다운창 -->
						<div class="dropdown show">
							<a
								class="nav-icon position-relative text-decoration-none dropdown-toggle"
								href="#" data-toggle="dropdown"> <svg
									xmlns="http://www.w3.org/2000/svg" width="16" height="16"
									fill="currentColor" class="bi bi-person-circle"
									viewBox="0 0 16 16">
								<path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z" />
								<path fill-rule="evenodd"
										d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z" />
							</svg>
							</a>
							<div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
								<sec:authorize access="isAnonymous()">
									<a class="dropdown-item" href="/member/signUp1">회원가입</a>
									<a class="dropdown-item" href="/member/login">로그인</a>
								</sec:authorize>
								<sec:authorize access="isAuthenticated()">
									<a class="dropdown-item" href="/member/logout">로그아웃</a>
									<a class="dropdown-item" href="/member/myPage">마이페이지</a>
									<a class="dropdown-item" href="#">장바구니</a>
								</sec:authorize>
							</div>
						</div>
						<!-- 마이메뉴 icon + 드롭다운창 종료 -->

					</div>
				</div>
			</div>

		</nav>
	</section>
	<!-- Header 종료-->