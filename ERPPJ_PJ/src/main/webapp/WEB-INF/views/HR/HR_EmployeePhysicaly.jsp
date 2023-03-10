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
	 $(function(){
		$('#search').click(function(){
			$('#result').empty();
			
			var param = new Object();
			var jsonData;			
			
			param.username = $("#username").val();
			param.e_name = $("#e_name").val();
			param.department_code = $("#department_code").val();
			param.position_code = $("#position_code").val();
			param.rank_code = $("#rank_code").val();
					
			jsonData = JSON.stringify(param);
			
			$.ajax({
				url : '${pageContext.request.contextPath}/HR_EmployeePhysicaly_result?${_csrf.parameterName}=${_csrf.token }',
				type : 'POST',
				data : jsonData, 
				dataType : "json",
				contentType:"application/json;charset=UTF-8",
				success : function(list){
					
					document.getElementById("searchTable").style.display="block";
					
					$('#bodyappend').empty();
					$('#resulttable').empty();
					
					document.getElementById("selectTable").style.display="none";
					
					$('#resulttable').append(
						'<table id="datatable" class="table table-striped table-bordered dt-responsive nowrap" style="border-collapse: collapse; border-spacing: 0; width: 100%;">'+
							'<thead class="bg-primary text-white">'+
								'<tr>'+
									'<th>????????????</th>'+
									'<th>?????????</th>'+
									'<th>??????</th>'+
									'<th>??????</th>'+
									'<th>??????(???)</th>'+
									'<th>??????(???)</th>'+
									'<th>??????</th>'+
									'<th>?????????</th>'+
									'<th>??????</th>'+
									'<th>??????</th>'+
									'<th>????????????/??????</th>'+
									'<th>????????? ??????</th>'+
									'<th>????????????</th>'+
									'<th>????????????</th>'+
									'<th>????????????</th>'+
								'</tr>'+
							'</thead>'+
							'<tbody id="result">'+
							'</tbody>'+
						'</table>');
					
					for(var i = 0 ; i < list.length; i++){
					
						var usernames = list[i].username;
						var e_names = list[i].e_name;
						var e_heights = list[i].e_height;
						var e_weights = list[i].e_weight;
						var e_left_sights = list[i].e_left_sight;
						var e_right_sights = list[i].e_right_sight;
						var e_color_blinds = list[i].e_color_blind;
						if(e_color_blinds == "blind") {
							e_color_blinds = "???";
						}
						if(e_color_blinds == "common") {
							e_color_blinds = "???";
						}
						var e_blood_types = list[i].e_blood_type;
						var e_blood_presures = list[i].e_blood_presure;
						var e_medical_infos = list[i].e_medical_info;
						
						var e_veteran_types = list[i].e_veteran_type;
						if(e_veteran_types == "0") {
							e_veteran_types = "?????????";
						}
						if(e_veteran_types == "1") {
							e_veteran_types = "??????";
						}
						
						var e_veteran_infos = list[i].e_veteran_info;
						if(e_veteran_infos == "0") {
							e_veteran_infos = "?????????";
						}
						if(e_veteran_infos == "1") {
							e_veteran_infos = "????????????";
						}
						if(e_veteran_infos == "2") {
							e_veteran_infos = "?????????";
						}
						if(e_veteran_infos == "3") {
							e_veteran_infos = "??????";
						}
						
						var e_veteran_levels = list[i].e_veteran_level;
						var e_disability_types = list[i].e_disability_type;
						var e_disability_levels = list[i].e_disability_level;
						
					$('#result').append('<tr onclick="updatePHY('+usernames+');">'+                         	
							'<td>'+ usernames +'</td>'+
							'<td>'+ e_names +'</td>'+
							'<td>'+ e_heights +'</td>'+
							'<td>'+ e_weights +'</td>'+
							'<td>'+ e_left_sights +'</td>'+
							'<td>'+ e_right_sights +'</td>'+
							'<td>'+ e_color_blinds +'</td>'+
							'<td>'+ e_blood_types +'</td>'+
							'<td>'+ e_blood_presures +'</td>'+
							'<td>'+ e_medical_infos +'</td>'+
							'<td>'+ e_veteran_types +'</td>'+
							'<td>'+ e_veteran_infos +'</td>'+
							'<td>'+ e_veteran_levels +'</td>'+
							'<td>'+ e_disability_types +'</td>'+
							'<td>'+ e_disability_levels +'</td>'+
                 		'</tr>');
					}
					
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
					
					
				},
				error : function(){
					alert("??????");
				}
			});
		}); 
	 });
	 
	 function updatePHY(code){
		 
		  $.ajax({
	  			url: '/erp/HR_update_Phy?${_csrf.parameterName}=${_csrf.token }&username='+code,
	  			type: 'POST',
	  			dataTpye: 'json',
	  			success: function(data){
	  				
	  				document.getElementById("selectTable").style.display="block";
	  				
	  				var username = data.username;	  					  				
	  				var e_height = data.e_height;
	  				var e_weight = data.e_weight;
	  				var e_left_sight = data.e_left_sight;
	  				var e_right_sight = data.e_right_sight;
	  				var e_color_blind = data.e_color_blind;
	  				var e_blood_type = data.e_blood_type;
	  				var e_blood_presure = data.e_blood_presure;
	  				var e_medical_info = data.e_medical_info;
	  				var e_veteran_type = data.e_veteran_type;	  				
	  				var e_veteran_info = data.e_veteran_info;
	  				var e_veteran_level = data.e_veteran_level;
	  				var e_disability_type = data.e_disability_type;
	  				var e_disability_level = data.e_disability_level;
	  				
	  				$('#result2').empty();	  					  				
	  				
	  				$("#result2").append('<input type="hidden" name="username" value="'+username+'">'
  						+'<div class="form-group row">'
							+'<label class="col-md-1 col-form-label" for="simpleinput">??????</label>'
								+'<div class="col-md-3">'
									+'<input type="text" class="form-control" name="e_height" value="'+e_height+'">'
								+'</div>'
							+'<label class="col-md-1 col-form-label" for="simpleinput">cm</label>'
							+'<label class="col-md-1 col-form-label" for="simpleinput">&nbsp;</label>'
							+'<label class="col-md-1 col-form-label" for="simpleinput">??????</label>'
							+'<div class="col-md-3">'
								+'<input type="text" class="form-control" name="e_weight" value="'+e_weight+'">'
							+'</div>'
							+'<label class="col-md-1 col-form-label" for="simpleinput">kg</label>'
						+'</div>'
						+'<div class="form-group row">'
							+'<label class="col-md-1 col-form-label" for="simpleinput">??????(???)</label>'
							+'<div class="col-md-1">'
								+'<input type="text" class="form-control" name="e_left_sight" value="'+e_left_sight+'">'
							+'</div>'
							+'<label class="col-md-1 col-form-label" for="simpleinput">&nbsp;</label>'
							+'<label class="col-md-1 col-form-label" for="simpleinput">??????(???)</label>'
							+'<div class="col-md-1">'
								+'<input type="text" class="form-control" name="e_right_sight" value="'+e_right_sight+'">'
							+'</div>'							
							+'<label class="col-md-1 col-form-label" for="simpleinput">&nbsp;</label>'
							+'<label class="col-md-1 col-form-label" for="simpleinput">??????</label>'
								+'<div class="col-md-3 col-form-label">'
	                                +'<div class="custom-control custom-radio custom-control-inline mb-2">'
	                                    +'<input type="radio" id="customRadioInline9" name="e_color_blind" class="custom-control-input" value="blind" checked>'
	                                    +'<label class="custom-control-label" for="customRadioInline9">???</label>'
	                                +'</div>'
	                                +'<div class="custom-control custom-radio custom-control-inline mb-2">'
	                                    +'<input type="radio" id="customRadioInline10" name="e_color_blind" class="custom-control-input" value="common">'
	                                    +'<label class="custom-control-label" for="customRadioInline10">???</label>'
	                                +'</div>'
	                            +'</div>'
						+'</div>'
						+'<div class="form-group row">'
							+'<label class="col-md-1 col-form-label" for="simpleinput">?????????</label>'
							+'<div class="col-md-3 col-form-label">'
                                +'<div class="custom-control custom-radio custom-control-inline mb-2">'
                                    +'<input type="radio" id="customRadioInline11" name="e_blood_type" class="custom-control-input" value="A" checked>'
                                    +'<label class="custom-control-label" for="customRadioInline11">A</label>'
                                +'</div>'
                                +'<div class="custom-control custom-radio custom-control-inline mb-2">'
                                    +'<input type="radio" id="customRadioInline12" name="e_blood_type" class="custom-control-input" value="B">'
                                    +'<label class="custom-control-label" for="customRadioInline12">B</label>'
                                +'</div>'
                                +'<div class="custom-control custom-radio custom-control-inline mb-2">'
                                    +'<input type="radio" id="customRadioInline13" name="e_blood_type" class="custom-control-input" value="AB" checked>'
                                    +'<label class="custom-control-label" for="customRadioInline13">AB</label>'
                                +'</div>'
                                +'<div class="custom-control custom-radio custom-control-inline mb-2">'
                                    +'<input type="radio" id="customRadioInline14" name="e_blood_type" class="custom-control-input" value="O">'
                                    +'<label class="custom-control-label" for="customRadioInline14">O</label>'
                                +'</div>'
                            +'</div>'
                            +'<label class="col-md-1 col-form-label" for="simpleinput">&nbsp;</label>'
                            +'<label class="col-md-1 col-form-label" for="simpleinput">&nbsp;</label>'
                            +'<label class="col-md-1 col-form-label" for="simpleinput">??????</label>'
								+'<div class="col-md-1">'
									+'<input type="text" class="form-control" name="e_blood_presure1" placeholder="??????">'
								+'</div>'
							+'<label class="col-md-1 col-form-label" for="simpleinput">mmHg ~</label>'
								+'<div class="col-md-1">'
									+'<input type="text" class="form-control" name="e_blood_presure2" placeholder="??????">'
								+'</div>'																		
							+'<label class="col-md-1 col-form-label" for="simpleinput">mmHg</label>'
					    +'</div>'
					    +'<div class="form-group row">'																	
							+'<label class="col-md-1 col-form-label" for="simpleinput">??????</label>'
							+'<div class="col-md-5">'
								+'<input type="text" class="form-control" name="e_medical_info" value="'+e_medical_info+'">'
							+'</div>'							
						+'</div>'
						+'<div class="form-group row">'																	
							+'<label class="col-md-1 col-form-label" for="simpleinput">?????? ??????/??????<span class="text-danger">*</span></label>' 
							+'<div class="col-md-3 col-form-label">'
								+'<div>'
	                                +'<div class="custom-control custom-radio custom-control-inline mb-2">'
	                                    +'<input type="radio" id="customRadioInline3" name="e_disability_type" class="custom-control-input" value="1" checked>'
	                                    +'<label class="custom-control-label" for="customRadioInline3">?????????</label>'
	                                +'</div>'
	                                +'<div class="custom-control custom-radio custom-control-inline mb-2">'
	                                    +'<input type="radio" id="customRadioInline4" name="e_disability_type" class="custom-control-input" value="2">'
	                                    +'<label class="custom-control-label" for="customRadioInline4">?????????</label>'
	                                +'</div>'
	                                +'<div class="custom-control custom-radio custom-control-inline mb-2">'
	                                    +'<input type="radio" id="customRadioInline5" name="e_disability_type" class="custom-control-input" value="3">'
	                                    +'<label class="custom-control-label" for="customRadioInline5">???????????????</label>'
	                                +'</div>'
	                                +'<div class="custom-control custom-radio custom-control-inline mb-2">'
	                                    +'<input type="radio" id="customRadioInline6" name="e_disability_type" class="custom-control-input" value="4">'
	                                    +'<label class="custom-control-label" for="customRadioInline6">??????</label>'
	                                +'</div>'
	                            +'</div>'
							+'</div>'
							+'<div class="col-md-1">'
								+'<input type="text" class="form-control" name="e_disability_level" placeholder="????????? ??????">'
							+'</div>'
							+'<label class="col-md-1 col-form-label" for="simpleinput">&nbsp;</label>'							
							+'<label class="col-md-1 col-form-label" for="simpleinput">????????????<span class="text-danger">*</span></label>'
							+'<div class="col-md-3 col-form-label">'
	                            +'<div class="custom-control custom-radio custom-control-inline mb-2">'
	                                +'<input type="radio" id="customRadioInline9" name="e_veteran_type" class="custom-control-input" value="0" checked>'
	                                +'<label class="custom-control-label" for="customRadioInline9">?????????</label>'
	                            +'</div>'
	                            +'<div class="custom-control custom-radio custom-control-inline mb-2">'
	                                +'<input type="radio" id="customRadioInline10" name="e_veteran_type" class="custom-control-input" value="1">'
	                                +'<label class="custom-control-label" for="customRadioInline10">??????</label>'
	                            +'</div>'
	                        +'</div>'	                          
						+'</div>'
						+'<div class="form-group row">'
							+'<label class="col-md-1 col-form-label" for="simpleinput">????????????<span class="text-danger">*</span></label>'
							+'<div class="col-md-4">'
								+'<select class="form-control select2" name="e_veteran_info" onchange="">'
									+'<option value="0">0. ?????????</option>'
									+'<option value="1">1. ????????????</option>'
									+'<option value="2">2. ?????????</option>'
									+'<option value="3">3. ??????</option>'																																							
								+'</select>'
							+'</div>'
							+'<label class="col-md-1 col-form-label" for="simpleinput">&nbsp;</label>'
							+'<label class="col-md-1 col-form-label" for="simpleinput">????????????<span class="text-danger">*</span></label>'
							+'<div class="col-md-4">'
								+'<select class="form-control select2" name="e_veteran_level" onchange="">'
									+'<option value="0">0. ?????????</option>'
									+'<option value="1">1. ???????????????</option>'
									+'<option value="2">2. ????????? ????????? ??? ????????? ????????? 2?????????</option>'
									+'<option value="3">3. 5.18 ???????????????</option>'
									+'<option value="4">4. ?????????????????????</option>'
									+'<option value="5">5. ???????????????????????????</option>'																							
								+'</select>'
							+'</div>'																
						+'</div>'						
						+'<div class="form-group text-right mb-0">'
							+'<input type="submit" formaction="HR_modifyPhysicalyPro?${_csrf.parameterName}=${_csrf.token }" value="??????">'
						+'</div>'
	  				);
	  			},
	  			 
	  			error : function(){
	  				alert("?????? ????????? ????????? ????????? ?????????????????????.");
	  			}
	  		}); 	 
	 }
	 
	 function HR_modifyPhysicalyPro(){
         var param = $("#updatePhy").serializeArray();
 		 
 		 $.ajax({
 			 url: '/erp/HR_modifyPhysicalyPro',
 			 type: 'POST',
 			 data : param,
 			 dataTpye: 'json',
 			 success: function(updateCnt){
 				 if(updateCnt != 0){
 					 $('#result2').empty();
 					 document.getElementById("update").style.display="none";
 					 alert("????????? ?????????????????????.");    					
 				 }
 			 },
 			 error : function(){
 				 alert("?????? ????????? ????????? AS??????????????? ???????????? ???????????????.");
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
										<li class="breadcrumb-item active">????????????????????????</li>
									</ol>
								</div>
								<h4 class="page-title">????????????????????????</h4>
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
											<th class="col-md-1 col-form-label">????????????</th>
											<td class="col-md-2 input-group"><input type="text"
												class="form-control" name="username" id="username">
											</td>

											<th class="col-md-1 col-form-label">&nbsp;</th>

											<th class="col-md-1 col-form-label">?????????</th>
											<td class="col-md-2 input-group"><input type="text"
												class="form-control" name="e_name" id="e_name"></td>

											<th class="col-md-1 col-form-label">&nbsp;</th>

											<th class="col-md-1 col-form-label">??????</th>
											<td class="col-md-2 input-group"><input type="text"
												class="form-control" name="department_code"
												id="department_code"></td>

										</tr>

										<tr class="form-group row">

											<th class="col-md-1 col-form-label">??????</th>
											<td class="col-md-2 input-group"><input type="text"
												class="form-control" name="position_code" id="position_code">
											</td>

											<th class="col-md-1 col-form-label">&nbsp;</th>

											<th class="col-md-1 col-form-label">??????</th>
											<td class="col-md-2 input-group"><input type="text"
												class="form-control" name="rank_code" id="rank_code">
											</td>

											<th class="col-md-1 col-form-label"></th>
									</table>
									<div align="right">
										<button type="button" class="btn btn-primary waves-effect waves-light"
													id="search">??????</button>
									</div>
								</div>
							</div>
						</div>
					</div>

					<div class="row" id="searchTable">
						<div class="col-sm-12">
							<div class="card">
								<div class="card-body">
									<div id="resulttable">
										<!-- ?????? ?????? ?????? ??????  -->
									</div>
								</div>
							</div>
							<div class="card" id="selectTable">
								<div class="card-body">
									<form id="updatePhy">
									<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
									<div id="result2">									
										<!-- ?????? ????????? ?????? ?????? -->
									</div>
									</form>
								</div>
							</div>
						</div>
					</div>

				</div>

				<%@ include file="../footer.jsp"%>

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