<%@ include file="./include/manager_header.jsp" %>

                <!-- content 시작 -->
                <div class="container-fluid">

						<!-- 마켓 이미지 -->
                        <div class="col-xl-12 col-lg-7">
                            <div class="card shadow mb-4">
                                <div class="card-body">
                                    <div class="chart-area">
                                        <img src="/resources/img/market.PNG" style="width:100%; height:100%"/>
                                    </div>
                                </div>
                            </div>
                        </div>

                    <div class="row">
                        <!-- 마켓 참여자 리스트 -->
                        <div class="col-xl-6 col-lg-5">
                            <div class="card shadow mb-4">
                            	<!-- header -->
                                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                    <h6 class="m-0 font-weight-bold text-primary">My Seller</h6>
                                        <a href="#">more</a>
                                </div>
                                <!-- body -->
                                <div class="card-body">
                                    <div class="chart-pie pt-4 pb-2">
                                        <canvas id="myPieChart"></canvas>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- 마켓 리뷰 -->
                        <div class="col-xl-6 col-lg-5">
                            <div class="card shadow mb-4">
                                <!-- header -->
                                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                    <h6 class="m-0 font-weight-bold text-primary">Market Review</h6>
                                        <a href="#">more</a>
                                </div>
                                <!-- body -->
                                <div class="card-body">
                                    <div class="chart-pie pt-4 pb-2">
                                        <canvas id="myPieChart"></canvas>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- content 종료 -->

            </div>
            <!-- End of Main Content -->
            
<%@ include file="./include/manager_footer.jsp" %>