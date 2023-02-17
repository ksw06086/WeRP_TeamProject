<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<%@ include file="../setting.jsp"%>
<script src="/erp/resources/assets/css/js/jquery-3.4.1.min.js"></script>
<script src="/erp/resources/assets/css/js/request.js"></script>
<script type="text/javascript">
			var daynum;
        	var count = 2;
        	var frontcursor;
        	var updatekey = 0;
        	var focusval;
        	var selectval;
        	var date = new Date();
       		var toyear = date.getFullYear(); //yyyy 
       		var tomonth = (1 + date.getMonth()); //M 
       		tomonth = tomonth >= 10 ? tomonth : '0' + tomonth; //month 두자리로 저장 
       		var today = date.getDate(); //d 
       		today = today >= 10 ? today : '0' + today; //day 두자리로 저장
       		function onload() {
       			if("${list}" != "") {
	        		$("#year").val("${year}");
	        		$("#month option:eq(${month-1})" ).prop("selected","selected");
	        		$("#day").val("${day}");
	        		$("#journalNum").val("${chkno}");
	        		count = parseInt("${listsize+2}");
	        		daynum = "${day}";
       			}
       		}
       		
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
        			if(!$("input[name=key" + keyval + "]").val()) {
        				focusval = "";
        			} else {
        				focusval = keyval;	
        			}
        			
        		});
        	}
        	
        	function RLenter(cc, dd) {
       			if(window.event.which == 97 || window.event.which == 49) {
           			$("input[name=" + dd + "]").val("차변");
           		} else if(window.event.which == 98 || window.event.which == 50) {
           			$("input[name=" + dd + "]").val("대변");
           		} else {
           			$("input[name=" + dd + "]").val("");
           		}
        	}
        	
        	function enter(cc, dd) {
        		if(cc == "INPUT") {
        			var swit = 0;
        			var nowme = $("input[name=" + dd + "]").parent();
        			if(window.event.which == 13){
            			if(dd == ("SubjectCode" + parseInt(dd.substring(dd.length-1,dd.length)))){
            				var popupX = Math.ceil((window.screen.width - 363)/2);
                        	var popupY = Math.ceil((window.screen.height - 528)/2);
                    		var url = "FT_Subject_list?key=" + $("*[name=SubjectCode" + parseInt(dd.substring(dd.length-1,dd.length)) + "]").val() + "&keyname=" + parseInt(dd.substring(dd.length-1,dd.length));
                    		window.open(url, "subject_list", "menubar=no, width=363px, height = 528px, left="+ popupX + ", top="+ popupY);
                    		return false;
            			}
            			if(dd == ("AccCode" + parseInt(dd.substring(dd.length-1,dd.length)))){
                        	var popupX = Math.ceil((window.screen.width - 363)/2);
                        	var popupY = Math.ceil((window.screen.height - 528)/2);
                    		var url = "FT_account_list?key=" + $("*[name=AccCode" + parseInt(dd.substring(dd.length-1,dd.length)) + "]").val() + "&keyname=" + parseInt(dd.substring(dd.length-1,dd.length));
                    		window.open(url, "account_list", "menubar=no, width=363px, height = 528px, left=" + popupX + ", top=" + popupY);
                    		return false;
            			}
        				for(var i = 0; i < $("input[name=" + dd + "]").parent().nextAll().children().length; i++){
        					nowme = nowme.next();
        					if(!nowme.children().attr("readonly")){
        						nowme.children().focus();
        						return false;
        					}
        				}
            		} else if(window.event.which == 9) {
            			if($("*[name=" + dd + "]").parent().parent().parent().parent().attr("class") == "table m-0 chit-table-colored-bordered chit-table-bordered-primary table-bordered"){
                			frontcursor = dd;
            				$(".chitsub-table-bordered-primary tbody #firstsub").focus();
            				$(".chitsub-table-bordered-primary tbody #firstsub").parent().prev().children().focus();
            			} else if($("*[name=" + dd + "]").parent().parent().parent().parent().attr("class") == "table m-0 chitsub-table-colored-bordered chitsub-table-bordered-primary table-bordered"){
            				$("*[name=" + frontcursor + "]").focus();
            				$("*[name=" + frontcursor + "]").parent().prev().children().focus();
            			}
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
						return false;
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
                	updatekey = 2;
        			$(".chit-table-bordered-primary tbody #enter" + vv).onclick();
					return false;
        		}
        		
        		// 자바스크립트 객체 생성
             	obj.key = $("input[name=key" + vv + "]").val();
         		obj.wname = $("input[name=writer" + vv + "]").val();
         		obj.fname = $("input[name=formaler" + vv + "]").val();
         		obj.date = $("#year").val() + "-" + $("#month").val() + "-" + $("#day").val();
         		obj.number = $("#journalNum").val();
         		obj.accountcode = $("input[name=AccCode" + vv + "]").val();
         		obj.subjectcode = $("input[name=SubjectCode" + vv + "]").val();
         		if($("input[name=RLstate" + vv + "]").val() == "대변"){
         			obj.leftprice = "0";
         			obj.leftcount = "0";
         			obj.rightprice = $("input[name=price" + vv + "]").val();
         			obj.rightcount = $("input[name=count" + vv + "]").val();
         		} else {
         			obj.rightprice = "0";
         			obj.rightcount = "0";
         			obj.leftprice = $("input[name=price" + vv + "]").val();
         			obj.leftcount = $("input[name=count" + vv + "]").val();
         		}
         		obj.text = $("input[name=text" + vv + "]").val();
         		obj.type = $("*[name=type" + vv + "]").val();
         		obj.updateday = $("input[name=updateday" + vv + "]").val();
        		
        		// json 객체를 String 객체로 변환 -- 
        		// 제이슨은 안드로이드에서 이제는 jsp로 하지 않고 안드로이드에서 뿌려줄 때 json 형식으로 불러와서 활용한다.
        		// 빅데이터 00데이터들은 실제 값들을 XML로 많이 사용할 것임
        		jsonData = JSON.stringify(obj);
        		/* sendRequest(load_insert, "FT_chitupdate", "post", jsonData); */
        		
        		$.ajax({
                       type : "POST",
                       url : "/erp/FT_chitupdate?${_csrf.parameterName }=${_csrf.token }",
                       data : jsonData,
                       contentType : 'application/json;charset=UTF-8',
                       success : function(data) {
                              if(updatekey == 0){
                  				
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
                              alert('서버 연결 도중 에러가 났습니다. 다시 시도해 주십시오.');
                       }
               });
        	}
        	
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
        	
        	function userslist() {
            	var popupX = Math.ceil((window.screen.width - 363)/2);
            	var popupY = Math.ceil((window.screen.height - 528)/2);
        		var url = "FT_users_list?key=" + $("#usercode").val();
        		window.open(url, "users_list", "menubar=no, width=363px, height = 528px, left=" + popupX + ", top=" + popupY);
        		
        	}
        	
        	function ajaxload() {
        		var obj = new Object();
        		var jsonData;
        		
        		if(!$("#year").val()){
        			alert("년도 입력해주세요");
        			$("#year").focus();
        			return false;
        		} else if(!$("#month").val()) {
        			alert("월을 입력해주세요");
        			$("#month").focus();
        			return false;
        		} else if(window.event.which == 13){
        			if(!$("#day").val()){
            			alert("날짜 입력해주세요!");
            			$("#day").focus();
            			return false;
            		} else if(parseInt($("#day").val()) > (new Date(obj.year, obj.month, 0)).getDate()){
            			alert("날짜가 초과되었습니다. 다시 입력해주세요");
            			$("#day").focus();
            			return false;
            		}

            		daynum = $("#day").val()
	        		// 자바스크립트 객체 생성
	        		obj.year = $("#year").val();
	        		obj.month = $("#month").val();
	        		obj.day = $("#day").val();
	        		
	        		// json 객체를 String 객체로 변환 -- 
	        		// 제이슨은 안드로이드에서 이제는 jsp로 하지 않고 안드로이드에서 뿌려줄 때 json 형식으로 불러와서 활용한다.
	        		// 빅데이터 00데이터들은 실제 값들을 XML로 많이 사용할 것임
	        		jsonData = JSON.stringify(obj);
	        		/* sendRequest(load_insert, "FT_chitupdate", "post", jsonData); */
	        		$.ajax({
	                       type : "POST",
	                       url : "/erp/FT_chitMaxNumber?${_csrf.parameterName }=${_csrf.token }",
	                       data : jsonData,
	                       contentType : 'application/json;charset=UTF-8',
	                       success : function(data) {
	                    	   $("#journalNum").attr("max", data);
	                    	   $("#journalNum").val(data);
	                    	   $(".chit-table-bordered-primary tbody").html('<tr>' +
	                                    '<input type = "hidden" name = "writer1" value = "${sessionScope.username}">' +
	                                    '<input type = "hidden" name = "formaler1" value = "">' +
	                                    '<td>' +
	                                    '<input type="text" onfocus = "focuse(1);" name = "date1" class="form-control" data-toggle="input-mask" data-mask-format="0000/00/00" style = "width: 100%; border:0px;" readonly onclick = "notfocus(this.name);" value = "' + daynum + '"></td>' +
	                                    '<td><input type="text" onfocus = "focuse(1);" name = "key1" class="form-control" data-toggle="input-mask" style = "width: 100%; border:0px;" readonly onclick = "notfocus(this.name);"></td>' +
	                                    '<td><input type="text" onfocus = "focuse(1);" name = "number1" class="form-control" data-toggle="input-mask" data-mask-format="00000" style = "width: 100%; border:0px;" readonly onclick = "notfocus(this.name);" value = "' + $("#journalNum").val() + '"></td>' +
	                                    '<td><input type="text" onfocus = "focuse(1);" id = "first1" name = "RLstate1" class="form-control" data-toggle="input-mask" style = "width: 100%; border:0px;" onkeyup = "RLenter(this.value, this.name);" onkeydown = "enter(this.tagName, this.name);"></td>' +
	                                    '<td><input type="text" onfocus = "focuse(1);" name = "SubjectCode1" class="form-control" onclick = "subjectlist(1)" data-toggle="input-mask" style = "width: 100%; border:0px;" onkeydown = "enter(this.tagName, this.name);"></td>' +
	                                    '<td><input type="text" onfocus = "focuse(1);" name = "SubjectName1" class="form-control" data-toggle="input-mask" style = "width: 100%; border:0px;" readonly onclick = "notfocus(this.name);"></td>' +
	                                    '<td><input type="text" onfocus = "focuse(1);" name = "AccCode1" class="form-control" onclick = "accountlist(1)" data-toggle="input-mask" style = "width: 100%; border:0px;" onkeydown = "enter(this.tagName, this.name);"></td>' +
	                                    '<td><input type="text" onfocus = "focuse(1);" name = "AccName1" class="form-control" data-toggle="input-mask" style = "width: 100%; border:0px;" readonly onclick = "notfocus(this.name);"></td>' +
	                                    '<td><input type="text" onfocus = "focuse(1);" name = "price1" class="form-control" data-toggle="input-mask" style = "width: 100%; border:0px;" onkeydown = "enter(this.tagName, this.name);"></td>' +
	                                    '<td><input type="text" onfocus = "focuse(1);" name = "count1" class="form-control" data-toggle="input-mask" style = "width: 100%; border:0px;" onkeydown = "enter(this.tagName, this.name);"></td>' +
	                                    '<td><input type="text" onfocus = "focuse(1);" name = "text1" class="form-control" data-toggle="input-mask" style = "width: 100%; border:0px;" onkeydown = "enter(this.tagName, this.name);"></td>' +
	                                    '<td><select class="form-control" id = "enter1" onfocus = "focuse(1);" name = "type1" style = "width: 100%; -webkit-appearance: none; border:0px;" onkeydown = "enter(this.tagName,this.name);" onchange="enterinsert(1);">' +
	                                    '<option value="0">== 선택 ==</option>' +
	                                    '<option value="1">일반</option>' +
	                                    '<option value="2">매입</option>' +
	                                    '<option value="3">매출</option>' +
	                                    '<option value="4">결산</option>' +
	                               		'</select></td>' +
	                                    '<td><input type="text" onfocus = "focuse(1);" name = "updateday1" class="form-control" data-toggle="input-mask" style = "width: 100%; border:0px;" readonly onclick = "notfocus(this.name);" value = "' + toyear + "-" + tomonth + "-" + today + '"></td>' +
	                                '</tr>');
	        						$("#first1").focus();
	                       },
	                       error : function(e) {
	                       		alert('서버 연결 도중 에러가 났습니다. 다시 시도해 주십시오.');
	                       }
	        		});
        		}
        	}
        	
        	function change() {
        		if(!$("#year").val()){
        			alert("년도 입력해주세요");
        			$("#year").focus();
        			return false;
        		} else if(!$("#month").val()) {
        			alert("월을 입력해주세요");
        			$("#month").focus();
        			return false;
        		} else if(!$("#day").val()){
        			alert("날짜 입력해주세요!");
        			$("#day").focus();
        			return false;
        		} else if(window.event.which == 13){
	        		var obj = new Object();
	        		var jsonData;
	        		
	        		if(parseInt($("#day").val()) > (new Date(obj.year, obj.month, 0)).getDate()){
	        			alert("날짜가 초과되었습니다. 다시 입력해주세요");
	        			$("#day").focus();
	        			return false;
	        		} else {
		        		// 자바스크립트 객체 생성
		        		obj.year = $("#year").val();
		        		obj.month = $("#month").val();
		        		obj.day = $("#day").val();
		        		obj.chkno = $("#journalNum").val();
		        		
		        		// json 객체를 String 객체로 변환 -- 
		        		// 제이슨은 안드로이드에서 이제는 jsp로 하지 않고 안드로이드에서 뿌려줄 때 json 형식으로 불러와서 활용한다.
		        		// 빅데이터 00데이터들은 실제 값들을 XML로 많이 사용할 것임
		        		jsonData = JSON.stringify(obj);
		        		/* sendRequest(load_insert, "FT_chitupdate", "post", jsonData); */
		        		$.ajax({
		                       type : "POST",
		                       url : "/erp/FT_chitDataLoad?${_csrf.parameterName }=${_csrf.token }",
		                       data : jsonData,
		                       contentType : 'application/json;charset=UTF-8',
		                       success : function(data) {
		                    	   $(".chit-table-bordered-primary tbody").html("");
		                    		var i = 0;
		                    	   if(data != null){
									for(i = 0; i < data.length; i++){
										var RLtype;
										var price;
										if(data[i].debtor_value == 0){
											RLtype = "대변";
										} else {
											RLtype = "차변";
										}
										
										if(data[i].debtor_value == 0){
											price = data[i].creditor_value;
										} else {
											price = data[i].debtor_value;
										}
										
										if(data[i].l_count_value == 0){
											count = data[i].r_count_value;
										} else {
											count = data[i].l_count_value;
										}
										$(".chit-table-bordered-primary tbody").append('<tr>' +
		                                    '<input type = "hidden" name = "writer' + (i+1) + '" value = "' + data[i].last_modi_user + '">' +
		                                    '<input type = "hidden" name = "formaler' + (i+1) + '" value = "' + data[i].fname + '">' +
		                                    '<td>' +
		                                    '<input type="text" onfocus = "focuse(' + (i+1) + ');" name = "date' + (i+1) + '" class="form-control" data-toggle="input-mask" data-mask-format="0000/00/00" style = "width: 100%; border:0px;" readonly onclick = "notfocus(this.name);" value = "' + $("#day").val() + '"></td>' +
		                                    '<td><input type="text" onfocus = "focuse(' + (i+1) + ');" name = "key' + (i+1) + '" class="form-control" data-toggle="input-mask" style = "width: 100%; border:0px;" readonly onclick = "notfocus(this.name);" value = "' + data[i].journal_code + '"></td>' +
		                                    '<td><input type="text" onfocus = "focuse(' + (i+1) + ');" name = "number' + (i+1) + '" class="form-control" data-toggle="input-mask" style = "width: 100%; border:0px;" readonly onclick = "notfocus(this.name);" value = "' + data[i].journal_number + '"></td>' +
		                                    '<td><input type="text" onfocus = "focuse(' + (i+1) + ');" id = "first' + (i+1) + '" name = "RLstate' + (i+1) + '" class="form-control" data-toggle="input-mask" style = "width: 100%; border:0px;" onkeyup = "RLenter(this.tagName, this.name);" value = "' + RLtype + '"></td>' +
		                                    '<td><input type="text" onfocus = "focuse(' + (i+1) + ');" name = "SubjectCode' + (i+1) + '" class="form-control" onclick = "subjectlist(' + (i+1) + ')" data-toggle="input-mask" style = "width: 100%; border:0px;" onkeydown = "enter(this.tagName, this.name);" value = "' + data[i].detail_ac_code + '"></td>' +
		                                    '<td><input type="text" onfocus = "focuse(' + (i+1) + ');" name = "SubjectName' + (i+1) + '" class="form-control" data-toggle="input-mask" style = "width: 100%; border:0px;" readonly onclick = "notfocus(this.name);" value = "' + data[i].account_name + '"></td>' +
		                                    '<td><input type="text" onfocus = "focuse(' + (i+1) + ');" name = "AccCode' + (i+1) + '" class="form-control" onclick = "accountlist(' + (i+1) + ')" data-toggle="input-mask" style = "width: 100%; border:0px;" onkeydown = "enter(this.tagName, this.name);" value = "' + data[i].customer_code + '"></td>' +
		                                    '<td><input type="text" onfocus = "focuse(' + (i+1) + ');" name = "AccName' + (i+1) + '" class="form-control" data-toggle="input-mask" style = "width: 100%; border:0px;" readonly onclick = "notfocus(this.name);" value = "' + data[i].customer_name + '"></td>' +
		                                    '<td><input type="text" onfocus = "focuse(' + (i+1) + ');" name = "price' + (i+1) + '" class="form-control" data-toggle="input-mask" style = "width: 100%; border:0px;" onkeydown = "enter(this.tagName, this.name);" value = "' + price + '"></td>' +
		                                    '<td><input type="text" onfocus = "focuse(' + (i+1) + ');" name = "count' + (i+1) + '" class="form-control" data-toggle="input-mask" style = "width: 100%; border:0px;" onkeydown = "enter(this.tagName, this.name);" value = "' + count + '"></td>' +
		                                    '<td><input type="text" onfocus = "focuse(' + (i+1) + ');" name = "text' + (i+1) + '" class="form-control" data-toggle="input-mask" style = "width: 100%; border:0px;" onkeydown = "enter(this.tagName, this.name);" value = "' + data[i].journal_abstract + '"></td>' +
		                                    '<td><select class="form-control" id = "enter' + (i+1) + '" onfocus = "focuse(' + (i+1) + ');" name = "type' + (i+1) + '" style = "width: 100%; -webkit-appearance: none; border:0px;" onkeydown = "enterupdate(' + (i+1) + ');" onchange="enterupdate(' + (i+1) + ');">' +
		                                    '<option value="0">== 선택 ==</option>' +
		                                    '<option value="1">일반</option>' +
		                                    '<option value="2">매입</option>' +
		                                    '<option value="3">매출</option>' +
		                                    '<option value="4">결산</option>' +
		                               		'</select></td>' +
		                                    '<td><input type="text" onfocus = "focuse(' + (i+1) + ');" name = "updateday' + (i+1) + '" class="form-control" data-toggle="input-mask" data-mask-format="0000/00/00" style = "width: 100%; border:0px;" readonly onclick = "notfocus(this.name);" value = "' + data[i].last_update + '"></td>' +
		                                '</tr>');
										$( "select[name=type" + (i+1) + "] option:eq(" + data[i].jr_state + ")" ).prop("selected","selected");
									}
		                    	   }
		                    	   i = i + 1;
		                    	   $(".chit-table-bordered-primary tbody").append('<tr>' +
		                                    '<input type = "hidden" name = "writer' + i + '" value = "${sessionScope.username}">' +
		                                    '<input type = "hidden" name = "formaler' + i + '" value = "">' +
		                                    '<td>' +
		                                    '<input type="text" onfocus = "focuse(' + i + ');" name = "date' + i + '" class="form-control" data-toggle="input-mask" data-mask-format="0000/00/00" style = "width: 100%; border:0px;" readonly onclick = "notfocus(this.name);" value = "' + daynum + '"></td>' +
		                                    '<td><input type="text" onfocus = "focuse(' + i + ');" name = "key' + i + '" class="form-control" data-toggle="input-mask" style = "width: 100%; border:0px;" readonly onclick = "notfocus(this.name);"></td>' +
		                                    '<td><input type="text" onfocus = "focuse(' + i + ');" name = "number' + i + '" class="form-control" data-toggle="input-mask" data-mask-format="00000" style = "width: 100%; border:0px;" readonly onclick = "notfocus(this.name);" value = "' + $("#journalNum").val() + '"></td>' +
		                                    '<td><input type="text" onfocus = "focuse(' + i + ');" id = "first' + i + '" name = "RLstate' + i + '" class="form-control" data-toggle="input-mask" style = "width: 100%; border:0px;" onkeyup = "RLenter(this.value, this.name);" onkeydown = "enter(this.tagName, this.name);"></td>' +
		                                    '<td><input type="text" onfocus = "focuse(' + i + ');" name = "SubjectCode' + i + '" class="form-control" onclick = "subjectlist(' + i + ')" data-toggle="input-mask" style = "width: 100%; border:0px;" onkeydown = "enter(this.tagName, this.name);"></td>' +
		                                    '<td><input type="text" onfocus = "focuse(' + i + ');" name = "SubjectName' + i + '" class="form-control" data-toggle="input-mask" style = "width: 100%; border:0px;" readonly onclick = "notfocus(this.name);"></td>' +
		                                    '<td><input type="text" onfocus = "focuse(' + i + ');" name = "AccCode' + i + '" class="form-control" onclick = "accountlist(' + i + ')" data-toggle="input-mask" style = "width: 100%; border:0px;" onkeydown = "enter(this.tagName, this.name);"></td>' +
		                                    '<td><input type="text" onfocus = "focuse(' + i + ');" name = "AccName' + i + '" class="form-control" data-toggle="input-mask" style = "width: 100%; border:0px;" readonly onclick = "notfocus(this.name);"></td>' +
		                                    '<td><input type="text" onfocus = "focuse(' + i + ');" name = "price' + i + '" class="form-control" data-toggle="input-mask" style = "width: 100%; border:0px;" onkeydown = "enter(this.tagName, this.name);"></td>' +
		                                    '<td><input type="text" onfocus = "focuse(' + i + ');" name = "count' + i + '" class="form-control" data-toggle="input-mask" style = "width: 100%; border:0px;" onkeydown = "enter(this.tagName, this.name);"></td>' +
		                                    '<td><input type="text" onfocus = "focuse(' + i + ');" name = "text' + i + '" class="form-control" data-toggle="input-mask" style = "width: 100%; border:0px;" onkeydown = "enter(this.tagName, this.name);"></td>' +
		                                    '<td><select class="form-control" id = "enter' + i + '" onfocus = "focuse(' + i + ');" name = "type' + i + '" style = "width: 100%; -webkit-appearance: none; border:0px;" onkeydown = "enter(this.tagName,this.name);" onchange="enterinsert(' + i + ');">' +
		                                    '<option value="0">== 선택 ==</option>' +
		                                    '<option value="1">일반</option>' +
		                                    '<option value="2">매입</option>' +
		                                    '<option value="3">매출</option>' +
		                                    '<option value="4">결산</option>' +
		                               		'</select></td>' +
		                                    '<td><input type="text" onfocus = "focuse(' + i + ');" name = "updateday' + i + '" class="form-control" data-toggle="input-mask" style = "width: 100%; border:0px;" readonly onclick = "notfocus(this.name);" value = "' + toyear + "-" + tomonth + "-" + today + '"></td>' +
		                                '</tr>');
		        						$("#first" + i).focus();
		        						count = i + 1;
		                       },
		                       error : function(e) {
		                       		alert('서버 연결 도중 에러가 났습니다. 다시 시도해 주십시오.');
		                       }
		        		});
	        		}
        		}
        	}
        	

        	function enterinsert(cc) {
        		var obj = new Object();
        		var jsonData;
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
        		}
        		frontcursor = $(".chit-table-bordered-primary tbody #enter" + cc).attr("name");
       			$(".chit-table-bordered-primary tbody #enter" + cc).attr("onchange", "enterupdate(" + cc + ");");
       			$(".chit-table-bordered-primary tbody #enter" + cc).attr("onkeydown", "enterupdate(" + cc + ");");
       			$(".chit-table-bordered-primary tbody").append('<tr>' +
                        '<input type = "hidden" name = "writer' + count + '" value = "${sessionScope.username}">' +
                        '<input type = "hidden" name = "formaler' + count + '" value = "">' +
                        '<td>' +
                        '<input type="text" onfocus = "focuse(' + count + ');" name = "date' + count + '" class="form-control" data-toggle="input-mask" data-mask-format="0000/00/00" style = "width: 100%; border:0px;" readonly onclick = "notfocus(this.name);" value = "' + daynum + '"></td>' +
                        '<td><input type="text" onfocus = "focuse(' + count + ');" name = "key' + count + '" class="form-control" data-toggle="input-mask" style = "width: 100%; border:0px;" readonly onclick = "notfocus(this.name);"></td>' +
                        '<td><input type="text" onfocus = "focuse(' + count + ');" name = "number' + count + '" class="form-control" data-toggle="input-mask" data-mask-format="00000" style = "width: 100%; border:0px;" readonly onclick = "notfocus(this.name);" value = "' + $("#journalNum").val() + '"></td>' +
                        '<td><input type="text" onfocus = "focuse(' + count + ');" id = "first' + count + '" name = "RLstate' + count + '" class="form-control" data-toggle="input-mask" style = "width: 100%; border:0px;" onkeyup = "RLenter(this.tagName, this.name);"></td>' +
                        '<td><input type="text" onfocus = "focuse(' + count + ');" name = "SubjectCode' + count + '" class="form-control" onclick = "subjectlist(' + count + ')" data-toggle="input-mask" style = "width: 100%; border:0px;" onkeydown = "enter(this.tagName, this.name);"></td>' +
                        '<td><input type="text" onfocus = "focuse(' + count + ');" name = "SubjectName' + count + '" class="form-control" data-toggle="input-mask" style = "width: 100%; border:0px;" readonly onclick = "notfocus(this.name);"></td>' +
                        '<td><input type="text" onfocus = "focuse(' + count + ');" name = "AccCode' + count + '" class="form-control" onclick = "accountlist(' + count + ')" data-toggle="input-mask" style = "width: 100%; border:0px;" onkeydown = "enter(this.tagName, this.name);"></td>' +
                        '<td><input type="text" onfocus = "focuse(' + count + ');" name = "AccName' + count + '" class="form-control" data-toggle="input-mask" style = "width: 100%; border:0px;" readonly onclick = "notfocus(this.name);"></td>' +
                        '<td><input type="text" onfocus = "focuse(' + count + ');" name = "price' + count + '" class="form-control" data-toggle="input-mask" style = "width: 100%; border:0px;" onkeydown = "enter(this.tagName, this.name);"></td>' +
                        '<td><input type="text" onfocus = "focuse(' + count + ');" name = "count' + count + '" class="form-control" data-toggle="input-mask" style = "width: 100%; border:0px;" onkeydown = "enter(this.tagName, this.name);"></td>' +
                        '<td><input type="text" onfocus = "focuse(' + count + ');" name = "text' + count + '" class="form-control" data-toggle="input-mask" style = "width: 100%; border:0px;" onkeydown = "enter(this.tagName, this.name);"></td>' +
                        '<td><select class="form-control" id = "enter' + count + '" onfocus = "focuse(' + count + ');" name = "type' + count + '" style = "width: 100%; -webkit-appearance: none; border:0px;" onkeydown = "enter(this.tagName,this.name);" onchange="enterinsert(' + count + ');">' +
                        '<option value="0">== 선택 ==</option>' +
                        '<option value="1">일반</option>' +
                        '<option value="2">매입</option>' +
                        '<option value="3">매출</option>' +
                        '<option value="4">결산</option>' +
                   		'</select></td>' +
                        '<td><input type="text" onfocus = "focuse(' + count + ');" name = "updateday' + count + '" class="form-control" data-toggle="input-mask" style = "width: 100%; border:0px;" readonly onclick = "notfocus(this.name);" value = "' + toyear + "-" + tomonth + "-" + today + '"></td>' +
                    '</tr>');
                    count = count + 1;
       			 $(".chit-table-bordered-primary tbody #first" + count).focus();

         		// 자바스크립트 객체 생성
         		obj.wname = $("input[name=writer" + cc + "]").val();
         		obj.fname = $("input[name=formaler" + cc + "]").val();
         		obj.date = $("#year").val() + "-" + $("#month").val() + "-" + $("#day").val();
         		obj.number = $("#journalNum").val();
         		obj.accountcode = $("input[name=AccCode" + cc + "]").val();
         		obj.subjectcode = $("input[name=SubjectCode" + cc + "]").val();
         		if($("input[name=RLstate" + cc + "]").val() == "대변"){
         			obj.leftprice = "0";
         			obj.leftcount = "0";
         			obj.rightprice = $("input[name=price" + cc + "]").val();
         			obj.rightcount = $("input[name=count" + cc + "]").val();
         		} else {
         			obj.rightprice = "0";
         			obj.rightcount = "0";
         			obj.leftprice = $("input[name=price" + cc + "]").val();
         			obj.leftcount = $("input[name=count" + cc + "]").val();
         		}
         		obj.text = $("input[name=text" + cc + "]").val();
         		obj.type = $("*[name=type" + cc + "]").val();
         		obj.updateday = $("input[name=updateday" + cc + "]").val();
         		
         		
         		// json 객체를 String 객체로 변환 -- 
         		// 제이슨은 안드로이드에서 이제는 jsp로 하지 않고 안드로이드에서 뿌려줄 때 json 형식으로 불러와서 활용한다.
         		// 빅데이터 00데이터들은 실제 값들을 XML로 많이 사용할 것임
         		jsonData = JSON.stringify(obj);
         		/* sendRequest(load_insert, "FT_chitupdate", "post", jsonData); */
         		
         		$.ajax({
                        type : "POST",
                        url : "/erp/FT_chitInsert?${_csrf.parameterName }=${_csrf.token }",
                        data : jsonData,
                        contentType : 'application/json;charset=UTF-8',
                        success : function(data) {
                        	$("input[name=key" + cc + "]").val(data);
                        },
                        error : function(e) {
                               alert('서버 연결 도중 에러가 났습니다. 다시 시도해 주십시오.');
                        }
                });
        	}
        	
        	function chitdelete() {
        		if(!focusval){
        			alert("등록되어 있는 분개를 선택해주세요!")
        		} else {
	        		var obj = new Object();
	        		var jsonData;
	        	
	        		// 자바스크립트 객체 생성
	        		obj.key = $("input[name=key" + focusval + "]").val();
	        		
	        		// json 객체를 String 객체로 변환 -- 
	        		// 제이슨은 안드로이드에서 이제는 jsp로 하지 않고 안드로이드에서 뿌려줄 때 json 형식으로 불러와서 활용한다.
	        		// 빅데이터 00데이터들은 실제 값들을 XML로 많이 사용할 것임
	        		jsonData = JSON.stringify(obj);
	        		/* sendRequest(load_insert, "FT_chitupdate", "post", jsonData); */
	        		$.ajax({
	                       type : "POST",
	                       url : "/erp/FT_chitDelete?${_csrf.parameterName }=${_csrf.token }",
	                       data : jsonData,
	                       contentType : 'application/json;charset=UTF-8',
	                       success : function(data) {
	                    	   alert(data);
	                    	   $("input[name=key" + focusval + "]").parent().parent().remove();
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

<body onload="onload();">

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
								 
								<h4 class="page-title" style="font-size: 25px;">전표입력</h4>
							</div>
						</div>
					</div>
					<!-- end page title -->

					<div class="row">
						<div class="col-sm-12">
							<div class="card">
								<div class="card-body table-responsive">
									<div align="right" style="margin-bottom: 30px;">
										<button type="button"
											class="btn btn-outline-primary waves-effect waves-light"
											onclick="chitdelete();">전표삭제</button>
										<br>
									</div>
									<table id="datatable"
										style="border-collapse: collapse; border-spacing: 0; width: 100%;">
										<tr>
											<td>년</td>
											<td><input type="text" class="" data-toggle="input-mask"
												data-mask-format="0000" placeholder="ex)2018"
												style="width: 100px;" id="year"></td>
											<td>월</td>
											<td><select class="" style="width: 50px;" id="month">
													<option value="1">1</option>
													<option value="2">2</option>
													<option value="3">3</option>
													<option value="4">4</option>
													<option value="5">5</option>
													<option value="6">6</option>
													<option value="7">7</option>
													<option value="8">8</option>
													<option value="9">9</option>
													<option value="10">10</option>
													<option value="11">11</option>
													<option value="12">12</option>
											</select></td>
											<td>일</td>
											<td><input type="text" class="" id="day"
												data-toggle="input-mask" data-mask-format="00"
												placeholder="ex)29" style="width: 100px;"
												onkeydown="ajaxload();"></td>
											<td>거래번호</td>
											<td><input type="number" class="" id="journalNum"
												data-toggle="input-mask" style="width: 100px;" min="0"
												max="0" value="0" onkeydown="change();"></td>

										</tr>
									</table>

									<div class="table-responsive" style="margin: 15px 0px 50px">
										<table
											class="table m-0 chit-table-colored-bordered chit-table-bordered-primary table-bordered">
											<col style="width: 5%;">
											<col style="width: 8%;">
											<col style="width: 5%">
											<col style="width: 8%;">
											<col style="width: 6%;">
											<col style="width: 10%;">
											<col style="width: 6%;">
											<col style="width: 10%;">
											<col style="width: 10%;">
											<col style="width: 5%;">
											<col style="width: 10%;">
											<col style="width: 7%;">
											<col style="width: 10%;">
											<thead>
												<tr>
													<th>일</th>
													<th>분개코드</th>
													<th>번호</th>
													<th>구분</th>
													<th>계정</th>
													<th>계정명</th>
													<th>거래처</th>
													<th>거래처명</th>
													<th>금액</th>
													<th>수량</th>
													<th>적요</th>
													<th>전표상태</th>
													<th>최종수정일</th>
												</tr>
											</thead>

											<tbody>
												<c:set var="cnt" value="0" />
												<c:if test="${list != null}">
													<c:forEach var="lists" items="${list}">
														<tr>
															
															<td><input type="hidden" name="writer${cnt}"
																value="${lists.last_modi_user}">
															<input type="hidden" name="formaler${cnt}"
																value="${lists.fname}">
																
																<input type="text" onfocus="focuse(${cnt + 1});"
																name="date${cnt + 1}" class="form-control"
																data-toggle="input-mask" data-mask-format="0000/00/00"
																placeholder="YYYY/DD/MM"
																style="width: 100%; border: 0px;" readonly
																onclick="notfocus(this.name);" value="${day}"></td>
															<td><input type="text" onfocus="focuse(${cnt + 1});"
																name="key${cnt + 1}" class="form-control"
																data-toggle="input-mask"
																style="width: 100%; border: 0px;" readonly
																onclick="notfocus(this.name);"
																value="${lists.journal_code}"></td>
															<td><input type="text" onfocus="focuse(${cnt + 1});"
																name="number${cnt + 1}" class="form-control"
																data-toggle="input-mask"
																style="width: 100%; border: 0px;" readonly
																onclick="notfocus(this.name);"
																value="${lists.journal_number}"></td>
															<c:if test="${lists.debtor_value == 0}">
																<td><input type="text"
																	onfocus="focuse(${cnt + 1});" id="first${cnt + 1}"
																	name="RLstate${cnt + 1}" class="form-control"
																	data-toggle="input-mask"
																	style="width: 100%; border: 0px;"
																	onkeyup="RLenter(this.tagName, this.name);" value="대변"></td>
															</c:if>
															<c:if test="${lists.debtor_value != 0}">
																<td><input type="text"
																	onfocus="focuse(${cnt + 1});" id="first${cnt + 1}"
																	name="RLstate${cnt + 1}" class="form-control"
																	data-toggle="input-mask"
																	style="width: 100%; border: 0px;"
																	onkeyup="RLenter(this.tagName, this.name);" value="차변"></td>
															</c:if>
															<td><input type="text" onfocus="focuse(${cnt + 1});"
																name="SubjectCode${cnt + 1}" class="form-control"
																onclick="subjectlist(${cnt + 1})"
																data-toggle="input-mask"
																style="width: 100%; border: 0px;"
																onkeydown="enter(this.tagName, this.name);"
																value="${lists.detail_ac_code}"></td>
															<td><input type="text" onfocus="focuse(${cnt + 1});"
																name="SubjectName${cnt + 1}" class="form-control"
																data-toggle="input-mask"
																style="width: 100%; border: 0px;" readonly
																onclick="notfocus(this.name);"
																value="${lists.account_name}"></td>
															<td><input type="text" onfocus="focuse(${cnt + 1});"
																name="AccCode${cnt + 1}" class="form-control"
									 							onclick="accountlist(${cnt + 1})"
																data-toggle="input-mask"
																style="width: 100%; border: 0px;"
																onkeydown="enter(this.tagName, this.name);"
																value="${lists.customer_code}"></td>
															<td><input type="text" onfocus="focuse(${cnt + 1});"
																name="AccName${cnt + 1}" class="form-control"
																data-toggle="input-mask"
																style="width: 100%; border: 0px;" readonly
																onclick="notfocus(this.name);"
																value="${lists.customer_name}"></td>
															<c:if test="${lists.debtor_value == 0}">
																<td><input type="text"
																	onfocus="focuse(${cnt + 1});" name="price${cnt + 1}"
																	class="form-control" data-toggle="input-mask"
																	style="width: 100%; border: 0px;"
																	onkeydown="enter(this.tagName, this.name);"
																	value="${lists.creditor_value}"></td>
															</c:if>
															<c:if test="${lists.debtor_value != 0}">
																<td><input type="text"
																	onfocus="focuse(${cnt + 1});" name="price${cnt + 1}"
																	class="form-control" data-toggle="input-mask"
																	style="width: 100%; border: 0px;"
																	onkeydown="enter(this.tagName, this.name);"
																	value="${lists.debtor_value}"></td>
															</c:if>
															<c:if test="${lists.l_count_value == 0}">
																<td><input type="text"
																	onfocus="focuse(${cnt + 1});" name="count${cnt + 1}"
																	class="form-control" data-toggle="input-mask"
																	style="width: 100%; border: 0px;"
																	onkeydown="enter(this.tagName, this.name);"
																	value="${lists.r_count_value}"></td>
															</c:if>
															<c:if test="${lists.l_count_value != 0}">
																<td><input type="text"
																	onfocus="focuse(${cnt + 1});" name="count${cnt + 1}"
																	class="form-control" data-toggle="input-mask"
																	style="width: 100%; border: 0px;"
																	onkeydown="enter(this.tagName, this.name);"
																	value="${lists.l_count_value}"></td>
															</c:if>
															<td><input type="text" onfocus="focuse(${cnt + 1});"
																name="text${cnt + 1}" class="form-control"
																data-toggle="input-mask"
																style="width: 100%; border: 0px;"
																onkeydown="enter(this.tagName, this.name);"
																value="${lists.journal_abstract}"></td>
															<td><select class="form-control"
																id="enter${cnt + 1}" onfocus="focuse(${cnt + 1});"
																name="type${cnt + 1}"
																style="width: 100%; -webkit-appearance: none; border: 0px;"
																onkeydown="enterupdate(${cnt + 1});"
																onchange="enterupdate(${cnt + 1});">
																	<c:if test="${lists.jr_state == 0}">
																		<option value="0" selected="selected">== 선택
																			==</option>
																		<option value="1">일반</option>
																		<option value="2">매입</option>
																		<option value="3">매출</option>
																		<option value="4">결산</option>
																	</c:if>
																	<c:if test="${lists.jr_state == 1}">
																		<option value="0">== 선택 ==</option>
																		<option value="1" selected="selected">일반</option>
																		<option value="2">매입</option>
																		<option value="3">매출</option>
																		<option value="4">결산</option>
																	</c:if>
																	<c:if test="${lists.jr_state == 2}">
																		<option value="0">== 선택 ==</option>
																		<option value="1">일반</option>
																		<option value="2" selected="selected">매입</option>
																		<option value="3">매출</option>
																		<option value="4">결산</option>
																	</c:if>
																	<c:if test="${lists.jr_state == 3}">
																		<option value="0">== 선택 ==</option>
																		<option value="1">일반</option>
																		<option value="2">매입</option>
																		<option value="3" selected="selected">매출</option>
																		<option value="4">결산</option>
																	</c:if>
																	<c:if test="${lists.jr_state == 4}">
																		<option value="0">== 선택 ==</option>
																		<option value="1">일반</option>
																		<option value="2">매입</option>
																		<option value="3">매출</option>
																		<option value="4" selected="selected">결산</option>
																	</c:if>

															</select></td>
															<td><input type="text" onfocus="focuse(${cnt + 1});"
																name="updateday${cnt + 1}" class="form-control"
																data-toggle="input-mask" data-mask-format="0000/00/00"
																placeholder="YYYY/DD/MM"
																style="width: 100%; border: 0px;" readonly
																onclick="notfocus(this.name);"
																value="${lists.last_update}"></td>
															<c:set var="cnt" value="${cnt + 1}" />
														</tr>
													</c:forEach>
													<tr>
														<input type = "hidden" name = "writer${cnt + 1}">
								                        <input type = "hidden" name = "formaler${cnt + 1}">
								                        <td>
								                        <input type="text" onfocus = "focuse(${cnt + 1});" name = "date${cnt + 1}" class="form-control" data-toggle="input-mask" data-mask-format="0000/00/00" style = "width: 100%; border:0px;" readonly onclick = "notfocus(this.name);" value="${day}"></td>
								                        <td><input type="text" onfocus = "focuse(${cnt + 1});" name = "key${cnt + 1}" class="form-control" data-toggle="input-mask" style = "width: 100%; border:0px;" readonly onclick = "notfocus(this.name);"></td>
								                        <td><input type="text" onfocus = "focuse(${cnt + 1});" name = "number${cnt + 1}" class="form-control" data-toggle="input-mask" data-mask-format="00000" style = "width: 100%; border:0px;" readonly onclick = "notfocus(this.name);" value = "${chkno}"></td>
								                        <td><input type="text" onfocus = "focuse(${cnt + 1});" id = "first${cnt + 1}" name = "RLstate${cnt + 1}" class="form-control" data-toggle="input-mask" style = "width: 100%; border:0px;" onkeyup = "RLenter(this.tagName, this.name);"></td>
								                        <td><input type="text" onfocus = "focuse(${cnt + 1});" name = "SubjectCode${cnt + 1}" class="form-control" onclick = "subjectlist(${cnt + 1})" data-toggle="input-mask" style = "width: 100%; border:0px;" onkeydown = "enter(this.tagName, this.name);"></td>
								                        <td><input type="text" onfocus = "focuse(${cnt + 1});" name = "SubjectName${cnt + 1}" class="form-control" data-toggle="input-mask" style = "width: 100%; border:0px;" readonly onclick = "notfocus(this.name);"></td>
								                        <td><input type="text" onfocus = "focuse(${cnt + 1});" name = "AccCode${cnt + 1}" class="form-control" onclick = "accountlist(${cnt + 1})" data-toggle="input-mask" style = "width: 100%; border:0px;" onkeydown = "enter(this.tagName, this.name);"></td>
								                        <td><input type="text" onfocus = "focuse(${cnt + 1});" name = "AccName${cnt + 1}" class="form-control" data-toggle="input-mask" style = "width: 100%; border:0px;" readonly onclick = "notfocus(this.name);"></td>
								                        <td><input type="text" onfocus = "focuse(${cnt + 1});" name = "price${cnt + 1}" class="form-control" data-toggle="input-mask" style = "width: 100%; border:0px;" onkeydown = "enter(this.tagName, this.name);"></td>
								                        <td><input type="text" onfocus = "focuse(${cnt + 1});" name = "count${cnt + 1}" class="form-control" data-toggle="input-mask" style = "width: 100%; border:0px;" onkeydown = "enter(this.tagName, this.name);"></td>
								                        <td><input type="text" onfocus = "focuse(${cnt + 1});" name = "text${cnt + 1}" class="form-control" data-toggle="input-mask" style = "width: 100%; border:0px;" onkeydown = "enter(this.tagName, this.name);"></td>
								                        <td><select class="form-control" id = "enter' + count + '" onfocus = "focuse(${cnt + 1});" name = "type${cnt + 1}" style = "width: 100%; -webkit-appearance: none; border:0px;" onkeydown = "enter(this.tagName,this.name);" onchange="enterinsert(${cnt + 1});">
								                        <option value="0">== 선택 ==</option>
								                        <option value="1">일반</option>
								                        <option value="2">매입</option>
								                        <option value="3">매출</option>
								                        <option value="4">결산</option>
								                   		</select></td>
								                        <td><input type="text" onfocus = "focuse(${cnt + 1});" name = "updateday${cnt + 1}" class="form-control" data-toggle="input-mask" style = "width: 100%; border:0px;" readonly onclick = "notfocus(this.name);"></td>
							                        </tr>
												</c:if>
											</tbody>
										</table>
									</div>

									<!-- <div class="table-responsive" style = "margin: 0px 0px 50px">
                                            <table class="table m-0 chitsub-table-colored-bordered chitsub-table-bordered-primary table-bordered">
                                                <col style = "width:5%;">
                                                <col style = "width:10%;">
                                                <col style = "width:5%">
                                                <col style = "width:10%;">
                                                <col style = "width:5%;">
                                                <col style = "width:10%;">
                                                <col style = "width: 10%;">
                                                <col style = "width: 10%;">
                                                <col style = "width: 5%;">
                                                <col style = "width: 10%;">
                                                <col style = "width: 10%;">
                                                <col style = "width: 5%;">
                                                <col style = "width: 5%;">
                                                <thead>
                                                    <tr>
		                                                <th>순번</th>
		                                                <th>구분</th>
		                                                <th>코드</th>
		                                                <th>계정과목</th>
		                                                <th>코드</th>
		                                                <th>거래처명</th>
		                                                <th>사업자(주민)번호</th>
		                                                <th>금액</th>
		                                                <th>No</th>
		                                                <th>적요명</th>
		                                                <th>증빙</th>
		                                                <th>전자</th>
		                                                <th>국세청</th>
		                                            </tr>
		                                      	</thead>
		    
		                                        <tbody>
		                                            
		                                        </tbody>
                                            </table>
                                        </div> -->
								</div>
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