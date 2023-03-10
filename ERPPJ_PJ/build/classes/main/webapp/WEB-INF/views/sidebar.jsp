<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="setting.jsp" %>

<!-- Topbar Start -->
            <div class="navbar-custom">
                <ul class="list-unstyled topnav-menu float-right mb-0">

                    <li class="d-none d-sm-block">
                        <form class="app-search">
                            <div class="app-search-box">
                                <div class="input-group">
                                    <input type="text" class="form-control" placeholder="Search...">
                                    <div class="input-group-append">
                                        <button class="btn" type="submit">
                                            <i class="fe-search"></i>
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </li>
        
                    <li class="dropdown notification-list">
                        <a class="nav-link dropdown-toggle  waves-effect waves-light" data-toggle="dropdown" href="#" role="button" aria-haspopup="false" aria-expanded="false">
                            <i class="fe-bell noti-icon"></i>
                            <span class="badge badge-danger rounded-circle noti-icon-badge">9</span>
                        </a>
                        <div class="dropdown-menu dropdown-menu-right dropdown-lg">

                            <!-- item-->
                            <div class="dropdown-item noti-title">
                                <h5 class="m-0">
                                    <span class="float-right">
                                        <a href="" class="text-dark">
                                            <small>Clear All</small>
                                        </a>
                                    </span>Notification
                                </h5>
                            </div>

                            <div class="slimscroll noti-scroll">

                                <!-- item-->
                                <a href="javascript:void(0);" class="dropdown-item notify-item">
                                    <div class="notify-icon bg-primary">
                                        <i class="mdi mdi-settings-outline"></i>
                                    </div>
                                    <p class="notify-details">New settings
                                        <small class="text-muted">There are new settings available</small>
                                    </p>
                                </a>

                                <!-- item-->
                                <a href="javascript:void(0);" class="dropdown-item notify-item active">
                                    <div class="notify-icon">
                                        <img src="/erp/resources/assets/images/users/avatar-1.jpg" class="img-fluid rounded-circle" alt="" /> </div>
                                    <p class="notify-details">Cristina Pride</p>
                                    <p class="text-muted mb-0 user-msg">
                                        <small>Hi, How are you? What about our next meeting</small>
                                    </p>
                                </a>

                    
                                <!-- item-->
                                <a href="javascript:void(0);" class="dropdown-item notify-item">
                                    <div class="notify-icon bg-warning">
                                        <i class="mdi mdi-bell-outline"></i>
                                    </div>
                                    <p class="notify-details">Updates
                                        <small class="text-muted">There are 2 new updates available</small>
                                    </p>
                                </a>

                                <!-- item-->
                                <a href="javascript:void(0);" class="dropdown-item notify-item">
                                    <div class="notify-icon">
                                        <img src="/erp/resources/assets/images/users/avatar-4.jpg" class="img-fluid rounded-circle" alt="" /> </div>
                                    <p class="notify-details">Karen Robinson</p>
                                    <p class="text-muted mb-0 user-msg">
                                        <small>Wow ! this admin looks good and awesome design</small>
                                    </p>
                                </a>

                                <!-- item-->
                                <a href="javascript:void(0);" class="dropdown-item notify-item">
                                    <div class="notify-icon bg-danger">
                                        <i class="mdi mdi-account-plus"></i>
                                    </div>
                                    <p class="notify-details">New user
                                        <small class="text-muted">You have 10 unread messages</small>
                                    </p>
                                </a>

                                <!-- item-->
                                <a href="javascript:void(0);" class="dropdown-item notify-item">
                                    <div class="notify-icon bg-info">
                                        <i class="mdi mdi-comment-account-outline"></i>
                                    </div>
                                    <p class="notify-details">Caleb Flakelar commented on Admin
                                        <small class="text-muted">4 days ago</small>
                                    </p>
                                </a>

                                <!-- item-->
                                <a href="javascript:void(0);" class="dropdown-item notify-item">
                                    <div class="notify-icon bg-secondary">
                                        <i class="mdi mdi-heart"></i>
                                    </div>
                                    <p class="notify-details">Carlos Crouch liked
                                        <b>Admin</b>
                                        <small class="text-muted">13 days ago</small>
                                    </p>
                                </a>
                            </div>

                            <!-- All-->
                            <a href="javascript:void(0);" class="dropdown-item text-center text-primary notify-item notify-all">
                                View all
                                <i class="fi-arrow-right"></i>
                            </a>

                        </div>
                    </li>
						 <li class="dropdown notification-list">
                        <a class="nav-link dropdown-toggle nav-user mr-0 waves-effect waves-light" data-toggle="dropdown" href="#" role="button" aria-haspopup="false" aria-expanded="false">
                        <i class="dripicons-user" alt="user-image" class="rounded-circle"></i>
                        <!-- <img src="/erp/resources/assets/images/users/login.png" alt="user-image" class="rounded-circle"> -->
                        </a>
                        <div class="dropdown-menu dropdown-menu-right profile-dropdown ">
                            <!-- item-->
                            <div class="dropdown-header noti-title">
                                <h6 class="text-overflow m-0">Welcome !</h6>
                            </div>
                            <!-- item-->
                            <sec:authorize access="isAnonymous()">
                            <a href="login" class="dropdown-item notify-item">
                                <i class="fe-log-in"></i>
                                <span>LogIn</span>
                            </a>
                            </sec:authorize>
                            <!-- item-->
                            <sec:authorize access="isAuthenticated()">
                            <a href="#" onclick="document.getElementById('logout-form').submit();" class="dropdown-item notify-item">
                                <form id="logout-form" action="logout" method="POST">
   									<input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}"/>
   									<i class="fe-log-out"></i>
                                	<span>Logout</span>
								</form>
                            </a>
                            </sec:authorize>
                        </div>
                    </li>
					
					
                    <!-- <li class="dropdown notification-list">
                        <a class="nav-link dropdown-toggle nav-user mr-0 waves-effect waves-light" data-toggle="dropdown" href="#" role="button" aria-haspopup="false" aria-expanded="false">
                            <img src="/erp/resources/assets/images/users/avatar-1.jpg" alt="user-image" class="rounded-circle">
                        </a>
                        <div class="dropdown-menu dropdown-menu-right profile-dropdown ">
                            item
                            <div class="dropdown-header noti-title">
                                <h6 class="text-overflow m-0">Welcome !</h6>
                            </div>

                            item
                            <a href="javascript:void(0);" class="dropdown-item notify-item">
                                <i class="fe-user"></i>
                                <span>Profile</span>
                            </a>

                            item
                            <a href="javascript:void(0);" class="dropdown-item notify-item">
                                <i class="fe-settings"></i>
                                <span>Settings</span>
                            </a>

                            item
                            <a href="javascript:void(0);" class="dropdown-item notify-item">
                                <i class="fe-lock"></i>
                                <span>Lock Screen</span>
                            </a>

                            <div class="dropdown-divider"></div>

                            item
                            <a href="javascript:void(0);" class="dropdown-item notify-item">
                                <i class="fe-log-out"></i>
                                <span>Logout</span>
                            </a>

                        </div>
                    </li> -->
					
                    <li class="dropdown notification-list">
                        <a href="javascript:void(0);" class="nav-link right-bar-toggle waves-effect waves-light">
                            <i class="fe-settings noti-icon"></i>
                        </a>
                    </li>
					

                </ul>

                <!-- LOGO -->
                <div class="logo-box">
                    <a href="index" class="logo text-center">
                        <span class="logo-lg">
                            <img src="/erp/resources/assets/images/logo-light.png" alt="" height="20">
                            <!-- <span class="logo-lg-text-light">UBold</span> -->
                        </span>
                        <span class="logo-sm">
                            <!-- <span class="logo-sm-text-dark">U</span> -->
                            <img src="/erp/resources/assets/images/logo-sm.png" alt="" height="24">
                        </span>
                    </a>
                </div>

                <ul class="list-unstyled topnav-menu topnav-menu-left m-0">
                    <li>
                        <button class="button-menu-mobile waves-effect waves-light">
                            <i class="fe-menu"></i>
                        </button>
                    </li>
        
                    <li class="dropdown d-none d-lg-block ">
                        <div class="lang-option">
                            <select class="selectpicker form-control" title="" data-width="110px">
                                <option> English </option>
                                <option> French </option>
                                <option> Germany </option>
                                <option> Spanish</option>
                            </select>
                        </div>
            
                    </li>

                </ul>
            </div>
            <!-- end Topbar -->


