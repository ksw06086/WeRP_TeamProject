<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><!DOCTYPE html>
<html lang="en">
<head>
<style type="text/css">
	#payAll{
		display : none;
	}
</style>

<%@ include file="../setting.jsp"%>
<!-- c3 plugin css -->
<link rel="stylesheet" type="text/css"
	href="/erp/resources/assets/libs/c3/c3.min.css">

<script src="//code.jquery.com/jquery-3.4.1.min.js"></script>
<!-- <script src="/erp/resources/assets/css/js/jquery-3.4.1.min.js"></script> -->	
<script type="text/javascript">

	
	function load(rank){
		$.ajax({
			type : "GET",
			url : "/erp/HR_GoodPay_paystep",
			data : { 'rank_code' : rank},
			contentType : 'application/json',
			dataType : "json",
			success : function(vo){
				
				document.getElementById("payAll").style.display="block";
				if($(".payRank") != null){
					$(".payRank").remove();
				}				
				
				for(var i = 0; i < vo.length; i++){
					var paystep_codeS = vo[i].paystep_code;
					var BASE_PAYMENTS = addComma(vo[i].base_PAYMENT);
					var ADD_PAYMENTS = addComma(vo[i].add_PAYMENT);
					var EXTENSION_PAYMENTS = addComma(vo[i].extension_PAYMENT);
					var total = addComma(vo[i].base_PAYMENT+vo[i].add_PAYMENT+vo[i].extension_PAYMENT);
					var rank = vo[i].rank_code;
					
					$('#pay2').append("<tr class='payRank'>"+"<input type='hidden' name = 'paystep_code"+i+"' value ='"+paystep_codeS+"'>"+"<input type='hidden' name='rank_code' value='"+rank+"'>"+
						"<td>"+paystep_codeS+"</td><td>"	
						+"<input type='text' numberOnly id='simpleinput' class='form-control' name='BASE_PAYMENT"+i+"' value='"+BASE_PAYMENTS+"' maxlength='10' style='width:200px; text-align:center;' onKeyUp='removeChar(event); inputNumberFormat(this);'>"+"</td><td>"
						+"<input type='text' numberOnly id='simpleinput' class='form-control' name='ADD_PAYMENT"+i+"' value='"+ADD_PAYMENTS+"' maxlength='10' style='width:200px; text-align:center;' onKeyUp='removeChar(event); inputNumberFormat(this);'>"+"</td><td>"
						+"<input type='text' numberOnly id='simpleinput' class='form-control' name='EXTENSION_PAYMENT"+i+"' value='"+EXTENSION_PAYMENTS+"' maxlength='10' style='width:200px; text-align:center;' onKeyUp='removeChar(event); inputNumberFormat(this);'>"+"</td><td>"
						+total+"</td></tr>");
				} 
				
			},
			error : function(e){
				alert('?????? ?????? ?????? ????????? ????????????. ?????? ??????????????????.');
			}
		});
	}
	
	
	function payUpdate(){
		 var param = $("#updatePay").serializeArray();
		$.ajax({
			url: '/erp/HR_GoodPay_payUpdate',
			type: 'POST',
			data : param,
			dataTpye: 'json',
			success: function(param){
				alert("?????? ????????? ?????????????????????.");
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

		<!-- ============================================================== -->
		<!-- Start Page Content here -->
		<!-- ============================================================== -->

<form id="updatePay" action="HR_GoodPay_payUpdate" method="post" class="form-horizontal">
		<input type = 'hidden' name = "${_csrf.parameterName }" value ="${_csrf.token }">
		<div class="content-page">
			<div class="content">

				<!-- Start Content-->
				<div class="container-fluid">
					<!-- start page title -->
					<div class="row">
						<div class="col-12">
							<div class="page-title-box">
								<h4 class="page-title">??????????????? ??????</h4>
							</div>
						</div>
					</div>
					<!-- end page title -->

			<div class="row">
				<div class="col-lg-6">
					<div class="card">
						<div class="card-body">
							<div class="table-responsive">
								<table class="table table-bordered mb-0">
									<thead class="bg-primary text-white">
										<tr>
											<th scope="col" colspan="2" style="font-weight: 900; font-size: 20px; text-align:center;">??? ??? ??? ???</th>																						
										</tr>
										
										<tr>
											<th scope="col">??? ???</th>
											<th scope="col">??? ???</th>
										</tr>
									</thead>
									
									<tbody>
										<c:forEach var="rank" items="${vo}">
											<tr id="rank2">
												<td class="UserRank" onclick="load(${rank.rank_code});">${rank.rank_code}</td>
												<td class="UserRank2" onclick="load(${rank.rank_code});">${rank.rank_name}</td>
											</tr>
										</c:forEach>
									</tbody>
																		
								</table>							
							</div>
							
							<div class="table-responsive">
								<table class="table table-bordered mb-0">
									<thead class="bg-primary text-white">
										<tr>
											<th scope="col" colspan="2" style="font-weight: 900; font-size: 20px; text-align:center;">????????????</th>																						
										</tr>
									</thead>
									<tbody>	
										<tr>
											<th scope="col">??????????????????</th>
											<th scope="col">??????????????????</th>
										</tr>
									</tbody>									
								</table>							
							</div>
						</div>
					</div>
				</div>

			
				<div class="col-lg-6">
				<div id="payAll">
					<div class="card">
						<div class="card-body">
							<div class="table-responsive">
								<table id="pay2" class="table table-bordered mb-0">
									<thead class="bg-primary text-white">
										<tr>
											<th rowspan="2" align="center">??? ???</th>
											<th colspan="3" align="center">??? ??? ??? ??? ???</th>
											<th rowspan="2" align="center">??? ???</th>																						
										</tr>
										
										<tr>
											<th scope="col" align="center" style="font-weight: 900; font-size: 20px; text-align:center;">??? ??? ???</th>
											<th scope="col" align="center" style="font-weight: 900; font-size: 20px; text-align:center;">??? ??? ??? ???</th>
											<th scope="col" align="center" style="font-weight: 900; font-size: 20px; text-align:center;">??? ??? ??? ???</th>
										</tr>
									</thead>
								</table>
								<div class="page-title-center">
									</div>								
							</div>
							<div class="page-title-center">
    								<button id="updatePA" onclick="payUpdate();" type="button" class="btn btn-outline-primary waves-effect waves-light">????????????</button>
							</div>
						</div>
					</div>
				</div>
				</div>
			</div>
			 <%@ include file="../footer.jsp" %>
			</div>
		</div>
		</div>
		</form>

		<!-- ============================================================== -->
		<!-- End Page content -->
		<!-- ============================================================== -->

	</div>
	<!-- END wrapper -->

	 <%@ include file="../rightbar.jsp" %>
     <%@ include file="../setting2.jsp" %>
     
     <script type="text/javascript">

     function addComma(num) {
   	  var regexp = /\B(?=(\d{3})+(?!\d))/g;
   	  return num.toString().replace(regexp, ',');
   	}
     

    //????????? ??????
    function onlyNumber(event){
 	    event = event || window.event;
 	    var keyID = (event.which) ? event.which : event.keyCode;
 	    if ( (keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105) || keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 )
 	    	   return;
 	    else
 	        return false;
 	   }
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