<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles"%>
<%@taglib uri="http://java.sun.com/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">


<!-- jQuery -->
<script src="js/jquery-3.1.1.min.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="js/bootstrap.min.js"></script>

<title>Admin - Quản lý cửa tiệm cầm đồ</title>

<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="css/vinh.css" rel="stylesheet">


<!-- Custom Fonts -->
<link href="css/font-awesome.min.css" rel="stylesheet" type="text/css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

	<div id="wrapper">

		<!-- Navigation -->
		<jsp:include page="menu.jsp"></jsp:include>
		<!-- end Navigation -->

		<div id="page-wrapper">

			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-12">
						<div class="panel panel-primary">
							<div class="panel-heading">
								<h3 class="panel-title">
									<i class="fa fa-fw fa-table"></i> Quản lý chi tiết hợp đồng
								</h3>
							</div>
							<div class="panel-body">
								<!-- <div id="morris-area-chart"></div> -->

								<div class="row">
									<!-- thông tin -->
									<div class="col-sm-12">
										<div class="panel panel-info">
											<div class="panel-heading">
												<h3 class="panel-title">
													<i class="fa fa-info"></i> Thông tin
												</h3>
											</div>
											<div class="panel-body">
												<!-- body -->
												<html:form action="/themChiTietHopDong"
													acceptCharset="UTF-8" styleClass="form-horizontal"
													enctype="multipart/form-data" styleId="formSubmit" onsubmit="return batLoi()">
													<div class="row">
														<!-- tài sản -->
														<div class="col-sm-6">
															<div class="panel panel-warning">
																<div class="panel-heading">
																	<h3 class="panel-title">
																		<i class="fa fa-asset"></i> Tài sản
																	</h3>
																</div>
																<div class="panel-body">
																	<div class="form-group">
																		<label class="control-label col-sm-4">Chọn
																			danh mục <span style="color:red">*</span></label>
																		<div class="col-sm-8">
																			<html:select styleClass="form-control"
																				property="maDanhMuc" styleId="maDanhMuc">
																				<option value="">-- Chọn danh mục:</option>
																				<html:optionsCollection name="chiTietHopDongForm"
																					property="listDanhMuc" label="tenLoaiTaiSan"
																					value="maLoaiTaiSan" />
																			</html:select>
																			<h6 style="color:red" id="maDM"></h6>
																		</div>
																	</div>
																	<div class="form-group">
																		<label class="control-label col-sm-4">Tên tài
																			sản <span style="color:red">*</span></label>
																		<div class="col-sm-8">
																			<html:text property="tenTaiSan"
																				styleClass="form-control" styleId="tenTaiSan"/>
																			<h6 style="color:red" id="tenTS"></h6>
																		</div>
																	</div>
																	<div class="form-group">
																		<label class="control-label col-sm-4">Mô tả</label>
																		<div class="col-sm-8">
																			<html:textarea property="moTaTaiSan"
																				styleClass="form-control"></html:textarea>
																		</div>
																	</div>
																	<div class="form-group">
																		<label class="control-label col-sm-4">Hình
																			ảnh <span style="color:red">*</span></label>
																		<div class="col-sm-8">
																			<html:file property="file" styleClass="form-control"></html:file>
																		</div>
																	</div>
																</div>
															</div>
														</div>

														<!-- hợp đồng -->
														<div class="col-sm-6">
															<div class="panel panel-warning">
																<div class="panel-heading">
																	<h3 class="panel-title">
																		<i class="fa fa-fw fa-table"></i> Hợp đồng
																	</h3>
																</div>
																<div class="panel-body">
																	<div class="form-group">
																		<label class="control-label col-sm-4">Giá cầm
																			(vnđ) <span style="color:red">*</span></label>
																		<div class="col-sm-8">
																			<html:text property="soTienCam"
																				styleClass="form-control" styleId="rsgiacam"/>
																			<h6 style="color:red" id="gia"></h6>
																		</div>
																	</div>
																	<div class="form-group">
																		<label class="control-label col-sm-4">Hợp đồng
																			đến <span style="color:red">*</span></label>
																		<div class="col-sm-8">
																			<input type="date" value="" class="form-control"
																				id="rsngay" name="ngayTra" />
																			<h6 style="color:red" id="ngay"></h6>
																		</div>
																	</div>
																	<div class="form-group">
																		<div class="col-sm-6">
																			<button type="button" class="form-control btn-info"
																				id="btnShow" data-toggle="modal"
																				data-target="#myModal">Xem trước</button>
																		</div>
																		<div class="col-sm-6">
																			<html:submit styleClass="form-control btn-danger"
																				property="datHopDong" value="Đặt hợp đồng"></html:submit>
																		</div>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</html:form>
												<!-- end body -->
											</div>
										</div>
									</div>

									<div class="col-sm-6"></div>
								</div>

								<!-- end row -->
								<div class="row">
									<div class="col-lg-12">

										<!-- danh sach hop dong- -->
										<div class="panel panel-success">
											<div class="panel-heading">
												<h3 class="panel-title">
													<i class="fa fa-list fa-fw"></i> Danh sách chi tiết hợp
													đồng
												</h3>
											</div>
											<div class="panel-body">
												<div class="table-responsive">
													<table
														class="table table-bordered table-hover table-striped">
														<thead>
															<tr>
																<th>Mã CTHĐ</th>
																<th>Tên KH</th>
																<th>Địa chỉ</th>
																<th>Tên tài sản</th>
																<!-- <th>Mô tả</th> -->
																<th>Ngày cầm</th>
																<th>Ngày trả</th>
																<th>Số tiền cầm</th>
																<th>Mức lãi suất (%)</th>
																<th>Thanh toán (vnđ)</th>
																<th>Chi tiết</th>
															</tr>
														</thead>
														<tbody>
															<logic:present name="chiTietHopDongForm"
																property="listPages">
																<logic:iterate id="cthd" name="chiTietHopDongForm"
																	property="listPages">
																	<tr>
																		<td><bean:write name="cthd" property="maCTHD"></bean:write></td>
																		<td><bean:write name="cthd"
																				property="khachHang.tenKhachHang"></bean:write></td>
																		<td><bean:write name="cthd"
																				property="khachHang.diaChi"></bean:write></td>
																		<td><bean:write name="cthd"
																				property="taiSan.tenTaiSan"></bean:write></td>
																		<%-- <td><bean:write name="cthd"
																				property="taiSan.moTa"></bean:write></td> --%>
																		<td><bean:write name="cthd" property="ngayCam"></bean:write></td>
																		<td><bean:write name="cthd" property="ngayTra"></bean:write></td>
																		<td><bean:write name="cthd" property="soTienCamFormat"></bean:write></td>
																		<td><bean:write name="cthd"
																				property="laiSuat.mucLaiSuat"></bean:write></td>
																		<td><bean:write name="cthd"
																				property="tienThanhToanFormat"></bean:write></td>
																		<td><bean:define id="maCTHD" name="cthd" property="maCTHD"/>
																		<html:link action="/thanhToan?maCTHD=${maCTHD}">
																				<span class="glyphicon glyphicon-plus">Thanh toán</span>
																		 	</html:link></td>
																	</tr>
																</logic:iterate>
															</logic:present>
														</tbody>
													</table>
												</div>
												<!--  end danh sach hop dong -->
												<div class="row">
                                                   <div class="col-sm-4"></div>
                                                    <div class="col-sm-4">
                                                        <div class="dataTables_paginate paging_simple_numbers" id="dataTables-example_paginate">
	                                                        <ul class="pagination">
	                                                            <li class="paginate_button previous disabled" aria-controls="dataTables-example" tabindex="0" id="dataTables-example_previous">
	                                                                <a href="#">Trước</a></li>
	                                                            <li class="paginate_button" aria-controls="dataTables-example" tabindex="0">
		                                                            <logic:present name="chiTietHopDongForm" property="pages">
																			<logic:iterate name="chiTietHopDongForm" property="pages" id="a">
																				<bean:define id="maCTHD" name="cthd" property="maHopDong"/>
																				<html:link action="/themChiTietHopDong.do?maHopDong=${maHopDong}" paramName="a" paramId="page">
																					<bean:write name="a" />
																				</html:link>
																			</logic:iterate>
																	</logic:present>
																</li>
	                                                            <li class="paginate_button next" aria-controls="dataTables-example" tabindex="0" id="dataTables-example_next">
	                                                            <a href="#">Tiếp</a></li>
	                                                        </ul>
                                                    	</div>
                                                    </div>
                                                   <div class="col-sm-4">
                                                </div>
                                            </div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<!-- /.row -->
						</div>
						<!-- /.container-fluid -->

					</div>
					<!-- /#page-wrapper -->

				</div>
			</div>
		</div>
		<!-- Modal -->
		<div class="modal fade" id="myModal" role="dialog">
			<div class="modal-dialog modal-sm">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">Thông tin lãi suất</h4>
					</div>
					<div class="modal-body" id="showall">
						<!-- hiển thị danh sach -->
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Quay
							lại</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- /#wrapper -->
	<!-- ajax -->
	<script type="text/javascript">
	
	/* kiểm tra có phải là số hay không */
		function isPositiveInteger(n) {
		    return n >>> 0 === parseFloat(n);
		}
	
		/* kiểm tra ngày */
		function ktNgay(ngay){
			
			var dateCurrent=(new Date()).getTime();
			
			var date=(new Date(ngay)).getTime();
			
			if (date<dateCurrent) {
				return false;
			} else {
				return true;
			}
			
		}
		
		function batLoi(){
			
			var maDM=$('#maDanhMuc').val();
			var tenTaiSan=$('#tenTaiSan').val().trim();
			var gia=$('#rsgiacam').val();
			var ngay=$('#rsngay').val();
			
			var check=true;
			
			if (maDM==null || maDM.length==0) {
				$('#maDM').html("Vui lòng nhập mã loại tài sản.");
				check=false;
			}
			
			if (tenTaiSan==null || tenTaiSan.length==0) {
				$('#tenTS').html("Vui lòng nhập tên tài sản.");
				check=false;
			}
			
			if (gia==1000 || gia<1000) {
				$('#gia').html("Giá cầm phải lón hơn 1,000vnd!");
				check=false;
			}
			
			if (gia>80000000) {
				$('#gia').html("Giá cầm nhỏ hơn 80,000,000vnd!");
				check=false;
			}
			
			if (isPositiveInteger(gia)==false) {
				$('#gia').html("Vui lòng nhập kiểu số!");
				check=false;
			}
			
			if (ngay==null || ngay.length==0) {
				$('#ngay').html("Vui lòng chọn ngày kết thúc hợp đồng.");
				check=false;
			}
			
			if (ktNgay(ngay)==false) {
				$('#ngay').html("Ngày đặt hợp đồng nhỏ hơn ngày hiện tại.");
				check=false;
			}
			
			return check;
		} 
	
  		//load data ajax server -> client
    	function loadDataAjax(){

			var ngay=$('#rsngay').val();
			var gia=$('#rsgiacam').val();
			
			/* console.log(gia);
			console.log(ngay); */
			var a = parseFloat(gia);
			
			if (ngay!=""||gia!=0.0) {
				
				console.log(a);
				console.log(ngay);
				
				$.ajax({
					type:'POST',
					async: false,
					url:'/QuanLyCamDov1.0.4/tinh-lai-suat.do',
					data: "ngayTra="+ngay+"&soTienCam="+a+"",
					cache:false,
					dataType:'json',
					success: function (response){
						var arr = [];
						var rs="";
						
						//alert(response);
					 for ( var key in response) {
	                    	//set data from json to array
	                    	arr.push(response[key]);
	                    	
	                    	console.log(arr);
						}
						
						if(arr.length!=0){
							
	 						for ( var re in response) {
	    					    	 if (response[re].thongBao!="") {
										rs="<h4 style=\"text-align: center;color: red;\">"+response[re].thongBao+"</h4>";
									} else {
										rs="<form>"
			    				            +"<div class=\"form-group\">"
				    				              +"<label for=\"sotien\"><span class=\"fa fa-eye\"></span> Số tiền cầm (vnd)</label>"
				    				              +"<input type=\"text\" class=\"form-control\" value="+parseFloat(response[re].giaCam).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,")+">"
				    				         +"</div>"
			    				             +"<div class=\"form-group\">"
			    				              	+"<label for=\"ngay\"><span class=\"fa fa-eye\"></span> Ngày Kết thúc hợp đồng</label>"
			    				              	+"<input type=\"text\" class=\"form-control\" value="+response[re].ngayTra+">"
			    				            +"</div>"
			    				             +"<div class=\"form-group\">"
			    				              	+"<label for=\"songay\"><span class=\"fa fa-eye\"></span> Số ngày</label>"
			    				              	+"<input type=\"text\" class=\"form-control\" value="+response[re].soNgay+">"
			    				            +"</div>"
			    				            +"<div class=\"form-group\">"
			    				              	+"<label for=\"laisuat\"><span class=\"fa fa-eye\"></span> Mức lãi suất (%)</label>"
			    				              	+"<input type=\"text\" class=\"form-control\" value="+response[re].maLaiSuat+">"
			    				            +"</div>" 
			    				            +"<div class=\"form-group\">"
			    				              	+"<label for=\"tongtien\"><span class=\"fa fa-eye\"></span>Tổng tiền thanh toán(vnd)</label>"
			    				              	+"<input type=\"text\" class=\"form-control\" value="+parseFloat(response[re].tienThanhToan).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,")+">"
			    				            +"</div>" 
			    				          +"</form>"
								}
							}
						} 
						
		              //hien thi danh sach
	             		$('#showall').html(rs);
					},
					error: function(e){
						alert("loi "+e);
					}
				});
			}
		}
    	
    	//su kien lay data
    	$(function(){
    		$('#btnShow').click(function(){
    			loadDataAjax();
    		});
    	});
    	
    </script>
</body>

</html>