<!-- ========== Left Sidebar Start ========== -->
            <div class="left-side-menu">

                <div class="slimscroll-menu">

                    <!--- Sidemenu -->
                    <div id="sidebar-menu">

                        <ul class="metismenu" id="side-menu">

                            <li class="menu-title">Navigation</li>

                            <li>
                                <a href="index">
                                    <i class="fe-airplay"></i>
                                    <span class="badge badge-success badge-pill float-right">1</span>
                                    <span> Dashboard </span>
                                </a>
                            </li>
                           
                           	<li> 
	                          <a href="javascript: void(0);">
	                             <i class="mdi mdi-file-document"></i>
	                             <span> ???????????? </span>
	                             <span class="menu-arrow"></span>
	                          </a>
	                          <ul class="nav-second-level" aria-expanded="false">  	
	                          	<li><a href="planInquiry">????????? ??????</a></li>
	                          	<li><a href="planManagement">????????? ??????</a></li>
	                          	<li><a href="planEnrollment">????????? ??????</a></li> 	
	                          </ul>
							</li>
                           
                           
                           	<li> 
	                          <a href="javascript: void(0);">
	                             <i class="mdi mdi-account"></i> 
	                             <span> ?????? </span>
	                             <span class="menu-arrow"></span>
	                          </a>
	                          <ul class="nav-second-level" aria-expanded="false">
	                          	<li><a href="javascript: void(0);" aria-expanded="false">????????????
	                          			<span class="menu-arrow"></span>
	                          		</a>
	                          		<ul>
	                          			<li><a href="HR_InputHR">??????????????????</a></li>
										<li><a href="HR_EmployeeInformation">??????????????????</a></li>
										<li><a href="HR_GreetingPunishment">????????????/????????????</a></li>
										<li><a href="HR_EmployeeSalary">???????????? ??????</a></li>
										<li><a href="HR_Yearsofservice">??????????????????</a></li>
										<li><a href="HR_HrSalaryEnvironment">??????/??????????????????</a></li>
	                          		</ul>
	                          	</li>
	
	                          	<li><a href="javascript: void(0);" aria-expanded="false">????????????
	                          		<span class="menu-arrow"></span></a>
	                          		<ul>
	                          			<li><a href="HR_Greeting">??????????????????</a></li>
										<li><a href="HR_appointment_notice">??????????????????</a></li>
										<li><a href="HR_appointment_report">?????????????????????</a></li>
	                          		</ul>	
	                          	</li>
	                          	
	                          	<li><a href="javascript: void(0);" aria-expanded="false">??????/????????????
	                          	<span class="menu-arrow"></span></a>
	                          		<ul>
	                          			<li><a href="HR_work_record">??????????????????</a></li>
					                	<li><a href="coming_soon">!??????????????? ?????? ??? ??????</a></li>
					                	<li><a href="coming_soon">!????????????</a></li>
					                	<li><a href="coming_soon">!????????????</a></li>
					                	<li><a href="coming_soon">!???/?????? ????????????</a></li>
					                	<li><a href="coming_soon">!?????? ???/??????????????????</a></li>
					                	<li><a href="coming_soon">!????????? ???/??????????????????</a></li>
					                	<li><a href="coming_soon">!???/?????? ????????????</a></li>
					                	<li><a href="coming_soon">!????????? ???/?????? ????????????</a></li>
					                	<li><a href="coming_soon">!??????????????????</a></li>
					                	<li><a href="coming_soon">!???/?????? ????????????</a></li>
					                	<li><a href="coming_soon">!??????????????????</a></li>
					                	<li><a href="coming_soon">!????????? ??????????????????</a></li>
	                          		</ul>
	                          	</li>
	                          	
	                          	<li><a href="javascript: void(0);" aria-expanded="false">!??????????????????<span class="menu-arrow"></span></a>
	                          		<ul>
	                          			<li><a href="coming_soon">!????????????????????????</a></li>
										<li><a href="coming_soon">!????????????????????????</a></li>
										<li><a href="coming_soon">!?????????????????????</a></li>
										<li><a href="coming_soon">!?????????????????????</a></li>
										<li><a href="coming_soon">!???????????????????????????</a></li>
	                          		</ul>
	                          	</li>
	                          	
	                          	<li><a href="javascript: void(0);" aria-expanded="false">!??????????????????
	                          	<span class="menu-arrow"></span></a>
	                          		<ul>
	                          			<li><a href="coming_soon">!????????????????????????</a></li>
										<li><a href="coming_soon">!??????????????????</a></li>
										<li><a href="coming_soon">!???????????????????????????</a></li>
										<li><a href="coming_soon">!?????????????????????????????????</a></li>
	                          		</ul>
	                          	</li>
	                          	
	                          	<li><a href="javascript: void(0);" aria-expanded="false">!??????????????????
	                          	<span class="menu-arrow"></span></a>
	                          		<ul>
	                          			<li><a href="coming_soon">!??????????????????</a></li>
										<li><a href="coming_soon">!???????????????</a></li>
										<li><a href="coming_soon">!?????????????????????????????????</a></li>
										<li><a href="coming_soon">!??????????????????</a></li>
	                          		</ul>
	                          	</li>
	                          	
	                          	<li><a href="javascript: void(0);" aria-expanded="false">!????????????
	                          	<span class="menu-arrow"></span></a>
	                          		<ul>
	                          			<li><a href="coming_soon">!?????????????????????????????????</a></li>
										<li><a href="coming_soon">!?????????????????????????????????/?????????</a></li>
	                          		</ul>
	                          	</li>
	                          	
	                          	<li><a href="javascript: void(0);" aria-expanded="false">!????????????
	                          	<span class="menu-arrow"></span></a>
	                          		<ul>
	                          			<li><a href="coming_soon">!??????????????????</a></li>
										<li><a href="coming_soon">!??????????????????????????????</a></li>
										<li><a href="coming_soon">!???????????? ??? ??????</a></li>
	                          		</ul>
	                          	</li>
	                          	
	                          	<li><a href="javascript: void(0);" aria-expanded="false">!???????????????
	                          	<span class="menu-arrow"></span></a>
	                          		<ul>
	                          			<li><a href="coming_soon">!?????????????????????</a></li>
										<li><a href="coming_soon">!?????????????????????????????????</a></li>
										<li><a href="coming_soon">!????????????????????? ??? ??????</a></li>
	                          		</ul>
	                          	</li>
	                          </ul>
	                          
	                          
	                          <!-- ??? ?????? ?????? ?????? ?????? ??? -->
	                        <li> 
	                          <a href="javascript: void(0);">
	                             <i class="mdi mdi-car-back"></i>
	                             <span> ?????? </span>
	                             <span class="menu-arrow"></span>
	                             </a>
	                          </a>
	                          <ul class="nav-second-level" aria-expanded="false">  	
	                          	<li><a href="javascript: void(0);" aria-expanded="false">????????????
	                          			<span class="menu-arrow"></span>
	                          		</a>
	                          		<ul>
	                          			<li><a href="ST_sale_plan">???????????? ??????</a></li>
										<li><a href="ST_estimate">?????? ??????</a></li>
										<li><a href="ST_tables-datatable">?????? ????????? ??????</a></li>
										<li><a href="ST_tax-statements">?????? ????????? ??????</a></li>
	                          		</ul>
	                          	</li>
	                          	
	                          	<li><a href="javascript: void(0);" aria-expanded="false">????????????
			                          	<span class="menu-arrow"></span>
	                          		</a>
	                          		<ul>
	                          			<li><a href="ST_sale_plan_state">???????????? ??????</a></li>
										<li><a href="ST_contrast_pp">???????????? ?????? ?????? ??????</a></li>
										<li><a href="ST_tables-responsive">?????? ??????</a></li>
										<li><a href="ST_contrast_pPro">?????? ?????? ?????? ??????</a></li>
										<li><a href="ST_delay_state">?????? ?????? ??????</a></li>
										<li><a href="ST_release">?????? ??????</a></li>
										<li><a href="ST_refund">?????? ??????</a></li>
										<li><a href="ST_tex_invoice_list">??????????????? ?????? ??????</a></li>
										<li><a href="coming_soon">!?????? ??????</a></li>																									
										<li><a href="coming_soon">!?????? ?????? ??????</a></li>
										<li><a href="coming_soon">!?????? ?????? ??????</a></li>
										<li><a href="coming_soon">!?????? ?????? ?????? ??????</a></li>	
	                          		</ul>
	                          	</li>
	                          	
	                          	<li><a href="javascript: void(0);" aria-expanded="false">????????????
	                          			<span class="menu-arrow"></span>
	                          		</a>
	                          		<ul>
	                          				<li><a href="coming_soon">!?????? ?????? ??????</a></li>
						                    <li><a href="coming_soon">!?????? ?????? ?????????(??????)</a></li>
						                    <li><a href="coming_soon">!?????? ??????</a></li>
						                    <li><a href="coming_soon">!?????? ?????????</a></li>
						                    <li><a href="coming_soon">!?????? ?????????</a></li>
											<li><a href="coming_soon">!?????? ????????????</a></li>
	                          		</ul>
	                          	</li>
	                          </ul>
							</li>	
	                         
							<li> 
	                          <a href="javascript: void(0);">
	                             <i class="mdi mdi-coin"></i>
	                             <span> ?????? </span>
	                             <span class="menu-arrow"></span>
	                          </a>
	                          <ul class="nav-second-level" aria-expanded="false">  	
	                          	<li><a href="javascript: void(0);" aria-expanded="false">??????/??????
	                          	<span class="menu-arrow"></span></a>
	                          		<ul>
	                          			<li><a href="FT_insertChit">????????????</a></li> 
					                    <li><a href="FT_Chit_Manager">??????????????????</a></li>
					                    <li><a href="FT_journal">?????????</a></li>
					                    <li><a href="FT_ledger">???????????????</a></li>
					                    <li><a href="FT_DTB">????????????????????????(????????????)</a></li>
					                    <li><a href="coming_soon">!????????? ???????????? ??????</a></li>
                          			</ul>
	                          	</li>
	                          	
	                          	<li><a href="javascript: void(0);" aria-expanded="false">??????/????????????
	                          			<span class="menu-arrow"></span>
	                          		</a>
	                          		<ul>
	                          				<li><a href="FT_insertTotal">??????????????????</a></li>
						                    <li><a href="FT_BS">???????????????</a></li>
						                    <li><a href="FT_IS">???????????????</a></li>
						                    <li><a href="FT_p_cost">???????????????</a></li>
	                          		</ul>
	                          	</li>
	                          	
	                          	<li><a href="javascript: void(0);" aria-expanded="false">??????
	                          			<span class="menu-arrow"></span>
	                          		</a>
	                          		<ul>
	                          				<li><a href="FT_funds_state">????????????</a></li>
                    						<li><a href="FT_sa_state">??????????????? ??????</a></li>
	                          		</ul>
	                          	</li>
	                          	
	                          	<li><a href="javascript: void(0);" aria-expanded="false">??????
	                          			<span class="menu-arrow"></span>
	                          		</a>
	                          		<ul>
	                          			<li><a href="#">???????????????????????????</a></li>
					                    <li><a href="#">??????????????????</a></li>
					                    <li><a href="#">??????????????????</a></li>
					                    <li><a href="#">??????????????????</a></li>
	                          		</ul>
	                          	</li>
	                          	
	                          	<li><a href="javascript: void(0);" aria-expanded="false">????????????
	                          			<span class="menu-arrow"></span>
	                          		</a>
	                          		<ul>
	                          			<li><a href="#">??????????????????</a></li>
                    					<li><a href="#">????????????????????? ??????</a></li>
	                          		</ul>
	                          	</li>
	                          	
	                          	<li><a href="javascript: void(0);" aria-expanded="false">???????????????
	                          			<span class="menu-arrow"></span>
	                          		</a>
	                          		<ul>
	                          			<li><a href="#">???????????????</a></li>
                    					<li><a href="#">??????????????? ?????????</a></li>
	                          		</ul>
	                          	</li>
	                          	
	                          	<li><a href="javascript: void(0);" aria-expanded="false">????????????
	                          	<span class="menu-arrow"></span></a>
	                          		<ul>
	                          			<li><a href="#">???????????? ??????</a></li>
                    					<li><a href="#">???????????? ??????</a></li>
	                          		</ul>
	                          	</li>
	                          	 	
	                          </ul>
							</li>
							
							<li> 
	                          <a href="javascript: void(0);">
	                             <i class="mdi mdi-server"></i>
	                             <span> ?????? </span>
	                             <span class="menu-arrow"></span>
	                          </a>
	                          <ul class="nav-second-level" aria-expanded="false">  	
	                          	<li><a href="javascript: void(0);" aria-expanded="false">????????????
	                          	<span class="menu-arrow"></span></a>
	                          		<ul>
	                          			<li><a href="CT_equip_add">?????? ?????? ??????</a></li>
	                          			<li><a href="CT_equip_list">?????? ?????? ??????</a></li>
					                    <li><a href="CT_equip_manage">?????? ?????? ??????</a></li>
	                          		</ul>
	                          	</li>
	                          	
	                          	<li><a href="javascript: void(0);" aria-expanded="false">?????? ?????????
	                          		<span class="menu-arrow"></span></a>
	                          		<ul>
	                          			<li><a href="CT_repair_list_add">?????? ?????? ??????</a></li>
                    					<li><a href="CT_reqair_list">?????? ??????</a></li>
	                          		</ul>
	                          	</li>
	                          	
	                          	<li><a href="javascript: void(0);" aria-expanded="false">????????????
	                          		<span class="menu-arrow"></span></a>
	                          		<ul>
	                          			<li><a href="CT_budget">?????? ??????</a></li>
                    					<li><a href="CT_budget_apply">?????? ?????? ??????</a></li>
	                          		</ul>
	                          	</li>
	                          	
	                          	<li><a href="javascript: void(0);" aria-expanded="false">A/S??????
	                          		<span class="menu-arrow"></span></a>
	                          		<ul>
	                          			<li><a href="CT_as_list">A/S ?????? ??????</a></li>
                    					<li><a href="CT_as_manage">A/S ?????? ?????? </a></li>
	                          		</ul>
	                          	</li>
	                          </ul>
							</li>
							
							<li> 
	                          <a href="javascript: void(0);">
	                             <i class="mdi mdi-factory"></i>
	                             <span> ?????? </span>
	                             <span class="menu-arrow"></span>
	                          </a>
	                          <ul class="nav-second-level" aria-expanded="false">  	
	                          	<li><a href="javascript: void(0);" aria-expanded="false">????????????
	                          			<span class="menu-arrow"></span>
	                          		</a>
	                          		<ul>
	                          			<li><a href="#">??????????????????</a></li>
					                    <li><a href="#">??????????????????</a></li>
										<li><a href="#">??????????????????</a></li>
					                    <li><a href="#">??????????????????</a></li>
					                    <li><a href="#">??????????????????</a></li>
	                          		</ul>
	                          	</li>
	                          	
	                          	<li><a href="javascript: void(0);" aria-expanded="false">????????????
	                          		<span class="menu-arrow"></span>
	                          		</a>
	                          		<ul>
	                          			<li><a href="#">??????????????????</a></li>
                    					<li><a href="#">????????? ??????/?????? ??????</a></li>
	                          		</ul>
	                          	</li>
	                          	
	                          	<li><a href="javascript: void(0);" aria-expanded="false">??????/?????? ??????
	                          		<span class="menu-arrow"></span>
	                          		</a>
	                          		<ul>
	                          			<li><a href="#">???????????? ??????</a></li>
					                    <li><a href="#">???????????? ?????? ??????</a></li>
										<li><a href="#">?????????????????? ????????????</a></li>
					                    <li><a href="#">????????????</a></li>
					                    <li><a href="#">????????????</a></li>
					                    <li><a href="#">????????????</a></li>
					                    <li><a href="#">??????????????????</a></li>
	                          		</ul>
	                          	</li>
	                          	
	                          	<li><a href="javascript: void(0);" aria-expanded="false">????????????
	                          		<span class="menu-arrow"></span>
	                          		</a>
	                          		<ul>
	                          			<li><a href="#">????????????</a></li>
					                    <li><a href="#">????????????</a></li>
										<li><a href="#">??????????????????(?????????)</a></li>
										<li><a href="#">??????????????????(?????????)</a></li>
										<li><a href="#">??????????????????(?????????)</a></li>
	                          		</ul>
	                          	</li>
	                          </ul>
							</li>
							
                            <li class="menu-title mt-2">More</li>

							<li>
                                <a href="javascript: void(0);">
                                    <i class="fe-briefcase"></i>
                                    <span> UI Kit </span>
                                    <span class="menu-arrow"></span>
                                </a>
                                <ul class="nav-second-level" aria-expanded="false">
                                    <li><a href="ui-typography">Typography</a></li>
                                    <li><a href="ui-cards">Cards</a></li>
                                    <li><a href="ui-buttons">Buttons</a></li>
                                    <li><a href="ui-modals">Modals</a></li>
                                    <li><a href="ui-checkbox-radio">Checkboxs-Radios</a></li>
                                    <li><a href="ui-tabs">Tabs</a></li>
                                    <li><a href="ui-progressbars">Progress Bars</a></li>
                                    <li><a href="ui-notifications">Notification</a></li>
                                    <li><a href="ui-carousel">Carousel</a>
                                    <li><a href="ui-video">Embed Video</a>
                                    <li><a href="ui-tooltips-popovers">Tooltips & Popovers</a></li>
                                    <li><a href="ui-images">Images</a></li>
                                    <li><a href="ui-bootstrap">Bootstrap UI</a></li>
                                </ul>
                            </li>

                            <li>
                                <a href="javascript: void(0);">
                                    <i class="fe-box"></i>
                                    <span> Icons </span>
                                    <span class="menu-arrow"></span>
                                </a>
                                <ul class="nav-second-level" aria-expanded="false">
                                    <li><a href="icons-colored">Colored Icons</a></li>
                                    <li><a href="icons-materialdesign">Material Design</a></li>
                                    <li><a href="icons-dripicons">Dripicons</a></li>
                                    <li><a href="icons-fontawesome">Font awesome</a></li>
                                    <li><a href="icons-feather">Feather Icons</a></li>
                                </ul>
                            </li>

                            <li>
                                <a href="javascript: void(0);">
                                    <i class="fe-pie-chart"></i>
                                    <span> Graphs </span>
                                    <span class="menu-arrow"></span>
                                </a>
                                <ul class="nav-second-level" aria-expanded="false">
                                    <li><a href="charts-flot">Flot Chart</a></li>
                                    <li><a href="charts-morris">Morris Chart</a></li>
                                    <li><a href="charts-google">Google Chart</a></li>
                                    <li><a href="charts-chartist">Chartist Charts</a></li>
                                    <li><a href="charts-chartjs">Chartjs Chart</a></li>
                                    <li><a href="charts-c3">C3 Chart</a></li>
                                    <li><a href="charts-sparkline">Sparkline Chart</a></li>
                                    <li><a href="charts-knob">Jquery Knob</a></li>
                                </ul>
                            </li>

                            <li>
                                <a href="javascript: void(0);">
                                    <i class="fe-disc"></i>
                                    <span class="badge badge-primary badge-pill float-right">9</span>
                                    <span> Forms </span>
                                </a>
                                <ul class="nav-second-level" aria-expanded="false">
                                    <li><a href="form-elements">Form Elements</a></li>
                                    <li><a href="form-advanced">Form Advanced</a></li>
                                    <li><a href="form-validation">Form Validation</a></li>
                                    <li><a href="form-pickers">Form Pickers</a></li>
                                    <li><a href="form-wizard">Form Wizard</a></li>
                                    <li><a href="form-mask">Form Masks</a></li>
                                    <li><a href="form-summernote">Summernote</a></li>
                                    <li><a href="form-quilljs">Quilljs Editor</a></li>
                                    <li><a href="form-uploads">File Upload</a></li>
                                </ul>
                            </li>
                
                            <li>
                                <a href="javascript: void(0);">
                                    <i class="fe-grid"></i>
                                    <span> Tables </span>
                                    <span class="menu-arrow"></span>
                                </a>
                                <ul class="nav-second-level" aria-expanded="false">
                                    <li><a href="tables-basic">Basic Tables</a></li>
                                    <li><a href="tables-layouts">Tables Layouts</a></li>
                                    <li><a href="tables-datatable">Data Tables</a></li>
                                    <li><a href="tables-responsive">Responsive Table</a></li>
                                    <li><a href="tables-tablesaw">Tablesaw Table</a></li>
                                    <li><a href="tables-editable">Editable Table</a></li>
                                </ul>
                            </li>


                            <li>
                                <a href="javascript: void(0);">
                                    <i class="fe-target"></i>
                                    <span> Admin UI </span>
                                    <span class="menu-arrow"></span>
                                </a>
                                <ul class="nav-second-level" aria-expanded="false">
                                    <li><a href="admin-grid">Grid</a></li>
                                    <li><a href="admin-sweet-alert">Sweet Alert</a></li>
                                    <li><a href="admin-widqets">Widgets</a></li>
                                    <li><a href="admin-nestable">Nestable List</a></li>
                                    <li><a href="admin-rangeslider">Range Slider</a></li>
                                    <li><a href="admin-ratings">Ratings</a></li>
                                </ul>
                            </li>

                            <li>
                                <a href="calender">
                                    <i class="fe-calendar"></i>
                                    <span> Calendar </span>
                                </a>
                            </li>

                            <li>
                                <a href="javascript: void(0);">
                                    <i class="fe-map"></i>
                                    <span> Maps </span>
                                    <span class="menu-arrow"></span>
                                </a>
                                <ul class="nav-second-level" aria-expanded="false">
                                    <li><a href="maps-google">Google Maps</a></li>
                                    <li><a href="maps-vector">Vector Maps</a></li>
                                    <li><a href="maps-mapael">Mapael Maps</a></li>
                                </ul>
                            </li>

                            <li>
                                <a href="javascript: void(0);">
                                    <i class="fe-layout"></i>
                                    <span> Layouts </span>
                                    <span class="badge badge-purple badge-pill float-right">New</span>
                                </a>
                                <ul class="nav-second-level" aria-expanded="false">
                                    <li>
                                        <a href="layouts-dark-sidebar">Dark Sidebar</a>
                                    </li>
                                    <li>
                                        <a href="layouts-small-sidebar">Small Sidebar</a>
                                    </li>
                                    <li>
                                        <a href="layouts-sidebar-collapsed">Sidebar Collapsed</a>
                                    </li>
                                    <li>
                                        <a href="layouts-boxed">Boxed Layout</a>
                                    </li>
                                </ul>
                            </li>
                
                            <li>
                                <a href="javascript: void(0);">
                                    <i class="fe-book-open"></i>
                                    <span> Pages </span>
                                    <span class="menu-arrow"></span>
                                </a>
                                <ul class="nav-second-level" aria-expanded="false">
                                    <li><a href="pages-starter">Starter Page</a></li>
                                    <li><a href="pages-login">Login</a></li>
                                    <li><a href="pages-register">Register</a></li>
                                    <li><a href="pages-logout">Logout</a></li>
                                    <li><a href="pages-recoverpw">Recover Password</a></li>
                                    <li><a href="pages-lock-screen">Lock Screen</a></li>
                                    <li><a href="pages-confirm-mail">Confirm Mail</a></li>
                                    <li><a href="pages-404">Error 404</a></li>
                                    <li><a href="pages-404-alt">Error 404-alt</a></li>
                                    <li><a href="pages-500">Error 500</a></li>
                                </ul>
                            </li>

                            <li>
                                <a href="javascript: void(0);">
                                    <i class="fe-folder-plus"></i>
                                    <span> Extra Pages </span>
                                    <span class="menu-arrow"></span>
                                </a>
                                <ul class="nav-second-level" aria-expanded="false">
                                    <li><a href="extras-about">About Us</a></li>
                                    <li><a href="extras-contact">Contact</a></li>
                                    <li><a href="extras-members">Members</a></li>
                                    <li><a href="extras-timeline">Timeline</a></li>
                                    <li><a href="extras-invoice">Invoice</a></li>
                                    <li><a href="extras-maintenance">Maintenance</a></li>
                                    <li><a href="extras-coming-soon">Coming Soon</a></li>
                                    <li><a href="extras-faq">FAQ</a></li>
                                    <li><a href="extras-pricing">Pricing</a></li>
                                </ul>
                            </li>

                            <li>
                                <a href="javascript: void(0);">
                                    <i class="fe-plus-square"></i>
                                    <span> Multi Level </span>
                                    <span class="menu-arrow"></span>
                                </a>
                                <ul class="nav-second-level nav" aria-expanded="false">
                                    <li>
                                        <a href="javascript: void(0);">Level 1.1</a>
                                    </li>
                                    <li>
                                        <a href="javascript: void(0);" aria-expanded="false">Level 1.2
                                            <span class="menu-arrow"></span>
                                        </a>
                                        <ul class="nav-third-level nav" aria-expanded="false">
                                            <li>
                                                <a href="javascript: void(0);">Level 2.1</a>
                                            </li>
                                            <li>
                                                <a href="javascript: void(0);">Level 2.2</a>
                                            </li>
                                        </ul>
                                    </li>
                                </ul>
                            </li>
                        </ul>

                    </div>
                    <!-- End Sidebar -->

                    <div class="clearfix"></div>

                </div>
                <!-- Sidebar -left -->

            </div>
            <!-- Left Sidebar End -->