<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <%@ include file="../setting.jsp" %>
    <script src="/erp/resources/assets/css/js/jquery-3.4.1.min.js"></script> 
	<script src="/erp/resources/assets/css/js/request.js"></script>
    <script type="text/javascript">
        	var count = 1/* ${listsize} */;
        	var subcount = 1;
        	var frontcursor;
        	var updatekey = 0;
        	var selectval;
        	var focusval = "";
        	function notfocus(dd){
    			var nowme = $("*[name=" + dd + "]").parent();
        		for(var i = 0; i < $("*[name=" + dd + "]").parent().nextAll().children().length; i++){
					nowme = nowme.next();
					if(!nowme.children().attr("readonly")){
						nowme.children().focus();
						return false;
					}
				}
    			nowme = $("*[name=" + dd + "]").parent();
    			for(var i = 0; i < $("*[name=" + dd + "]").parent().prevAll().children().length; i++){
					nowme = nowme.prev();
					if(!nowme.children().attr("readonly")){
						nowme.children().focus();
						return false;
					}
				}
        	}
        	function focuse(keyval) {
        		$(".chit-table-bordered-primary tbody *").focus(function() {
        			$(".chit-table-bordered-primary tbody *").css("background-color", "");
        			$(this).parent().parent().children().children().css("background-color", "#D6EAF8");
        			$(this).parent().parent().children().css("background-color", "#D6EAF8");
        			$(this).css("background-color", "");
        			$(this).parent().css("background-color", "");
        			if(!$("input[name=SecuritiesCode" + keyval + "]").val()) {
        				focusval = "";
        			} else {
        				focusval = keyval;	
        			}
        		});
        	}
        	
        	function enter(cc, dd) {
        		if(cc == "INPUT") {
        			var swit = 0;
        			var nowme = $("input[name=" + dd + "]").parent();
        			if(window.event.which == 13){
        				for(var i = 0; i < $("input[name=" + dd + "]").parent().nextAll().children().length; i++){
        					nowme = nowme.next();
        					if(!nowme.children().attr("readonly")){
        						nowme.children().focus();
        						return false;
        					}
        				}
            		} else if(window.event.which == 9) {
            			$("*[name=" + dd + "]").parent().prev().children().focus();	
						return false;
            		} else if(window.event.which == 37) {
            			for(var i = 0; i < $("input[name=" + dd + "]").parent().prevAll().children().length; i++){
        					nowme = nowme.prev();
        					if(!nowme.children().attr("readonly")){
        						nowme.children().focus();
        						return false;
        					}
        				}
            		} else if(window.event.which == 38) {
            			$("input[name=" + dd.substring(0, dd.length-1) + (parseInt(dd.substring(dd.length-1,dd.length)) - 1) + "]").focus();
            		} else if(window.event.which == 39) {
        				for(var i = 0; i < $("input[name=" + dd + "]").parent().nextAll().children().length; i++){
        					nowme = nowme.next();
        					if(!nowme.children().attr("readonly")){
        						nowme.children().focus();
        						return false;
        					}
        				}
            		} else if(window.event.which == 40) {
            			$("input[name=" + dd.substring(0, dd.length-1) + (parseInt(dd.substring(dd.length-1,dd.length)) + 1) + "]").focus();
            		}
        		} else if(cc == "SELECT"){
        			if(window.event.which == 9) {
            			$("select[name=" + dd + "]").parent().prev().children().focus();
            		}
        		}
        	}
        	
        	function enterupdate(vv) {
        		var obj = new Object();
        		var jsonData;
        		frontcursor = $(".chit-table-bordered-primary tbody #enter" + vv).attr("name");
        		if(window.event.which == 9) {
        			$(".chit-table-bordered-primary tbody #enter" + vv).parent().prev().children().focus();
        		}
        		var nowme = $("#enter" + vv).parent();
				
                if(window.event.which == 37) {
                	updatekey = 1;
                	selectval = $("#enter" + vv).val();
          			for(var i = 0; i < $("#enter" + vv).parent().prevAll().children().length; i++){
    					nowme = nowme.prev();
    					if(!nowme.children().attr("readonly")){
    						nowme.children().focus();
    						return false;
    					}
    				}
        		} else if(window.event.which == 38) {
                	updatekey = 1;
                	selectval = $("#enter" + vv).val();
                	$("#enter" + (vv-1)).focus();
					return false;
        		} else if(window.event.which == 39) {
        			updatekey = 1;
                	selectval = $("#enter" + vv).val();
    				for(var i = 0; i < $("#enter" + vv).parent().nextAll().children().length; i++){
    					nowme = nowme.next();
    					if(!nowme.children().attr("readonly")){
    						nowme.children().focus();
    						return false;
    					}
    				}
                	$("#first" + (vv+1)).focus();
					return false;
        		} else if(window.event.which == 40) {
                	updatekey = 1;
                	selectval = $("#enter" + vv).val();
                	if($("#enter" + (vv+1)).attr("onchange") != "enterinsert(" + (vv+1) + ");"){
                    	$("#enter" + (vv+1)).focus();
                	}
					return false;
        		} else if(window.event.which == 13) {
	        		// ?????????????????? ?????? ??????
	         		obj.SecuritiesCode = $("input[name=SecuritiesCode" + vv + "]").val();
	         		obj.SecuritiesName = $("input[name=SecuritiesName" + vv + "]").val();
	         		obj.AccCode = $("input[name=AccCode" + vv + "]").val();
	         		obj.AccName = $("input[name=AccName" + vv + "]").val();
	         		obj.type = $("input[name=type" + vv + "]").val();
	         		obj.number = $("input[name=number" + vv + "]").val();
	         		obj.startDate = $("input[name=startDay" + vv + "]").val();
	         		obj.endDate = $("input[name=endDay" + vv + "]").val();
	         		obj.amount = $("input[name=amount" + vv + "]").val();
	         		obj.price = $("input[name=price" + vv + "]").val();
	         		obj.lend = $("input[name=lend" + vv + "]").val();
	        		
	        		// json ????????? String ????????? ?????? -- 
	        		// ???????????? ????????????????????? ????????? jsp??? ?????? ?????? ????????????????????? ????????? ??? json ???????????? ???????????? ????????????.
	        		// ???????????? 00??????????????? ?????? ????????? XML??? ?????? ????????? ??????
	        		jsonData = JSON.stringify(obj);
	        		/* sendRequest(load_insert, "FT_chitupdate", "post", jsonData); */
	        		
	        		$.ajax({
	                       type : "POST",
	                       url : "/erp/FT_SecuritiesUpdate?${_csrf.parameterName }=${_csrf.token }",
	                       data : jsonData,
	                       contentType : 'application/json;charset=UTF-8',
	                       success : function(data) {
	                              // data??? ??????????????? ???????????? ??????(JSON)????????? ?????? ????????????
	                             /*  if (data.answer == 'success') {
	                                      alert(data.name + '??? ???????????????.');
	                                      var map = new MapArray();
	                                      postData('/News/index.do', map);
	                              } else if (data.answer == 'fail') {
	                                      alert('???????????? ????????? ???????????? ????????????.');
	                              } else if (data.answer == 'error') {
	                                      alert('????????? ????????? ????????? ?????? ???????????????. ??????????????? ??????????????????.');
	                              } */
	                              alert(data);
	                              if(updatekey == 0){
	                  				$(".chitsub-table-bordered-primary tbody #firstsub").focus();
	                              } else {
	                            	 if(updatekey == 1){
	                             	 	$("#enter" + vv).val(selectval);
	                            	 } else if(updatekey == 2){
	                                 	$("#first" + (vv+1)).focus();
	                            	 }
	                            	 updatekey = 0;
	                              }

	                              location.reload();
	                       },
	                       error : function(e) {
	                              alert('?????? ?????? ?????? ????????? ????????????. ?????? ????????? ????????????.');
	                       }
	               });

        		}
        	}
        	
        	function enterinsert(cc) {
				var nowme = $("#enter" + cc).parent();
				
                if(window.event.which == 37) {
                	updatekey = 1;
                	selectval = $("#enter" + cc).val();
          			for(var i = 0; i < $("#enter" + cc).parent().prevAll().children().length; i++){
    					nowme = nowme.prev();
    					if(!nowme.children().attr("readonly")){
    						nowme.children().focus();
    						return false;
    					}
    				}
        		} else if(window.event.which == 38) {
                	updatekey = 1;
                	selectval = $("#enter" + cc).val();
                	$("#enter" + (cc-1)).focus();
					return false;
        		} else if(window.event.which == 39) {
        			updatekey = 1;
                	selectval = $("#enter" + cc).val();
    				for(var i = 0; i < $("#enter" + cc).parent().nextAll().children().length; i++){
    					nowme = nowme.next();
    					if(!nowme.children().attr("readonly")){
    						nowme.children().focus();
    						return false;
    					}
    				}
                	$("#first" + (cc+1)).focus();
					return false;
        		} else if(window.event.which == 40) {
                	updatekey = 1;
                	selectval = $("#enter" + vv).val();
                	if($("#enter" + (vv+1)).attr("onchange") != "enterinsert(" + (vv+1) + ");"){
                    	$("#enter" + (vv+1)).focus();
                	}
					return false;
        		} else if(window.event.which == 13) {
        			var obj = new Object();
            		var jsonData;
            		
	              	// ?????????????????? ?????? ??????
	         		obj.SecuritiesName = $("input[name=SecuritiesName" + cc + "]").val();
	         		obj.AccCode = $("input[name=AccCode" + cc + "]").val();
	         		obj.AccName = $("input[name=AccName" + cc + "]").val();
	         		obj.type = $("input[name=type" + cc + "]").val();
	         		obj.number = $("input[name=number" + cc + "]").val();
	         		obj.startDate = $("input[name=startDay" + cc + "]").val();
	         		obj.endDate = $("input[name=endDay" + cc + "]").val();
	         		obj.amount = $("input[name=amount" + cc + "]").val();
	         		obj.price = $("input[name=price" + cc + "]").val();
	         		obj.lend = $("input[name=lend" + cc + "]").val();
	         		
	         		// json ????????? String ????????? ?????? -- 
	         		// ???????????? ????????????????????? ????????? jsp??? ?????? ?????? ????????????????????? ????????? ??? json ???????????? ???????????? ????????????.
	         		// ???????????? 00??????????????? ?????? ????????? XML??? ?????? ????????? ??????
	         		jsonData = JSON.stringify(obj);
	         		/* sendRequest(load_insert, "FT_chitupdate", "post", jsonData); */
	         		
	         		$.ajax({
	                        type : "POST",
	                        url : "/erp/FT_SecuritiesInsert?${_csrf.parameterName }=${_csrf.token }",
	                        data : jsonData,
	                        contentType : 'application/json;charset=UTF-8',
	                        success : function(data) {
	                        	/* 
		           	       			 $("input[name=depositCode" + cc + "]").val(data);
	                               frontcursor = $(".chit-table-bordered-primary tbody #enter" + cc).attr("name");
		           	       			$(".chit-table-bordered-primary tbody #enter" + cc).attr("onkeydown", "enterupdate(" + cc + ");");
		           	       			$(".chit-table-bordered-primary tbody").append('<tr>' +
		           	       					 '<td><input type="text" onfocus = "focuse(${cnt});" name = "SecuritiesCode${cnt}" class="form-control" data-toggle="input-mask" style = "width: 100%; border:0px;" readonly onclick = "notfocus(this.name);"></td>' +
		                                     '<td><input type="text" id = "first${cnt}" onfocus = "focuse(${cnt});" name = "SecuritiesName${cnt}" class="form-control" data-toggle="input-mask" style = "width: 100%; border:0px;" onkeydown = "enter(this.tagName, this.name);"></td>' +
		                                     '<td><input type="text" onfocus = "focuse(${cnt});" name = "AccCode${cnt}" class="form-control" onclick = "accountlist(${cnt})" data-toggle="input-mask" style = "width: 100%; border:0px;" onkeydown = "enter(this.tagName, this.name);"></td>' +
		                                     '<td><input type="text" onfocus = "focuse(${cnt});" name = "AccName${cnt}" class="form-control" data-toggle="input-mask" style = "width: 100%; border:0px;" readonly onclick = "notfocus(this.name);"></td>' +
		                                     '<td><input type="text" onfocus = "focuse(${cnt});" name = "type${cnt}" class="form-control" data-toggle="input-mask" style = "width: 100%; border:0px;" onkeydown = "enter(this.tagName, this.name);"></td>' +
		                                     '<td><input type="text" onfocus = "focuse(${cnt});" name = "number${cnt}" class="form-control" data-toggle="input-mask" style = "width: 100%; border:0px;" onkeydown = "enter(this.tagName, this.name);"></td>' +
		                                     '<td><input type="date" onfocus = "focuse(${cnt});" name = "startDay${cnt}" class="form-control" data-toggle="input-mask" style = "width: 100%; border:0px;" onkeydown = "enter(this.tagName, this.name);"></td>' +
		                                     '<td><input type="date" onfocus = "focuse(${cnt});" name = "endDay${cnt}" class="form-control" data-toggle="input-mask" style = "width: 100%; border:0px;" onkeydown = "enter(this.tagName, this.name);"></td>' +
		                                     '<td><input type="text" onfocus = "focuse(${cnt});" name = "amount${cnt}" class="form-control" data-toggle="input-mask" style = "width: 100%; border:0px;" onkeydown = "enter(this.tagName, this.name);"></td>' +
		                                     '<td><input type="text" onfocus = "focuse(${cnt});" name = "price${cnt}" class="form-control" data-toggle="input-mask" style = "width: 100%; border:0px;" onkeydown = "enter(this.tagName, this.name);"></td>' +
		                                     '<td><input type="text" id = "enter${cnt}" onfocus = "focuse(${cnt});" name = "lend${cnt}" class="form-control" data-toggle="input-mask" style = "width: 100%; border:0px;" onkeydown = "enter(this.tagName, this.name);"></td>' +
		           	                       '</tr>');
		           	       			 $(".chit-table-bordered-primary tbody #first" + count).focus(); 
		           	                 count = count + 1;*/
	                        	if(data == "insert ??????"){
                               		alert(data);
	           	               } else {
	           	            		alert("??????");
	           	               }
	                               location.reload();
	                        },
	                        error : function(e) {
	                               alert('?????? ?????? ?????? ????????? ????????????. ?????? ????????? ????????????.');
	                        }
	                });
        		}
        	}
        	
        	function accountlist(accountcode) {
            	var popupX = Math.ceil((window.screen.width - 363)/2);
            	var popupY = Math.ceil((window.screen.height - 528)/2);
        		var url = "FT_account_list?key=" + $("*[name=AccCode" + accountcode + "]").val() + "&keyname=" + accountcode;
        		window.open(url, "account_list", "menubar=no, width=363px, height = 528px, left=" + popupX + ", top=" + popupY);
        		
        	}
        	
        	function deleted() {
        		if(!focusval){
        			alert("???????????? ?????? ????????? ??????????????????!")
        		} else {
	        		var obj = new Object();
	        		var jsonData;
	        	
	        		// ?????????????????? ?????? ??????
	        		obj.key = $("input[name=SecuritiesCode" + focusval + "]").val();
	        		
	        		// json ????????? String ????????? ?????? -- 
	        		// ???????????? ????????????????????? ????????? jsp??? ?????? ?????? ????????????????????? ????????? ??? json ???????????? ???????????? ????????????.
	        		// ???????????? 00??????????????? ?????? ????????? XML??? ?????? ????????? ??????
	        		jsonData = JSON.stringify(obj);
	        		/* sendRequest(load_insert, "FT_chitupdate", "post", jsonData); */
	        		$.ajax({
	                       type : "POST",
	                       url : "/erp/FT_SecuritiesDelete?${_csrf.parameterName }=${_csrf.token }",
	                       data : jsonData,
	                       contentType : 'application/json;charset=UTF-8',
	                       success : function(data) {
	                    	   alert(data);
	                    	   $("input[name=SecuritiesCode" + focusval + "]").parent().parent().remove();
	                       },
	                       error : function(e) {
	                       		alert('?????? ?????? ?????? ????????? ????????????. ?????? ????????? ????????????.');
	                       }
	        		});
	        	}
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

            
            <%@ include file="../sidebar.jsp" %>

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
                                    <div class="card-body table-responsive">
                                    	<div align="right" style = "margin-bottom: 30px;">
    										<button type="button" class="btn btn-outline-primary waves-effect waves-light" onclick = "deleted();">??????</button>
    										<br>
    									</div>
                                       <div class="table-responsive" style = "margin: 15px 0px 15px">
                                            <table class="table m-0 chit-table-colored-bordered chit-table-bordered-primary table-bordered">
                                                <col style="width: 12%;">
                                                <col style="width: 12%;">
												<col style="width: 10%;">
												<col style="width: 10%;">
												<col style="width: 10%;">
												<col style="width: 10%;">
												<col style="width: 5%;">
												<col style="width: 5%;">
												<col style="width: 6%;">
												<col style="width: 10%;">
												<col style="width: 10%;">
												<thead>
													<tr>
														<th>????????????????????????</th>
														<th>?????????????????????</th>
														<th>???????????????</th>
														<th>????????????</th>
		                                                <th>????????????</th>
														<th>??????????????????</th>
														<th>?????????</th>
														<th>?????????</th>
														<th>??????</th>
														<th>?????????</th>
														<th>?????????</th>
													</tr>
												</thead>
		    									
		                                        <tbody>
		                                            <c:set var="cnt" value="0"/>                               
		                                        	<c:forEach var="se" items="${Securities}">
		                                        		<tr>												
			                                                <td><input type="text" onfocus = "focuse(${cnt});" name = "SecuritiesCode${cnt}" class="form-control" data-toggle="input-mask" style = "width: 100%; border:0px;" readonly onclick = "notfocus(this.name);" value = "${se.securitiesCode}"></td>
			                                                <td><input type="text" id = "first${cnt}" onfocus = "focuse(${cnt});" name = "SecuritiesName${cnt}" class="form-control" data-toggle="input-mask" style = "width: 100%; border:0px;" onkeydown = "enter(this.tagName, this.name);" value = "${se.securitiesName}"></td>
			                                                <td><input type="text" onfocus = "focuse(${cnt});" name = "AccCode${cnt}" class="form-control" onclick = "accountlist(${cnt})" data-toggle="input-mask" style = "width: 100%; border:0px;" onkeydown = "enter(this.tagName, this.name);" value = "${se.customer_code}"></td>
			                                                <td><input type="text" onfocus = "focuse(${cnt});" name = "AccName${cnt}" class="form-control" data-toggle="input-mask" style = "width: 100%; border:0px;" readonly onclick = "notfocus(this.name);" value = "${se.customer_name}"></td>
			                                                <td><input type="text" onfocus = "focuse(${cnt});" name = "type${cnt}" class="form-control" data-toggle="input-mask" style = "width: 100%; border:0px;" onkeydown = "enter(this.tagName, this.name);" value = "${se.ts_type}"></td>
			                                                <td><input type="text" onfocus = "focuse(${cnt});" name = "number${cnt}" class="form-control" data-toggle="input-mask" style = "width: 100%; border:0px;" onkeydown = "enter(this.tagName, this.name);" value = "${se.ts_number}"></td>
			                                                <td><input type="date" onfocus = "focuse(${cnt});" name = "startDay${cnt}" class="form-control" data-toggle="input-mask" style = "width: 100%; border:0px;" onkeydown = "enter(this.tagName, this.name);" value = "${se.ts_date.substring(0,10)}"></td>
			                                                <td><input type="date" onfocus = "focuse(${cnt});" name = "endDay${cnt}" class="form-control" data-toggle="input-mask" style = "width: 100%; border:0px;" onkeydown = "enter(this.tagName, this.name);" value = "${se.ts_expriration.substring(0,10)}"></td>
			                                                <td><input type="text" onfocus = "focuse(${cnt});" name = "amount${cnt}" class="form-control" data-toggle="input-mask" style = "width: 100%; border:0px;" onkeydown = "enter(this.tagName, this.name);" value = "${se.ts_amount}"></td>
			                                                <td><input type="text" onfocus = "focuse(${cnt});" name = "price${cnt}" class="form-control" data-toggle="input-mask" style = "width: 100%; border:0px;" onkeydown = "enter(this.tagName, this.name);" value = "${se.ts_money}"></td>
			                                                <td><input type="text" id = "enter${cnt}" onfocus = "focuse(${cnt});" name = "lend${cnt}" class="form-control" data-toggle="input-mask" style = "width: 100%; border:0px;" onkeydown = "enterupdate(${cnt});" value = "${se.ts_interest}"></td>
			                                            </tr>
			                                            <c:set var="cnt" value="${cnt+1}"/>
		                                        	</c:forEach>
		                                            <tr>
		                                                <td><input type="text" onfocus = "focuse(${cnt});" name = "SecuritiesCode${cnt}" class="form-control" data-toggle="input-mask" style = "width: 100%; border:0px;" readonly onclick = "notfocus(this.name);"></td>
		                                                <td><input type="text" id = "first${cnt}" onfocus = "focuse(${cnt});" name = "SecuritiesName${cnt}" class="form-control" data-toggle="input-mask" style = "width: 100%; border:0px;" onkeydown = "enter(this.tagName, this.name);"></td>
		                                                <td><input type="text" onfocus = "focuse(${cnt});" name = "AccCode${cnt}" class="form-control" onclick = "accountlist(${cnt})" data-toggle="input-mask" style = "width: 100%; border:0px;" onkeydown = "enter(this.tagName, this.name);"></td>
		                                                <td><input type="text" onfocus = "focuse(${cnt});" name = "AccName${cnt}" class="form-control" data-toggle="input-mask" style = "width: 100%; border:0px;" readonly onclick = "notfocus(this.name);"></td>
		                                                <td><input type="text" onfocus = "focuse(${cnt});" name = "type${cnt}" class="form-control" data-toggle="input-mask" style = "width: 100%; border:0px;" onkeydown = "enter(this.tagName, this.name);"></td>
		                                                <td><input type="text" onfocus = "focuse(${cnt});" name = "number${cnt}" class="form-control" data-toggle="input-mask" style = "width: 100%; border:0px;" onkeydown = "enter(this.tagName, this.name);"></td>
		                                                <td><input type="date" onfocus = "focuse(${cnt});" name = "startDay${cnt}" class="form-control" data-toggle="input-mask" style = "width: 100%; border:0px;" onkeydown = "enter(this.tagName, this.name);"></td>
		                                                <td><input type="date" onfocus = "focuse(${cnt});" name = "endDay${cnt}" class="form-control" data-toggle="input-mask" style = "width: 100%; border:0px;" onkeydown = "enter(this.tagName, this.name);"></td>
		                                                <td><input type="text" onfocus = "focuse(${cnt});" name = "amount${cnt}" class="form-control" data-toggle="input-mask" style = "width: 100%; border:0px;" onkeydown = "enter(this.tagName, this.name);"></td>
		                                                <td><input type="text" onfocus = "focuse(${cnt});" name = "price${cnt}" class="form-control" data-toggle="input-mask" style = "width: 100%; border:0px;" onkeydown = "enter(this.tagName, this.name);"></td>
		                                                <td><input type="text" id = "enter${cnt}" onfocus = "focuse(${cnt});" name = "lend${cnt}" class="form-control" data-toggle="input-mask" style = "width: 100%; border:0px;" onkeydown = "enterinsert(${cnt});"></td>
		                                            </tr>
		                                        </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div> <!-- end container-fluid -->

                </div> <!-- end content -->
                
			<%@ include file="../footer.jsp"%>
		</div>
	</div>
	<!-- END wrapper -->

	<%@ include file="../rightbar.jsp"%>
	<%@ include file="../setting2.jsp"%>

</body>
</html>