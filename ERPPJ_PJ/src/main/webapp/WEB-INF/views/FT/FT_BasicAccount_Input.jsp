<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<%@ include file="../setting.jsp"%>
<link href="/erp/resources/assets/libs/dropify/dropify.min.css"
	rel="stylesheet" type="text/css" />
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
<script src="/erp/resources/assets/css/js/jquery-3.4.1.min.js"></script>
<script src="/erp/resources/assets/css/js/request.js"></script>
<script type="text/javascript">
        	var count = 1;
        	var subcount = 1;
        	var a_count = 1;
        	var a_subcount = 1;
        	var frontcursor;
        	var updatekey = 0;
        	var selectval;
        	var focusval;
        	
        	function focuse(cc) {
    			$("tbody *").css("background-color", "");
    			$("#code" + cc).parent().css("background-color", "#D6EAF8");
    			$("#code" + cc).css("background-color", "#D6EAF8");
    			$("#name" + cc).parent().css("background-color", "#D6EAF8");
    			$("#name" + cc).css("background-color", "#D6EAF8");
    			$("#number" + cc).parent().css("background-color", "#D6EAF8");
    			$("#number" + cc).css("background-color", "#D6EAF8");
    			if(!$("#code" + cc).val()){
    				focusval = "";
                   	$("#update").css("display", "none");
                   	$("#submit").css("display", "");
    				return false;
    			} else {
    				focusval = cc;
    			}
    			
    			$.ajax({
                    type : "POST",
                    url : "/erp/FT_AccountOneSelect?${_csrf.parameterName }=${_csrf.token }&srhval=" + $("#code" + cc).val(),
                    success : function(data) {
	                   	$("#update").css("display", "");
	                   	$("#submit").css("display", "none");
	                   	$("input[name=number]").val(data.license_number);
	                   	$("input[name=customerName]").val(data.customer_name);
	                   	$("input[name=bsName]").val(data.bs_name);
	                   	$("input[name=bsNumber]").val(data.bs_number);
	                   	$("input[name=bsMaster]").val(data.bs_master);
	                   	$("input[name=bsCondition]").val(data.bs_condition);
	                   	$("input[name=bsLine]").val(data.bs_line);
	                   	$("input[name=customerCredit]").val(data.customer_credit);
	                   	$("input[name=bsStartdate]").val(data.bs_startdate.substring(0,4) + "-" + data.bs_startdate.substring(5,7) + "-" + data.bs_startdate.substring(8,10));
	                   	$("input[name=branchName]").val(data.branch_name);
	                   	$("select[name=state] option:eq(" + data.deal_state + ")").prop("selected","selected");
	                   	$("input[name=bsAddress]").val(data.bs_address);
	                   	$("input[name=bsAddress2]").val(data.bs_address2);
	                   	$("input[name=scanfile]").val(data.license_scanfile);
                    },
                    error : function(e) {
                           alert('?????? ?????? ?????? ????????? ????????????. ?????? ????????? ????????????.');
                    }
            	});
    		}
        	
        	function update() {
        		var obj = new Object();
        		var jsonData;
        		if(!$("input[name=number]").val()) {
        			alert("??????????????? ?????????????????????!");
        			return false;
        		}
        		obj.licenseNumber = $("input[name=number]").val();
        		obj.customerCode = $("#code" + focusval).val();
        		obj.customerName = $("input[name=customerName]").val();
        		obj.bsName = $("input[name=bsName]").val();
        		obj.bsNumber = $("input[name=bsNumber]").val();
        		obj.bsMaster = $("input[name=bsMaster]").val();
        		obj.bsCondition = $("input[name=bsCondition]").val();
        		obj.bsLine = $("input[name=bsLine]").val();
        		obj.customerCredit = $("input[name=customerCredit]").val();
               	obj.bsStartdate = $("input[name=bsStartdate]").val();
               	obj.branchName = $("input[name=branchName]").val();
               	obj.state = $("select[name=state]").val();
               	obj.bsAddress = $("input[name=bsAddress]").val();
               	obj.bsAddress2 = $("input[name=bsAddress2]").val();
               	obj.scanfile = "wow.png";
               	
        		// json ????????? String ????????? ?????? -- 
        		// ???????????? ????????????????????? ????????? jsp??? ?????? ?????? ????????????????????? ????????? ??? json ???????????? ???????????? ????????????.
        		// ???????????? 00??????????????? ?????? ????????? XML??? ?????? ????????? ??????
        		jsonData = JSON.stringify(obj);
        		/* sendRequest(load_insert, "FT_chitupdate", "post", jsonData); */
        		
        		$.ajax({
                       type : "POST",
                       url : "/erp/FT_AccountUpdate?${_csrf.parameterName }=${_csrf.token }",
                       data : jsonData,
                       contentType : 'application/json;charset=UTF-8',
                       success : function(data) {
                              alert(data);
                              $("#name" + focusval).val($("input[name=customerName]").val());
                              $("#number" + focusval).val($("input[name=number]").val());
                       },
                       error : function(e) {
                              alert('?????? ?????? ?????? ????????? ????????????. ?????? ????????? ????????????.');
                       }
               });
        	}
        	
        	function deleted() {
        		var obj = new Object();
        		var jsonData;
        		obj.licenseNumber = $("#number" + focusval).val();
        		obj.customerCode = $("#code" + focusval).val();
               	
        		// json ????????? String ????????? ?????? -- 
        		// ???????????? ????????????????????? ????????? jsp??? ?????? ?????? ????????????????????? ????????? ??? json ???????????? ???????????? ????????????.
        		// ???????????? 00??????????????? ?????? ????????? XML??? ?????? ????????? ??????
        		jsonData = JSON.stringify(obj);
        		/* sendRequest(load_insert, "FT_chitupdate", "post", jsonData); */
        		
        		$.ajax({
                       type : "POST",
                       url : "/erp/FT_AccountDelete?${_csrf.parameterName }=${_csrf.token }",
                       data : jsonData,
                       contentType : 'application/json;charset=UTF-8',
                       success : function(data) {
                              alert(data);
                              location.reload();
                       },
                       error : function(e) {
                              alert('?????? ?????? ?????? ????????? ????????????. ?????? ????????? ????????????.');
                       }
               });
        	}
        	
        	function allCheck(dd) {
        		if($("img[name=" + dd + "]").attr("src") == "/erp/resources/img/checked.png"){
        			$("img[name=" + dd + "]").attr("src", "/erp/resources/img/checked2.png");
        			$("input[type='checkbox']").prop("checked", true);
        		} else {
        			$("img[name=" + dd + "]").attr("src", "/erp/resources/img/checked.png");
        			$("input[type='checkbox']").prop("checked", false);
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
                                       <li class="breadcrumb-item"><a href="javascript: void(0);">Codefox</a></li>
                                       <li class="breadcrumb-item"><a href="javascript: void(0);">Tables</a></li>
                                       <li class="breadcrumb-item active">Datatables</li>
									</ol>
								</div>
								<h4 class="page-title">????????? ??????</h4>
							</div>
						</div>
					</div>
					<!-- end page title -->

					<div class="row">
						<div class="col-sm-12">
							<div class="accordion" id="accordion-test">
								<div class="card mb-2">
	                                <div class="card-header bg-primary">
	                                    <h4 class="card-title font-14 mb-0">
	                                        <a href="#" class="collapsed text-white" data-toggle="collapse" data-target="#collapseOne" aria-expanded="false" aria-controls="collapseOne">
	                                           	?????? ????????? ??????
	                                        </a>
	                                    </h4>
	                                </div>
	                                <div id="collapseOne" class="collapse" data-parent="#accordion-test">
	                                    <div class="card-body">
	                                        <div class="table-responsive" style = "margin: 15px 0px 15px">
                                            <table class="table m-0 chit-table-colored-bordered chit-table-bordered-primary table-bordered">
                                                <col>
                                                <col>
                                                <thead>
                                                    <tr>
		                                                <th>??????</th>
		                                                <th>????????????</th>
		                                                <th>?????????????????????</th>
		                                            </tr>
		                                        </thead>
		    
		                                        <tbody>
		                                            <c:set var="count" value="0"/>
				                                  	<c:if test="${account != null}">
				                                   		<c:forEach var = "sub" items="${account}">
				                                    		<tr>
				                                    			<td><input type="text" id = "code${count}" class="form-control" data-toggle="input-mask" readonly onclick="focuse(${count});" value = "${sub.customer_code}" style = "width: 100%; -webkit-appearance: none; border:0px;"></td>
				                                    			<td><input type="text" id = "name${count}" class="form-control" data-toggle="input-mask" readonly onclick="focuse(${count});" value = "${sub.customer_name}" style = "width: 100%; -webkit-appearance: none; border:0px;"></td>
				                                    			<td><input type="text" id = "number${count}" class="form-control" data-toggle="input-mask" readonly onclick="focuse(${count});" value = "${sub.license_number}" style = "width: 100%; -webkit-appearance: none; border:0px;"></td>
				                                    			<c:set var="count" value="${count+1}"/>
				                                    		</tr>
				                                   		</c:forEach>
				                                  	</c:if>
		                                            <tr>
		                                                <td><input type="text" id = "code${count}" class="form-control" data-toggle="input-mask" readonly onclick="focuse(${count});" style = "width: 100%; -webkit-appearance: none; border:0px;"></td>
				                                    	<td><input type="text" id = "name${count}" class="form-control" data-toggle="input-mask" readonly onclick="focuse(${count});" style = "width: 100%; -webkit-appearance: none; border:0px;"></td>
				                                    	<td><input type="text" id = "number${count}" class="form-control" data-toggle="input-mask" readonly onclick="focuse(${count});" style = "width: 100%; -webkit-appearance: none; border:0px;"></td>
		                                            </tr>
		                                        </tbody>
                                            </table>
                                        </div>
	                                    </div>
	                                </div>
	                            </div>
                            </div>
							<div class="card">
								<div class="card-body">
									<!-- ???????????? -->
									<form action="FT_AccountInsert" method="post">
										<input type="hidden" name="${_csrf.parameterName }"
											value="${_csrf.token }">
										<div class="col-sm-12">
											<div class="card-body table-responsive">
												<h4 class="header-title">????????? ??????</h4>
												<div class="form-group row">
													<div class="col-md-5">
														<div class="form-group row">
															<label class="col-lg-4 col-form-label" for="simpleinput">????????????<span
																class="text-danger">*</span></label>
															<div class="col-lg-8">
																<input type="text" class="form-control"
																	name="customerName" placeholder="????????????">
															</div>
														</div>

														<div class="form-group row">
															<label class="col-lg-4 col-form-label" for="simpleinput">????????????<span
																class="text-danger">*</span></label>
															<div class="col-lg-8">
																<input type="text" class="form-control" name="bsName"
																	placeholder="????????????">
															</div>
														</div>

														<div class="form-group row">
															<label class="col-lg-4 col-form-label" for="simpleinput">?????????????????????<span
																class="text-danger">*</span></label>
															<div class="col-lg-8">
																<input type="text" class="form-control" name="number" placeholder = "?????????????????????" style = "background-color:#FCF3CF;" required="required">
															</div>
														</div>

														<div class="form-group row">
															<label class="col-lg-4 col-form-label" for="simpleinput">???????????????<span
																class="text-danger">*</span></label>
															<div class="col-lg-8">
																<input type="text" class="form-control" name="bsMaster"
																	placeholder="???????????????">
															</div>
														</div>

														<div class="form-group row">
															<label class="col-lg-4 col-form-label" for="simpleinput">??????<span
																class="text-danger">*</span></label>
															<div class="col-lg-8">
																<input type="text" class="form-control"
																	name="bsCondition" placeholder="??????">
															</div>
														</div>

														<div class="form-group row">
															<label class="col-lg-4 col-form-label" for="simpleinput">??????<span
																class="text-danger">*</span></label>
															<div class="col-lg-8">
																<input type="text" class="form-control" name="bsLine"
																	placeholder="??????">
															</div>
														</div>

														<div class="form-group row">
															<label class="col-lg-4 col-form-label" for="simpleinput">?????????<span
																class="text-danger">*</span></label>
															<div class="col-lg-8">
																<input type="text" class="form-control"
																	name="customerCredit" placeholder="?????????">
															</div>
														</div>

														<div class="form-group row">
															<label class="col-lg-4 col-form-label" for="simpleinput">???????????????<span
																class="text-danger">*</span></label>
															<div class="col-lg-8">
																<input type="date" class="form-control"
																	name="bsStartdate" placeholder="???????????????">
															</div>
														</div>
													</div>
													<label class="col-md-1 col-form-label" for="simpleinput">&nbsp;</label>
													<div class="col-md-5">
														<div class="form-group row">
															<label class="col-lg-4 col-form-label" for="simpleinput">?????????<span
																class="text-danger">*</span></label>
															<div class="col-lg-8">
																<input type="text" class="form-control"
																	name="branchName" placeholder="?????????">
															</div>
														</div>

														<div class="form-group row">
															<label class="col-lg-4 col-form-label" for="simpleinput">????????????<span
																class="text-danger">*</span></label>
															<div class="col-lg-8">
																<select class="form-control" name="state">
																	<option value="0">== ?????? ==</option>
																	<option value="1">??????</option>
																	<option value="2">??????</option>
																	<option value="3">??????</option>
																	<option value="4">????????????</option>
																	<option value="5">?????????</option>
																</select>
															</div>
														</div>
														
														<div class="form-group row">
															<label class="col-lg-4 col-form-label" for="simpleinput">??????????????????<span class="text-danger">*</span></label>
															<div class="col-lg-8">
																<input type="text" class="form-control" name="bsNumber" placeholder = "??????????????????">
															</div>
														</div>
															
														<div class="form-group row">	
															<label class="col-lg-4 col-form-label"
																for="simpleinput">??????????????????<span class="text-danger">*</span></label>
															<div class="col-lg-8">
																<input type="text" class="form-control" name="bsAddress" placeholder = "??????????????????">
															</div>
														</div>

														<div class="form-group row">
															<label class="col-lg-4 col-form-label" for="simpleinput">???????????????<span
																class="text-danger">*</span></label>
															<div class="col-lg-8">
																<input type="text" class="form-control"
																	name="bsAddress2" placeholder="???????????????">
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
										<div id = "submit" class="form-group text-right mb-0">
                                            <button class="btn btn-primary waves-effect waves-light mr-1" type="submit">
                                                Submit
                                            </button>
                                            <button type="reset" class="btn btn-secondary waves-effect">
                                                Cancel
                                            </button>
                                        </div>
									</form>
									<div id = "update" class="form-group text-right mb-0" style = "display:none;">
										<button class="btn btn-primary waves-effect waves-light mr-1" onclick="update();">
	                                        Update
	                                    </button>
	                                    <button class="btn btn-primary waves-effect waves-light mr-1" onclick="deleted();">
	                                        Delete
	                                    </button>
                                    </div>
								</div>
							</div>
							<!-- end container-fluid -->

						</div>
						<!-- end row -->

						<!-- end content -->

						

						<!-- ============================================================== -->
						<!-- End Page content -->
						<!-- ============================================================== -->
					</div>
				</div>
				<%@ include file="../footer.jsp"%>
			</div>
		</div>
	</div>
	<!-- END wrapper -->

	<%@ include file="../rightbar.jsp"%>
	<%@ include file="../setting2.jsp"%>

</body>
</html>