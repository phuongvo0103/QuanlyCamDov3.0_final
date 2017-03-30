<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles"%>
<%@taglib uri="http://java.sun.com/jstl/fmt" prefix="fmt" %>
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
	<script type="text/javascript">
		$(function(){
			$('#giahan').prop('checked')? $('button#btnGiaHan').attr('disabled', true) : $('#btnGiaHan').attr('disabled', false);
		});
	</script>
</head>
<body>

	<div id="wrapper">

		<!-- Navigation -->
		<jsp:include page="menu.jsp"></jsp:include>
		<!-- end Navigation -->

		<div id="page-wrapper">

			<div class="container-fluid">
				<!-- row thông báo -->
				<div class="row">
					<div class="col-sm-12">
						<div class="col-sm-4">
							<span> <%-- <html:link href="window.history.back()"><u>Quay lại</u></html:link> --%>
								<button type="button" class="btn btn-info"
									onclick="window.history.back()" style="margin-top: 13px;">Quay lại</button>
							</span>
						</div>
						<div class="col-sm-4">
							<h3 style="color:red; text-align:center">
								<bean:write name="phiGiaHanForm" property="thongBao"/>
							</h3>
						</div>
					</div>
				</div><br>
				<!-- /.row thông báo -->
				<!-- row1 -->
				<div class="row">
					<div class="col-lg-12">
						<html:form action="/phiGiaHan.do" acceptCharset="UTF-8">
							<div class="col-sm-6">
								<div class="row">
									<div class="panel panel-info">
										<div class="panel-heading">
											<h3 class="panel-title">
												<i class="fa fa-fw fa-user-circle-o" aria-hidden="true"></i>
												Thông tin khách hàng
											</h3>
										</div>
										<div class="panel-body">
											<div class="form-group">
												<label class="control-label col-sm-4">Mã CTHD</label>
												<div class="col-sm-8">
													<html:text styleClass="form-control" property="maCTHD" readonly="true"/>
												</div>
											</div>
											<div class="form-group">
												<label class="control-label col-sm-4">Tên Khách Hàng</label>
												<div class="col-sm-8">
													<html:text styleClass="form-control"
														property="tenKhachHang" readonly="true"/>
												</div>
											</div>
											<div class="form-group">
												<label class="control-label col-sm-4">Số CMND</label>
												<div class="col-sm-8">
													<html:text styleClass="form-control" property="soCMND" readonly="true"/>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="panel panel-info">
										<div class="panel-heading">
											<h3 class="panel-title">
												<i class="fa fa-fw fa-external-link" aria-hidden="true"></i>
												Thông tin lãi suât
											</h3>
										</div>
										<div class="panel-body">
											<div class="form-group">
												<label class="control-label col-sm-4">Mức lãi suất
													mới</label>
												<div class="col-sm-8">
													<html:text styleClass="form-control" property="mucLaiSuat" readonly="true"/>
												</div>
											</div>
											<div class="form-group">
												<label class="control-label col-sm-4">Tổng tiền lãi</label>
												<div class="col-sm-8">
													<html:text styleClass="form-control" property="tongTienLai" readonly="true"/>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="row">
									<!-- hình thưc -->
									<div class="panel panel-info">
										<div class="panel-heading">
											<h3 class="panel-title">
												<i class="fa fa-fw fa-info" aria-hidden="true"></i>Thông tin
												thanh toán
											</h3>
										</div>
										<div class="panel-body">
											<div class="form-group">
												<label class="control-label col-sm-4">Số tiền cầm</label>
												<div class="col-sm-8">
													<html:text styleClass="form-control" property="soTienCam" readonly="true"/>
												</div>
											</div>
											<div class="form-group">
												<label class="control-label col-sm-4">Tổng tiền
													thanh toán</label>
												<div class="col-sm-8">
													<html:text styleClass="form-control" property="tongTienTT" readonly="true"/>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-sm-6">
								<div class="panel panel-info">
									<div class="panel-heading">
										<h3 class="panel-title">
											<i class="fa fa-fw fa-info"></i> Thông tin gia hạn
										</h3>
									</div>
									<div class="panel-body">
										<div class="form-horizontal">
											<div class="form-group">
												<label class="control-label col-sm-4">Ngày bắt đầu
													HĐ</label>
												<div class="col-sm-8">
													<html:text styleClass="form-control"
														property="ngayBatDauHopDong" readonly="true"/>
												</div>
											</div>
											<div class="form-group">
												<label class="control-label col-sm-4">Ngày bắt đầu
													GH</label>
												<div class="col-sm-8">
													<html:text styleClass="form-control" property="ngayBatDau" readonly="true"/>
												</div>
											</div>
											<div class="form-group">
												<label class="control-label col-sm-4" for="email">Ngày
													kết thúc GH</label>
												<div class="col-sm-8">
													<html:text styleClass="form-control" property="ngayKetThuc" readonly="true"/>
												</div>
											</div>
											<div class="form-group">
												<label class="control-label col-sm-4">TG gia hạn</label>
												<div class="col-sm-8">
													<html:text styleClass="form-control" property="thoiGianGH" readonly="true"/>
												</div>
											</div>
											<div class="form-group">
												<label class="control-label col-sm-4">TG Hợp Đồng</label>
												<div class="col-sm-8">
													<html:text styleClass="form-control"
														property="thoiGianHopDong" readonly="true"/>
												</div>
											</div>
											<div class="form-group">
												<label class="control-label col-sm-4">Tình trạng gia
													hạn</label>
												<div class="col-sm-8">
													<html:text styleClass="form-control" property="tinhTrangGH" readonly="true"/>
												</div>
											</div>
											<div class="form-group">
												<label class="control-label col-sm-4" for="email">Tiền
													gia hạn/ ngày</label>
												<div class="col-sm-8">
													<html:text styleClass="form-control" property="tienGH1Ngay" readonly="true"/>
												</div>
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-sm-4" for="email">Tổng
												tiền gia hạn</label>
											<div class="col-sm-8">
												<html:text styleClass="form-control" property="tongTienGH" readonly="true"/>
											</div>
										</div>
										<div class="form-group">
											<div class="col-sm-offset-4 col-sm-8">
												<html:submit property="giaHan" styleClass="btn btn-primary">Gia Hạn</html:submit>
											</div>
										</div>
									</div>
								</div>
							</div>
						</html:form>
					</div>
				</div>
				<!-- /.row1 -->
			</div>
			<!-- /.container-fluid -->
		</div>
		<!-- /#page-wrapper -->
	</div>
	<!-- /#wrapper -->
</body>

</html>
