<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<%@ include file="../setting.jsp"%>
<script src="/erp/resources/assets/css/js/jquery-3.4.1.min.js"></script>
<script src="/erp/resources/assets/css/js/request.js"></script>
<script type="text/javascript">
			var d = new Date();
			$(function(){
				if((d.getMonth() + 1) < 10){
	        		$(".lastdate0").val(d.getFullYear()+'-0'+(d.getMonth() + 1)+'-'+d.getDate());
	        		$(".firstdate0").val(d.getFullYear()+'-0'+(d.getMonth() + 1)+'-'+d.getDate());
	        		$(".lastdate1").val(d.getFullYear()+'-0'+(d.getMonth() + 1)+'-'+d.getDate());
	        		$(".firstdate1").val(d.getFullYear()+'-0'+(d.getMonth() + 1)+'-'+d.getDate());
				} else {
	        		$(".lastdate0").val(d.getFullYear()+'-'+(d.getMonth() + 1)+'-'+d.getDate());
	        		$(".firstdate0").val(d.getFullYear()+'-'+(d.getMonth() + 1)+'-'+d.getDate());
	        		$(".lastdate1").val(d.getFullYear()+'-'+(d.getMonth() + 1)+'-'+d.getDate());
	        		$(".firstdate1").val(d.getFullYear()+'-'+(d.getMonth() + 1)+'-'+d.getDate());
				}
			});

	        function subjectlist(subjectcode) {
	           	var popupX = Math.ceil((window.screen.width - 363)/2);
	           	var popupY = Math.ceil((window.screen.height - 528)/2);
	       		var url = "FT_Subject_list?key=" + $("*[name=SubjectCode" + subjectcode + "]").val() + "&keyname=" + subjectcode;
	       		window.open(url, "subject_list", "menubar=no, width=600px, height = 600px, left="+ popupX + ", top="+ popupY);
	       		
	       	}
	       	
	       	function accountlist(accountcode) {
	           	var popupX = Math.ceil((window.screen.width - 363)/2);
	           	var popupY = Math.ceil((window.screen.height - 528)/2);
	       		var url = "FT_account_list?key=" + $("*[name=AccCode" + accountcode + "]").val() + "&keyname=" + accountcode;
	       		window.open(url, "account_list", "menubar=no, width=363px, height = 528px, left=" + popupX + ", top=" + popupY);
	       		
	       	}
	       	
	       	function ajaxload(cc) {
        		var obj = new Object();
        		var jsonData;
        		
        		if(window.event.which == 13){
        			if(parseInt($(".firstdate" + cc).val()) > parseInt($(".lastdate" + cc).val())){
            			alert("??? ????????? ???????????? ??????????????? ????????????");
            			$(".firstdate" + cc).focus();
            			return false;
            		} else if(!$("*[name=SubjectCode" + cc + "]").val()) {
            			alert("??????????????? ??????????????????");
            			$("*[name=SubjectCode" + cc + "]").focus();
            			return false;
            		}
	        		// ?????????????????? ?????? ??????
	        		obj.scode = $("*[name=SubjectCode" + cc + "]").val();
	        		obj.firstday = $(".firstdate" + cc).val();
	        		obj.lastday = $(".lastdate" + cc).val();
	        		
	        		// json ????????? String ????????? ?????? -- 
	        		// ???????????? ????????????????????? ????????? jsp??? ?????? ?????? ????????????????????? ????????? ??? json ???????????? ???????????? ????????????.
	        		// ???????????? 00??????????????? ?????? ????????? XML??? ?????? ????????? ??????
	        		jsonData = JSON.stringify(obj);
	        		$("#onepage").html("");
	        		/* sendRequest(load_insert, "FT_chitupdate", "post", jsonData); */
	        		$.ajax({
	                       type : "POST",
	                       url : "/erp/FT_ledgerList?${_csrf.parameterName }=${_csrf.token }",
	                       data : jsonData,
	                       contentType : 'application/json;charset=UTF-8',
	                       success : function(data) {
	                    	   if(data != null){
									for(i = 0; i < data.length; i++){
                                        var statename = "";
                                        if(data[i].deal_state == "1") {
                                        	statename = "??????"
                                        } else if(data[i].deal_state == "2") {
                                        	statename = "??????"
                                        } else if(data[i].deal_state == "3") {
                                        	statename = "??????"
                                        } else if(data[i].deal_state == "4") {
                                        	statename = "????????????"
                                        } else if(data[i].deal_state == "5") {
                                        	statename = "?????????"
                                        }
                                        var allsum = (parseInt(data[i].before_value) + parseInt(data[i].debtor_value) - parseInt(data[i].creditor_value));
										$("#onepage").append('<tr>' +
	                                        '<td scope="row" style = "padding: .85rem; vertical-align: top; border-top: 1px solid #dee2e6;">' + data[i].customer_code + '</td>' +
	                                        '<td style = "padding: .85rem; vertical-align: top; border-top: 1px solid #dee2e6;">' + data[i].customer_name + '</td>' +
	                                        '<td style = "padding: .85rem; vertical-align: top; border-top: 1px solid #dee2e6;">' + data[i].license_number + '</td>' +
	                                        '<td style = "padding: .85rem; vertical-align: top; border-top: 1px solid #dee2e6;">' + data[i].before_value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + '</td>' +
	                                        '<td style = "padding: .85rem; vertical-align: top; border-top: 1px solid #dee2e6;">' + data[i].debtor_value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + '</td>' +
	                                        '<td style = "padding: .85rem; vertical-align: top; border-top: 1px solid #dee2e6;">' + data[i].creditor_value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + '</td>' +
	                                        '<td style = "padding: .85rem; vertical-align: top; border-top: 1px solid #dee2e6;">' + allsum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + '</td>' +
	                                        '<td style = "padding: .85rem; vertical-align: top; border-top: 1px solid #dee2e6;">' + data[i].deal_state + '</td>' +
	                                        '<td style = "padding: .85rem; vertical-align: top; border-top: 1px solid #dee2e6;">' + statename + '</td>' +
	                                        '<td style = "padding: .85rem; vertical-align: top; border-top: 1px solid #dee2e6;">' + data[i].bs_master + '</td>' +
		                                '</tr>');
									}
									if(data.length == 0) {
			                    		   alert("???????????? ????????????.");
			                    	   }
		                    	   } else {
		                    		   alert("???????????? ????????????.");
		                    	   }
	                       },
	                       error : function(e) {
	                       		alert('?????? ?????? ?????? ????????? ????????????. ?????? ????????? ????????????.');
	                       }
	        		});
        		}
        	}
	       	
	       	function twoajaxload(cc) {
        		var obj = new Object();
        		var jsonData;
        		var balance = 0;
        		if(window.event.which == 13){
        			if(parseInt($(".firstdate" + cc).val()) > parseInt($(".lastdate" + cc).val())){
            			alert("??? ????????? ???????????? ??????????????? ????????????!");
            			$(".firstdate" + cc).focus();
            			return false;
            		} else if(!$("*[name=SubjectCode" + cc + "]").val()) {
            			alert("??????????????? ??????????????????!");
            			$("*[name=SubjectCode" + cc + "]").focus();
            			return false;
            		} else if(!$("*[name=AccCode" + cc + "]").val()) {
            			alert("???????????? ??????????????????!");
            			$("*[name=AccCode" + cc + "]").focus();
            			return false;
            		}
	        		// ?????????????????? ?????? ??????
	        		obj.scode = $("*[name=SubjectCode" + cc + "]").val();
	        		obj.acode = $("*[name=AccCode" + cc + "]").val();
	        		obj.firstday = $(".firstdate" + cc).val();
	        		obj.lastday = $(".lastdate" + cc).val();
	        		
	        		// json ????????? String ????????? ?????? -- 
	        		// ???????????? ????????????????????? ????????? jsp??? ?????? ?????? ????????????????????? ????????? ??? json ???????????? ???????????? ????????????.
	        		// ???????????? 00??????????????? ?????? ????????? XML??? ?????? ????????? ??????
	        		jsonData = JSON.stringify(obj);
	        		$("#twopage").html("");
	        		/* sendRequest(load_insert, "FT_chitupdate", "post", jsonData); */
	        		$.ajax({
	                       type : "POST",
	                       url : "/erp/FT_ledgerAccList?${_csrf.parameterName }=${_csrf.token }",
	                       data : jsonData,
	                       contentType : 'application/json;charset=UTF-8',
	                       success : function(data) {
	                    	   if(data != null){
									for(i = 0; i < data.length; i++){
										var dev;
										if(data[i].lg_name == "??????" || data[i].lg_name == "??????"){
											dev = parseInt(data[i].debtor_value) - parseInt(data[i].creditor_value);
										} else if(data[i].lg_name == "??????" || data[i].lg_name == "??????" || data[i].lg_name == "??????"){
											dev = parseInt(data[i].creditor_value) - parseInt(data[i].debtor_value);
										}
										balance += dev;
										$("#twopage").append('<tr>' +
	                                        '<td scope="row" style = "padding: .85rem; vertical-align: top; border-top: 1px solid #dee2e6;">' + data[i].journal_date + '</td>' +
	                                        '<td style = "padding: .85rem; vertical-align: top; border-top: 1px solid #dee2e6;">' + data[i].journal_abstract + '</td>' +
	                                        '<td style = "padding: .85rem; vertical-align: top; border-top: 1px solid #dee2e6;">' + data[i].debtor_value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + '</td>' +
	                                        '<td style = "padding: .85rem; vertical-align: top; border-top: 1px solid #dee2e6;">' + data[i].creditor_value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + '</td>' +
	                                        '<td style = "padding: .85rem; vertical-align: top; border-top: 1px solid #dee2e6;">' + balance.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + '</td>' +
		                                '</tr>');
									}
									 if(data.length == 0) {
			                    		   alert("???????????? ????????????.");
			                    	   }
		                    	   } else {
		                    		   alert("???????????? ????????????.");
		                    	   }
	                       },
	                       error : function(e) {
	                       		alert('?????? ?????? ?????? ????????? ????????????. ?????? ????????? ????????????.');
	                       }
	        		});
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
								 
								<h4 class="page-title" style="font-size: 25px;">???????????????</h4>
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
											id="home-tab" data-toggle="tab" href="#home" role="tab"
											aria-controls="home" aria-selected="true"> <span
												class="d-block d-sm-none"><i class="fa fa-home"></i></span>
												<span class="d-none d-sm-block">??????</span>
										</a></li>
										<li class="nav-item"><a class="nav-link" id="profile-tab"
											data-toggle="tab" href="#profile" role="tab"
											aria-controls="profile" aria-selected="false"> <span
												class="d-block d-sm-none"><i class="fa fa-user"></i></span>
												<span class="d-none d-sm-block">??????</span>
										</a></li>
									</ul>
									<div class="tab-content">
										<!-- ?????? -->
										<div class="tab-pane show active" id="home" role="tabpanel"
											aria-labelledby="home-tab">
											<div class="col-sm-12">
												<div class="card">
													<div class="card-body table-responsive">
														<table id="datatable"
															style="border-collapse: collapse; border-spacing: 0; width: 100%;">
															<tr>
																<td>????????????</td>
																<td><input type="text" class="" name="SubjectCode0"
																	style="width: 100px;">&nbsp;<a href="#"
																	onclick="subjectlist(0);"><i
																		class="dripicons-zoom-in"></i></a> <input type="text"
																	class="" name="SubjectName0" readonly
																	style="width: 100px;"></td>

																<td>????????????</td>
																<td><input type="date" class="firstdate0"
																	max="9999-12-31"> ~ <input
																	type="date" class="lastdate0"
																	onkeydown="ajaxload(0);" max="9999-12-31"></td>
															</tr>
														</table>

														<div class="table-responsive">
															<table class="table mb-0 chit-table-colored-bordered chit-table-bordered-primary table-bordered"
															style="border-collapse: collapse; border-spacing: 0;">
																<thead>
																	<tr>
																		<th>??????</th>
																		<th>????????????</th>
																		<th>???????????????</th>
																		<th>??????(???)??????</th>
																		<th>??????</th>
																		<th>??????</th>
																		<th>??????</th>
																		<th>?????????????????????</th>
																		<th>??????????????????</th>
																		<th>???????????????</th>
																	</tr>

																</thead>
																<tbody id="onepage">

																</tbody>
															</table>
														</div>
													</div>
												</div>
											</div>
										</div>

										<!-- ?????? -->
										<div class="tab-pane" id="profile" role="tabpanel"
											aria-labelledby="profile-tab">
											<div class="col-sm-12">
												<div class="card">
													<div class="card-body table-responsive">
														<table id="datatable"
															style="border-collapse: collapse; border-spacing: 0; width: 100%;">
															<tr>
																<td>????????????</td>
																<td><input type="text" class="" name="SubjectCode1"
																	style="width: 100px;">&nbsp;<a href="#"
																	onclick="subjectlist(1);"><i
																		class="dripicons-zoom-in"></i></a> <input type="text"
																	class="" name="SubjectName1" readonly
																	style="width: 100px;"></td>

																<td>????????????</td>
																<td><input type="date" class="firstdate1"
																	> ~ <input type="date"
																	class="lastdate1"></td>

																<td>?????????</td>
																<td><input type="text" class="" name="AccCode1"
																	style="width: 100px;" onkeydown="twoajaxload(1);">&nbsp;<a
																	href="#" onclick="accountlist(1);"><i
																		class="dripicons-zoom-in"></i></a> <input type="text"
																	class="" name="AccName1" readonly style="width: 100px;"></td>
															</tr>
														</table>

														<div class="table-responsive">
															<table class="table mb-0 chit-table-colored-bordered chit-table-bordered-primary table-bordered"
															style="border-collapse: collapse; border-spacing: 0;">
																<thead>
																	<!-- <tr>
					                                                    <th scope="col">#</th>
					                                                    <th scope="col">First</th>
					                                                    <th scope="col">Last</th>
					                                                    <th scope="col">Handle</th>
					                                                    </tr> -->

																	<tr>
																		<th>??????</th>
																		<th>?????????</th>
																		<th>??????</th>
																		<th>??????</th>
																		<th>??????</th>
																	</tr>

																</thead>
																<tbody id="twopage">

																</tbody>
															</table>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<!--  -->
							</div>
						</div>
					</div>
				</div>
				<!-- end container-fluid -->

			</div>
			<!-- end content -->


			<%@ include file="../footer.jsp"%>
		</div>
	</div>
	<!-- END wrapper -->

	<%@ include file="../rightbar.jsp"%>
	<%@ include file="../setting2.jsp"%>

</body>
</html>