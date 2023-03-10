<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><!DOCTYPE html>
<html lang="en">
<head>
<style type="text/css">
#update {
	display: none;
}
</style>
<%@ include file="../setting.jsp"%>

<script src="//code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="/erp/resources/assets/js/request.js"></script>
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
	
	function sunyoungJoa(code){
		if(code < 10){
			code = "00"+code;
		}else if(code < 100){
			code = "0"+code;
		}

		$.ajax({
			url: '/erp/CT_select_code?${_csrf.parameterName }=${_csrf.token }&ceq_code='+code,
			type: 'POST',
			data : {'ceq_code' : code},
			dataTpye: 'json',
			success: function(voC){
				document.getElementById("update").style.display="block";
				$('#update1').empty();
				
				var acquire_date = voC.ceq_acquire_date; 
				var pa = new Date(acquire_date);
				var year = pa.getFullYear();
				
				var month = (1+pa.getMonth());
				if(month < 10){
					month = "0" +month;
				}
				var day = pa.getDate();
				if(day < 10){
					day = "0" +day;
				}
				var ceq_acquire_date = year + "-" + month + "-" +day;
				
				$('#update1').append('<tr><input type="hidden" name="ceq_code" value="'+voC.ceq_code+'"><td>' + voC.ceq_code + '</td><td>'
					+'<input type="text" name="ceq_name" value="'+voC.ceq_name+'" class="form-control" data-toggle="input-mask" style = "width: 100%; border:0px;" autofocus></td><td>'+
					'<select name="ceq_type" class="form-control" data-toggle="input-mask" style = "width: 100%; border:0px;">' +
						 '<option value="'+voC.ceq_type+'">??????</option>'+
						 '<option value="??????">??????</option>'+
						 '<option value="??????">??????</option>'+
					 '</select></td><td>' +
					 '<input type="date" name="ceq_acquire_date" value="'+ceq_acquire_date+'" class="form-control" data-toggle="input-mask" style = "width: 100%; border:0px;"></td><td>' +
					 '<select name = "department_code" class="form-control" data-toggle="input-mask" style = "width: 100%; border:0px;">' +
					 	'<option value="'+voC.department_code+'">??????</option>' +
					 	'<option value="??????">??????</option>' +
					 	'<option value="??????">??????</option>' +
					 	'<option value="??????">??????</option>' +
					 	'<option value="??????">??????</option>' +
					 	'<option value="??????">??????</option>' +
					 	'<option value="??????">??????</option>' +
					 '</select></td><td>' +
					 '<input type="text" name="ceq_location" value="'+voC.ceq_location+'" class="form-control" data-toggle="input-mask" style = "width: 100%; border:0px;"></td><td>' +
					 '<input type="text" name="ceq_prime_cost" value="'+voC.ceq_prime_cost+'" class="form-control" data-toggle="input-mask" style = "width: 100%; border:0px;" onkeyup="removeChar(event); inputNumberFormat(this);"></td><td>' +
					 '<input type="text" name="ceq_durable" value="'+voC.ceq_durable+'" class="form-control" data-toggle="input-mask" style = "width: 100%; border:0px;" onkeyup="removeChar(event); inputNumberFormat(this);"></td><td>' +
					 '<select name="ceq_depreciation" class="form-control" data-toggle="input-mask" style = "width: 100%; border:0px;">' +
					 	'<option value="'+voC.ceq_depreciation+'">??????</option>' +
					 	'<option value="2">Y</option>' +
					 	'<option value="1">N</option>' +
					 '<select></td><td>' +
					 '<select name="ceq_depreciation_type" class="form-control" data-toggle="input-mask" style = "width: 100%; border:0px;">' +
					 	'<option value="'+voC.ceq_depreciation_type+'">??????</option>' +
					 	'<option value="?????????">?????????</option>' +
					 	'<option value="?????????">?????????</option>' +
					 '</select></td></tr>'
				);
				
			},
			error : function(){
				alert("?????? ????????? ????????? ????????? ?????????????????????.");
			}
		});
	}
	
	  function SelectAS(value){
		var param = $("#selectAS").serializeArray();
		$.ajax({
			url: '/erp/CT_select_as',
			type: 'POST',
			data : param,
			dataTpye: 'json',
			success: function(vo){
				
				$('#result').empty();
				
				for(var i = 0; i < vo.length; i++){
					var cas_code = vo[i].cas_code;
  					var department_code = vo[i].department_code;
  					var username = vo[i].username;
  					var cas_title = vo[i].cas_title; 
  					var date = vo[i].cas_date;
  					
  					var pa = new Date(date);
  					var year = pa.getFullYear();
  					var month = (1+pa.getMonth());
  					if(month < 10){
						month = "0" +month;
					}
					var day = pa.getDate();
					if(day < 10){
						day = "0" +day;
					}
					
					var cas_date = year + "-" + month + "-" +day;
  					
					$('#result').append(
							'<tr class="spoat" onclick="detail('+cas_code+')"><td>'+
							cas_code+'</td><td>' +
  							department_code + '</td><td>' +
  							username + '</td><td>' +
  							cas_title + '</td><td>' +
  							cas_date + '</td><tr>'
  						);
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
				alert("?????? ????????? ????????? ??????????????? ?????????????????????.");
			}
		}); 
	} 
	  
	function updateCT(){
		  var param = $("#updateCTS").serializeArray();
	  		$.ajax({
	  			url: '/erp/CT_update_ct',
	  			type: 'POST',
	  			data : param,
	  			dataTpye: 'json',
	  			success: function(updateCnt){
	  				document.getElementById("update").style.display="none";
	  				alert("????????? ??????????????????.");
	  			},
	  			error : function(){
	  				alert("?????? ????????? ????????? ????????? ?????????????????????.");
	  			}
	  		});
	  }

	function deleteCT(){
		var param = $("#updateCTS").serializeArray();
  		$.ajax({
  			url: '/erp/CT_delete_ct',
  			type: 'POST',
  			data : param,
  			dataTpye: 'json',
  			success: function(deleteCnt){
  				document.getElementById("update").style.display="none";
  				alert("????????? ?????????????????????.");
  			},
  			error : function(){
  				alert("?????? ????????? ????????? ????????? ?????????????????????.");
  			}
  		});
	}
	  
</script>
</head>
<body>
	<!-- Begin page -->
	<div id="wrapper">
		<%@ include file="../sidebar.jsp"%>
		<div class="content-page">
			<!-- ============================================================== -->
			<!-- Start Page Content here -->
			<!-- ============================================================== -->

			<!-- Start Content-->
			<div class="container-fluid">

				<!-- start page title -->
				<div class="row">
					<div class="col-12">
						<div class="page-title-box">
							<h4 class="page-title">?????? ?????? ??????</h4>
						</div>
					</div>
				</div>
				<!-- end page title -->

				<div class="row">
					<div class="col-sm-12">
						<div class="card">
							<div class="card-body table-responsive">
								<div class="form-group row">
									<label class="col-md-1 col-form-label" for="simpleinput">????????????</label>
									<div class="col-md-4 input-group">
										<form id="selectAS" style="width: 400px; text-align: center;">
											<input type="hidden" name="${_csrf.parameterName }"
												value="${_csrf.token }"> <select
												class=" form-control" name="cas_state"
												onchange="SelectAS(this.value);">
												<option value="" selected disabled></option>
												<option value="1">?????????</option>
												<option value="2">??????</option>
											</select>
										</form>
									</div>
									<label class="col-md-1 col-form-label" for="simpleinput">&nbsp;</label>
									<label class="col-md-1 col-form-label" for="simpleinput">&nbsp;</label>
									<div id="ceq_button" class="col-md-4 input-group">
										<button type="button" onclick="updateAS();"
											class="btn btn-outline-dark waves-effect waves-light width-md">??????</button>
										&nbsp;
										<button type="button" onclick="deleteAS();"
											class="btn btn-outline-dark waves-effect waves-light width-md">??????</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="col-sm-12">
						<div class="card">
							<div class="card-body table-responsive">
								<hr>
								<table id="datatable"
									class="table table-striped table-bordered dt-responsive nowrap">
									<thead>
										<tr>
											<th>AS??????</th>
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
					</div>
				</div>

				<div id="update">
					<div class="col-sm-12">
						<div class="card">
							<div class="card-body table-responsive">
								<div class="table-responsive" style="margin: 15px 0px 50px">
									<div id="result2" class="card-body">
										<!-- ?????? ????????? ?????? ?????? -->
										<form id="updateCTS" method="post" class="form-horizontal">
											<input type="hidden" name="${_csrf.parameterName }"
												value="${_csrf.token }">
											<table
												class="table table-striped table-bordered dt-responsive nowrap">
												<col style="width: 12%">
												<col style="width: 13%;">
												<col style="width: 10%">
												<col style="width: 7%;">
												<col style="width: 8%;">
												<col style="width: 11%;">
												<col style="width: 9%;">
												<col style="width: 10%;">
												<col style="width: 10%;">
												<col style="width: 10%;">

												<thead>
													<tr>
														<th>??????????????????</th>
														<th>?????????</th>
														<th>????????????</th>
														<th>?????????</th>
														<th>????????????</th>
														<th>??????</th>
														<th>?????????</th>
														<th>??????????????????</th>
														<th>??????????????????</th>
														<th>???????????????</th>
													</tr>
												</thead>
												<tbody id="update1">
												</tbody>
											</table>
										</form>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- end container-fluid -->

			</div>
			<!-- end content -->

			<%@ include file="../footer.jsp"%>


			<!-- ============================================================== -->
			<!-- End Page content -->
			<!-- ============================================================== -->

		</div>
		<!-- END wrapper -->
	</div>
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


	<script type="text/javascript">
   
  //?????? ?????????
    function removeChar(event) {
   	    event = event || window.event;
   	    var keyID = (event.which) ? event.which : event.keyCode;
   	    if ( keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 ) 
   	        return;
   	    else
   	    	 event.target.value = event.target.value.replace(/[^-\.0-9]/g, "");
   }
  
    
  //?????? ??????
  function addComma(num) {
     	  var regexp = /\B(?=(\d{3})+(?!\d))/g;
     	  return num.toString().replace(regexp, ',');
     	}
  
  //?????? ??????
  function comma(obj) {
      var regx = new RegExp(/(-?\d+)(\d{3})/);
      var bExists = obj.indexOf(".", 0);//0???????????? .??? ?????????.
      var strArr = obj.split('.');
      while (regx.test(strArr[0])) {//???????????? ????????? ??????????????? ???????????? ????????? ??????
          //?????? ???????????? ?????? ?????? 
          strArr[0] = strArr[0].replace(regx, "$1,$2");//??????????????????
      }
      if (bExists > -1) {
          //. ????????? ???????????? ???????????? ?????? ?????? -1 ??????
          obj = strArr[0] + "." + strArr[1];
      } else { //????????? ???????????? //????????? ????????? ???????????? ?????? ?????? 
          obj = strArr[0];
      }
      return obj;//????????? ??????
  }

//input ?????? ?????? ??????
  function inputNumberFormat(obj) {
 	    obj.value = comma(obj.value);
 	}
    
    var items = [];
    </script>
</body>

</html>