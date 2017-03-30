<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<!-- jQuery -->
<script src="js/jquery.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="js/bootstrap.min.js"></script>

<title>Admin - Quản lý cửa tiệm cầm đồ</title>

<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="css/sb-admin.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="css/font-awesome.min.css" rel="stylesheet" type="text/css">

<style>
	  .modal-header, h4, .close {
	      background-color: #71cbda;
	      color:white !important;
	      text-align: center;
	      font-size: 18px;
	  }
	  
	  div#myModalUp {
	    padding-left: 210px;
	}
  </style>
  
  <!-- ajax -->
<script type="text/javascript">
    	
    	//load data ajax server -> client
    	function loadDataAjax(){
			$.ajax({
				type:'POST',
				async: false,
				url:'/QuanLyCamDov1.0.4/hop-dong.do',
				cache:false,
				dataType:'json',
				success: function (response){
					var arr = [];
					
					var rs="";
					
					//chuyển đổi JSONObject -> JSON
					var JsonList=response.jsonArray;
					
					//chuyển đổi JSONObject -> JSON
					var JsonPages=response.pages;
					
					for ( var key in JsonList) {
                    	//set data from json to array
                    	arr.push(key);
                    	
                    	console.log(arr);
					}
					
					/* $.each(response, function(key, value) {
					      var tblRow = "<tr>" + "<td>" + f.id + "</td>" + "<td>" + f.user.username + "</td>" + "<td>" + f.message + "</td>" + "<td> " + f.location + "</td>" +  "<td>" + f.at + "</td>" + "</tr>"
					       $(tblRow).appendTo("#showall tbody");
					 }); */
					
					if(arr.length!=0){
						
 						for ( var re in JsonList) {
    					    	 
    					    	rs+="<tr>"
			                        	+"<th>"
						                	+""+JsonList[re].maCTHD+""
										+"</th>"
						                +"<td>"
						                	+""+JsonList[re].khachHang.tenKhachHang+""
						                +"</td>"
						                +"<td>"
						                	+""+JsonList[re].laiSuat.mucLaiSuat+""
										+"</td>"
						                +"<td>"
						                	+""+JsonList[re].dongTienLai.soTienDong+""
						                +"</td>"
						                 +"<td>"
						                	+""+JsonList[re].taiSan.tenTaiSan+""
						                +"</td>"
						                +"<td>"
						                	+""+JsonList[re].ngayCam+""
						                +"</td>"
						                +"<td>"
						                	+""+JsonList[re].ngayTra+""
						                +"</td>"
						                var tinhTrang="";
						                if (JsonList[re].tinhTrang==0) {
						                	tinhTrang="Chưa hết hạn";
										} else {
											tinhTrang="Hết hạn";
										}
						                +"<td>"
						                	+""+tinhTrang+""
						                +"</td>"
			                    	+"</tr>"
							}
					}else{
						rs="";
					}
					
					//phân trang
					var showPage="";
					for ( var p in JsonPages) {
						showPage+= "<li class=\"paginate_button previous disabled\" aria-controls=\"dataTables-example\" tabindex=\"0\" id=\"dataTables-example_previous\">"
                       				 	+"<a href=\"#\"></a>"
                       				+"</li>"
									+"<li class=\"paginate_button active\" aria-controls=\"dataTables-example\" tabindex=\"0\">"
										+"<a href=\"#\">"+JsonPages[p]+"</a>"
                        			+"</li>"
                       				+"<li class=\"paginate_button next\" aria-controls=\"dataTables-example\" tabindex=\"0\" id=\"dataTables-example_next\">"
                    					+"<a href=\"#\">>></a>"
                    				+"</li>"
					}
                    
                  //hien thi table danh sach
			 	   $('#showall tbody').html(rs);
	              
             		//hien thi phân trang
             		$('#showPaging').html(showPage);
             		
                    //hien thi thong tin
	                $('#showInfo').html(info);
				},
				error: function(e){
					alert('loi '+e);
                }
			});
		
    	}
    	
    	//su kien lay data
//     	$(function(){
//     		setTimeout(function(){
//     			loadDataAjax();
//     		}, 10000);//1 giay
//     	});
    	
    </script>

