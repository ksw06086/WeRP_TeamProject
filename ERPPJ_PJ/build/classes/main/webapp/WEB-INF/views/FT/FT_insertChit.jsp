<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <%@ include file="../setting.jsp" %>
        <script src="/erp/resources/assets/css/js/jquery-3.4.1.min.js"></script> 
        <script type="text/javascript">
        	var count = 1;	
        
        	function inin() {
        		alert("dkdkk");
        	}
        	function focuse() {
        		$(".chit-table-bordered-primary tbody *").focus(function() {
        			$(".chit-table-bordered-primary tbody *").css("background-color", "");
        			$(this).parent().parent().children().children().css("background-color", "#D6EAF8");
        			$(this).parent().parent().children().css("background-color", "#D6EAF8");
        			$(this).css("background-color", "");
        			$(this).parent().css("background-color", "");
        		});
        	}
        	
        	function enterupdate(vv) {
        		if(event.keyCode == 13) {
        			alert(vv + 100);
        		}
        	}
        	
        	function enterinsert(cc) {
        		if(event.keyCode == 13) {
        			alert(cc);
        			alert(count);
        			$(".chit-table-bordered-primary tbody #enter").attr("onkeyup", "enterupdate(" + cc + ");");
        			$(".chit-table-bordered-primary tbody #enter").attr("id", "enter" + cc);
        			$(".chit-table-bordered-primary tbody #first").attr("id", "first" + cc);
        			$(".chit-table-bordered-primary tbody").append('<tr>' +
                            '<td><input type="text" onfocus = "focuse();" name = "date' + count + '" id = "first" class="form-control" data-toggle="input-mask" data-mask-format="0000/00/00" placeholder = "YYYY/DD/MM" style = "width: 150px; border:0px;"></td>' +
                            '<td><input type="text" onfocus = "focuse();" name = "number' + count + '" class="form-control" data-toggle="input-mask" data-mask-format="00000" placeholder = "ex)10001" style = "width: 150px; border:0px;"></td>' +
                            '<td><input type="text" onfocus = "focuse();" name = "no' + count + '" class="form-control" onclick = "inin();" data-toggle="input-mask" style = "width: 50px; border:0px;"></td>' +
                            '<td><input type="text" onfocus = "focuse();" name = "text' + count + '" class="form-control" data-toggle="input-mask" style = "width: 200px; border:0px;"></td>' +
                            '<td><select class="form-control" onfocus = "focuse();" name = "type' + count + '" style = "width: 100px; -webkit-appearance: none; border:0px;">' +
                            '<option value="??????">??????</option>' +
                            '<option value="??????">??????</option>' +
                            '<option value="??????">??????</option>' +
                            '<option value="??????">??????</option>' +
                       		'</select></td>' +
                            '<td><input type="text" onfocus = "focuse();" name = "num' + count + '" class="form-control" data-toggle="input-mask" style = "width: 200px; border:0px;"></td>' +
                            '<td><select class="form-control" onfocus = "focuse();" name = "state' + count + '" style = "width: 100px; -webkit-appearance: none; border:0px;">' +
                            '<option value="??????">??????</option>' +
                       		'</select></td>' +
                            '<td><input type="text" onfocus = "focuse();" name = "confirmname' + count + '" class="form-control" data-toggle="input-mask" style = "width: 100px; border:0px;"></td>' +
                            '<td><input type="text" onfocus = "focuse();" name = "devprice' + count + '" class="form-control" data-toggle="input-mask" style = "width: 100px; border:0px;"></td>' +
                            '<td><input type="text" onfocus = "focuse();" name = "writer' + count + '" class="form-control" data-toggle="input-mask" style = "width: 100px; border:0px;"></td>' +
                           '<td><input type="text" onfocus = "focuse();" name = "slee' + count + '" id = "enter" class="form-control" data-toggle="input-mask" style = "width: 100px; border:0px;" onkeyup="enterinsert(' + count + ');"></td>' +
                        '</tr>');
                     count = count + 1;
                     alert(count);
        			 $(".chit-table-bordered-primary tbody #first").focus();
        		}
        	}
        </script>
        <!-- Table datatable css -->
        <link href="/erp/resources/assets/libs/datatables/dataTables.bootstrap4.min.css" rel="stylesheet" type="text/css" />
        <link href="/erp/resources/assets/libs/datatables/responsive.bootstrap4.min.css" rel="stylesheet" type="text/css" />
        <link href="/erp/resources/assets/libs/datatables/buttons.bootstrap4.min.css" rel="stylesheet" type="text/css" />
        <link href="/erp/resources/assets/libs/datatables/fixedHeader.bootstrap4.min.css" rel="stylesheet" type="text/css" />
        <link href="/erp/resources/assets/libs/datatables/scroller.bootstrap4.min.css" rel="stylesheet" type="text/css" />
        <link href="/erp/resources/assets/libs/datatables/dataTables.colVis.css" rel="stylesheet" type="text/css" />
        <link href="/erp/resources/assets/libs/datatables/fixedcolumns.bootstrap4.min.css" rel="stylesheet" type="text/css" />
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
                                        <h4 class="header-title">Example</h4>
                                        <div align="right" style = "margin-bottom: 30px;">
    									<button type="button" class="btn btn-outline-primary waves-effect waves-light">????????????</button>
    									<button type="button" class="btn btn-outline-primary waves-effect waves-light">????????????</button>
    									<button type="button" class="btn btn-outline-primary waves-effect waves-light">????????????</button>
    									<button type="button" class="btn btn-outline-primary waves-effect waves-light">??????????????????</button>
    									<button type="button" class="btn btn-outline-primary waves-effect waves-light">????????????</button>
    									<button type="button" class="btn btn-outline-primary waves-effect waves-light">????????????</button>
    									<br>
    									</div>
    									<table id="datatable" style="border-collapse: collapse; border-spacing: 0; width: 100%;">
                                            <tr>
                                                <td>????????????</td>
                                                <td>
                                                	<input type="text" class="">&nbsp;<a href="#"><i class="dripicons-zoom-in"></i></a>
                                                </td>
                                                
                                                <td>????????????</td>
                                                <td>.. / .. / ..</td>
                                                
                                                <td>
                                                <!-- ?????? ?????? ?????? ?????? -->
                                                </td>
                                                <td>????????????</td>
                                                <td><input type="text" class="">&nbsp;<a href="#"><i class="dripicons-zoom-in"></i></a>
                                                	<input type="text" class="" readonly>
                                                </td>
                                               
                                                <td>?????????</td>
                                            	<td><input type="text" class="">&nbsp;<a href="#"><i class="dripicons-zoom-in"></i></a></td>
                                            </tr>
                                        </table>
                                        
                                       <div class="table-responsive" style = "margin: 15px 0px 50px">
                                            <table class="table m-0 chit-table-colored-bordered chit-table-bordered-primary table-bordered">
                                                <col style = "width:150px;">
                                                <col style = "width:150px;">
                                                <col style = "width:50px;">
                                                <col style = "width:200px;">
                                                <col style = "width: 100px;">
                                                <col style = "width:200px;">
                                                <col style = "width: 100px;">
                                                <col style = "width: 100px;">
                                                <col style = "width: 100px;">
                                                <col style = "width: 100px;">
                                                <col style = "width: 100px;">
                                                <thead>
                                                    <tr>
		                                                <th>???</th>
		                                                <th>??????</th>
		                                                <th>No</th>
		                                                <th>????????????</th>
		                                                <th>??????</th>
		                                                <th>????????????</th>
		                                                <th>??????</th>
		                                                <th>?????????</th>
		                                                <th>????????????</th>
		                                                <th>?????????</th>
		                                                <th>????????????</th>
		                                            </tr>
		                                        </thead>
		    
		    
		                                        <tbody>
		                                            <tr>
		                                                <td><input type="text" onfocus = "focuse();" name = "date0" id = "first" class="form-control" data-toggle="input-mask" data-mask-format="0000/00/00" placeholder = "YYYY/DD/MM" style = "width: 150px; border:0px;"></td>
		                                                <td><input type="text" onfocus = "focuse();" name = "number0" class="form-control" data-toggle="input-mask" data-mask-format="00000" placeholder = "ex)10001" style = "width: 150px; border:0px;"></td>
		                                                <td><input type="text" onfocus = "focuse();" name = "no0" class="form-control" onclick = "inin();" data-toggle="input-mask" style = "width: 50px; border:0px;"></td>
		                                                <td><input type="text" onfocus = "focuse();" name = "text0" class="form-control" data-toggle="input-mask" style = "width: 200px; border:0px;"></td>
		                                                <td><select class="form-control" onfocus = "focuse();" name = "type0" style = "width: 100px; -webkit-appearance: none; border:0px;">
		                                                <option value="??????">??????</option>
		                                                <option value="??????">??????</option>
		                                                <option value="??????">??????</option>
		                                                <option value="??????">??????</option>
			                                       		</select></td>
		                                                <td><input type="text" onfocus = "focuse();" name = "num0" class="form-control" data-toggle="input-mask" style = "width: 200px; border:0px;"></td>
		                                                <td><select class="form-control" onfocus = "focuse();" name = "state0" style = "width: 100px; -webkit-appearance: none; border:0px;">
		                                                <option value="??????">??????</option>
			                                       		</select></td>
		                                                <td><input type="text" onfocus = "focuse();" name = "confirmname0" class="form-control" data-toggle="input-mask" style = "width: 100px; border:0px;"></td>
		                                                <td><input type="text" onfocus = "focuse();" name = "devprice0" class="form-control" data-toggle="input-mask" style = "width: 100px; border:0px;"></td>
		                                                <td><input type="text" onfocus = "focuse();" name = "writer0" class="form-control" data-toggle="input-mask" style = "width: 100px; border:0px;"></td>
		                                                <td><input type="text" onfocus = "focuse();" name = "slee0" id = "enter" class="form-control" data-toggle="input-mask" style = "width: 100px; border:0px;" onkeyup="enterinsert(0);"></td>
		                                            </tr>
		                                        </tbody>
                                            </table>
                                        </div>
                                        
                                        <div class="table-responsive" style = "margin: 0px 0px 50px">
                                            <table class="table m-0 table-colored-bordered table-bordered-primary table-hover table-bordered">
                                                <thead>
                                                    <tr>
		                                                <th>??????</th>
		                                                <th>??????</th>
		                                                <th>??????</th>
		                                                <th>????????????</th>
		                                                <th>??????</th>
		                                                <th>????????????</th>
		                                                <th>?????????(??????)??????</th>
		                                                <th>??????</th>
		                                                <th>No</th>
		                                                <th>?????????</th>
		                                                <th>??????</th>
		                                                <th>??????</th>
		                                                <th>?????????</th>
		                                            </tr>
		                                      	</thead>
		    
		    
		                                        <tbody>
		                                            <tr>
		                                            	<td>1</td>
		                                                <td>??????</td>
		                                                <td>500050</td>
		                                                <td>????????????</td>
		                                                <td></td>
		                                                <td></td>
		                                                <td></td>
		                                                <td>32,000,000</td>
		                                                <td>1</td>
		                                                <td>?????????????????? ?????????</td>
		                                                <td>??????</td>
		                                                <td>PJT???</td>
		                                                <td>??????</td>
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
                

                <!-- Footer Start -->
                <footer class="footer">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-md-6">
                                2016 - 2019 &copy; Codefox theme by <a href="">Coderthemes</a>
                            </div>
                            <div class="col-md-6">
                                <div class="text-md-right footer-links d-none d-sm-block">
                                    <a href="#">About Us</a>
                                    <a href="#">Help</a>
                                    <a href="#">Contact Us</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </footer>
                <!-- end Footer -->

            </div>

            <!-- ============================================================== -->
            <!-- End Page content -->
            <!-- ============================================================== -->

        </div>
        <!-- END wrapper -->

        <!-- Right Sidebar -->
        <div class="right-bar">
            <div class="rightbar-title">
                <a href="javascript:void(0);" class="right-bar-toggle float-right">
                    <i class="mdi mdi-close"></i>
                </a>
                <h5 class="m-0 text-white">Settings</h5>
            </div>
            <div class="slimscroll-menu">
                <hr class="mt-0">
                <h5 class="pl-3">Basic Settings</h5>
                <hr class="mb-0" />


                <div class="p-3">
                    <div class="custom-control custom-checkbox mb-2">
                        <input type="checkbox" class="custom-control-input" id="customCheck1" checked>
                        <label class="custom-control-label" for="customCheck1">Notifications</label>
                    </div>
                    <div class="custom-control custom-checkbox mb-2">
                        <input type="checkbox" class="custom-control-input" id="customCheck2" checked>
                        <label class="custom-control-label" for="customCheck2">API Access</label>
                    </div>
                    <div class="custom-control custom-checkbox mb-2">
                        <input type="checkbox" class="custom-control-input" id="customCheck3">
                        <label class="custom-control-label" for="customCheck3">Auto Updates</label>
                    </div>
                    <div class="custom-control custom-checkbox mb-2">
                        <input type="checkbox" class="custom-control-input" id="customCheck4" checked>
                        <label class="custom-control-label" for="customCheck4">Online Status</label>
                    </div>
                    <div class="custom-control custom-checkbox">
                        <input type="checkbox" class="custom-control-input" id="customCheck5">
                        <label class="custom-control-label" for="customCheck5">Auto Payout</label>
                    </div>
                </div>

                <!-- Timeline -->
                <hr class="mt-0" />
                <h5 class="pl-3 pr-3">Timeline</h5>
                <hr class="mb-0" />

                <div class="p-3">
                    <ul class="list-unstyled activity-widget">
                        <li class="activity-list">
                            <p class="mb-0"><small>08 July</small></p>
                            <p>Neque porro quisquam est</p>
                        </li>
                        <li class="activity-list">
                            <p class="mb-0"><small>09 July</small></p>
                            <p>Ut enim ad minima veniam quis velit esse </p>
                        </li>
                        <li class="activity-list">
                            <p class="mb-0"><small>10 July</small></p>
                            <p>Quis autem vel eum iure</p>
                        </li>
                    </ul>
                </div>

                <!-- Messages -->
                <hr class="mt-0" />
                <h5 class="pl-3 pr-3">Messages <span class="float-right badge badge-pill badge-danger">24</span></h5>
                <hr class="mb-0" />
                <div class="p-3">
                    <div class="inbox-widget">
                        <div class="inbox-item">
                            <div class="inbox-item-img"><img src="assets/images/users/avatar-1.jpg" class="rounded-circle" alt=""></div>
                            <p class="inbox-item-author"><a href="javascript: void(0);">Chadengle</a></p>
                            <p class="inbox-item-text">Hey! there I'm available...</p>
                            <p class="inbox-item-date">13:40 PM</p>
                        </div>
                        <div class="inbox-item">
                            <div class="inbox-item-img"><img src="assets/images/users/avatar-2.jpg" class="rounded-circle" alt=""></div>
                            <p class="inbox-item-author"><a href="javascript: void(0);">Tomaslau</a></p>
                            <p class="inbox-item-text">I've finished it! See you so...</p>
                            <p class="inbox-item-date">13:34 PM</p>
                        </div>
                        <div class="inbox-item">
                            <div class="inbox-item-img"><img src="assets/images/users/avatar-3.jpg" class="rounded-circle" alt=""></div>
                            <p class="inbox-item-author"><a href="javascript: void(0);">Stillnotdavid</a></p>
                            <p class="inbox-item-text">This theme is awesome!</p>
                            <p class="inbox-item-date">13:17 PM</p>
                        </div>

                        <div class="inbox-item">
                            <div class="inbox-item-img"><img src="assets/images/users/avatar-4.jpg" class="rounded-circle" alt=""></div>
                            <p class="inbox-item-author"><a href="javascript: void(0);">Kurafire</a></p>
                            <p class="inbox-item-text">Nice to meet you</p>
                            <p class="inbox-item-date">12:20 PM</p>

                        </div>
                        <div class="inbox-item">
                            <div class="inbox-item-img"><img src="assets/images/users/avatar-5.jpg" class="rounded-circle" alt=""></div>
                            <p class="inbox-item-author"><a href="javascript: void(0);">Shahedk</a></p>
                            <p class="inbox-item-text">Hey! there I'm available...</p>
                            <p class="inbox-item-date">10:15 AM</p>

                        </div>
                    </div> <!-- end inbox-widget -->
                </div> <!-- end .p-3-->

            </div> <!-- end slimscroll-menu-->
        </div>
        <!-- /Right-bar -->

        <!-- Right bar overlay-->
        <div class="rightbar-overlay"></div>

        <!-- Vendor js -->
        <script src="/erp/resources/assets/js/vendor.min.js"></script>

        <!-- Bootstrap select plugin -->
        <script src="/erp/resources/assets/libs/bootstrap-select/bootstrap-select.min.js"></script>

        <!-- Datatable plugin js -->
        <script src="/erp/resources/assets/libs/datatables/jquery.dataTables.min.js"></script>
        <script src="/erp/resources/assets/libs/datatables/dataTables.bootstrap4.min.js"></script>

        <script src="/erp/resources/assets/libs/datatables/dataTables.responsive.min.js"></script>
        <script src="/erp/resources/assets/libs/datatables/responsive.bootstrap4.min.js"></script>

        <script src="/erp/resources/assets/libs/datatables/dataTables.buttons.min.js"></script>
        <script src="/erp/resources/assets/libs/datatables/buttons.bootstrap4.min.js"></script>

        <script src="/erp/resources/assets/libs/datatables/buttons.html5.min.js"></script>
        <script src="/erp/resources/assets/libs/datatables/buttons.print.min.js"></script>

        <script src="/erp/resources/assets/libs/datatables/dataTables.keyTable.min.js"></script>
        <script src="/erp/resources/assets/libs/datatables/dataTables.fixedHeader.min.js"></script>
        <script src="/erp/resources/assets/libs/datatables/dataTables.scroller.min.js"></script>
        <script src="/erp/resources/assets/libs/datatables/dataTables.colVis.js"></script>
        <script src="/erp/resources/assets/libs/datatables/dataTables.fixedColumns.min.js"></script>
        <!-- Plugins js -->
        <script src="/erp/resources/assets/libs/jquery-mask-plugin/jquery.mask.min.js"></script>
        <script src="/erp/resources/assets/libs/autonumeric/autoNumeric-min.js"></script>
		<script src="/erp/resources/assets/libs/select2/select2.min.js"></script>
        <script src="/erp/resources/assets/libs/jquery-mockjax/jquery.mockjax.min.js"></script>
        <script src="/erp/resources/assets/libs/autocomplete/jquery.autocomplete.min.js"></script>
        <script src="/erp/resources/assets/libs/bootstrap-tagsinput/bootstrap-tagsinput.min.js"></script>
        <script src="/erp/resources/assets/libs/switchery/switchery.min.js"></script>
        <script src="/erp/resources/assets/libs/bootstrap-maxlength/bootstrap-maxlength.min.js"></script>
        <script src="/erp/resources/assets/libs/bootstrap-touchspin/jquery.bootstrap-touchspin.min.js"></script>
        <script src="/erp/resources/assets/libs/bootstrap-filestyle2/bootstrap-filestyle.min.js"></script>
		
        <!-- Init js-->
        <script src="/erp/resources/assets/js/pages/form-masks.init.js"></script>

        <script src="/erp/resources/assets/libs/jszip/jszip.min.js"></script>
        <script src="/erp/resources/assets/libs/pdfmake/pdfmake.min.js"></script>
        <script src="/erp/resources/assets/libs/pdfmake/vfs_fonts.js"></script>

        <script src="/erp/resources/assets/js/pages/datatables.init.js"></script>
		
        <!-- form advanced init js -->
        <script src="/erp/resources/assets/js/pages/form-advanced.init.js"></script>

        <!-- App js -->
        <script src="/erp/resources/assets/js/app.min.js"></script>
        
        
    </body>
</html>