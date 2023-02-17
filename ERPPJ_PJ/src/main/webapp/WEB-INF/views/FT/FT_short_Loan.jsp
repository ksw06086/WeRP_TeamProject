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
        			if(!$("input[name=loanCode" + keyval + "]").val()) {
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
	        		// 자바스크립트 객체 생성
	         		obj.loanCode = $("input[name=loanCode" + vv + "]").val();
	         		obj.loanName = $("input[name=loanName" + vv + "]").val();
	         		obj.AccCode = $("input[name=AccCode" + vv + "]").val();
	         		obj.AccName = $("input[name=AccName" + vv + "]").val();
	         		obj.username = $("input[name=username" + vv + "]").val();
	         		obj.ename = $("input[name=ename" + vv + "]").val();
	         		obj.price = $("input[name=price" + vv + "]").val();
	         		obj.startDate = $("input[name=startDay" + vv + "]").val();
	         		obj.endDate = $("input[name=endDay" + vv + "]").val();
	         		obj.lend = $("input[name=lend" + vv + "]").val();
	        		
	        		// json 객체를 String 객체로 변환 -- 
	        		// 제이슨은 안드로이드에서 이제는 jsp로 하지 않고 안드로이드에서 뿌려줄 때 json 형식으로 불러와서 활용한다.
	        		// 빅데이터 00데이터들은 실제 값들을 XML로 많이 사용할 것임
	        		jsonData = JSON.stringify(obj);
	        		/* sendRequest(load_insert, "FT_chitupdate", "post", jsonData); */
	        		
	        		$.ajax({
	                       type : "POST",
	                       url : "/erp/FT_LoanUpdate?${_csrf.parameterName }=${_csrf.token }",
	                       data : jsonData,
	                       contentType : 'application/json;charset=UTF-8',
	                       success : function(data) {
	                              // data는 서버로부터 전송받은 결과(JSON)이므로 바로 사용한다
	                             /*  if (data.answer == 'success') {
	                                      alert(data.name + '님 환영합니다.');
	                                      var map = new MapArray();
	                                      postData('/News/index.do', map);
	                              } else if (data.answer == 'fail') {
	                                      alert('아이디와 비번이 일치하지 않습니다.');
	                              } else if (data.answer == 'error') {
	                                      alert('원활한 접속이 이루어 지지 못했습니다. 관리자에게 문의하십시오.');
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
	                              alert('서버 연결 도중 에러가 났습니다. 다시 시도해 주십시오.');
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
            		
	              	// 자바스크립트 객체 생성
	         		obj.loanName = $("input[name=loanName" + cc + "]").val();
	         		obj.AccCode = $("input[name=AccCode" + cc + "]").val();
	         		obj.AccName = $("input[name=AccName" + cc + "]").val();
	         		obj.username = $("input[name=username" + cc + "]").val();
	         		obj.ename = $("input[name=ename" + cc + "]").val();
	         		obj.price = $("input[name=price" + cc + "]").val();
	         		obj.startDate = $("input[name=startDay" + cc + "]").val();
	         		obj.endDate = $("input[name=endDay" + cc + "]").val();
	         		obj.lend = $("input[name=lend" + cc + "]").val();
	         		
	         		// json 객체를 String 객체로 변환 -- 
	         		// 제이슨은 안드로이드에서 이제는 jsp로 하지 않고 안드로이드에서 뿌려줄 때 json 형식으로 불러와서 활용한다.
	         		// 빅데이터 00데이터들은 실제 값들을 XML로 많이 사용할 것임
	         		jsonData = JSON.stringify(obj);
	         		/* sendRequest(load_insert, "FT_chitupdate", "post", jsonData); */
	         		
	         		$.ajax({
	                        type : "POST",
	                        url : "/erp/FT_LoanInsert?${_csrf.parameterName }=${_csrf.token }",
	                        data : jsonData,
	                        contentType : 'application/json;charset=UTF-8',
	                        success : function(data) {
	                        	/* 
		           	       			 $("input[name=depositCode" + cc + "]").val(data);
	                               frontcursor = $(".chit-table-bordered-primary tbody #enter" + cc).attr("name");
		           	       			$(".chit-table-bordered-primary tbody #enter" + cc).attr("onkeydown", "enterupdate(" + cc + ");");
		           	       			$(".chit-table-bordered-primary tbody").append('<tr>' +
		           	       					 '<td><input type="text" onfocus = "focuse(' + count + ');" name = "loanCode${cnt}" class="form-control" data-toggle="input-mask" style = "width: 100%; border:0px;" readonly onclick = "notfocus(this.name);"></td>' +
			                                 '<td><input type="text" id = "first' + count + '" onfocus = "focuse(' + count + ');" name = "loanName' + count + '" class="form-control" data-toggle="input-mask" style = "width: 100%; border:0px;" onkeydown = "enter(this.tagName, this.name);"></td>' +
			                                 '<td><input type="text" onfocus = "focuse(' + count + ');" name = "AccCode' + count + '" class="form-control" onclick = "accountlist(' + count + ')" data-toggle="input-mask" style = "width: 100%; border:0px;" onkeydown = "enter(this.tagName, this.name);"></td>' +
			                                 '<td><input type="text" onfocus = "focuse(' + count + ');" name = "AccName' + count + '" class="form-control" data-toggle="input-mask" style = "width: 100%; border:0px;" readonly onclick = "notfocus(this.name);"></td>' +
			                                 '<td><input type="text" onfocus = "focuse(' + count + ');" name = "username' + count + '" class="form-control" onclick = "userslist(' + count + ')" data-toggle="input-mask" style = "width: 100%; border:0px;" onkeydown = "enter(this.tagName, this.name);""></td>' +
			                                 '<td><input type="text" onfocus = "focuse(' + count + ');" name = "ename' + count + '" class="form-control" data-toggle="input-mask" style = "width: 100%; border:0px;" onkeydown = "enter(this.tagName, this.name);"></td>' +
			                                 '<td><input type="text" onfocus = "focuse(' + count + ');" name = "price' + count + '" class="form-control" data-toggle="input-mask" style = "width: 100%; border:0px;" onkeydown = "enter(this.tagName, this.name);"></td>' +
			                                 '<td><input type="date" onfocus = "focuse(' + count + ');" name = "startDay' + count + '" class="form-control" data-toggle="input-mask" style = "width: 100%; border:0px;" onkeydown = "enter(this.tagName, this.name);"></td>' +
			                                 '<td><input type="date" onfocus = "focuse(' + count + ');" name = "endDay' + count + '" class="form-control" data-toggle="input-mask" style = "width: 100%; border:0px;" onkeydown = "enter(this.tagName, this.name);"></td>' +
			                                 '<td><input type="text" id = "enter' + count + '" onfocus = "focuse(' + count + ');" name = "lend' + count + '" class="form-control" data-toggle="input-mask" style = "width: 100%; border:0px;" onkeydown = "enter(this.tagName, this.name);"></td>' +
		           	                       '</tr>');
		           	       			 $(".chit-table-bordered-primary tbody #first" + count).focus(); 
		           	                 count = count + 1;*/
		           	               if(data == "insert 실패"){
	                               		alert(data);
		           	               } else {
		           	            		alert("성공");
		           	               }
	                               location.reload();
	                        },
	                        error : function(e) {
	                               alert('서버 연결 도중 에러가 났습니다. 다시 시도해 주십시오.');
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

        	function userslist(usercode) {
            	var popupX = Math.ceil((window.screen.width - 363)/2);
            	var popupY = Math.ceil((window.screen.height - 528)/2);
        		var url = "FT_users_list?key=" + $("*[name=username" + usercode + "]").val() + "&keyname=" + usercode;
        		window.open(url, "users_list", "menubar=no, width=363px, height = 528px, left=" + popupX + ", top=" + popupY);
        		
        	}
        	
        	function deleted() {
        		if(!focusval){
        			alert("등록되어 있는 분개를 선택해주세요!")
        		} else {
	        		var obj = new Object();
	        		var jsonData;
	        	
	        		// 자바스크립트 객체 생성
	        		obj.key = $("input[name=loanCode" + focusval + "]").val();
	        		
	        		// json 객체를 String 객체로 변환 -- 
	        		// 제이슨은 안드로이드에서 이제는 jsp로 하지 않고 안드로이드에서 뿌려줄 때 json 형식으로 불러와서 활용한다.
	        		// 빅데이터 00데이터들은 실제 값들을 XML로 많이 사용할 것임
	        		jsonData = JSON.stringify(obj);
	        		/* sendRequest(load_insert, "FT_chitupdate", "post", jsonData); */
	        		$.ajax({
	                       type : "POST",
	                       url : "/erp/FT_loanDelete?${_csrf.parameterName }=${_csrf.token }",
	                       data : jsonData,
	                       contentType : 'application/json;charset=UTF-8',
	                       success : function(data) {
	                    	   alert(data);
	                    	   $("input[name=noteCode" + focusval + "]").parent().parent().remove();
	                       },
	                       error : function(e) {
	                       		alert('서버 연결 도중 에러가 났습니다. 다시 시도해 주십시오.');
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
                                            <li class="breadcrumb-item active">단기대여금관리</li>
                                        </ol>
                                    </div>
                                    <h4 class="page-title" style="font-size: 25px;">단기대여금관리</h4>
                                </div>
                            </div>
                        </div>     
                        <!-- end page title --> 
						
                        <div class="row">
                            <div class="col-sm-12">
                                <div class="card">
                                    <div class="card-body table-responsive" style="margin-bottom: 0px;">
                                    	<div align="right" style = "margin-bottom: 30px;">
    										<button type="button" class="btn btn-outline-primary waves-effect waves-light" onclick = "deleted();">삭제</button>
    										<br>
    									</div>
                                       <div class="table-responsive" style = "margin: 15px 0px 15px">
                                            <table class="table m-0 chit-table-colored-bordered chit-table-bordered-primary table-bordered">
                                                <col style="width: 10%;">
                                                <col style="width: 10%;">
												<col style="width: 10%;">
												<col style="width: 10%;">
												<col style="width: 10%;">
												<col style="width: 10%;">
												<col style="width: 10%;">
												<col style="width: 10%;">
												<col style="width: 10%;">
												<col style="width: 10%;">
												<thead>
													<tr>
														<th>단기대여금코드</th>
														<th>단기대여금명</th>
														<th>거래처코드</th>
		                                                <th>거래처명</th>
														<th>사원번호</th>
														<th>사원이름</th>
														<th>대여금액</th>
														<th>대여일</th>
														<th>만기일</th>
														<th>이자율</th>
													</tr>
												</thead>
		    
		                                        <tbody>
		                                            <c:set var="cnt" value="0"/>                               
		                                        	<c:forEach var="lo" items="${loan}">
		                                        		<tr>																			
			                                                <td><input type="text" onfocus = "focuse(${cnt});" name = "loanCode${cnt}" class="form-control" data-toggle="input-mask" style = "width: 100%; border:0px;" readonly onclick = "notfocus(this.name);" value = "${lo.loanCode}"></td>
			                                                <td><input type="text" id = "first${cnt}" onfocus = "focuse(${cnt});" name = "loanName${cnt}" class="form-control" data-toggle="input-mask" style = "width: 100%; border:0px;" onkeydown = "enter(this.tagName, this.name);" value = "${lo.loanName}"></td>
			                                                <td><input type="text" onfocus = "focuse(${cnt});" name = "AccCode${cnt}" class="form-control" onclick = "accountlist(${cnt})" data-toggle="input-mask" style = "width: 100%; border:0px;" onkeydown = "enter(this.tagName, this.name);" value = "${lo.customer_code}"></td>
			                                                <td><input type="text" onfocus = "focuse(${cnt});" name = "AccName${cnt}" class="form-control" data-toggle="input-mask" style = "width: 100%; border:0px;" readonly onclick = "notfocus(this.name);" value = "${lo.customer_name}"></td>
			                                                <td><input type="text" onfocus = "focuse(${cnt});" name = "username${cnt}" class="form-control" onclick = "userslist(${cnt})" data-toggle="input-mask" style = "width: 100%; border:0px;" onkeydown = "enter(this.tagName, this.name);" value = "${lo.username}"></td>
			                                                <td><input type="text" onfocus = "focuse(${cnt});" name = "ename${cnt}" class="form-control" data-toggle="input-mask" style = "width: 100%; border:0px;" readonly onclick = "notfocus(this.name);" value = "${lo.ename}"></td>
			                                                <td><input type="text" onfocus = "focuse(${cnt});" name = "price${cnt}" class="form-control" data-toggle="input-mask" style = "width: 100%; border:0px;" onkeydown = "enter(this.tagName, this.name);" value = "${lo.loan_s_price}"></td>
			                                                <td><input type="date" onfocus = "focuse(${cnt});" name = "startDay${cnt}" class="form-control" data-toggle="input-mask" style = "width: 100%; border:0px;" onkeydown = "enter(this.tagName, this.name);" value = "${lo.loan_s_date.substring(0,10)}"></td>
			                                                <td><input type="date" onfocus = "focuse(${cnt});" name = "endDay${cnt}" class="form-control" data-toggle="input-mask" style = "width: 100%; border:0px;" onkeydown = "enter(this.tagName, this.name);" value = "${lo.loan_s_expriration.substring(0,10)}"></td>
			                                                <td><input type="text" id = "enter${cnt}" onfocus = "focuse(${cnt});" name = "lend${cnt}" class="form-control" data-toggle="input-mask" style = "width: 100%; border:0px;" onkeydown = "enterupdate(${cnt});" value = "${lo.loan_s_interest}"></td>
			                                            </tr>
			                                            <c:set var="cnt" value="${cnt+1}"/>
		                                        	</c:forEach>
		                                            <tr>
		                                                <td><input type="text" onfocus = "focuse(${cnt});" name = "loanCode${cnt}" class="form-control" data-toggle="input-mask" style = "width: 100%; border:0px;" readonly onclick = "notfocus(this.name);"></td>
			                                            <td><input type="text" id = "first${cnt}" onfocus = "focuse(${cnt});" name = "loanName${cnt}" class="form-control" data-toggle="input-mask" style = "width: 100%; border:0px;" onkeydown = "enter(this.tagName, this.name);"></td>
			                                            <td><input type="text" onfocus = "focuse(${cnt});" name = "AccCode${cnt}" class="form-control" onclick = "accountlist(${cnt})" data-toggle="input-mask" style = "width: 100%; border:0px;" onkeydown = "enter(this.tagName, this.name);"></td>
			                                            <td><input type="text" onfocus = "focuse(${cnt});" name = "AccName${cnt}" class="form-control" data-toggle="input-mask" style = "width: 100%; border:0px;" readonly onclick = "notfocus(this.name);"></td>
			                                            <td><input type="text" onfocus = "focuse(${cnt});" name = "username${cnt}" class="form-control" onclick = "userslist(${cnt})" data-toggle="input-mask" style = "width: 100%; border:0px;" onkeydown = "enter(this.tagName, this.name);"></td>
			                                            <td><input type="text" onfocus = "focuse(${cnt});" name = "ename${cnt}" class="form-control" data-toggle="input-mask" style = "width: 100%; border:0px;" readonly onclick = "notfocus(this.name);"></td>
			                                            <td><input type="text" onfocus = "focuse(${cnt});" name = "price${cnt}" class="form-control" data-toggle="input-mask" style = "width: 100%; border:0px;" onkeydown = "enter(this.tagName, this.name);"></td>
			                                            <td><input type="date" onfocus = "focuse(${cnt});" name = "startDay${cnt}" class="form-control" data-toggle="input-mask" style = "width: 100%; border:0px;" onkeydown = "enter(this.tagName, this.name);"></td>
			                                            <td><input type="date" onfocus = "focuse(${cnt});" name = "endDay${cnt}" class="form-control" data-toggle="input-mask" style = "width: 100%; border:0px;" onkeydown = "enter(this.tagName, this.name);"></td>
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