<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<%@ include file="../setting.jsp"%>
<script src="/pj/resources/assets/css/js/jquery-3.4.1.min.js"></script>
<script src="/pj/resources/assets/css/js/request.js"></script>
<script type="text/javascript">
        	var count = 1;
        	var subcount = 1;
        	var frontcursor;
        	var updatekey = 0;
        	var selectval = "";
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
        			if(!$("input[name=CardCode" + keyval + "]").val()) {
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
        			var swit = 0;
        			var nowme = $("*[name=" + dd + "]").parent();
        			selectval = $("*[name=" + dd + "]").val();
        			if(window.event.which == 9) {
            			$("*[name=" + dd + "]").parent().prev().children().focus();
            		} else if(window.event.which == 37) {
            			for(var i = 0; i < $("*[name=" + dd + "]").parent().prevAll().children().length; i++){
        					nowme = nowme.prev();
        					if(!nowme.children().attr("readonly")){
        						nowme.children().focus();
        						return false;
        					}
        				}
            		} else if(window.event.which == 38) {
            			$("*[name=" + dd.substring(0, dd.length-1) + (parseInt(dd.substring(dd.length-1,dd.length)) - 1) + "]").focus();
            		} else if(window.event.which == 39) {
        				for(var i = 0; i < $("*[name=" + dd + "]").parent().nextAll().children().length; i++){
        					nowme = nowme.next();
        					if(!nowme.children().attr("readonly")){
        						$("*[name=" + dd + "]").val(selectval);
        						nowme.children().focus();
        						return false;
        					}
        				}
            		} else if(window.event.which == 40) {
            			$("*[name=" + dd.substring(0, dd.length-1) + (parseInt(dd.substring(dd.length-1,dd.length)) + 1) + "]").focus();
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
	        		obj.CardCode = $("input[name=CardCode" + vv + "]").val();
	        		obj.AccCode = $("input[name=AccCode" + vv + "]").val();
	        		obj.SubjectCode = $("input[name=SubjectCode" + vv + "]").val();
	        		obj.CardName = $("input[name=CardName" + vv + "]").val();
	        		obj.CardType = $("select[name=CardType" + vv + "]").val();
	        		obj.CardPurpose = $("input[name=CardPurpose" + vv + "]").val();
	        		obj.Owner = $("input[name=Owner" + vv + "]").val();
	        		obj.PayCode = $("input[name=PayCode" + vv + "]").val();
	        		
	        		// json ????????? String ????????? ?????? -- 
	        		// ???????????? ????????????????????? ????????? jsp??? ?????? ?????? ????????????????????? ????????? ??? json ???????????? ???????????? ????????????.
	        		// ???????????? 00??????????????? ?????? ????????? XML??? ?????? ????????? ??????
	        		jsonData = JSON.stringify(obj);
	        		/* sendRequest(load_insert, "FT_chitupdate", "post", jsonData); */
	        		
	        		$.ajax({
	                       type : "POST",
	                       url : "/erp/FT_CardManagementUpdate?${_csrf.parameterName }=${_csrf.token }",
	                       data : jsonData,
	                       contentType : 'application/json;charset=UTF-8',
	                       success : function(data) {
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
                	if($("#enter" + (cc+1)).attr("onchange") != "enterinsert(" + (cc+1) + ");"){
                    	$("#enter" + (cc+1)).focus();
                	}
					return false;
        		} else if(window.event.which == 13) {
        			var obj = new Object();
            		var jsonData;
	                 
	              	// ?????????????????? ?????? ??????
	        		obj.AccCode = $("input[name=AccCode" + cc + "]").val();
	        		obj.SubjectCode = $("input[name=SubjectCode" + cc + "]").val();
	        		obj.CardName = $("input[name=CardName" + cc + "]").val();
	        		obj.CardType = $("select[name=CardType" + cc + "]").val();
	        		obj.CardPurpose = $("input[name=CardPurpose" + cc + "]").val();
	        		obj.Owner = $("input[name=Owner" + cc + "]").val();
	        		obj.PayCode = $("input[name=PayCode" + cc + "]").val();
	         		
	         		// json ????????? String ????????? ?????? -- 
	         		// ???????????? ????????????????????? ????????? jsp??? ?????? ?????? ????????????????????? ????????? ??? json ???????????? ???????????? ????????????.
	         		// ???????????? 00??????????????? ?????? ????????? XML??? ?????? ????????? ??????
	         		jsonData = JSON.stringify(obj);
	         		/* sendRequest(load_insert, "FT_chitupdate", "post", jsonData); */
	         		
	         		$.ajax({
	                        type : "POST",
	                        url : "/erp/FT_CardManagementInsert?${_csrf.parameterName }=${_csrf.token }",
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
		           	       			 $("input[name=CardCode" + cc + "]").val(data);
	                               frontcursor = $(".chit-table-bordered-primary tbody #enter" + cc).attr("name");
		           	       			$(".chit-table-bordered-primary tbody #enter" + cc).attr("onkeydown", "enterupdate(" + cc + ");");
		           	       			$(".chit-table-bordered-primary tbody").append('<tr>' +
		           	       				'<td><input type="text" onfocus = "focuse(' + count + ');" name = "CardCode' + count + '" class="form-control" data-toggle="input-mask" style = "width: 100%; border:0px;" readonly onclick = "notfocus(this.name);"></td>' +
		                                '<td><input type="text" onfocus = "focuse(' + count + ');" id = "first' + count + '" name = "CardName' + count + '" class="form-control" data-toggle="input-mask" style = "width: 100%; border:0px;" onkeydown = "enter(this.tagName, this.name);"></td>' +
		                                '<td><select class="form-control" onfocus = "focuse(' + count + ');" name = "CardType' + count + '" style = "width: 100%; -webkit-appearance: none; border:0px;" onkeydown = "enter(this.tagName,this.name);">' +
		                                '<option value="0">== ?????? ==</option>' +
		                                '<option value="1">????????????</option>' +
		                                '<option value="2">????????????</option>' +
		                           		'</select></td>' +
		                                '<td><input type="text" onfocus = "focuse(' + count + ');" name = "AccCode' + count + '" class="form-control" onclick = "accountlist(' + count + ')" data-toggle="input-mask" style = "width: 100%; border:0px;" onkeydown = "enter(this.tagName, this.name);"></td>' +
		                                '<td><input type="text" onfocus = "focuse(' + count + ');" name = "AccName' + count + '" class="form-control" data-toggle="input-mask" style = "width: 100%; border:0px;" readonly onclick = "notfocus(this.name);"></td>' +
		                                '<td><input type="text" onfocus = "focuse(' + count + ');" name = "SubjectCode' + count + '" class="form-control" onclick = "subjectlist(' + count + ')" data-toggle="input-mask" style = "width: 100%; border:0px;" onkeydown = "enter(this.tagName, this.name);"></td>' +
		                                '<td><input type="text" onfocus = "focuse(' + count + ');" name = "SubjectName' + count + '" class="form-control" data-toggle="input-mask" style = "width: 100%; border:0px;" readonly onclick = "notfocus(this.name);"></td>' +
		                           		'<td><input type="text" onfocus = "focuse(' + count + ');" name = "CardPurpose' + count + '" class="form-control" data-toggle="input-mask" style = "width: 100%; border:0px;" onkeydown = "enter(this.tagName, this.name);"></td>' +
		                                '<td><input type="text" onfocus = "focuse(' + count + ');" name = "Owner' + count + '" class="form-control" data-toggle="input-mask" style = "width: 100%; border:0px;" onkeydown = "enter(this.tagName, this.name);"></td>' +
		                                '<td><input type="text" id = "enter' + count + '" onfocus = "focuse(' + count + ');" name = "PayCode' + count + '" class="form-control" onclick = "depositlist(' + count + ')" data-toggle="input-mask" style = "width: 100%; border:0px;" onkeydown="enterinsert(' + count + ');"></td>' +
		                                '<td><input type="text" onfocus = "focuse(' + count + ');" name = "PayNo' + count + '" class="form-control" data-toggle="input-mask" style = "width: 100%; border:0px;" readonly onclick = "notfocus(this.name);"></td>' +
		           	                       '</tr>');
		           	       			 $(".chit-table-bordered-primary tbody #first" + count).focus();
		           	                 count = count + 1;
		           	              if(data == "insert ??????"){
	                               		alert(data);
		           	               } else {
		           	            		alert("??????");
		           	               }
	                        },
	                        error : function(e) {
	                               alert('?????? ?????? ?????? ????????? ????????????. ?????? ????????? ????????????.');
	                        }
	                });
        		}
        	}
        	
        	function subjectlist(subjectcode) {
            	var popupX = Math.ceil((window.screen.width - 363)/2);
            	var popupY = Math.ceil((window.screen.height - 528)/2);
        		var url = "FT_AccSubject_list?key=" + $("*[name=SubjectCode" + subjectcode + "]").val() + "&keyname=" + subjectcode;
        		window.open(url, "subject_list", "menubar=no, width=363px, height = 528px, left="+ popupX + ", top="+ popupY);
        		
        	}
        	
        	function accountlist(accountcode) {
            	var popupX = Math.ceil((window.screen.width - 363)/2);
            	var popupY = Math.ceil((window.screen.height - 528)/2);
        		var url = "FT_account_list?key=" + $("*[name=AccCode" + accountcode + "]").val() + "&keyname=" + accountcode;
        		window.open(url, "account_list", "menubar=no, width=363px, height = 528px, left=" + popupX + ", top=" + popupY);
        		
        	}
        	
        	function depositlist(depositcode) {
            	var popupX = Math.ceil((window.screen.width - 363)/2);
            	var popupY = Math.ceil((window.screen.height - 528)/2);
        		var url = "FT_depositsub_list?key=" + $("*[name=PayCode" + depositcode + "]").val() + "&keyname=" + depositcode;
        		window.open(url, "deposit_list", "menubar=no, width=363px, height = 528px, left=" + popupX + ", top=" + popupY);
        		
        	}
        	
        	function deleted() {
        		if(focusval == "" && focusval != "0"){
        			alert("???????????? ?????? ????????? ??????????????????!");
        		} else {
	        		var obj = new Object();
	        		var jsonData;
	        	
	        		// ?????????????????? ?????? ??????
	        		obj.key = $("input[name=CardCode" + focusval + "]").val();
	        		
	        		// json ????????? String ????????? ?????? -- 
	        		// ???????????? ????????????????????? ????????? jsp??? ?????? ?????? ????????????????????? ????????? ??? json ???????????? ???????????? ????????????.
	        		// ???????????? 00??????????????? ?????? ????????? XML??? ?????? ????????? ??????
	        		jsonData = JSON.stringify(obj);
	        		/* sendRequest(load_insert, "FT_chitupdate", "post", jsonData); */
	        		$.ajax({
	                       type : "POST",
	                       url : "/erp/FT_CardManagementDelete?${_csrf.parameterName }=${_csrf.token }",
	                       data : jsonData,
	                       contentType : 'application/json;charset=UTF-8',
	                       success : function(data) {
	                    	   alert(data);
	                    	   $("input[name=CardCode" + focusval + "]").parent().parent().remove();
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
                                            <li class="breadcrumb-item active">Datatables</li>
                                        </ol>
                                    </div>
                                    <h4 class="page-title">????????????</h4>
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
                                                <col style = "width:8%;">
                                                <col style = "width:10%;">
                                                <col style = "width:7%;">
                                                <col style = "width:7%">
                                                <col style = "width:10%;">
                                                <col style = "width:7%;">
                                                <col style = "width:10%;">
                                                <col style = "width:12%;">
                                                <col style = "width:8%;">
                                                <col style = "width:7%;">
                                                <col style = "width:13%;">
                                                <thead>
                                                    <tr>
                                                    	<th>????????????</th>
		                                                <th>?????????</th>
		                                                <th>????????????</th>
		                                                <th>???????????????</th>
		                                                <th>????????????</th>
		                                                <th>????????????</th>
		                                                <th>?????????</th>
		                                                <th>????????????</th>
		                                                <th>?????????</th>
		                                                <th>????????????</th>
		                                                <th>??????????????????</th>
		                                            </tr>
		                                        </thead>
		    
		                                        <tbody>
		                                       		<c:set var="cnt" value="0"/>
		                                        	<c:forEach var="card" items="${cardlist}">
		                                        		<tr>							
			                                                <td><input type="text" onfocus = "focuse(${cnt});" name = "CardCode${cnt}" class="form-control" data-toggle="input-mask" style = "width: 100%; border:0px;" readonly onclick = "notfocus(this.name);" value = "${card.cardCode}"></td>
			                                                <td><input type="text" onfocus = "focuse(${cnt});" id = "first${cnt}" name = "CardName${cnt}" class="form-control" data-toggle="input-mask" style = "width: 100%; border:0px;" onkeydown = "enter(this.tagName, this.name);" value = "${card.cardName}"></td>
			                                                <td><select class="form-control" onfocus = "focuse(${cnt});" name = "CardType${cnt}" style = "width: 100%; -webkit-appearance: none; border:0px;" onkeydown = "enter(this.tagName,this.name);">
			                                                <option value="0">== ?????? ==</option>
			                                                <c:if test="${card.cardType == 1}">
			                                                <option value="1" selected="selected">????????????</option>
			                                                <option value="2">????????????</option>
			                                                </c:if>
			                                                <c:if test="${card.cardType == 2}">
			                                                <option value="1">????????????</option>
			                                                <option value="2" selected="selected">????????????</option>
			                                                </c:if>
				                                       		</select></td>
			                                                <td><input type="text" onfocus = "focuse(${cnt});" name = "AccCode${cnt}" class="form-control" onclick = "accountlist(${cnt})" data-toggle="input-mask" style = "width: 100%; border:0px;" onkeydown = "enter(this.tagName, this.name);" value = "${card.accCode}"></td>
			                                                <td><input type="text" onfocus = "focuse(${cnt});" name = "AccName${cnt}" class="form-control" data-toggle="input-mask" style = "width: 100%; border:0px;" readonly onclick = "notfocus(this.name);" value = "${card.accName}"></td>
			                                                <td><input type="text" onfocus = "focuse(${cnt});" name = "SubjectCode${cnt}" class="form-control" onclick = "subjectlist(${cnt})" data-toggle="input-mask" style = "width: 100%; border:0px;" onkeydown = "enter(this.tagName, this.name);" value = "${card.subjectCode}"></td>
			                                                <td><input type="text" onfocus = "focuse(${cnt});" name = "SubjectName${cnt}" class="form-control" data-toggle="input-mask" style = "width: 100%; border:0px;" readonly onclick = "notfocus(this.name);" value = "${card.subjectName}"></td>
				                                       		<td><input type="text" onfocus = "focuse(${cnt});" name = "CardPurpose${cnt}" class="form-control" data-toggle="input-mask" style = "width: 100%; border:0px;" onkeydown = "enter(this.tagName, this.name);" value = "${card.cardPurpose}"></td>
			                                                <td><input type="text" onfocus = "focuse(${cnt});" name = "Owner${cnt}" class="form-control" data-toggle="input-mask" style = "width: 100%; border:0px;" onkeydown = "enter(this.tagName, this.name);" value = "${card.owner}"></td>
			                                                <td><input type="text" id = "enter${cnt}" onfocus = "focuse(${cnt});" name = "PayCode${cnt}" class="form-control" onclick = "depositlist(${cnt})" data-toggle="input-mask" style = "width: 100%; border:0px;" onkeydown="enterupdate(${cnt});" value = "${card.payCode}"></td>
				                                            <td><input type="text" onfocus = "focuse(${cnt});" name = "PayNo${cnt}" class="form-control" data-toggle="input-mask" style = "width: 100%; border:0px;" readonly onclick = "notfocus(this.name);" value = "${card.accountNo}"></td>
			                                            </tr>
			                                            <c:set var="cnt" value="${cnt+1}"/>
		                                        	</c:forEach>
		                                            <tr>
	                                                	<td><input type="text" onfocus = "focuse(${cnt});" name = "CardCode${cnt}" class="form-control" data-toggle="input-mask" style = "width: 100%; border:0px;" readonly onclick = "notfocus(this.name);"></td>
		                                                <td><input type="text" onfocus = "focuse(${cnt});" id = "first${cnt}" name = "CardName${cnt}" class="form-control" data-toggle="input-mask" style = "width: 100%; border:0px;" onkeydown = "enter(this.tagName, this.name);"></td>
		                                                <td><select class="form-control" onfocus = "focuse(${cnt});" name = "CardType${cnt}" style = "width: 100%; -webkit-appearance: none; border:0px;" onkeydown = "enter(this.tagName,this.name);">
		                                                <option value="0">== ?????? ==</option>
		                                                <option value="1">????????????</option>
		                                                <option value="2">????????????</option>
			                                       		</select></td>
		                                                <td><input type="text" onfocus = "focuse(${cnt});" name = "AccCode${cnt}" class="form-control" onclick = "accountlist(${cnt})" data-toggle="input-mask" style = "width: 100%; border:0px;" onkeydown = "enter(this.tagName, this.name);"></td>
		                                                <td><input type="text" onfocus = "focuse(${cnt});" name = "AccName${cnt}" class="form-control" data-toggle="input-mask" style = "width: 100%; border:0px;" readonly onclick = "notfocus(this.name);"></td>
		                                                <td><input type="text" onfocus = "focuse(${cnt});" name = "SubjectCode${cnt}" class="form-control" onclick = "subjectlist(${cnt})" data-toggle="input-mask" style = "width: 100%; border:0px;" onkeydown = "enter(this.tagName, this.name);"></td>
		                                                <td><input type="text" onfocus = "focuse(${cnt});" name = "SubjectName${cnt}" class="form-control" data-toggle="input-mask" style = "width: 100%; border:0px;" readonly onclick = "notfocus(this.name);"></td>
			                                       		<td><input type="text" onfocus = "focuse(${cnt});" name = "CardPurpose${cnt}" class="form-control" data-toggle="input-mask" style = "width: 100%; border:0px;" onkeydown = "enter(this.tagName, this.name);"></td>
		                                                <td><input type="text" onfocus = "focuse(${cnt});" name = "Owner${cnt}" class="form-control" data-toggle="input-mask" style = "width: 100%; border:0px;" onkeydown = "enter(this.tagName, this.name);"></td>
		                                                <td><input type="text" id = "enter${cnt}" onfocus = "focuse(${cnt});" name = "PayCode${cnt}" class="form-control" onclick = "depositlist(${cnt})" data-toggle="input-mask" style = "width: 100%; border:0px;" onkeydown="enterinsert(${cnt});"></td>
			                                            <td><input type="text" onfocus = "focuse(${cnt});" name = "PayNo${cnt}" class="form-control" data-toggle="input-mask" style = "width: 100%; border:0px;" readonly onclick = "notfocus(this.name);"></td>
		                                            </tr>
		                                        </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div> <!-- end container-fluid -->

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

</body>
</html>