<!-- end ajax -->
</head>
<body>

	<div id="wrapper">

		<!-- Navigation -->
		<jsp:include page="menu.jsp"></jsp:include>
		<!-- end Navigation -->

		<div id="page-wrapper">

			<div class="container-fluid">
				<!-- Page Heading -->
				<div class="row">
					<div class="col-lg-12">
						<h1 class="page-header">
							Hệ thống <small>Quản lý cửa hiệu cầm đồ</small>
						</h1>
					</div>
				</div>
				<!-- /.row -->

				<!-- col-lg-3 col-md-6 -->
				<!-- /.row -->

				
				<div class="row">
					<ul class="nav nav-tabs">
						<li class="active"><a data-toggle="tab" href="#home">Hợp
								đồng sắp hết hạn</a></li>
						<li><a data-toggle="tab" href="#menu1">Hợp đồng hết hạn</a></li>
						<li><a data-toggle="tab" href="#menu2">Sản phẩm thanh lý</a></li>
					</ul><br>
					<div class="tab-content">
						<div id="home" class="tab-pane fade in active">
							<div class="col-lg-12">
								<div class="panel panel-warning">
									<div class="panel-heading">
										<h3 class="panel-title">
											<i class="fa fa-list fa-fw"></i> Hợp đồng sắp hết hạn
										</h3>
									</div>
									<div class="panel-body">
										<div class="table-responsive">
											<table class="table table-bordered table-hover table-striped"
												id="showall">
												<thead>
													<tr>
														<th>Mã CTHD</th>
														<th>Tên khách hàng</th>
														<th>Mức lãi suất (%)</th>
														<th>Tên tài sản</th>
														<th>Ngày cầm</th>
														<th>Ngày trả</th>
														<th>Số tiền cầm (vnd)</th>
													</tr>
												</thead>
												<tbody>
													<logic:present name="formThongKe" property="listHDHH">
														<logic:iterate name="formThongKe" property="listHDHH"
															id="hd">
															<tr>
																<th><bean:write name="hd" property="maCTHD" /></th>
																<td><bean:define id="tenKhachHang" name="hd"
																		property="khachHang.tenKhachHang" /> <bean:write
																		name="tenKhachHang" /></td>
																<td><bean:define id="mucLaiSuat" name="hd"
																		property="laiSuat.mucLaiSuat" /> <bean:write
																		name="mucLaiSuat" /></td>
																<td><bean:define id="tenTaiSan" name="hd"
																		property="taiSan.tenTaiSan" /> <bean:write
																		name="tenTaiSan" /></td>
																<td><bean:write name="hd" property="ngayCam" /></td>
																<td><bean:write name="hd" property="ngayTra" /></td>
																<td><bean:write name="hd" property="soTienCamFormat" /></td>
															</tr>
														</logic:iterate>
													</logic:present>
												</tbody>
											</table>
										</div>
										<!--  end table hop dong sắp hết han -->
										<div class="row">
											<div class="col-sm-6"></div>
											<div class="col-sm-6">
												<div class="dataTables_paginate paging_simple_numbers"
													id="dataTables-example_paginate">
													<ul class="pagination" id="showPaging">
														<li class="paginate_button previous disabled"
															aria-controls="dataTables-example" tabindex="0"
															id="dataTables-example_previous"><a href="#">Trước</a></li>
														<li class="paginate_button"
															aria-controls="dataTables-example" tabindex="0"><logic:present
																name="formThongKe" property="pages">
																<logic:iterate name="formThongKe" property="pages"
																	id="a">
																	<html:link action="/thong-ke.do?action=hopdonghethan"
																		paramName="a" paramId="page">
																		<bean:write name="a" />
																	</html:link>
																</logic:iterate>
															</logic:present></li>
														<li class="paginate_button next"
															aria-controls="dataTables-example" tabindex="0"
															id="dataTables-example_next"><a href="#">Tiếp</a></li>
													</ul>
												</div>
											</div>
										</div>
									</div>
								</div>
								<!-- /.row -->
							</div>
						</div>
						<div id="menu1" class="tab-pane fade">
							<div class="col-lg-12">
								<div class="panel panel-danger">
									<div class="panel-heading">
										<h3 class="panel-title">
											<i class="fa fa-list fa-fw"></i> Hợp đồng hết hạn
										</h3>
									</div>
									<div class="panel-body">
										<div class="table-responsive">
											<table class="table table-bordered table-hover table-striped"
												id="showall">
												<thead>
													<tr>
														<th>Mã CTHD</th>
														<th>Tên khách hàng</th>
														<th>Mức lãi suất (%)</th>
														<th>Tên tài sản</th>
														<th>Ngày cầm</th>
														<th>Ngày trả</th>
														<th>Số tiền cầm(vnd) </th>
														<th>Hình thức</th>
													</tr>
												</thead>
												<tbody>
													<logic:present name="formThongKe" property="listHH">
														<logic:iterate name="formThongKe" property="listHH"
															id="hd">
															<tr>
																<th><bean:write name="hd" property="maCTHD" /></th>
																<td><bean:define id="tenKhachHang" name="hd"
																		property="khachHang.tenKhachHang" /> <bean:write
																		name="tenKhachHang" /></td>
																<td><bean:define id="mucLaiSuat" name="hd"
																		property="laiSuat.mucLaiSuat" /> <bean:write
																		name="mucLaiSuat" /></td>
																<td><bean:define id="tenTaiSan" name="hd"
																		property="taiSan.tenTaiSan" /> <bean:write
																		name="tenTaiSan" /></td>
																<td><bean:write name="hd" property="ngayCam" /></td>
																<td><bean:write name="hd" property="ngayTra" /></td>
																<td><bean:write name="hd" property="soTienCamFormat" /></td>
																<td>
																	<logic:equal name="formThongKe" property="kiemTraDongLai" value="0">
																		<logic:equal name="hd" property="tinhTrang" value="0">
																			<bean:define id="maCTHD" name="hd" property="maCTHD"/>
																					<html:link action="/cap-nhat-thanh-ly.do?maCTHD=${maCTHD}">
																						<span class="glyphicon glyphicon-plus">Thanh lý</span>
																					</html:link>
																		</logic:equal>
																	</logic:equal>
																	<logic:equal name="hd" property="tinhTrang" value="1">
																		<bean:define id="maCTHD" name="hd" property="maCTHD"/>
																			<span class="glyphicon glyphicon-plus" style="color: navy;">Đã thanh toán</span>
																	</logic:equal>
																	<%-- <logic:equal name="formThongKe" property="kiemTraDongLai" value="1">
																			<span class="glyphicon glyphicon-plus" style="color: blue;">Đã gia hạn</span>
																	</logic:equal> --%>
																</td>
															</tr>
														</logic:iterate>
													</logic:present>
												</tbody>
											</table>
										</div>
										<!--  end table hop dong hết han -->
										<div class="row">
											<div class="col-sm-6"></div>
											<div class="col-sm-6">
												<div class="dataTables_paginate paging_simple_numbers"
													id="dataTables-example_paginate">
													<ul class="pagination" id="showPaging">
														<li class="paginate_button previous disabled"
															aria-controls="dataTables-example" tabindex="0"
															id="dataTables-example_previous"><a href="#">Trước</a></li>
														<li class="paginate_button"
															aria-controls="dataTables-example" tabindex="0"><logic:present
																name="formThongKe" property="pagesHH">
																<logic:iterate name="formThongKe" property="pagesHH"
																	id="a">
																	<html:link action="/thong-ke.do?action=hopdonghethan"
																		paramName="a" paramId="pageHH">
																		<bean:write name="a" />
																	</html:link>
																</logic:iterate>
															</logic:present></li>
														<li class="paginate_button next"
															aria-controls="dataTables-example" tabindex="0"
															id="dataTables-example_next"><a href="#">Sau</a></li>
													</ul>
												</div>
											</div>
										</div>
									</div>
								</div>
								<!-- /.row -->
							</div>
						</div>
						<div id="menu2" class="tab-pane fade">
							<div class="panel panel-success">
								<div class="panel-heading">
									<h3 class="panel-title">
										<i class="fa fa-list fa-fw"></i>Danh Sách hàng thanh lý
									</h3>
								</div>
								<div class="panel-body">
									<div class="table-responsive">
										<table class="table table-bordered table-hover table-striped">
											<thead>
												<tr style="text-align:center">
													<th>Mã Thanh Lý</th>
													<th>Tên sản phẩm</th>
													<th>Tình trạng</th>
													<th>Tiền thanh lý (vnd)</th>
													<th>Tác vụ</th>
												</tr>
											</thead>
											<tbody>
												<logic:present name="formThongKe"
													property="listTL">
													<logic:iterate id="tl" name="formThongKe"
														property="listTL">
														<tr>
															<td class="maThanhLy"><bean:write name="tl" property="maThanhLy" /></td>
															<td class="tenTaiSan"><bean:write name="tl" property="tenTaiSan" /></td>
															<td class="tinhTrang"><bean:write name="tl" property="trangThai" /></td>
															<td><bean:write name="tl" property="soTienThanhLy"/></td>
															<td>
																<logic:equal name="tl" property="tinhTrang" value="0">
																	<button type="button" class="btn btn-success btn-xs btnCapNhat myBtnUp">
																	Cập nhật</button>
																</logic:equal>
																<logic:equal name="tl" property="tinhTrang" value="1">
																	<div style="text-align:center"><button type="button" class="btn btn-danger btn-xs">
																	<i class="fa fa-check-square-o" aria-hidden="true"></i></button></div>
																</logic:equal>
															</td>
														</tr>
													</logic:iterate>
												</logic:present>
											</tbody>
										</table>
									</div>
									<!--  end table -->
									<div class="row">
										<div class="col-sm-6"></div>
										<div class="col-sm-6">
											<div class="dataTables_paginate paging_simple_numbers"
												id="dataTables-example_paginate">
												<ul class="pagination">
													<li class="paginate_button previous disabled"
														aria-controls="dataTables-example" tabindex="0"
														id="dataTables-example_previous"><a href="#">Trước</a></li>
													<li class="paginate_button"
														aria-controls="dataTables-example" tabindex="0"><logic:present
															name="formThongKe" property="pagesTL">
															<logic:iterate name="formThongKe" property="pagesTL" id="a">
																<html:link action="/thong-ke.do?action=hopdonghethan" paramName="a"
																	paramId="pageTL">
																	<bean:write name="a" />
																</html:link>
															</logic:iterate>
														</logic:present></li>
													<li class="paginate_button next"
														aria-controls="dataTables-example" tabindex="0"
														id="dataTables-example_next"><a href="#">Sau</a></li>
												</ul>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- /.container-fluid -->
				</div>
			</div>
		</div>
		<!-- /#page-wrapper -->
	   <!-- Modal delete-->
		<div class="modal fade" id="myModalUp" role="dialog">
			<div class="modal-dialog modal-sm">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<div class="row">
							<h4 class="modal-title">
								<span class="fa fa-question-circle"></span> Sản phẩm <span class="tents"></span> đã được thanh lý
							</h4>
							<!-- <h5 class="tentt"></h5> -->
						</div>
					</div>
					<div class="modal-body">
						<div class="row">
							<html:form action="/thong-ke.do?action=hopdonghethan" method="post">
								<div class="row">
									<html:text property="maThanhLy" styleId="matl"
										styleClass="rsMaThanhLy"></html:text>
								</div>
								<div class="row" style="margin-left: 0px; margin-right: 0px;">
									<div class="col-sm-6">
										<html:submit styleClass="btn btn-success btn-block"
											property="submit" value="Cập nhật" />
									</div>
									<div class="col-sm-6">
										<button type="submit" class="btn btn-danger btn-block"
											data-dismiss="modal">
											<span>Hủy</span>
										</button>
									</div>
								</div>
							</html:form>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- end modal delete -->

		<script type="text/javascript">
			$(function() {
				
				$('#matl').hide();
				
				$(".myBtnUp").click(function(){
					
					
					$("#myModalUp").modal();
					
					//lấy giá trị của một cột trong table td maTaiSan
			 		    var $maThanhLy = $(this).closest("tr")   // Finds the closest row <tr> 
			 		                       .find(".maThanhLy")     // Gets a descendent with class="maTaiSan"
			 		                       .text();      // Retrieves the text within <td>
			 		 
			 		  //lấy giá trị của một cột trong table td tinh trạng
			 		    var $tinhTrang = $(this).closest("tr")   // Finds the closest row <tr> 
			 		                       .find(".tinhTrang")     // Gets a descendent with class="tenTaiSan"
			 		                       .text();      // Retrieves the text within <td>
			
			 		//lấy giá trị của một cột trong table td tên tài sản
			 		    var $tenTaiSan = $(this).closest("tr")   // Finds the closest row <tr> 
			 		                       .find(".tenTaiSan")     // Gets a descendent with class="tenTaiSan"
			 		                       .text();      // Retrieves the text within <td>
			 		         
			 		 //set value for input maTaiSan
				 		  $('.rsMaThanhLy').each(function(){
				             	$(this).val($maThanhLy.trim());
				       		 });
			 		 
				 	//set value for input tenTaiSan
				 		  $('.tents').html($tenTaiSan);
				
				});
			});
			
		</script>
	</div>
	<!-- /#wrapper -->
	
</body>

</html>