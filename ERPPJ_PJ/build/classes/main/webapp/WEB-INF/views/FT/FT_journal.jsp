<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <%@ include file="../setting.jsp" %>
        
    </head>

    <body>

        <!-- Begin page -->
        <div id="wrapper">

            
            <%@ include file="../sidebar.jsp" %>

            <!-- ============================================================== -->
            <!-- Start Page Content here -->
            <!-- ============================================================== -->

            <div class="content-page">
                <div class="content">
                    
                    <!-- Start Content-->
                    <div class="container-fluid">
                        
                        <!-- start page title -->
                        <div class="row">
                            <div class="col-12">
                                <div class="page-title-box">
                                    <div class="page-title-right">
                                        <ol class="breadcrumb m-0">
                                            <li class="breadcrumb-item"><a href="javascript: void(0);">Codefox</a></li>
                                            <li class="breadcrumb-item"><a href="javascript: void(0);">Tables</a></li>
                                            <li class="breadcrumb-item active">Datatables</li>
                                        </ol>
                                    </div>
                                    <h4 class="page-title">분개장</h4>
                                </div>
                            </div>
                        </div>     
                        <!-- end page title --> 
						
                        <div class="row">
                            <div class="col-sm-12">
                                <div class="card">
                                    <div class="card-body table-responsive">
                                        <h4 class="header-title">Example</h4>
                                        <div align="right">
    									<button type="button" class="btn btn-outline-dark waves-effect waves-light">정렬순서</button>
    									<button type="button" class="btn btn-outline-dark waves-effect waves-light">조건검색</button>
    									<br>
    									</div>
    									<table id="datatable" style="border-collapse: collapse; border-spacing: 0; width: 100%;">
                                            <tr>
                                                <td>회계단위</td>
                                                <td>
                                                <select class="form-control select2">
		                                            <option>전체선택</option>
		                                                <option value="">오디</option>
		                                                <option value="">본점</option>
		                                        </select>
                                                </td>
                                                <td>기표기간</td>
                                                <td>
                                                <!-- 기간 달력 여기 넣고 -->
                                                </td>
                                                <td>결의부서</td>
                                                <td><input type="text" class="">&nbsp;<a href="#"><i class="dripicons-zoom-in"></i></a>
                                                	<input type="text" class="" readonly>
                                                </td>
                                                	
                                               	<td>
                                                	<input type="text" class="">&nbsp;<a href="#"><i class="dripicons-zoom-in"></i></a>
                                                	<input type="text" class="" readonly>
                                                </td>
                                                <td></td>
                                                <td></td>
                                            </tr>
                                            
                                            <tr>
                                            	<td>전표구분</td>
                                            	<td>
	                                            	<select class="form-control select2">
			                                            <option>전체선택</option>
			                                                <option value="">1.출 금</option>
			                                                <option value="">2.입 금</option>
			                                                <option value="">3.대 체</option>
			                                        </select>
                                            	</td>
                                            	
                                            	<td>전표유형</td>
                                            	<td>
	                                            	<select class="form-control select2">
			                                            <option>전체선택</option>
			                                                <option value="">1.일 반</option>
			                                                <option value="">2.매 입</option>
			                                                <option value="">3.매 출</option>
			                                                <option value="">4.수 금</option>
			                                                <option value="">5.반 제</option>
			                                                <option value="">6.수 정</option>
			                                                <option value="">7.본지점</option>
			                                                <option value="">8.결 산</option>
			                                                <option value="">9.결의서</option>
			                                        </select>
                                            	</td>
                                            	
                                            	<td>작성자</td>
                                            	<td><input type="text" class="">&nbsp;<a href="#"><i class="dripicons-zoom-in"></i></a></td>
                                            </tr>
                                        </table>
                                        
                                        <table id="datatable" class="table table-striped table-bordered dt-responsive nowrap" style="border-collapse: collapse; border-spacing: 0; width: 100%;">
                                            <thead>
                                            <tr>
                                                <th>구분[기표]</th>
                                                <th colspan="2">차변</th>
                                                <th colspan="2">대변</th>
                                                <th rolspan="2">적요</th>
                                                <th colspan="2">거래처</th>
                                                <th colspan="2">구분[결의]</th>
                                                <th colspan="2">PJT</th>
                                            </tr>
                                            </thead>
    
    
                                            <tbody>
                                            <tr>
                                                <td>번호</td>
                                                <td>금액</td>
                                                <td>계정과목</td>
                                                <td>계정과목</td>
                                                <td>금액</td>
                                                <td>코드</td>
                                                <td>거래처명</td>
                                                <td>년/월/일</td>
                                                <td>번호</td>
                                                <td>코드</td>
                                                <td>PJT명</td>
                                            </tr>
                                            
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div> <!-- end container-fluid -->

                </div> <!-- end content -->
                

                <!-- Footer Start -->
                <footer class="footer">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-md-6">
                                2016 - 2019 &copy; Codefox theme by <a href="">Coderthemes</a>
                            </div>
                            <div class="col-md-6">
                                <div class="text-md-right footer-links d-none d-sm-block">
                                    <a href="#">About Us</a>
                                    <a href="#">Help</a>
                                    <a href="#">Contact Us</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </footer>
                <!-- end Footer -->

            </div>

            <!-- ============================================================== -->
            <!-- End Page content -->
            <!-- ============================================================== -->

        </div>
        <!-- END wrapper -->

        <!-- Right Sidebar -->
        <div class="right-bar">
            <div class="rightbar-title">
                <a href="javascript:void(0);" class="right-bar-toggle float-right">
                    <i class="mdi mdi-close"></i>
                </a>
                <h5 class="m-0 text-white">Settings</h5>
            </div>
            <div class="slimscroll-menu">
                <hr class="mt-0">
                <h5 class="pl-3">Basic Settings</h5>
                <hr class="mb-0" />


                <div class="p-3">
                    <div class="custom-control custom-checkbox mb-2">
                        <input type="checkbox" class="custom-control-input" id="customCheck1" checked>
                        <label class="custom-control-label" for="customCheck1">Notifications</label>
                    </div>
                    <div class="custom-control custom-checkbox mb-2">
                        <input type="checkbox" class="custom-control-input" id="customCheck2" checked>
                        <label class="custom-control-label" for="customCheck2">API Access</label>
                    </div>
                    <div class="custom-control custom-checkbox mb-2">
                        <input type="checkbox" class="custom-control-input" id="customCheck3">
                        <label class="custom-control-label" for="customCheck3">Auto Updates</label>
                    </div>
                    <div class="custom-control custom-checkbox mb-2">
                        <input type="checkbox" class="custom-control-input" id="customCheck4" checked>
                        <label class="custom-control-label" for="customCheck4">Online Status</label>
                    </div>
                    <div class="custom-control custom-checkbox">
                        <input type="checkbox" class="custom-control-input" id="customCheck5">
                        <label class="custom-control-label" for="customCheck5">Auto Payout</label>
                    </div>
                </div>

                <!-- Timeline -->
                <hr class="mt-0" />
                <h5 class="pl-3 pr-3">Timeline</h5>
                <hr class="mb-0" />

                <div class="p-3">
                    <ul class="list-unstyled activity-widget">
                        <li class="activity-list">
                            <p class="mb-0"><small>08 July</small></p>
                            <p>Neque porro quisquam est</p>
                        </li>
                        <li class="activity-list">
                            <p class="mb-0"><small>09 July</small></p>
                            <p>Ut enim ad minima veniam quis velit esse </p>
                        </li>
                        <li class="activity-list">
                            <p class="mb-0"><small>10 July</small></p>
                            <p>Quis autem vel eum iure</p>
                        </li>
                    </ul>
                </div>

                <!-- Messages -->
                <hr class="mt-0" />
                <h5 class="pl-3 pr-3">Messages <span class="float-right badge badge-pill badge-danger">24</span></h5>
                <hr class="mb-0" />
                <div class="p-3">
                    <div class="inbox-widget">
                        <div class="inbox-item">
                            <div class="inbox-item-img"><img src="assets/images/users/avatar-1.jpg" class="rounded-circle" alt=""></div>
                            <p class="inbox-item-author"><a href="javascript: void(0);">Chadengle</a></p>
                            <p class="inbox-item-text">Hey! there I'm available...</p>
                            <p class="inbox-item-date">13:40 PM</p>
                        </div>
                        <div class="inbox-item">
                            <div class="inbox-item-img"><img src="assets/images/users/avatar-2.jpg" class="rounded-circle" alt=""></div>
                            <p class="inbox-item-author"><a href="javascript: void(0);">Tomaslau</a></p>
                            <p class="inbox-item-text">I've finished it! See you so...</p>
                            <p class="inbox-item-date">13:34 PM</p>
                        </div>
                        <div class="inbox-item">
                            <div class="inbox-item-img"><img src="assets/images/users/avatar-3.jpg" class="rounded-circle" alt=""></div>
                            <p class="inbox-item-author"><a href="javascript: void(0);">Stillnotdavid</a></p>
                            <p class="inbox-item-text">This theme is awesome!</p>
                            <p class="inbox-item-date">13:17 PM</p>
                        </div>

                        <div class="inbox-item">
                            <div class="inbox-item-img"><img src="assets/images/users/avatar-4.jpg" class="rounded-circle" alt=""></div>
                            <p class="inbox-item-author"><a href="javascript: void(0);">Kurafire</a></p>
                            <p class="inbox-item-text">Nice to meet you</p>
                            <p class="inbox-item-date">12:20 PM</p>

                        </div>
                        <div class="inbox-item">
                            <div class="inbox-item-img"><img src="assets/images/users/avatar-5.jpg" class="rounded-circle" alt=""></div>
                            <p class="inbox-item-author"><a href="javascript: void(0);">Shahedk</a></p>
                            <p class="inbox-item-text">Hey! there I'm available...</p>
                            <p class="inbox-item-date">10:15 AM</p>

                        </div>
                    </div> <!-- end inbox-widget -->
                </div> <!-- end .p-3-->

            </div> <!-- end slimscroll-menu-->
        </div>
        <!-- /Right-bar -->

        <!-- Right bar overlay-->
        <div class="rightbar-overlay"></div>

        <%@ include file="../setting2.jsp" %>
        
    </body>
</html>