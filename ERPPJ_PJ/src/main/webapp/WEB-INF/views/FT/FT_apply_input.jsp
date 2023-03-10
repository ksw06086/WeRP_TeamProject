<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><!DOCTYPE html>
<html lang="en">
<head>
<%@ include file="../setting.jsp"%>
<script src="/pj/resources/assets/css/js/jquery-3.4.1.min.js"></script>
<script src="/pj/resources/assets/css/js/request.js"></script>
<script type="text/javascript">

	
			function searchdept(count) {
				window.open("FT_searchDepartmentname2?count="+count+"", "FT_searchDepartmentname2", "menubar=no, width=450px, height = 600px, location=no, status=nos, top = 200, left = 500");
			}
			
        	var count = 0;
        	
        	    	
        	
        	function enterinsert() {
       			
       			$(".chit-table-bordered-primary tbody").append('<tr id = "tr'+count+'">' +
                        '<td><input type="text"  id="department_code'+count+'" name = "dept_code'+count+'" class="form-control" data-toggle="input-mask" style = "width: 100%; border:0px;" onclick="searchdept('+count+');" ></td>'+
                        '<td><input type="text"  id="department_name'+count+'" name = "dept_name'+count+'" class="form-control" data-toggle="input-mask" style = "width: 100%; border:0px;" ></td>'+
                        '<td><input type="text"   name = "money'+count+'" class="form-control" data-toggle="input-mask" style = "width: 100%; border:0px;" ></td>'+
                        '<td><input type="text"   name = "purpose'+count+'" class="form-control" data-toggle="input-mask" style = "width: 100%; border:0px;" ></td>'+
                       '</tr>');
                    count = count + 1;
                    
          		
        	}
        	
        	function enterdelete() {
        		count = count - 1;
        		
       			$("#tr"+count).remove();
    
        	}
        	
        	function countc(){
        		count = count -1
        		$("#countc").append('<input type="hidden" name="count" value="'+count+'">')
        	}
        	
        </script>
<!-- Table datatable css -->
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
	href="/erp/resources/assets/libs/datatables/fixedcolumns.bootstrap4.min.css"
	rel="stylesheet" type="text/css" />
</head>
<body>
	<!-- Begin page -->
	<div id="wrapper">
		<%@ include file="../sidebar.jsp"%>
		<div class="content-page">
			<!-- ============================================================== -->
			<!-- Start Page Content here -->
			<!-- ============================================================== -->

			<!-- ????????? ?????? ?????? ?????? -->
			<div class="containerfluid">
				<!-- start page title -->
				<div class="row">
					<div class="col-12">
						<div class="page-title-box">
							<div class="page-title-right">
								<ol class="breadcrumb m-0">
									<li class="breadcrumb-item"><a href="javascript: void(0);">WeRP</a></li>
									<li class="breadcrumb-item"><a href="javascript: void(0);">??????</a></li>
									<li class="breadcrumb-item"><a href="javascript: void(0);">??????</a></li>
									<li class="breadcrumb-item active">??????????????????</li>
								</ol>
							</div>
							<h4 class="page-title" style="font-size: 25px;">??????????????????</h4>
						</div>
					</div>
				</div>
				<!-- end page title -->

				<div class="row">
					<div class="col-sm-12">
						<div class="card">
							<form name="FT_apply_input" action="FT_apply_input_pro" 
								method="post" onsubmit="countc();">
								<div id = "countc"></div>
								<input type="hidden" name="${_csrf.parameterName }"
									value="${_csrf.token }">
								<div class="card-body">
									<div class="form-group text-right mr-1">
										<button class="btn btn-primary waves-effect waves-light mr-1"
											type="button" onclick="enterinsert();">??????</button>
										<button class="btn btn-primary waves-effect waves-light mr-1"
											type="button" onclick="enterdelete();">??????</button>
									</div>

									<div class="table-responsive" style="margin: 15px 0px 50px">
										<table
											class="table m-0 chit-table-colored-bordered chit-table-bordered-primary table-bordered">
											<col style="width: 25%;">
											<col style="width: 25%">
											<col style="width: 25%;">
											<col style="width: 25%;">
											<thead>
												<tr>
													<th>????????????</th>
													<th>?????????</th>
													<th>??????</th>
													<th>????????????</th>
												</tr>
											</thead>
											<tbody id="result">
											</tbody>
										</table>
									</div>
								</div>
								<div class="form-group text-right mr-1">
									<button class="btn btn-primary waves-effect waves-light mr-1"
										type="submit" >??????</button>
									<button type="reset"
										class="btn btn-secondary waves-effect waves-light mr-1">Cancel</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
			<!-- ????????? ?????? ?????? ?????? ?????? -->

			<%@ include file="../footer.jsp"%>

		</div>

		<!-- ============================================================== -->
		<!-- End Page content -->
		<!-- ============================================================== -->

	</div>
	<!-- END wrapper -->

	<%@ include file="../rightbar.jsp"%>
	<%@ include file="../setting2.jsp"%>
</body>
</html>