<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><!DOCTYPE html>
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
        	
        	    	
        	
        	function enterinsert() {
       			
       			$(".chit-table-bordered-primary tbody").append('<tr>' +
       					'<td><input type="text" onfocus = "focuse(this.name);" name = "f_name'+count+'" class="form-control" data-toggle="input-mask" style = "width: 100%; border:0px;"></td>'+
                        '<td><input type="text" onfocus = "focuse(this.name);" name = "f_type'+count+'" class="form-control" data-toggle="input-mask" style = "width: 100%; border:0px;"></td>'+
                        '<td><input type="text" onfocus = "focuse(this.name);" name = "f_cohabitation'+count+'" class="form-control" data-toggle="input-mask" style = "width: 100%; border:0px;"></td>'+
                        '<td><input type="text" onfocus = "focuse(this.name);" name = "f_born'+count+'" class="form-control" data-toggle="input-mask" data-mask-format="0000/00/00" placeholder = "YYYY/DD/MM" style = "width: 100%; border:0px;"></td>'+
                        '<td><input type="text" onfocus = "focuse(this.name);" name = "f_born_type'+count+'" class="form-control" data-toggle="input-mask" style = "width: 100%; border:0px;"></td>'+
                       '</tr>');
                    count = count + 1;
          		
        	}
        	
        	function enterdelete() {
       		
        		
       			$(".chit-table-bordered-primary tbody").empty('<tr>' +
       					'<td><input type="text" onfocus = "focuse(this.name);" name = "f_name'+count+'" class="form-control" data-toggle="input-mask" style = "width: 100%; border:0px;"></td>'+
                        '<td><input type="text" onfocus = "focuse(this.name);" name = "f_type'+count+'" class="form-control" data-toggle="input-mask" style = "width: 100%; border:0px;"></td>'+
                        '<td><input type="text" onfocus = "focuse(this.name);" name = "f_cohabitation'+count+'" class="form-control" data-toggle="input-mask" style = "width: 100%; border:0px;"></td>'+
                        '<td><input type="text" onfocus = "focuse(this.name);" name = "f_born'+count+'" class="form-control" data-toggle="input-mask" data-mask-format="0000/00/00" placeholder = "YYYY/DD/MM" style = "width: 100%; border:0px;"></td>'+
                        '<td><input type="text" onfocus = "focuse(this.name);" name = "f_born_type'+count+'" class="form-control" data-toggle="input-mask" style = "width: 100%; border:0px;"></td>'+
                       '</tr>');
                    count = 0;
          		
    
        	}
        	
        	function HR_userChk() {
        		// id??? ????????? ??? ???????????? ?????? ?????????
        		if(!document.inputPhysicaly.username.value) {
        			alert("??????????????? ??????????????? !");
        			document.inputPhysicaly.username.focus();
        			return false;
        		}
        		
        		/*
        		 * window.open("?????????", "????????????", "?????????");
        		 * url="?????????????=" + ?????????;  -> get??????
        		 */
        		
        		var url = "HR_userChk?username=" + document.inputPhysicaly.username.value;
        		window.open(url, "confirm", "menubar=no, width=300, height=200");
        		// -> confirmId.do ????????? ??????
        	}
        	
        	        	
        	function changePosition(code) {        	
        		$.ajax({
    	  			url: '/erp/HR_changePosition?${_csrf.parameterName}=${_csrf.token }&de='+code,
    	  			type: 'POST',
    	  			dataTpye: 'json',
    	  			success: function(data){
    	  				
    	  			}
    	  				
    	  			});
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
											href="javascript: void(0);">??????</a></li>
										<li class="breadcrumb-item"><a
											href="javascript: void(0);">????????????</a></li>
										<li class="breadcrumb-item active">??????????????????</li>
									</ol>
								</div>
								<h4 class="page-title">??????????????????</h4>
							</div>
						</div>
					</div>
					<!-- end page title -->

					<div class="row">
						<div class="col-sm-12">
							<div class="card">
								<div class="card-body">
									<ul class="nav nav-tabs" role="tablist">
										<li class="nav-item"><a class="nav-link active"
											id="employee-tab" data-toggle="tab" href="#employee"
											role="tab" aria-controls="employee" aria-selected="false">
												<span class="d-block d-sm-none"><i
													class="fa fa-employee"></i></span> <span class="d-none d-sm-block">????????????</span>
										</a></li>
										<!-- <li class="nav-item"><a class="nav-link"
											id="presidency-tab" data-toggle="tab" href="#presidency"
											role="tab" aria-controls="presidency" aria-selected="true">
												<span class="d-block d-sm-none"><i class="fa fa-user"></i></span>
												<span class="d-none d-sm-block">????????????</span>
										</a></li>
										<li class="nav-item"><a class="nav-link" id="message-tab"
											data-toggle="tab" href="#message" role="tab"
											aria-controls="message" aria-selected="false"> <span
												class="d-block d-sm-none"><i class="fa fa-envelope-o"></i></span>
												<span class="d-none d-sm-block">????????????</span>
										</a></li> -->
									</ul>

									<div class="tab-content">
										<!-- ???????????? -->
										<div class="tab-pane show active" id="employee"
											role="tabpanel" aria-labelledby="employee-tab">
											<div class="col-sm-12">
												<form action="HR_inputFoundation?${_csrf.parameterName}=${_csrf.token}" class="form-horizontal"
													id="foundation" method="post" enctype="multipart/form-data">
													<input type="hidden" name="${_csrf.parameterName}"
														value="${_csrf.token}">

													<div class="card-body table-responsive">
														<h4 class="header-title">?????? ??????</h4>
														<h4 class="header-title">&nbsp;</h4>
														<div class="form-group row">
															<label class="col-md-1 col-form-label" for="simpleinput">????????????<span class="text-danger">*</span></label>
																<div class="col-md-4">
																	<input type="file" class="dropify" name="e_picture" />
																</div>
															<label class="col-md-1 col-form-label" for="simpleinput">&nbsp;</label>
															<div class="col-md-6">
																<div class="form-group row">
																	<label class="col-lg-2 col-form-label"
																		for="simpleinput">??????<span class="text-danger">*</span></label>
																	<div class="col-lg-8">
																		<input type="text" class="form-control" name="e_name" id = "e_name"
																			placeholder="????????????">
																	</div>
																</div>
																<div class="form-group row">
																	<label class="col-md-2 col-form-label"
																		for="simpleinput">??????<span class="text-danger">*</span></label>
																	<div class="col-md-3  col-form-label">
																		<div>
																			<div
																				class="custom-control custom-radio custom-control-inline mb-2">
																				<input type="radio" id="customRadioInline1"
																					name="e_gender" class="custom-control-input"
																					value="1" checked> <label
																					class="custom-control-label"
																					for="customRadioInline1" id="g_male">??????</label>
																			</div>
																			<div
																				class="custom-control custom-radio custom-control-inline mb-2">
																				<input type="radio" id="customRadioInline2"
																					name="e_gender" class="custom-control-input"
																					value="2"> <label
																					class="custom-control-label"
																					for="customRadioInline2" id="g_female">??????</label>
																			</div>
																		</div>
																	</div>
																	<label class="col-md-2 col-form-label"
																		for="simpleinput">???/?????????<span
																		class="text-danger">*</span></label>
																	<div class="col-md-4  col-form-label">
																		<div>
																			<div
																				class="custom-control custom-radio custom-control-inline mb-2">
																				<input type="radio" id="customRadioInline7"
																					name="e_type" class="custom-control-input"
																					value="local" checked> <label
																					class="custom-control-label"
																					for="customRadioInline7" id = "local">?????????</label>
																			</div>
																			<div
																				class="custom-control custom-radio custom-control-inline mb-2">
																				<input type="radio" id="customRadioInline8"
																					name="e_type" class="custom-control-input"
																					value="foreign"> <label
																					class="custom-control-label"
																					for="customRadioInline8" id = "foreign">?????????</label>
																			</div>
																		</div>
																	</div>
																</div>
																<div class="form-group row">
																	<label class="col-md-2 col-form-label"
																		for="simpleinput">????????????<span
																		class="text-danger">*</span></label>
																	<div class="col-md-8">
																		<input type="text" class="form-control" name="e_code"
																			placeholder="????????????" size="13">
																	</div>
																</div>
																<div class="form-group row">
																	<label class="col-md-2 col-form-label"
																		for="simpleinput">????????????<span
																		class="text-danger">*</span></label>
																	<div class="col-md-8">
																		<input type="text" class="form-control" name="e_hp"
																			placeholder="????????????" size="13">
																	</div>
																</div>
															</div>
														</div>
														<div class="form-group row">
															<label class="col-md-1 col-form-label" for="simpleinput">??????<span
																class="text-danger">*</span></label>
															<div class="col-md-10">
																<input type="text" class="form-control"
																	name="e_address" placeholder="??????" >
															</div>															
														</div>
														<div class="form-group row">
															<label class="col-md-1 col-form-label" for="simpleinput">????????????<span
																class="text-danger">*</span></label>
															<div class="col-md-4">
																<input type="text" class="form-control"
																	name="e_mailcode" placeholder="????????????">
															</div>
															<label class="col-md-1 col-form-label" for="simpleinput">&nbsp;</label>
															<label class="col-md-1 col-form-label" for="simpleinput">nfc??????<span
																class="text-danger">*</span></label>
															<div class="col-md-4">
																<input type="text" class="form-control"
																	name="e_nfcCodeNFC" placeholder="nfc??????">
															</div>
														</div>

														<div class="form-group row">
															<label class="col-md-1 col-form-label" for="simpleinput">??????<span
																class="text-danger">*</span></label>
															<div class="col-md-4">
																<select class="form-control select2"
																	name="department_code" id = "department_code" onchange="changePosition();">
																		<option value="">????????? ???????????????</option>
																	<c:forEach var="dep" items="${dep}">
																		<option value="${dep.department_code}">${dep.department_name}</option>
																	</c:forEach>
																</select>
															</div>
															<label class="col-md-1 col-form-label" for="simpleinput">&nbsp;</label>
															<label class="col-md-1 col-form-label" for="simpleinput">??????<span
																class="text-danger">*</span></label>
															<div class="col-md-4">
																<select class="form-control select2"
																	name="position_code" id = "position_code" onchange="">
																	<option value="">????????? ???????????????</option>
																	<c:forEach var="poi" items="${poi}">
																		<option value="${poi.position_code}">${poi.position_name}</option>
																	</c:forEach>
																</select>
															</div>
														</div>

														<div class="form-group row">
															<label class="col-md-1 col-form-label" for="simpleinput">??????<span
																class="text-danger">*</span></label>
															<div class="col-md-4">
																<select class="form-control select2" name="rank_code" id = "rank_code"
																	onchange="">
																	<option value="">????????? ???????????????</option>
																	<c:forEach var="rank" items="${rank}">
																		<option value="${rank.rank_code}">${rank.rank_name}(${rank.rank_code})</option>
																	</c:forEach>
																</select>
															</div>
															<label class="col-md-1 col-form-label" for="simpleinput">&nbsp;</label>
															<label class="col-md-1 col-form-label" for="simpleinput">??????<span
																class="text-danger">*</span></label>
															<div class="col-md-4">
																<input type="text" class="form-control" id = "level_step"
																	name="level_step" placeholder="??????">
															</div>
														</div>
														<div class="form-group text-right mb-0">
															<button
																class="btn btn-primary waves-effect waves-light mr-1" id = "submit"
																type="submit">Submit</button>
															<button type="reset"
																class="btn btn-secondary waves-effect">Cancel</button>
														</div>
													</div>
												</form>

												<%-- <form action="HR_inputPhysical" class="form-horizontal"
													id="physical" name="inputPhysicaly" method="post">
													<input type="hidden" name="${_csrf.parameterName }"
														value="${_csrf.token }"> <input type="hidden"
														name="hiddenId" value="0">
													<div class="card-body table-responsive">
														<h4 class="header-title">?????? ??????</h4>
														<h4 class="header-title">&nbsp;</h4>

														<div class="form-group row">
															<label class="col-md-1 col-form-label" for="simpleinput">??????</label>
															<div class="col-md-3">
																<input type="text" class="form-control" name="e_height"
																	placeholder="??????">
															</div>
															<label class="col-md-1 col-form-label" for="simpleinput">cm</label>
															<label class="col-md-1 col-form-label" for="simpleinput">&nbsp;</label>
															<label class="col-md-1 col-form-label" for="simpleinput">??????</label>
															<div class="col-md-3">
																<input type="text" class="form-control" name="e_weight"
																	placeholder="??????">
															</div>
															<label class="col-md-1 col-form-label" for="simpleinput">kg</label>
														</div>
														<div class="form-group row">
															<label class="col-md-1 col-form-label" for="simpleinput">??????(???)</label>
															<div class="col-md-1">
																<input type="text" class="form-control"
																	name="e_left_sight" placeholder="??????(???)">
															</div>
															<label class="col-md-1 col-form-label" for="simpleinput">&nbsp;</label>
															<label class="col-md-1 col-form-label" for="simpleinput">??????(???)</label>
															<div class="col-md-1">
																<input type="text" class="form-control"
																	name="e_right_sight" placeholder="??????(???)">
															</div>

															<label class="col-md-1 col-form-label" for="simpleinput">&nbsp;</label>
															<label class="col-md-1 col-form-label" for="simpleinput">??????</label>
															<div class="col-md-3 col-form-label">
																<div
																	class="custom-control custom-radio custom-control-inline mb-2">
																	<input type="radio" id="customRadioInline9"
																		name="e_color_blind" class="custom-control-input"
																		value="blind" checked> <label
																		class="custom-control-label" for="customRadioInline9">???</label>
																</div>
																<div
																	class="custom-control custom-radio custom-control-inline mb-2">
																	<input type="radio" id="customRadioInline10"
																		name="e_color_blind" class="custom-control-input"
																		value="common"> <label
																		class="custom-control-label" for="customRadioInline10">???</label>
																</div>
															</div>
														</div>


														<div class="form-group row">
															<label class="col-md-1 col-form-label" for="simpleinput">?????????</label>
															<div class="col-md-3 col-form-label">
																<div
																	class="custom-control custom-radio custom-control-inline mb-2">
																	<input type="radio" id="customRadioInline11"
																		name="e_blood_type" class="custom-control-input"
																		value="a" checked> <label
																		class="custom-control-label" for="customRadioInline11">A</label>
																</div>
																<div
																	class="custom-control custom-radio custom-control-inline mb-2">
																	<input type="radio" id="customRadioInline12"
																		name="e_blood_type" class="custom-control-input"
																		value="b"> <label class="custom-control-label"
																		for="customRadioInline12">B</label>
																</div>
																<div
																	class="custom-control custom-radio custom-control-inline mb-2">
																	<input type="radio" id="customRadioInline13"
																		name="e_blood_type" class="custom-control-input"
																		value="ab" checked> <label
																		class="custom-control-label" for="customRadioInline13">AB</label>
																</div>
																<div
																	class="custom-control custom-radio custom-control-inline mb-2">
																	<input type="radio" id="customRadioInline14"
																		name="e_blood_type" class="custom-control-input"
																		value="o"> <label class="custom-control-label"
																		for="customRadioInline14">O</label>
																</div>
															</div>
															<label class="col-md-1 col-form-label" for="simpleinput">&nbsp;</label>
															<label class="col-md-1 col-form-label" for="simpleinput">&nbsp;</label>
															<label class="col-md-1 col-form-label" for="simpleinput">??????</label>
															<div class="col-md-1">
																<input type="text" class="form-control"
																	name="e_blood_presure1" placeholder="??????">
															</div>
															<label class="col-md-1 col-form-label" for="simpleinput">mmHg
																~</label>
															<div class="col-md-1">
																<input type="text" class="form-control"
																	name="e_blood_presure2" placeholder="??????">
															</div>
															<label class="col-md-1 col-form-label" for="simpleinput">mmHg</label>
														</div>

														<div class="form-group row">
															<label class="col-md-1 col-form-label" for="simpleinput">??????
																??????/??????<span class="text-danger">*</span>
															</label>
															<div class="col-md-3 col-form-label">
																<div>
																	<div
																		class="custom-control custom-radio custom-control-inline mb-2">
																		<input type="radio" id="customRadioInline3"
																			name="e_disability_type" class="custom-control-input"
																			value="1" checked> <label
																			class="custom-control-label" for="customRadioInline3">?????????</label>
																	</div>
																	<div
																		class="custom-control custom-radio custom-control-inline mb-2">
																		<input type="radio" id="customRadioInline4"
																			name="e_disability_type" class="custom-control-input"
																			value="2"> <label
																			class="custom-control-label" for="customRadioInline4">?????????</label>
																	</div>
																	<div
																		class="custom-control custom-radio custom-control-inline mb-2">
																		<input type="radio" id="customRadioInline5"
																			name="e_disability_type" class="custom-control-input"
																			value="3"> <label
																			class="custom-control-label" for="customRadioInline5">???????????????</label>
																	</div>
																	<div
																		class="custom-control custom-radio custom-control-inline mb-2">
																		<input type="radio" id="customRadioInline6"
																			name="e_disability_type" class="custom-control-input"
																			value="4"> <label
																			class="custom-control-label" for="customRadioInline6">??????</label>
																	</div>
																</div>

															</div>
															<div class="col-md-1">
																<input type="text" class="form-control"
																	name="e_disability_level" placeholder="????????? ??????">
															</div>
															<label class="col-md-1 col-form-label" for="simpleinput">&nbsp;</label>

															<label class="col-md-1 col-form-label" for="simpleinput">????????????<span
																class="text-danger">*</span></label>
															<div class="col-md-3 col-form-label">
																<div
																	class="custom-control custom-radio custom-control-inline mb-2">
																	<input type="radio" id="customRadioInline9"
																		name="e_veteran_type" class="custom-control-input"
																		value="0" checked> <label
																		class="custom-control-label" for="customRadioInline9">?????????</label>
																</div>
																<div
																	class="custom-control custom-radio custom-control-inline mb-2">
																	<input type="radio" id="customRadioInline10"
																		name="e_veteran_type" class="custom-control-input"
																		value="1"> <label class="custom-control-label"
																		for="customRadioInline10">??????</label>
																</div>
															</div>
														</div>

														<div class="form-group row">
															<label class="col-md-1 col-form-label" for="simpleinput">????????????<span
																class="text-danger">*</span></label>
															<div class="col-md-4">
																<select class="form-control select2"
																	name="e_veteran_info" onchange="">
																	<option value="?????????">0. ?????????</option>
																	<option value="????????????">1. ????????????</option>
																	<option value="?????????">2. ?????????</option>
																	<option value="??????">3. ??????</option>
																</select>
															</div>
															<label class="col-md-1 col-form-label" for="simpleinput">&nbsp;</label>
															<label class="col-md-1 col-form-label" for="simpleinput">????????????<span
																class="text-danger">*</span></label>
															<div class="col-md-4">
																<select class="form-control select2"
																	name="e_veteran_level" onchange="">
																	<option value="?????????">0. ?????????</option>
																	<option value="???????????????">1. ???????????????</option>
																	<option value="????????????????????????">2. ????????? ????????? ??? ????????? ?????????
																		2?????????</option>
																	<option value="5.18 ???????????????">3. 5.18 ???????????????</option>
																	<option value="?????????????????????">4. ?????????????????????</option>
																	<option value="???????????????????????????">5. ???????????????????????????</option>
																</select>
															</div>
														</div>

														<div class="form-group text-right mb-0">
															<button
																class="btn btn-primary waves-effect waves-light mr-1"
																type="submit">Submit</button>
															<button type="reset"
																class="btn btn-secondary waves-effect">Cancel</button>
														</div>
													</div>
												</form>

												<div class="card-body table-responsive">
													<h4 class="header-title">?????? ??????</h4>
													<h4 class="header-title">&nbsp;</h4>
													<div class="table-responsive" style="margin: 15px 0px 50px">
														<table
															class="table m-0 chit-table-colored-bordered chit-table-bordered-primary table-bordered">
															<col style="width: 20%;">
															<col style="width: 20%;">
															<col style="width: 20%">
															<col style="width: 20%;">
															<col style="width: 20%;">
															<thead>
																<tr>
																	<th>??????</th>
																	<th>??????</th>
																	<th>????????????</th>
																	<th>????????????</th>
																	<th>??????/??????</th>
																</tr>
															</thead>

															<tbody>
																<tr>
																	<td><input type="text" name="f_name0"
																		class="form-control" data-toggle="input-mask"
																		style="width: 100%; border: 0px;"></td>
																	<td><input type="text" name="f_type0"
																		class="form-control" data-toggle="input-mask"
																		style="width: 100%; border: 0px;"></td>
																	<td><input type="text" name="f_cohabitation0"
																		class="form-control" data-toggle="input-mask"
																		style="width: 100%; border: 0px;"></td>
																	<td><input type="text" name="f_born0"
																		class="form-control" data-toggle="input-mask"
																		data-mask-format="0000/00/00" placeholder="YYYY/DD/MM"
																		style="width: 100%; border: 0px;"></td>
																	<td><input type="text" name="f_born_type0"
																		class="form-control" data-toggle="input-mask"
																		style="width: 100%; border: 0px;"></td>
																</tr>
															</tbody>
														</table>
													</div>
													<div class="form-group text-right mb-0">
														<button
															class="btn btn-primary waves-effect waves-light mr-1"
															type="button" onclick="enterinsert(0);">??????</button>
														<button
															class="btn btn-primary waves-effect waves-light mr-1"
															type="button" onclick="enterdelete(0);">??????</button>
													</div>

												</div>
											</div>
											<div class="form-group text-right mb-0">
												<button
													class="btn btn-primary waves-effect waves-light mr-1"
													type="submit">Submit</button>
												<button type="reset" class="btn btn-secondary waves-effect">
													Cancel</button>
											</div> --%>


										</div>

										<%-- <!-- ???????????? -->
										<div class="tab-pane" id="presidency" role="tabpanel"
											aria-labelledby="presidency-tab">
											<form action="HR_inputProHR2" class="form-horizontal"
												method="post">
												<input type="hidden" name="${_csrf.parameterName }"
													value="${_csrf.token }">
												<div class="col-sm-12">
													<div class="card-body table-responsive">
														<!-- <form class="form-horizontal"> -->
														<div class="form-group row">
															<label class="col-md-1 col-form-label" for="simpleinput">?????????</label>
															<div class="col-md-4 input-group">
																<input type="text" class="form-control"
																	placeholder="mm/dd/yyyy" data-provide="datepicker"
																	data-date-autoclose="true">
																<div class="input-group-append">
																	<span
																		class="input-group-text bg-primary text-white b-0"><i
																		class="mdi mdi-calendar"></i></span>
																</div>
															</div>
															<label class="col-md-1 col-form-label" for="simpleinput">&nbsp;</label>
															<label class="col-md-1 col-form-label" for="simpleinput">???????????????</label>
															<div class="col-md-4 input-group">
																<input type="text" class="form-control"
																	placeholder="mm/dd/yyyy" data-provide="datepicker"
																	data-date-autoclose="true">
																<div class="input-group-append">
																	<span
																		class="input-group-text bg-primary text-white b-0"><i
																		class="mdi mdi-calendar"></i></span>
																</div>
															</div>
														</div>
														<div class="form-group row">
															<label class="col-md-1 col-form-label" for="simpleinput">?????????</label>
															<div class="col-md-4 input-group">
																<input type="text" class="form-control"
																	placeholder="mm/dd/yyyy" data-provide="datepicker"
																	data-date-autoclose="true">
																<div class="input-group-append">
																	<span
																		class="input-group-text bg-primary text-white b-0"><i
																		class="mdi mdi-calendar"></i></span>
																</div>
															</div>
															<label class="col-md-1 col-form-label" for="simpleinput">&nbsp;</label>
															<label class="col-md-1 col-form-label" for="simpleinput">???????????????</label>
															<div class="col-md-4 input-group">
																<input type="text" class="form-control"
																	placeholder="mm/dd/yyyy" data-provide="datepicker"
																	data-date-autoclose="true">
																<div class="input-group-append">
																	<span
																		class="input-group-text bg-primary text-white b-0"><i
																		class="mdi mdi-calendar"></i></span>
																</div>
															</div>
														</div>
														<div class="form-group row">
															<label class="col-md-2 col-form-label" for="simpleinput">????????????</label>
															<div class="col-md-10">
																<select class="">
																	<a href="#"><i class="dripicons-zoom-in"></i></a>
																	<option value="">1. ???</option>
																	<option value="">2. ???</option>
																</select>
															</div>
														</div>
														<div class="form-group row">
															<label class="col-md-2 col-form-label" for="simpleinput">??????????????????</label>
															<div class="col-md-10">
																<select class="">
																	<a href="#"><i class="dripicons-zoom-in"></i></a>
																	<option value="">1. ??????</option>
																	<option value="">2. ???</option>
																</select>

															</div>
														</div>
														<div class="form-group row">
															<label class="col-md-2 col-form-label" for="simpleinput">????????????</label>
															<div class="col-md-10">
																<input type="text" class="" value="____/__/__">&nbsp;<a
																	href="#"></a> ~ <input type="text" class=""
																	value="____/__/__">&nbsp;<a href="#"><i
																	class="dripicons-calendar"></i></a>
															</div>
														</div>
														<div class="form-group row">
															<label class="col-md-2 col-form-label" for="simpleinput">????????????</label>
															<div class="col-md-10">
																<select class="">
																	<option value="">1. ??????</option>
																	<option value="">2. ??????</option>
																	<option value="">3. ??????</option>
																	<option value="">4. ??????</option>
																	<option value="">5. ??????</option>
																</select>
															</div>
														</div>

														<div class="form-group row">
															<label class="col-md-2 col-form-label" for="simpleinput">?????????????????????(DB???)</label>
															<div class="col-md-10">
																<input type="text" class="">&nbsp;<a href="#"><i
																	class="dripicons-calendar"></i></a>
															</div>
														</div>
														<div class="form-group row">
															<label class="col-md-2 col-form-label" for="simpleinput">???????????????</label>
															<div class="col-md-10">
																<input type="text" class="">&nbsp;<a href="#"><i
																	class="dripicons-calendar"></i></a>
															</div>
														</div>

														<!-- end col -->
														<!-- end row -->
													</div>
												</div>
												<div class="form-group mb-0">
													<input type="submit" class="btn btn-success" value="??????">
												</div>
											</form>
										</div>

										<!-- ???????????? -->
										<div class="tab-pane" id="message" role="tabpanel"
											aria-labelledby="message-tab">
											<form action="HR_inputProHR3" class="form-horizontal"
												method="post">
												<input type="hidden" name="${_csrf.parameterName }"
													value="${_csrf.token }">
												<div class="col-sm-12">
													<div class="card">
														<div class="card-body table-responsive">
															<div align="left">
																<h4>????????????</h4>
																<br>
															</div>
															<table id="datatable"
																style="border-collapse: collapse; border-spacing: 0; width: 100%;">
																<tr>
																	<td>??????</td>
																	<td><input type="text" class="" value="2??????">&nbsp;<a
																		href="#"><i class="dripicons-zoom-in"></i></a> <input
																		type="text" class="" value="2,160,000" readonly></td>
																</tr>

																<tr>
																	<td>????????????</td>
																	<td><input type="text" class="" value="200">&nbsp;<a
																		href="#"><i class="dripicons-zoom-in"></i></a> <input
																		type="text" class="" value="????????????" readonly></td>
																</tr>


																<tr>
																	<td>??????????????????</td>
																	<td><select class="">
																			<option></option>
																			<option value="">1. ?????????</option>
																			<option value="">2. ??????</option>
																	</select></td>

																	<td>?????????????????????</td>
																	<td><select class="">
																			<option></option>
																			<option value="">1. ???</option>
																			<option value="">2. ???</option>
																	</select></td>
																</tr>

																<tr>
																	<td>??????????????????</td>
																	<td><select class="">
																			<option value="">0. ??????(2???5????????? ??????)</option>
																			<option value="">1. ?????????(2???5????????? ??????)</option>
																	</select></td>

																	<td>?????????????????????</td>
																	<td><select class="">
																			<option value="">0. ???</option>
																			<option value="">1. ???</option>
																	</select></td>
																</tr>

																<tr>
																	<td>?????????????????????</td>
																	<td><select class="">
																			<option></option>
																			<option value="">0. ???</option>
																			<option value="">1. ???</option>
																	</select></td>

																	<td>????????????????????????</td>
																	<td><input type="text" class=""></td>
																</tr>

																<tr>
																	<td>????????????</td>
																	<td><input type="text" class="" value="T10">&nbsp;<a
																		href="#"><i class="dripicons-zoom-in"></i></a> <input
																		type="text" class="" value="????????????????????????(1" readonly>
																		<input type="text" class="" value="____/__">&nbsp;
																		~ &nbsp; <input type="text" class="" value="____/__">&nbsp;<a
																		href="#"><i class="dripicons-calendar"></i></a></td>
																</tr>

																<tr>
																	<td>??????????????????</td>
																	<td><input type="text" class="">&nbsp;<a
																		href="#"><i class="dripicons-zoom-in"></i></a> <input
																		type="text" class="" disabled></td>
																</tr>

																<tr>
																	<td>????????????</td>
																	<td><input type="text" class=""></td>

																	<td>?????????</td>
																	<td><input type="text" class=""></td>
																</tr>

																<tr>
																	<td>??????????????????2</td>
																	<td><input type="text" class="">&nbsp;<a
																		href="#"><i class="dripicons-zoom-in"></i></a> <input
																		type="text" class="" disabled></td>
																</tr>

																<tr>
																	<td>????????????2</td>
																	<td><input type="text" class=""></td>

																	<td>?????????2</td>
																	<td><input type="text" class=""></td>
																</tr>
															</table>
														</div>
													</div>
												</div>

												<div class="col-sm-12">
													<div class="card">
														<div class="card-body table-responsive">
															<div align="left">
																<h4>????????????</h4>
																<br>
															</div>
															<table id="datatable"
																style="border-collapse: collapse; border-spacing: 0; width: 100%;">
																<tr>
																	<td>????????????</td>
																	<td><select class="">
																			<option value="">1. ????????????</option>
																			<option value="">2. ????????????</option>
																	</select></td>

																	<td>????????????</td>
																	<td><input type="text" class="" value="72,000">&nbsp;<a
																		href="#"><i class="dripicons-zoom-in"></i></a></td>
																</tr>

																<tr>
																	<td>????????????</td>
																	<td><input type="text" class="" disabled>&nbsp;<a
																		href="#"><i class="dripicons-zoom-in" disabled></i></a></td>

																	<td>????????????</td>
																	<td><input type="text" class="" value="10,400">&nbsp;<a
																		href="#"><i class="dripicons-zoom-in"></i></a></td>
																</tr>


																<tr>
																	<td>????????????</td>
																	<td><input type="text" class="" disabled>&nbsp;<a
																		href="#"><i class="dripicons-zoom-in"></i></a></td>

																	<td>??????????????????</td>
																	<td><input type="text" class=""></td>
																</tr>

																<tr>
																	<td>??????????????????</td>
																	<td><select class="">
																			<option value="">1. ???</option>
																			<option value="">2. ???</option>
																	</select></td>

																	<td>??????????????????(??????)</td>
																	<td><select class="">
																			<option value="">1. ???</option>
																			<option value="">2. ???</option>
																	</select></td>
																</tr>

																<tr>
																	<td>????????????????????????</td>
																	<td><select class="">
																			<option value="">0. ?????????</option>
																			<option value="">1. ??????</option>
																	</select></td>

																	<td>?????????????????????</td>
																	<td><select class="" disabled>
																			<option></option>
																	</select>&nbsp;
																		<button onclick="location=''">??????</button></td>
																</tr>
															</table>
														</div>
													</div>
												</div>

												<div class="col-sm-12">
													<div class="card">
														<div class="card-body table-responsive">
															<div align="left">
																<h4>????????????</h4>
																<br>
															</div>
															<table id="datatable"
																style="border-collapse: collapse; border-spacing: 0; width: 100%;">
																<tr>
																	<td>???????????????</td>
																	<td><select class="">
																			<option value="">1. ?????????</option>
																			<option value="">2. ??????</option>
																	</select></td>

																	<td>???????????????</td>
																	<td><select class="">
																			<option value="">1. ?????????</option>
																			<option value="">2. ??????</option>
																	</select></td>
																</tr>

																<tr>
																	<td>20?????????</td>
																	<td><input type="text" class="" placeholder="0"></td>

																	<td>??????60?????????</td>
																	<td><input type="text" class="" placeholder="0"></td>
																</tr>


																<tr>
																	<td>?????????</td>
																	<td><input type="text" class="" placeholder="0"></td>

																	<td>?????????/????????????</td>
																	<td><input type="text" class="" placeholder="0"></td>
																</tr>

																<tr>
																	<td>?????????????????????</td>
																	<td><input type="text" class="" placeholder="0"></td>
																</tr>
															</table>
														</div>
													</div>
												</div>

												<div class="form-group mb-0">
													<input type="submit" class="btn btn-success" value="??????">
												</div>
											</form> --%>
										</div>
									</div>

									<!--  -->

								</div>
							</div>
							<!-- end container-fluid -->

						</div>
						<!-- end row -->

						<%@ include file="../footer.jsp"%>

					</div>

					<!-- ============================================================== -->
					<!-- End Page content -->
					<!-- ============================================================== -->

				</div>
				<!-- END wrapper -->


			</div>
		</div>
	</div>
	<%@ include file="../rightbar.jsp"%>

	<%@ include file="../setting2.jsp"%>

	<!-- Plugins js -->
	<script src="/erp/resources/assets/libs/dropify/dropify.min.js"></script>

	<!-- Init js-->
	<script src="/erp/resources/assets/js/pages/form-fileuploads.init.js"></script>

</body>
</html>