<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><!DOCTYPE html>
<html lang="en">
<head>
<%@ include file="../setting.jsp"%>
<!-- c3 plugin css -->
<link rel="stylesheet" type="text/css"
	href="/erp/resources/assets/libs/c3/c3.min.css">
</head>

<body>

	<!-- Begin page -->
	<div id="wrapper">


		<%@ include file="../sidebar.jsp"%>

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
										<li class="breadcrumb-item"><a
											href="javascript: void(0);">Codefox</a></li>
										<li class="breadcrumb-item active">Dashboard</li>
									</ol>
								</div>
								<h4 class="page-title">인사정보현황</h4>
							</div>
						</div>
					</div>
					<!-- end page title -->
				</div>
			</div>

			<div class="container-fluid">
				<div class="row">
					<div class="col-sm-12">
						<div class="card">
							<div class="card-body table-responsive">
								<table id="datatable"
									style="border-collapse: collapse; border-spacing: 0; width: 100%;">
									<tr>
										<th>조회조건</th>
										<td><select class="" name="" disabled>
												<option></option>
												<option value="">1. 사업장</option>
										</select>&nbsp; ~ &nbsp; <select class="" name="" disabled>
												<option></option>
										</select>&nbsp;<a href="#"><i class="dripicons-zoom-in"></i></a></td>

										<th>재직구분</th>
										<td><select class="" name="" disabled>
												<option></option>
										</select>&nbsp;<a href="#"><i class="dripicons-zoom-in"></i></a></td>

										<th>직급</th>
										<td><select class="" name="" disabled>
												<option></option>
										</select>&nbsp;<a href="#"><i class="dripicons-zoom-in"></i></a></td>
									</tr>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="row">
				<div class="col-sm-12">
					<div class="card">
						<div class="card-body">
							<ul class="nav nav-tabs" role="tablist">
								<li class="nav-item"><a class="nav-link active" id="study-tab"
									data-toggle="tab" href="#study" role="tab"
									aria-controls="study" aria-selected="true"> <span
										class="d-block d-sm-none"><i class="fa fa-study"></i></span> <span
										class="d-none d-sm-block">교육</span>
								</a></li>
								<li class="nav-item"><a class="nav-link"
									id="presidency-tab" data-toggle="tab" href="#trip" role="tab"
									aria-controls="trip" aria-selected="true"> <span
										class="d-block d-sm-none"><i class="fa fa-user"></i></span> <span
										class="d-none d-sm-block">출장</span>
								</a></li>
								<li class="nav-item"><a class="nav-link" id="message-tab"
									data-toggle="tab" href="#Passport/Visa" role="tab"
									aria-controls="Passport/Visa" aria-selected="false"> <span
										class="d-block d-sm-none"><i class="fa fa-envelope-o"></i></span>
										<span class="d-none d-sm-block">여권/비자</span>
								</a></li>
								<li class="nav-item"><a class="nav-link" id="message-tab"
									data-toggle="tab" href="#Qualifications" role="tab"
									aria-controls="Qualifications" aria-selected="false"> <span
										class="d-block d-sm-none"><i class="fa fa-envelope-o"></i></span>
										<span class="d-none d-sm-block">자격/면허</span>
								</a></li>
								<li class="nav-item"><a class="nav-link" id="message-tab"
									data-toggle="tab" href="#AddedInfo" role="tab"
									aria-controls="AddedInfo" aria-selected="false"> <span
										class="d-block d-sm-none"><i class="fa fa-envelope-o"></i></span>
										<span class="d-none d-sm-block">추가정보</span>
								</a></li>
							</ul>
							<div class="tab-content">
								<!-- 잔액 -->
								<div class="tab-pane" id="study" role="tabpanel"
									aria-labelledby="study-tab">
									<div class="col-sm-12">
										<div class="card">
											<div class="card-body table-responsive">
												<div align="right">
													<br>
												</div>
												<table id="datatable"
													style="border-collapse: collapse; border-spacing: 0; width: 100%;">
													<tr>
														<td>기간</td>
														<td><input type="text" class="" value="____/__/__">&nbsp; ~ &nbsp;<input
															type="text" class="" value="____/__/__">
															<a href="#"><i class="dripicons-calendar"></i></a>
														</td>

														<td>교육명</td>
														<td><input type="text" class="">&nbsp;<a
															href="#"><i class="dripicons-zoom-in"></i></a><input
															type="text" class=""></td>
													</tr>
												</table>
											</div>
										</div>
									</div>
								</div>
							</div>

						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- Footer Start -->
		<footer class="footer">
			<div class="container-fluid">
				<div class="row">
					<div class="col-md-6">
						2016 - 2019 &copy; Codefox theme by <a href="">Coderthemes</a>
					</div>
					<div class="col-md-6">
						<div class="text-md-right footer-links d-none d-sm-block">
							<a href="#">About Us</a> <a href="#">Help</a> <a href="#">Contact
								Us</a>
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
					<input type="checkbox" class="custom-control-input"
						id="customCheck1" checked> <label
						class="custom-control-label" for="customCheck1">Notifications</label>
				</div>
				<div class="custom-control custom-checkbox mb-2">
					<input type="checkbox" class="custom-control-input"
						id="customCheck2" checked> <label
						class="custom-control-label" for="customCheck2">API Access</label>
				</div>
				<div class="custom-control custom-checkbox mb-2">
					<input type="checkbox" class="custom-control-input"
						id="customCheck3"> <label class="custom-control-label"
						for="customCheck3">Auto Updates</label>
				</div>
				<div class="custom-control custom-checkbox mb-2">
					<input type="checkbox" class="custom-control-input"
						id="customCheck4" checked> <label
						class="custom-control-label" for="customCheck4">Online
						Status</label>
				</div>
				<div class="custom-control custom-checkbox">
					<input type="checkbox" class="custom-control-input"
						id="customCheck5"> <label class="custom-control-label"
						for="customCheck5">Auto Payout</label>
				</div>
			</div>

			<!-- Timeline -->
			<hr class="mt-0" />
			<h5 class="pl-3 pr-3">Timeline</h5>
			<hr class="mb-0" />

			<div class="p-3">
				<ul class="list-unstyled activity-widget">
					<li class="activity-list">
						<p class="mb-0">
							<small>08 July</small>
						</p>
						<p>Neque porro quisquam est</p>
					</li>
					<li class="activity-list">
						<p class="mb-0">
							<small>09 July</small>
						</p>
						<p>Ut enim ad minima veniam quis velit esse</p>
					</li>
					<li class="activity-list">
						<p class="mb-0">
							<small>10 July</small>
						</p>
						<p>Quis autem vel eum iure</p>
					</li>
				</ul>
			</div>

			<!-- Messages -->
			<hr class="mt-0" />
			<h5 class="pl-3 pr-3">
				Messages <span class="float-right badge badge-pill badge-danger">24</span>
			</h5>
			<hr class="mb-0" />
			<div class="p-3">
				<div class="inbox-widget">
					<div class="inbox-item">
						<div class="inbox-item-img">
							<img src="/erp/resources/assets/images/users/avatar-1.jpg"
								class="rounded-circle" alt="">
						</div>
						<p class="inbox-item-author">
							<a href="javascript: void(0);">Chadengle</a>
						</p>
						<p class="inbox-item-text">Hey! there I'm available...</p>
						<p class="inbox-item-date">13:40 PM</p>
					</div>
					<div class="inbox-item">
						<div class="inbox-item-img">
							<img src="/erp/resources/assets/images/users/avatar-2.jpg"
								class="rounded-circle" alt="">
						</div>
						<p class="inbox-item-author">
							<a href="javascript: void(0);">Tomaslau</a>
						</p>
						<p class="inbox-item-text">I've finished it! See you so...</p>
						<p class="inbox-item-date">13:34 PM</p>
					</div>
					<div class="inbox-item">
						<div class="inbox-item-img">
							<img src="assets/images/users/avatar-3.jpg"
								class="rounded-circle" alt="">
						</div>
						<p class="inbox-item-author">
							<a href="javascript: void(0);">Stillnotdavid</a>
						</p>
						<p class="inbox-item-text">This theme is awesome!</p>
						<p class="inbox-item-date">13:17 PM</p>
					</div>

					<div class="inbox-item">
						<div class="inbox-item-img">
							<img src="/erp/resources/assets/images/users/avatar-4.jpg"
								class="rounded-circle" alt="">
						</div>
						<p class="inbox-item-author">
							<a href="javascript: void(0);">Kurafire</a>
						</p>
						<p class="inbox-item-text">Nice to meet you</p>
						<p class="inbox-item-date">12:20 PM</p>

					</div>
					<div class="inbox-item">
						<div class="inbox-item-img">
							<img src="/erp/resources/assets/images/users/avatar-5.jpg"
								class="rounded-circle" alt="">
						</div>
						<p class="inbox-item-author">
							<a href="javascript: void(0);">Shahedk</a>
						</p>
						<p class="inbox-item-text">Hey! there I'm available...</p>
						<p class="inbox-item-date">10:15 AM</p>

					</div>
				</div>
				<!-- end inbox-widget -->
			</div>
			<!-- end .p-3-->

		</div>
		<!-- end slimscroll-menu-->
	</div>
	<!-- /Right-bar -->

	<!-- Right bar overlay-->
	<div class="rightbar-overlay"></div>

	<!-- Vendor js -->
	<script src="/erp/resources/assets/js/vendor.min.js"></script>

	<!-- Bootstrap select plugin -->
	<script
		src="/erp/resources/assets/libs/bootstrap-select/bootstrap-select.min.js"></script>

	<!-- plugins -->
	<script src="/erp/resources/assets/libs/c3/c3.min.js"></script>
	<script src="/erp/resources/assets/libs/d3/d3.min.js"></script>

	<!-- dashboard init -->
	<script src="/erp/resources/assets/js/pages/dashboard.init.js"></script>

	<!-- App js -->
	<script src="/erp/resources/assets/js/app.min.js"></script>

</body>
</html>