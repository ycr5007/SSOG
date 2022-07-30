<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<!-- Font - googleapis -->
	<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
	<!-- Icon - fontawesome cdn -->
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous"/>
	<!-- Style -->
	<link href="/resources/css/sb-admin-2.min.css" rel="stylesheet">
	<!-- 파일 업로드 css -->
	<link rel="stylesheet" href="/resources/css/upload.css" />
	<title>관리자 메인 페이지</title>
</head>

<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">

		<!-- 사이드바 시작 -->
		<ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">
		
			<!-- 사이드바 - 메인 -->
			<a class="sidebar-brand d-flex align-items-center justify-content-center" href="/manager_index">
				<div class="sidebar-brand-icon">
					<i class="fas fa-fw fa-cog"></i>
				</div>
				<div class="sidebar-brand-text mx-3">Market Manager</div>
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

			<!-- 등록된 장터가 없는 경우 사이드바 장터 메뉴 이용 불가 -->
			<!-- alert('장터 등록 후 이용 가능합니다.') 후 market_register로 이동 -->
			
			<c:if test="${marketNo != 0}">
			<!-- 사이드바 - 내 장터 보기 -->
			<li class="nav-item">
				<a class="nav-link" href="/market/market_detail?marketNo=${marketNo}">
					<i class="fas fa-fw fa-bookmark"></i>
					<span>내 장터</span>
				</a>
			</li>

			<!-- 사이드바 - 장터 참여자 모집 신청 -->
			<li class="nav-item">
				<a class="nav-link" href="" onclick="recruitPopup();">
					<i class="fas fa-fw fa-users"></i>
					<span>장터 참여자 모집</span>
				</a>
			</li>

			<!-- 사이드바 - 내 장터 참여 신청자 보기 -->
			<li class="nav-item">
				<a class="nav-link" href="/market/market_receive?marketNo=${marketNo}&pageNum=1&amount=10">
					<i class="fas fa-fw fa-edit"></i>
					<span>장터 참여 신청 목록</span>
				</a>
			</li>
			
			<!-- 사이드바 - 참여 승인 상품 보기 -->
			<li class="nav-item">
				<a class="nav-link" href="/market/market_accept?marketNo=${marketNo}&pageNum=1&amount=10">
					<i class="fas fa-fw fa-check-square"></i>
					<span>참여 승인 목록</span>
				</a>
			</li>

			<!-- 사이드바 - 내 장터 참여자 보기 -->
			<li class="nav-item">
				<a class="nav-link" href="/market/market_myseller?marketNo=${marketNo}&pageNum=1&amount=10">
					<i class="fas fa-fw fa-shopping-basket"></i>
					<span>장터 판매 상품 목록</span>
				</a>
			</li>

			<!-- 사이드바 - 내 장터 한 줄 리뷰 -->
			<li class="nav-item">
				<a class="nav-link" href="/market/market_review?marketNo=${marketNo}&pageNum=1&amount=10">
					<i class="fas fa-fw fa-star"></i>
					<span>장터 후기</span>
				</a>
			</li>

			<!-- 사이드바 - 내 장터 공지 및 이벤트 -->
			<li class="nav-item">
				<a class="nav-link" href="/market/market_notice?marketNo=${marketNo}&pageNum=1&amount=10">
					<i class="fas fa-fw fa-table"></i>
					<span>장터 공지</span>
				</a>
			</li>
			
			</c:if>
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
								<!-- 알림 개수 표시 -->
								<span class="badge badge-danger badge-counter">3+</span>
							</a>
						</li>

						<!-- 상단바 - 쪽지 -->
						<li class="nav-item dropdown no-arrow mx-1">
							<a class="nav-link" href="#">
								<i class="fas fa-envelope fa-fw"></i>
								<!-- 쪽지 개수 표시 -->
								<span class="badge badge-danger badge-counter">7</span>
							</a>
						</li>

						<!-- 구분선 -->
						<div class="topbar-divider d-none d-sm-block"></div>

						<!-- 상단바 - 프로필 -->
						<li class="nav-item dropdown no-arrow">
							<a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
								<span class="mr-2 d-none d-lg-inline text-gray-600 small">관리자</span>
								<i class="fas fa-fw fa-user"></i>
							</a>
							<!-- 프로필 드롭다운 -->
							<div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
								<a class="dropdown-item" href="/member/myPagePwCheck">
									<i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
									마이페이지
								</a>
								<div class="dropdown-divider"></div>
								<a class="dropdown-item" href="/member/logout">
									<i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
									로그아웃
								</a>
							</div>
						</li>
					</ul>

				</nav>
				<!-- 상단바 종료 -->
		<script>
			function recruitPopup() {
				var pop = window.open("/market/recruitPopup?marketNo=${marketNo}", "pop", "width=500,height=400");
			}
		</script>