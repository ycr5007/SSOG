<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
	<!-- Font - googleapis -->
	<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
	<!-- Icon - fontawesome cdn -->
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous"/>
	<!-- Style -->
	<link href="/resources/css/sb-admin-2.min.css" rel="stylesheet">
	<script src="/resources/js/jquery.min.js"></script>
	<!-- 파일 업로드 css -->
	<link rel="stylesheet" href="/resources/css/upload.css" />
	<title>판매자 메인 페이지</title>
</head>

<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- 사이드바 시작 -->
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- 사이드바 - 메인 -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="/product/product_index">
                <div class="sidebar-brand-icon">
                    <i class="fas fa-fw fa-cog"></i>
                </div>
                <div class="sidebar-brand-text mx-3">Market Seller</div>
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
            
            <!-- 사이드바 - 현재 오픈된 장터 정보 -->
            <li class="nav-item">
                <a class="nav-link" href="/product/product_market_list?userNo=${userNo}&pageNum=${pageNum}&amount=${amount}">
                    <i class="fas fa-fw fa-map-marker-alt"></i>
                    <span>현재 오픈 예정 장터</span>
                </a>
            </li>

			 
             <!-- 사이드바 - 상품 관리 -->
		     <li class="nav-item">
		         <a class="nav-link" href="/product/product_list?userNo=${userNo}">
		              <i class="fas fa-fw fa-folder"></i>
		              <span>상품 목록</span>
		         </a>
            </li>
            
            <!-- 사이드바 : 마켓 종료 후 남은 상품 리스트 -->
            <li class="nav-item">
		         <a class="nav-link" href="/product/product_remain_list?userNo=${userNo}">
		              <i class="fas fa-fw fa-folder"></i>
		              <span>재고 상품 목록</span>
		         </a>
            </li>
            <!-- 사이드바 : 온라인 상품 리스트 -->
			  <li class="nav-item">
		         <a class="nav-link" href="/product/product_online_list?userNo=${userNo}">
		              <i class="fas fa-fw fa-folder"></i>
		              <span>온라인 상품 목록</span>
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
                                <!-- 알림 개수 표시 -->
                                <span class="badge badge-danger badge-counter">5+</span>
                            </a>
                        </li>

                        <!-- 상단바 - 쪽지 -->
                        <li class="nav-item dropdown no-arrow mx-1">
                            <a class="nav-link" href="#">
                                <i class="fas fa-envelope fa-fw"></i>
                                <!-- 쪽지 개수 표시 -->
                                <span class="badge badge-danger badge-counter">10</span>
                            </a>
                        </li>

						<!-- 구분선 -->
                        <div class="topbar-divider d-none d-sm-block"></div>

                       <!-- 상단바 - 프로필 -->
						<li class="nav-item dropdown no-arrow">
							<a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
								<span class="mr-2 d-none d-lg-inline text-gray-600 small">SELLER</span>
								<i class="fas fa-fw fa-user"></i>
							</a>
							<!-- 프로필 드롭다운 -->
							<div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
								<a class="dropdown-item" href="/member/myPagePwCheck">
									<i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
									마이페이지
								</a>
								<div class="dropdown-divider"></div>
								<a class="dropdown-item" href="/member/logout" >
									<i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>									
									로그아웃
								</a>
							</div>
						</li>
                            	<!-- 마이페이지로 돌아가기 -->
                            	<!-- 로그아웃 -->
                        
                    </ul>

                </nav>
                <!-- 상단바 종료 -->
                
           