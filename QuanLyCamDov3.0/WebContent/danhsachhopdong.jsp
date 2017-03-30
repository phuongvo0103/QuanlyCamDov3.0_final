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
					<div class="col-lg-12">
						<div class="panel panel-info">
							<div class="panel-heading">
								<h3 class="panel-title">
									<i class="fa fa-list fa-fw"></i> Danh sách chi tiết hợp đồng
								</h3>
							</div>
							<div class="panel-body">
								<div class="table-responsive">
									<table class="table table-bordered table-hover table-striped"
										id="showall">
										<thead>
											<tr>
												<th>Mã CTHĐ</th>
												<th>Tên KH</th>
												<th>Tên tài sản</th>
												<th>Tình Trạng</th>
												<th>Ngày cầm</th>
												<th>Ngày trả</th>
												<th>Số tiền cầm</th>
												<th>Mức lãi suất(%)</th>
												<th>Ngày thanh toán</th>
												<th>Thanh toán (vnđ)</th>
												<th>Chi tiết</th>
											</tr>
										</thead>
										<tbody>
											<logic:present name="danhSachHopDongForm"
												property="listHD">
												<logic:iterate id="cthd" name="danhSachHopDongForm"
													property="listHD">
													<tr>
														<td><bean:write name="cthd" property="maCTHD"></bean:write></td>
														<td><bean:write name="cthd"
																property="khachHang.tenKhachHang"></bean:write></td>
														<%-- <td><bean:write name="cthd"
																property="khachHang.diaChi"></bean:write></td> --%>
														<td><bean:write name="cthd"
																property="taiSan.tenTaiSan"></bean:write></td>
														<td><bean:write name="cthd" property="trangThai"></bean:write></td>
														<td><bean:write name="cthd" property="ngayCam"></bean:write></td>
														<td><bean:write name="cthd" property="ngayTra"></bean:write></td>
														<td><bean:write name="cthd" property="soTienCamFormat"></bean:write></td>
														<td><bean:write name="cthd"
																property="laiSuat.mucLaiSuat"></bean:write></td>
														
														<td><bean:write name="cthd" property="ngayThanhToan"></bean:write></td>
														<td><bean:write name="cthd" property="tienThanhToanFormat"/></td>
														<td>
															<logic:equal name="cthd" property="tinhTrang" value="0">
																<bean:define id="maCTHD" name="cthd" property="maCTHD"/> 
																<html:link action="/thanhToan?maCTHD=${maCTHD}">
																	<span class="glyphicon glyphicon-plus">Thanh toán</span>
																</html:link>
															</logic:equal>
															<logic:notEqual name="cthd" property="tinhTrang" value="0">
																<span class="glyphicon glyphicon-plus" style="color:blue">Đã thanh toán</span>
															</logic:notEqual>
														</td>
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
														name="danhSachHopDongForm" property="pages">
														<logic:iterate name="danhSachHopDongForm" property="pages" id="a">
															<html:link action="/danhsachhopdong.do"
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
					<!-- /.container-fluid -->
				</div>
			</div>
		</div>
		<!-- /#page-wrapper -->

	</div>
	<!-- /#wrapper -->

</body>

</html>