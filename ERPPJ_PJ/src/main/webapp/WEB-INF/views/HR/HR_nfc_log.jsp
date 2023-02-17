<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><!DOCTYPE html>
<html lang="en">
<head>
<%@ include file="../setting.jsp"%>

<!-- c3 plugin css -->
<link rel="stylesheet" type="text/css"
	href="/erp/resources/assets/libs/c3/c3.min.css">
<script src="/erp/resources/assets/css/js/jquery-3.4.1.min.js"></script>
<script src="/erp/resources/assets/css/js/request.js"></script>
<link
	href="/erp/resources/assets/libs/datatables/dataTables.bootstrap4.min.css"
	rel="stylesheet" type="text/css" />
<link
	href="/erp/resources/assets/libs/datatables/responsive.bootstrap4.min.css"
	rel="stylesheet" type="text/css" />
<link
	href="/erp/resources/assets/libs/datatables/buttons.bootstrap4.min.css"
	rel="stylesheet" type="text/css" />
<link
	href="/erp/resources/assets/libs/datatables/fixedHeader.bootstrap4.min.css"
	rel="stylesheet" type="text/css" />
<link
	href="/erp/resources/assets/libs/datatables/scroller.bootstrap4.min.css"
	rel="stylesheet" type="text/css" />
<link href="/erp/resources/assets/libs/datatables/dataTables.colVis.css"
	rel="stylesheet" type="text/css" />
<link
	href="/erp/resources/assets/libs/datatables/fixedColumns.bootstrap4.min.css"
	rel="stylesheet" type="text/css" />
<script type="text/javascript">
    var searchCount = 1;
    $(function(){
		$('#search').click(function(){
			var param = new Object();
			var jsonData;
			jsonData = JSON.stringify();
			$('#result').empty();
			$('#bodyappend').empty();
			$.ajax({
				url : '${pageContext.request.contextPath}/HR_nfc_result?${_csrf.parameterName}=${_csrf.token }',
				type : 'POST',
				data : jsonData, 
				dataType : "json",
				contentType:"application/json;charset=UTF-8",
				success : function(nfclog){
					
					$('#result').empty();
					$('#bodyappend').empty();
					
					for(var i = 0 ; i < nfclog.length; i++){
					
						var tag_date = nfclog[i].tag_date;
						var nfc_code = nfclog[i].nfc_code;
						var username = nfclog[i].username;
						var e_name = nfclog[i].e_name;
						var tag_code = nfclog[i].tag_code;
						
						$('#result').append('<tr>'+
								'<td><input type="checkbox" name="tag_code" value="'+tag_code+'" class="checklist"></td>' +
								'<td>'+ tag_date +'</td>'+
								'<td>'+ nfc_code +'</td>'+
								'<td>'+ username +'</td>'+ 
								'<td>'+ e_name +'</td>'+
	                 		'</tr>');
						
						if(searchCount == 1){
							$('#bodyappend').append(
							        '<script src="/erp/resources/assets/libs/datatables/jquery.dataTables.min.js"/>' +
							        '<script src="/erp/resources/assets/libs/datatables/dataTables.bootstrap4.min.js"/>' +
							        '<script src="/erp/resources/assets/libs/datatables/dataTables.responsive.min.js"/>' +
							        '<script src="/erp/resources/assets/libs/datatables/responsive.bootstrap4.min.js"/>' +
							        '<script src="/erp/resources/assets/libs/datatables/dataTables.buttons.min.js"/>' +
							        '<script src="/erp/resources/assets/libs/datatables/buttons.bootstrap4.min.js"/>' +
							        '<script src="/erp/resources/assets/libs/datatables/buttons.html5.min.js"/>' +
							        '<script src="/erp/resources/assets/libs/datatables/buttons.print.min.js"/>' +
							        '<script src="/erp/resources/assets/libs/datatables/dataTables.keyTable.min.js"/>' +
							        '<script src="/erp/resources/assets/libs/datatables/dataTables.fixedHeader.min.js"/>' +
							        '<script src="/erp/resources/assets/libs/datatables/dataTables.scroller.min.js"/>' +
							        '<script src="/erp/resources/assets/libs/datatables/dataTables.colVis.js"/>' +
							        '<script src="/erp/resources/assets/libs/datatables/dataTables.fixedColumns.min.js"/>'+
							        '<script src="/erp/resources/assets/libs/jszip/jszip.min.js"/>' +
							        '<script src="/erp/resources/assets/libs/pdfmake/pdfmake.min.js"/>' +
							        '<script src="/erp/resources/assets/libs/pdfmake/vfs_fonts.js"/>' +
							        '<script src="/erp/resources/assets/js/pages/datatables.init.js"/>'  	
							);
						searchCount = searchCount + 1;
						}
					}
				},
				error : function(){
					alert("에러");
				}
			});			
		}); 
	 });

	 function delteNfcList(){
		 var param = $("#deleteNfc").serializeArray();
		 $.ajax({
				url: '/erp/HR_NFC_Delete',
				type: 'POST',
				data : param,
				dataTpye: 'json',
				success: function(deleteCnt){
					if(deleteCnt == 1){
						alert("NFC로그를  삭제하였습니다.")
						search.click();
					}
				},
				error : function(){
					alert("전산 오류로 인하여 완료처리 수정에 실패하였습니다.");
				}
			});
	 }
	 
	 function allcheck() {
			if ($("#allChecked").prop("checked")) {
				$(".checklist").prop("checked", true);
			} else {
				$(".checklist").prop("checked", false);
			}
		}
