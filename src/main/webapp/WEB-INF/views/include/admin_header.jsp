<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<!-- Font - googleapis -->
	<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
	<!-- Icon - fontawesome cdn -->
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous" />
	<!-- Style -->
	<link href="/resources/css/sb-admin-2.min.css" rel="stylesheet">
	<!-- MetisMenu CSS -->
	<script src="/resources/vendor/chart.js/Chart.min.js"></script>
	<script src="/resources/js/jquery.min.js"></script>
	<title>쏠장터 사이트 관리자</title>
</head>

<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">

		<!-- 사이드바 시작 -->
		<ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">
			<!-- 사이드바 - 메인 -->
			<a class="sidebar-brand d-flex align-items-center justify-content-center" href="/admin/index">
				<div class="sidebar-brand-icon">
					<i class="fas fa-fw fa-cog"></i>
				</div>
				<div class="sidebar-brand-text mx-3">Admin</div>
			</a>

			<!-- 구분선 -->
			<hr class="sidebar-divider">

			<!-- 사이드바 - 홈페이지 메인으로 돌아가기 -->
			<li class="nav-item active">
				<a class="nav-link" href="/">
					<i class="fas fa-fw fa-house-user"></i>
					<span>쏠장터 메인</span>
				</a>
			</li>

			<!-- 구분선 -->
			<hr class="sidebar-divider">

			<!-- 회원관리 - 현재 회원 수 및 회원 권한 확인 ( 필터링 작업 ) -->
			<li class="nav-item">
				<a class="nav-link" href="/admin/user">
					<i class="fas fa-fw fa-bookmark"></i>
					<span>회원관리</span>
				</a>
			</li>

			<!-- 장터관리 - 마켓운영자로부터 장터 오픈 요청 확인 및 승인 작업 -->
			<li class="nav-item">
				<a class="nav-link" href="/admin/market">
					<i class="fas fa-fw fa-users"></i>
					<span>장터관리</span>
				</a>
			</li>

			<!-- 공지사항 - 마켓운영자로부터 공지사항 요청 확인 및 승인 작업 -->
			<li class="nav-item">
				<a class="nav-link" href="#">
					<i class="fas fa-fw fa-edit"></i>
					<span>공지사항</span>
				</a>
			</li>

			<!-- 게시판 관리 - 악성 및 광고성 게시글 삭제 -->
			<li class="nav-item">
				<a class="nav-link" href="#">
					<i class="fas fa-fw fa-star"></i>
					<span>게시판관리</span>
				</a>
			</li>
		</ul>
		<!-- 사이드바 종료 -->

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">
			<!-- Main Content -->
			<div id="content">
				<!-- 상단바 -->
				<nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
					<!-- 상단바 메뉴 -->
					<ul class="navbar-nav ml-auto">
						<!-- 상단바 - 알림 -->
						<li class="nav-item dropdown no-arrow mx-1">
							<a class="nav-link" href="#">
								<i class="fas fa-fw fa-bell"></i>
								<!-- 마켓운영자로부터 들어온 장터 요청 개수 -->
								<span class="badge badge-danger badge-counter">3+</span>
							</a>
						</li>
						<!-- 상단바 - 쪽지 -->
						<li class="nav-item dropdown no-arrow mx-1">
							<a class="nav-link" href="#">
								<i class="fas fa-envelope fa-fw"></i>
								<!-- 마켓 운영자로부터 들어온 공시사항 요청 개수 -->
								<span class="badge badge-danger badge-counter">7</span>
							</a>
						</li>

						<!-- 구분선 -->
						<div class="topbar-divider d-none d-sm-block"></div>

						<!-- 상단바 - 프로필 -->
						<li class="nav-item dropdown no-arrow">
							<a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
								<span class="mr-2 d-none d-lg-inline text-gray-600 small">ADMIN</span>
								<i class="fas fa-fw fa-user"></i>
							</a>
							<!-- 프로필 드롭다운 -->
							<div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
								<a class="dropdown-item" href="#">
									<i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
									마이페이지
								</a>
								<div class="dropdown-divider"></div>
								<a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
									<i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
									로그아웃
								</a>
							</div>
						</li>
					</ul>

				</nav>
				<!-- 상단바 종료 -->