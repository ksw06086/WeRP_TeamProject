<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><!DOCTYPE html>
<html lang="en">
<head>
<%@ include file="../setting.jsp"%>
<script type="text/javascript">
	function gamga() {
		var obj = new Object();
		var jsonData;
		
   		// 자바스크립트 객체 생성
		if(!$("#dated").val()){
   			alert("입력해주세요!!");
   			$("#dated").focus();
   			return false;
   		}
   		obj.dated = $("#dated").val();
   		
   		// json 객체를 String 객체로 변환 -- 
   		// 제이슨은 안드로이드에서 이제는 jsp로 하지 않고 안드로이드에서 뿌려줄 때 json 형식으로 불러와서 활용한다.
   		// 빅데이터 00데이터들은 실제 값들을 XML로 많이 사용할 것임
   		jsonData = JSON.stringify(obj);
   		/* sendRequest(load_insert, "FT_chitupdate", "post", jsonData); */
   		$.ajax({
                  type : "POST",
                  url : "/erp/FT_DepreciationList?${_csrf.parameterName }=${_csrf.token }",
                  data : jsonData,
                  contentType : 'application/json;charset=UTF-8',
                  success : function(data) {
               	   if(data != null){
						for(i = 0; i < data.length; i++){
							if(data[i].name == "건물"){
								$("input[name=buildingprice]").val(data[i].nowprice);
							} else if(data[i].name == "토지"){
								$("input[name=landprice]").val(data[i].nowprice);
							} else if(data[i].name == "설비"){
								$("input[name=eqprice]").val(data[i].nowprice);
							} else if(data[i].name == "전산설비"){
								$("input[name=ceqprice]").val(data[i].nowprice);
							}
						}
                   	   } else {
                   		   alert("데이터가 없습니다. 있는 기간을 선택해주세요!");
                   	   }
                  },
                  error : function(e) {
                  		alert('서버 연결 도중 에러가 났습니다. 다시 시도해 주십시오.');
                  }
   		});
	}
	
	function ajaxload(){
    	var obj = new Object();
		var jsonData;

		if(window.event.which == 13){
	   		// 자바스크립트 객체 생성
			if(!$("#dated").val()){
	   			alert("입력해주세요!!");
	   			$("#dated").focus();
	   			return false;
	   		}
	   		
	   		$.ajax({
	                  type : "GET",
	                  url : "/erp/FT_insertTotalList?${_csrf.parameterName }=${_csrf.token }&year=" + $("#dated").val(),
	                  success : function(data) {
	             	   if(data != null){
	             		    var salesum = parseInt(data.productsale) + parseInt(data.jepumsale);
	             		    var saleproduct = parseInt(data.productsale);
	             		    var salejepum = parseInt(data.jepumsale);
		             		var salecost = parseInt(data.baseproduct) + parseInt(data.nowproduct) + parseInt(data.basesource) + parseInt(data.nowsource) + parseInt(data.basejegong) + parseInt(data.basejepum);
		             		var productsalecost = parseInt(data.baseproduct) + parseInt(data.nowproduct);
		             		var baseproduct = parseInt(data.baseproduct);
		             		var nowproduct = parseInt(data.nowproduct);
		             		var salejepumcost = parseInt(data.basesource) + parseInt(data.nowsource) + parseInt(data.basejegong) + parseInt(data.basejepum);
		             		var source = parseInt(data.basesource) + parseInt(data.nowsource);
		             		var basesource = parseInt(data.basesource);
		             		var nowsource = parseInt(data.nowsource);
		             		var alljegongcost = parseInt(data.basejegong);
		             		var basejegong = parseInt(data.basejegong);
		             		var alljepumcost = parseInt(data.basejepum);
		             		var basejepum = parseInt(data.basejepum);
		             		var saleallprofit = (parseInt(data.productsale) + parseInt(data.jepumsale)) - (parseInt(data.baseproduct) + parseInt(data.nowproduct) + parseInt(data.basesource) + parseInt(data.nowsource) + parseInt(data.basejegong) + parseInt(data.basejepum));
		             		
		             		var saleandadmin = parseInt(data.basecost);
		             		var cost = parseInt(data.basecost);
		             		var saleprofit = parseInt(data.saleprofit);
		             		var unsaleprofit = parseInt(data.unsaleprofit);
		             		var unsalecost = parseInt(data.unsalecost);
		             		var sonprofit = (parseInt(data.productsale) + parseInt(data.jepumsale)) - (parseInt(data.baseproduct) + parseInt(data.nowproduct) + parseInt(data.basesource) + parseInt(data.nowsource) + parseInt(data.basejegong) + parseInt(data.basejepum)) - parseInt(data.basecost) + parseInt(data.saleprofit) + parseInt(data.unsaleprofit) - parseInt(data.unsalecost);
		             		var nowsonprofit = (parseInt(data.productsale) + parseInt(data.jepumsale)) - (parseInt(data.baseproduct) + parseInt(data.nowproduct) + parseInt(data.basesource) + parseInt(data.nowsource) + parseInt(data.basejegong) + parseInt(data.basejepum)) - parseInt(data.basecost) + parseInt(data.saleprofit) + parseInt(data.unsaleprofit) - parseInt(data.unsalecost);
							$("#salesum").html(salesum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
							$("#saleproduct").html(saleproduct.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
							$("#salejepum").html(salejepum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
							
							$("#salecost").html(salecost.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
							
							$("#productsalecost").html(productsalecost.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
							$("#baseproduct").html(baseproduct.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
							$("#nowproduct").html(nowproduct.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
							
							$("#salejepumcost").html(salejepumcost.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
							$("#source").html(source.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
							$("#basesource").html(basesource.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
							$("#nowsource").html(nowsource.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
							$("#gamgaprice").html("");
							
							$("#alljegongcost").html(alljegongcost.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
							$("#basejegong").html(basejegong.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
							
							$("#alljepumcost").html(alljepumcost.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
							$("#basejepum").html(basejepum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
							
							$("#saleallprofit").html(saleallprofit.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
							$("#saleandadmin").html(saleandadmin.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
							$("#cost").html(cost.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
							
							$("#salegamgaprice").html("");
							$("#desonprice").html("");
							
							$("#saleprofit").html(saleprofit.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
							$("#unsaleprofit").html(unsaleprofit.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
							$("#unsalecost").html(unsalecost.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
							$("#sonprofit").html(sonprofit.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
							$("#bubinses").html("");
							$("#nowsonprofit").html(nowsonprofit.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
	             			
	             	   }
	                  },
	                  error : function(e) {
	                  		alert('서버 연결 도중 에러가 났습니다. 다시 시도해 주십시오.');
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
								<div class="page-title-right">
									<!-- <ol class="breadcrumb m-0">
                                            <li class="breadcrumb-item"><a href="javascript: void(0);">Codefox</a></li>
                                            <li class="breadcrumb-item"><a href="javascript: void(0);">Tables</a></li>
                                            <li class="breadcrumb-item active">Datatables</li>
                                        </ol> -->
								</div>
								<h4 class="page-title" style="font-size: 25px;">결산자료입력</h4>
							</div>
						</div>
					</div>
					<!-- end page title -->

					<div class="row">
						<div class="col-sm-12">
							<div class="card">
								<div class="card-body">
									<div align="right">
										<button type="button"
											class="btn btn-outline-dark waves-effect waves-light" onclick = "javascript: TotalComplete.submit();">분개</button>
										<button type="button"
											class="btn btn-outline-dark waves-effect waves-light" onclick = "gamga();">감가상각</button>
										<hr>
									</div>
									<form action = "FT_journalComplete" name = "TotalComplete" method="post">
									<table id="datatable"
										style="border-collapse: collapse; border-spacing: 0; width: 100%;">
										<tr class="form-group row">
											<th class="col-md-1 col-form-label">조회기간</th>
											<td><input
												class="form-control" type="text" id = "dated" name = "years" onkeyup = "ajaxload();"></td>
										</tr>
									</table>
									
									<input type = "hidden" name = "${_csrf.parameterName }" value = "${_csrf.token }">
									<div class="col-sm-12">
										<div class="card">
											<div class="card-body table-responsive chit-table-colored-bordered chit-table-bordered-primary">
												<div class="table-responsive">
													<table class="table mb-0 totalscss">
														<col style = "width:20%;">
														<col style = "width:20%;">
														<col style = "width:20%;">
														<col style = "width:20%;">
														<col style = "width:20%;">
														<thead>
															<tr>
																<th colspan="2">과목</th>
																<th colspan="2">금액</th>
																<th>분개대상금액</th>
															</tr>

														</thead>
														<tbody>
															<tr>
																<td colspan="2"><b style = "font-size: 25px;">&emsp;1.매출액</b></td>
																<td></td>
																<td id = "salesum"></td>
																<td></td>
															</tr>
															<tr>
																<td colspan="2"><p style = "font-size: 15px;">&emsp;&emsp;상품매출</p></td>
																<td id = "saleproduct"></td>
																<td></td>
																<td></td>
															</tr>
															<tr>
																<td colspan="2"><p style = "font-size: 15px;">&emsp;&emsp;제품매출</p></td>
																<td id = "salejepum"></td>
																<td></td>
																<td></td>
															</tr>
															<tr>
																<td colspan="2"><b style = "font-size: 25px;">&emsp;2.매출원가</b></td>
																<td></td>
																<td id = "salecost"></td>
																<td></td>
															</tr>
															<tr>
																<td colspan="2"><p style = "font-size: 15px;">&emsp;&emsp;상품매출원가</p></td>
																<td></td>
																<td id = "productsalecost"></td>
																<td></td>
															</tr>
															<tr>
																<td colspan="2">&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;(1)기초상품재고액</td>
																<td id = "baseproduct"></td>
																<td></td>
																<td></td>
															</tr>
															<tr>
																<td colspan="2">&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;(2)당기상품재고액</td>
																<td id = "nowproduct"></td>
																<td></td>
																<td></td>
															</tr>
															<tr>
																<td colspan="2">&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;(3)기말상품재고액</td>
																<td></td>
																<td></td>
																<td><input type = "text" name = "endproduct" style = "width:100%;"></td>
															</tr>
															<tr>
																<td colspan="2"><p style = "font-size: 15px;">&emsp;&emsp;제품매출원가</p></td>
																<td></td>
																<td id = "salejepumcost"></td>
																<td></td>
															</tr>
															<tr>
																<td colspan="2"><p style = "font-size: 13px;">&emsp;&emsp;&emsp;&emsp;1)재료비</p></td>
																<td></td>
																<td id = "source"></td>
																<td></td>
															</tr>
															<tr>
																<td colspan="2">&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;(1)기초 원재료 재고액</td>
																<td id = "basesource"></td>
																<td></td>
																<td></td>
															</tr>
															<tr>
																<td colspan="2">&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;(2)당기 원재료 매입액</td>
																<td id = "nowsource"></td>
																<td></td>
																<td></td>
															</tr>
															<tr>
																<td colspan="2">&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;(3)기말 원재료 재고액</td>
																<td></td>
																<td></td>
																<td><input type = "text" name = "endsource" style = "width:100%;"></td>
															</tr>
															<tr>
																<td colspan="2"><p style = "font-size: 13px;">&emsp;&emsp;&emsp;&emsp;2)경비</p></td>
																<td id = "gamgaprice"></td>
																<td></td>
																<td></td>
															</tr>
															<tr>
																<td colspan="2">&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;(1)감가상각비</td>
																<td></td>
																<td></td>
																<td></td>
															</tr>
															<tr>
																<td colspan="2">&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;설비</td>
																<td></td>
																<td></td>
																<td><input type = "text" name = "eqprice" style = "width:100%;"></td>
															</tr>
															<tr>
																<td colspan="2">&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;전산설비</td>
																<td></td>
																<td></td>
																<td><input type = "text" name = "ceqprice" style = "width:100%;"></td>
															</tr>
															<tr>
																<td colspan="2"><p style = "font-size: 13px;">&emsp;&emsp;&emsp;&emsp;3)당기 총 제조비용</p></td>
																<td></td>
																<td id = "alljegongcost"></td>
																<td></td>
															</tr>
															<tr>
																<td colspan="2">&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;(1)기초 재공품 재고액</td>
																<td id = "basejegong"></td>
																<td></td>
																<td></td>
															</tr>
															<tr>
																<td colspan="2">&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;(2)기말재공품재고액</td>
																<td></td>
																<td></td>
																<td><input type = "text" name = "endjegong" style = "width:100%;"></td>
															</tr>
															<tr>
																<td colspan="2"><p style = "font-size: 13px;">&emsp;&emsp;&emsp;&emsp;4)당기 완성품 제조원가</p></td>
																<td></td>
																<td id = "alljepumcost"></td>
																<td></td>
															</tr>
															<tr>
																<td colspan="2">&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;(1)기초 제품 재고액</td>
																<td id = "basejepum"></td>
																<td></td>
																<td></td>
															</tr>
															<tr>
																<td colspan="2">&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;(2)기말 제품 재고액</td>
																<td></td>
																<td></td>
																<td><input type = "text" name = "endjepum" style = "width:100%;"></td>
															</tr>
															<tr>
																<td colspan="2"><b style = "font-size: 25px;">&emsp;3. 매출총이익</b></td>
																<td></td>
																<td id = "saleallprofit"></td>
																<td></td>
															</tr>
															<tr>
																<td colspan="2"><b style = "font-size: 25px;">&emsp;4.판매비와 관리비</b></td>
																<td></td>
																<td id = "saleandadmin"></td>
																<td></td>
															</tr>
															<tr>
																<td colspan="2"><p style = "font-size: 13px;">&emsp;&emsp;&emsp;&emsp;1)급여외</p></td>
																<td id = "cost"></td>
																<td></td>
																<td></td>
															</tr>
															<tr>
																<td colspan="2"><p style = "font-size: 13px;">&emsp;&emsp;&emsp;&emsp;2)감가상각비</p></td>
																<td id = "salegamgaprice"></td>
																<td></td>
																<td></td>
															</tr>
															<tr>
																<td colspan="2">&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;건물</td>
																<td></td>
																<td></td>
																<td><input type = "text" name = "buildingprice" style = "width:100%;"></td>
															</tr>
															<tr>
																<td colspan="2">&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;토지</td>
																<td></td>
																<td></td>
																<td><input type = "text" name = "landprice" style = "width:100%;"></td>
															</tr>
															<tr>
																<td colspan="2"><p style = "font-size: 13px;">&emsp;&emsp;&emsp;&emsp;3)대손상각</p></td>
																<td id = "desonprice"></td>
																<td></td>
																<td></td>
															</tr>
															<tr>
																<td colspan="2">&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;받을어음</td>
																<td></td>
																<td></td>
																<td><input type = "text" name = "noteprice" style = "width:100%;"></td>
															</tr>
															<tr>
																<td colspan="2">&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;단기대여금</td>
																<td></td>
																<td></td>
																<td><input type = "text" name = "loanprice" style = "width:100%;"></td>
															</tr>
															<tr>
																<td colspan="2">&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;미수금</td>
																<td></td>
																<td></td>
																<td><input type = "text" name = "notcatchprice" style = "width:100%;"></td>
															</tr>
															<tr>
																<td colspan="2">&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;외상매출금</td>
																<td></td>
																<td></td>
																<td><input type = "text" name = "creditprice" style = "width:100%;"></td>
															</tr> 
															<tr>
																<td colspan="2"><b style = "font-size: 25px;">&emsp;5.영업이익</b></td>
																<td></td>
																<td id = "saleprofit"></td>
																<td></td>
															</tr>
															<tr>
																<td colspan="2"><b style = "font-size: 25px;">&emsp;6.영업외수익</b></td>
																<td></td>
																<td id = "unsaleprofit"></td>
																<td></td>
															</tr>
															<tr>
																<td colspan="2"><b style = "font-size: 25px;">&emsp;7.영업외비용</b></td>
																<td></td>
																<td id = "unsalecost"></td>
																<td></td>
															</tr>
															<tr>
																<td colspan="2"><b style = "font-size: 25px;">&emsp;8.법인세 차감 전 순이익</b></td>
																<td></td>
																<td id = "sonprofit"></td>
																<td></td>
															</tr>
															<tr>
																<td colspan="2"><b style = "font-size: 25px;">&emsp;9.법인세 등</b></td>
																<td></td>
																<td id = "bubinses"></td>
																<td></td>
															</tr>
															<tr>
																<td colspan="2"><p style = "font-size: 13px;">&emsp;&emsp;&emsp;&emsp;(1)법인세 등</p></td>
																<td></td>
																<td></td>
																<td><input type = "text" name = "bubin" style = "width:100%;"></td>
															</tr>
															<tr>
																<td colspan="2"><b style = "font-size: 25px;">&emsp;당기순이익</b></td>
																<td></td>
																<td id = "nowsonprofit"></td>
																<td></td>
															</tr>
														</tbody>
													</table>
												</div>
											</div>
										</div>
									</div>
									</form>
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


</body>
</html>