</script>
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
											href="javascript: void(0);">WeRP</a></li>
										<li class="breadcrumb-item"><a
											href="javascript: void(0);">인사</a></li>
										<li class="breadcrumb-item"><a
											href="javascript: void(0);">인사/급여관리</a></li>
									</ol>
								</div>
								<h4 class="page-title">근태</h4>
							</div>
						</div>
					</div>
					<!-- end page title -->

					<div class="row">
						<div class="col-sm-12">
							<div class="card">
								<div class="card-body">
									<table class="col-12">
										<tr class="form-group row">
											<th class="col-md-1 col-form-label">사원번호</th>
											<td class="col-md-2 input-group"><input type="text"
												class="form-control" name="username" id="username">
											</td>

											<th class="col-md-1 col-form-label">&nbsp;</th>

											<th class="col-md-1 col-form-label">사원명</th>
											<td class="col-md-2 input-group"><input type="text"
												class="form-control" name="e_name" id="e_name"></td>

											<th class="col-md-1 col-form-label">&nbsp;</th>

											<th class="col-md-1 col-form-label">부서</th>
											<td class="col-md-2 input-group"><input type="text"
												class="form-control" name="department_code"
												id="department_code"></td>

										</tr>

										<tr class="form-group row">

											<th class="col-md-1 col-form-label">직책</th>
											<td class="col-md-2 input-group"><input type="text"
												class="form-control" name="position_code" id="position_code">
											</td>

											<th class="col-md-1 col-form-label">&nbsp;</th>

											<th class="col-md-1 col-form-label">직급</th>
											<td class="col-md-2 input-group"><input type="text"
												class="form-control" name="rank_code" id="rank_code">
											</td>

											<th class="col-md-1 col-form-label"></th>
										</tr>
									</table>
									<div align="right">
										<button type="button" id="search"
											class="btn btn-primary waves-effect waves-light">조회</button>
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
										<li class="nav-item"><a class="nav-link active"
											id="foundation-tab" data-toggle="tab" href="#foundation"
											role="tab" aria-controls="foundation" aria-selected="true">
												<span class="d-block d-sm-none"><i
													class="fa fa-study"></i></span> <span class="d-none d-sm-block">사원정보</span>
										</a></li>
									</ul>
									<div class="tab-content">
										<!-- 잔액 -->
										<div class="tab-pane show active" id="foundation"
											role="tabpanel" aria-labelledby="foundation-tab">
											<div class="col-sm-12">
												<div class="card">
													<div class="card-body">
														<form id="deleteNfc">
															<input type="hidden" name="${_csrf.parameterName }"
																value="${_csrf.token }">
															<table id="datatable"
																class="table table-striped table-bordered dt-responsive nowrap">

																<thead>
																	<tr>
																		<th><input type="checkbox" id="allChecked"
																			onclick="allcheck();"></th>
																		<th>nfc접촉시간</th>
																		<th>nfc고유번호</th>
																		<th>사번</th>
																		<th>사원명</th>
																	</tr>
																</thead>

																<tbody id="result">

																</tbody>

															</table>
														</form>
														<div align="right">
															<br>
														</div>

														<div class="form-group text-right mb-0">
															<button type="reset"
																class="btn btn-secondary waves-effect" type="button"
																onclick="delteNfcList();">삭제</button>
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
					<%@ include file="../footer.jsp"%>
				</div>
			</div>
		</div>

		<!-- ============================================================== -->
		<!-- End Page content -->
		<!-- ============================================================== -->

	</div>
	<!-- END wrapper -->

	<%@ include file="../rightbar.jsp"%>
	<%@ include file="../setting2.jsp"%>

	<!-- plugins -->
	<script src="/erp/resources/assets/libs/c3/c3.min.js"></script>
	<script src="/erp/resources/assets/libs/d3/d3.min.js"></script>
	<!-- plugins -->
	<script src="/erp/resources/assets/libs/moment/moment.min.js"></script>
	<script
		src="/erp/resources/assets/libs/bootstrap-timepicker/bootstrap-timepicker.min.js"></script>
	<script
		src="/erp/resources/assets/libs/bootstrap-colorpicker/bootstrap-colorpicker.min.js"></script>
	<script
		src="/erp/resources/assets/libs/bootstrap-daterangepicker/daterangepicker.js"></script>
	<script
		src="/erp/resources/assets/libs/clockpicker/bootstrap-clockpicker.min.js"></script>
	<script
		src="/erp/resources/assets/libs/bootstrap-datepicker/bootstrap-datepicker.min.js"></script>

	<!-- dashboard init -->
	<script src="/erp/resources/assets/js/pages/dashboard.init.js"></script>
	<!-- Init js-->
	<script src="/erp/resources/assets/js/pages/form-pickers.init.js"></script>
	<div id="bodyappend"></div>

</body>
</html>