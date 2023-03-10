<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><!DOCTYPE html>
<html lang="en">
<head>
<style type="text/css">
#firstR {
	display: none;
}

#seoncdR {
	display: none;
}
</style>

<%@ include file="../setting.jsp"%>

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
    
    
    function search(){
    	var param = new Object();
		var jsonData;
		
		param.rr_code = $("#rr_code").val();
		param.department_name = $("#department_name").val();
		param.rr_title = $("#rr_title").val();
		
		jsonData = JSON.stringify(param);
		$.ajax({
  			url: '/erp/CT_repairDelete_list?${_csrf.parameterName}=${_csrf.token }',
  			type: 'POST',
  			data : jsonData,
  			dataTpye: 'json',
  			contentType:"application/json;charset=UTF-8",
  			success: function(vo){
  				
  				$('#result').empty();
  				document.getElementById("firstR").style.display="block";
  				var as_state = "";
  				for(var i = 0; i < vo.length; i++){
  					var rr_code = vo[i].rr_code;
  					var rr_title = vo[i].rr_title;
  					var rr_content = vo[i].rr_content;
  					var ceq_code = vo[i].ceq_code;
  					var rr_repair_type = vo[i].rr_repair_type;
  					var	rr_cost = vo[i].rr_cost;

  					
  					var rr_state = vo[i].rr_state;
  					if(rr_state == 1){
  						as_state = "?????????";
  					}else if(rr_state == 2){
  						as_state = "??????";
  					}else if(rr_state == 3){
  						as_state = "??????";
  					}
  					
  					var reg_date = vo[i].rr_reg_date;

  					var pa = new Date(reg_date);
  					var year = pa.getFullYear();
  					
  					var month = (1+pa.getMonth());
  					if(month < 10){
  						month = "0" +month;
  					}
  					var day = pa.getDate();
  					if(day < 10){
  						day = "0" +day;
  					}
  					
  					var rr_reg_date = year + "-" + month + "-" + day;
  					var department_name = vo[i].department_name;
  					
  					$("#result").append('<tr><td>'
  							+ "<input type='checkbox' class='checklist' name='rr_code' value='"+rr_code+"'></td><td>"
  							+ rr_code + "</td><td>"
  							+ department_name + "</td><td>"
  							+ rr_reg_date + "</td><td>"
  							+ rr_title + "</td><td>"
  							+ as_state + "</td><td>"
  							+ rr_repair_type + "</td><td>"
  							+ rr_cost + "</td></tr>"
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
  				alert("???????????? ??????????????? ???????????? ????????????.");
  			}
  		});
		
    }
    
    function allcheck(){
    	if($("#allChecked").prop("checked")){
    		$(".checklist").prop("checked", true);
    	}
    	else{
    		$(".checklist").prop("checked", false);
    	}
    }
    
    function delRpX(){
    	var param = $("#DelUpdate").serializeArray();
    	$.ajax({
			url: '/erp/CT_RP_Rewind',
			type: 'POST',
			data : param,
			dataTpye: 'json',
			success: function(updateCnt){
				if(updateCnt == 1){
					alert("??????????????? ?????????????????????.")
					window.location.href="http://smueoot.dlinkddns.com:8087/erp/CT_repair_trash";
				}
			},
			error : function(){
				alert("?????? ????????? ????????? ???????????? ????????? ?????????????????????.");
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

			<!-- ????????? ?????? ?????? ?????? -->


			<!-- Start Content-->
			<div class="container-fluid">


				<!-- start page title -->
				<div class="row">
					<div class="col-12">
						<div class="page-title-box">
							<div class="page-title-right">
								<ol class="breadcrumb m-0">
									<li class="breadcrumb-item"><a href="javascript: void(0);">WeRP</a></li>
									<li class="breadcrumb-item"><a href="javascript: void(0);">??????</a></li>
									<li class="breadcrumb-item"><a href="javascript: void(0);">???????????????</a></li>
									<li class="breadcrumb-item active">?????? ??????</li>
								</ol>
							</div>
							<h4 class="page-title">????????????</h4>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="col-sm-12">
						<div class="card">
							<div class="card-body table-responsive">
								<table class="col-12">
									<tr class="form-group row">
										<th class="col-md-1 col-form-label">????????????</th>
										<td class="col-md-2 input-group"><input type="text"
											class="form-control" name="rr_code" id="rr_code"
											placeholder="RP_"></td>
										<td class="col-md-1 col-form-label">&nbsp;</td>
										<th class="col-md-1 col-form-label">?????????</th>
										<td class="col-md-2 input-group"><input type="text"
											class="form-control" name="department_name"
											id="department_name" placeholder="?????????"></td>
										<td class="col-md-1 col-form-label">&nbsp;</td>
										<th class="col-md-1 col-form-label">????????????</th>
										<td class="col-md-2 input-group"><input type="text"
											class="form-control" name="rr_title" id="rr_title"
											placeholder="????????????"></td>

										<td><button type="button"
												class="btn btn-primary waves-effect waves-light"
												onclick="search();">??????</button></td>
									</tr>
								</table>
							</div>
						</div>
					</div>
				</div>


				<!-- start page title -->

				<!-- end page title -->

				<div id="firstR">
					<div class="row">
						<div class="col-sm-12">
							<div class="card">
								<div class="card-body table-responsive">
									<form id="DelUpdate">
										<input type="hidden" name="${_csrf.parameterName }"
											value="${_csrf.token }">
										<table id="datatable"
											class="table table-striped table-bordered dt-responsive nowrap"
											style="border-collapse: collapse; border-spacing: 0; width: 100%;">
											<thead class="bg-primary text-white">
												<tr>
													<th><input type="checkbox" id="allChecked"
														onclick="allcheck();"></th>
													<th>????????????</th>
													<th>????????????</th>
													<th>?????????</th>
													<th>??????</th>
													<th>????????????</th>
													<th>????????????</th>
													<th>??????</th>
												</tr>
											</thead>

											<tbody id="result">
											</tbody>
										</table>
									</form>
								</div>
								<div class="form-group text-right mr-1">
									<button class="btn btn-primary waves-effect waves-light mr-1"
										type="button" onclick="delRpX();">????????????</button>
								</div>
							</div>
						</div>
					</div>
				</div>

			</div>
			<!-- end container-fluid -->


		</div>
		<!-- end content -->



		<!-- ????????? ?????? ?????? ?????? ?????? -->

		<%@ include file="../footer.jsp"%>

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
    	</script>

</body>
</html>