<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>쏠마켓</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <link rel="apple-touch-icon" href="assets/img/apple-icon.png" />
    <link
      rel="shortcut icon"
      type="image/x-icon"
      href="assets/img/favicon.ico"
    />

    <link rel="stylesheet" href="/resources/css/bootstrap.min.css" />
    <link rel="stylesheet" href="/resources/css/templatemo.css" />
    <link rel="stylesheet" href="/resources/css/custom.css" />

    <!-- Load fonts style after rendering the layout styles -->
    <link
      rel="stylesheet"
      href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap"
    />
    <link rel="stylesheet" href="/resources/css/fontawesome.min.css" />

    <!-- jquery cdn -->
    <script
      src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
      integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
      crossorigin="anonymous"
    ></script>

    <!-- bootstrap cdn -->
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF"
      crossorigin="anonymous"
    ></script>
</head>
<body>
	<!-- Header -->
    <nav class="navbar navbar-expand-lg navbar-light shadow">
      <div class="container d-flex justify-content-between align-items-center">
        <a class="navbar-brand text-success logo" href="index.html">
          <img
            src="/resources/img/ssol_logo.png"
            class="market_logo"
            style="display: block; margin: 0 auto; width: 116px; height: 55px"
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
                <a class="nav-link" href="index.html">홈</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="about.html">커뮤니티</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="shop.html">재고상점</a>
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

            <!-- 검색 icon -->
            <a
              class="nav-icon d-none d-lg-inline"
              href="#"
              data-bs-toggle="modal"
              data-bs-target="#templatemo_search"
            >
              <i class="fa fa-fw fa-search text-dark mr-2"></i>
            </a>

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
                <a class="dropdown-item" href="#">회원가입</a>
                <a class="dropdown-item" href="#">로그인</a>
                <a class="dropdown-item" href="#">마이페이지</a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </nav>
    <!-- Close Header -->
    
    <!-- Modal -->
    <div
      class="modal fade bg-white"
      id="templatemo_search"
      tabindex="-1"
      role="dialog"
      aria-labelledby="exampleModalLabel"
      aria-hidden="true"
    >
      <div class="modal-dialog modal-lg" role="document">
        <div class="w-100 pt-1 mb-5 text-right">
          <button
            type="button"
            class="btn-close"
            data-bs-dismiss="modal"
            aria-label="Close"
          ></button>
        </div>
        <form
          action=""
          method="get"
          class="modal-content modal-body border-0 p-0"
        >
          <div class="input-group mb-2">
            <input
              type="text"
              class="form-control"
              id="inputModalSearch"
              name="q"
              placeholder="검색할 상품을 입력해주세요"
            />
            <button
              type="submit"
              class="input-group-text bg-success text-light"
            >
              <i class="fa fa-fw fa-search text-white"></i>
            </button>
          </div>
        </form>
      </div>
    </div>