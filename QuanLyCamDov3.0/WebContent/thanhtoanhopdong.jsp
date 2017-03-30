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
			
			/* kiểm tra ngày kết thúc hợp đồng và ngày gia hạn */
			function ktNgayGiaHan(ngayGiaHan,ngayKetThuc){
				
				/* kiểm tra ngày kết thúc hợp đồng và ngày gia hạn */
				
				var ngayGHHD=(new Date(ngayGiaHan)).getTime();
				
				var ngayKTHD=(new Date(ngayKetThuc)).getTime();
				
				if (ngayGHHD<=ngayKTHD) {
					return false;
				}else{
					return true;
				}
			}
			
			function loiThanhToan(){
				var tienNo=$('#tienNoGiaHan').val();
				
				var formatFloat=parseFloat(tienNo);
				
				if (formatFloat>0) {
					alert("Vui lòng đóng tiền gia hạn trước khi muốn thanh toán !");
					return false;
				}
				return true;
			}
			
			function batLoi(){
					
				var ngay=$('#txtGiaHan').val();
				var ngayKTHD=$('#txtKetThuc').val();
					
				var check=true;
					
				if (ngay==null || ngay.length==0) {
						$('#gh').html("Vui lòng chọn ngày để gia hạn !");
						return false;
				}else if (ktNgay(ngay)==false) {
						
						$('#gh').html("Ngày gia hạn nhỏ hơn ngày hiện tại !");
						return false;
				}else if (ktNgayGiaHan(ngay,ngayKTHD)==false) {

						$('#gh').html("Ngày gia hạn phải lớn hơn ngày kết thúc hợp đồng !");
						return false;
				}
				return true;
			}
	
		$(function(){

				$('#cthd').hide();
				$('#ghd').hide();
				$('#kthd').hide();
				$('#cthddonglai').hide();
				/* $('a').hide(); */
				
			/* set disable button, textbox */
			
			//button,textbox gia han
			if (!$('#giahan').prop('checked')) {
				
				$('#btnGiaHan').attr('disabled', true);
				$('#txtGiaHan').attr('readonly', true);
				
			}
			
			//button thanh toán
			$('#thanhtoan').prop('checked') ? $('#btnThanhToan').attr('disabled', false):$('#btnThanhToan').attr('disabled', true);
				
			//button,textbox đóng lãi
			if (!$('#donglai').prop('checked')) {
				
				$('#btnDongLai').attr('disabled', true);
				$('#noGiaHan').attr('readonly', true);
				$('#tienNoGiaHan').attr('readonly', true);
			}
			
			//sự kiên checkbox gia hạn
			$('#giahan').change(function(){
				if(this.checked) {
			        //Do stuff
					$('#btnGiaHan').attr('disabled', false);
					$('#txtGiaHan').attr('readonly', false);
					
			    }else{
			    	
			    	$('#btnGiaHan').attr('disabled', true);
					$('#txtGiaHan').attr('readonly', true);
			    	
			    }
			});
			
			//sự kiên checkbox thanh toán
			$('#thanhtoan').change(function(){
				if(this.checked) {
			        //Do stuff
					$('#btnThanhToan').attr('disabled', false);
					
			    }else{
			    	
			    	$('#btnThanhToan').attr('disabled', true);
			    }
			});
			
			//sự kiên checkbox thanh toán
			$('#donglai').change(function(){
				if(this.checked) {
			        //Do stuff
					$('#btnDongLai').attr('disabled', false);
					$('#noGiaHan').attr('readonly', false);
					$('#tienNoGiaHan').attr('readonly', false);
					
			    }else{
			    	
			    	$('#btnDongLai').attr('disabled', true);
					$('#noGiaHan').attr('readonly', true);
					$('#tienNoGiaHan').attr('readonly', true);
			    }
			});
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
				<!-- thong bao -->
				<div class="row">
					<div class="col-sm-12" style="margin-bottom: -19px;margin-top: -8px;">
						<div class="col-sm-4">
							<span> <%-- <html:link href="window.history.back()"><u>Quay lại</u></html:link> --%>
								<button type="button" class="btn btn-info"
									onclick="window.history.back()" style="margin-top: 13px;">Quay lại</button>
							</span>
						</div>
						<div class="col-sm-4">
							<!-- hình thưc -->
							<div class="panel panel-default">
								<div class="panel-heading" style="padding: 6px 15px;">
									<h3 class="panel-title">Hình thức thanh toán</h3>
								</div>
								<div class="panel-body" style="padding: 4px;">
									<label class="checkbox-inline"> <input type="checkbox"
										value="" id="giahan">Gia hạn
									</label> <label class="checkbox-inline"> <input type="checkbox"
										value="" id="thanhtoan">Thanh toán
									</label> <label class="checkbox-inline"> <input type="checkbox"
										value="" id="donglai">Đóng lãi
									</label>
								</div>
							</div>
						</div>
						<div class="col-sm-4"></div>
					</div>
					<%-- <h3 style="color: red;text-align:center">
						<bean:write name="thanhToanForm" property="thongBao" />
						<bean:write name="thanhToanForm" property="thongBaoTT" />
						<span>
							<html:link action="/danhsachhopdong.do"><u>Quay lại</u></html:link>
						</span>
					</h3> --%>
				</div>
				<!--/.thong bao -->
				<!-- row1 -->
				<div class="row">
					<div class="col-lg-12">
					<%-- <html:form styleClass="form-horizontal" action="/thanhToan"
								acceptCharset="UTF-8" method="POST"> --%>
						<div class="col-sm-6">
							<html:form styleClass="form-horizontal" action="/thanhToan" 
							acceptCharset="UTF-8" method="POST" onsubmit="return batLoi()">
								<div class="row">
									<div class="panel panel-info">
										<div class="panel-heading">
											<h3 class="panel-title">
												<i class="fa fa-fw fa-user-circle-o" aria-hidden="true"></i>
												Khách hàng
											</h3>
										</div>
										<div class="panel-body">
											<div class="form-group">
												<label class="control-label col-sm-4">Mã CTHD</label>
												<div class="col-sm-8">
													<html:text styleClass="form-control" readonly="true"
														property="maCTHD"></html:text>
												</div>
											</div>
											<div class="form-group">
												<label class="control-label col-sm-4">Tên Khách Hàng</label>
												<div class="col-sm-8">
													<html:text styleClass="form-control" readonly="true"
														property="tenKhachHang"></html:text>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="panel panel-danger">
										<div class="panel-heading">
											<h3 class="panel-title">
												<i class="fa fa-fw fa-external-link" aria-hidden="true"></i>
												Gia hạn
											</h3>
										</div>
										<div class="panel-body">

											<div class="form-group">
												<label class="control-label col-sm-4">Ngày KTHD</label>
												<div class="col-sm-8">
													<html:text styleClass="form-control" readonly="true"
														property="ngayKTHD" styleId="txtKetThuc"></html:text>
												</div>
											</div>
											<div class="form-group">
												<label class="control-label col-sm-4">Thời gian đã HĐ</label>
												<div class="col-sm-8">
													<html:text styleClass="form-control" readonly="true" property="soNgayHopDong"></html:text>
												</div>
											</div>
											<div class="form-group">
												<label class="control-label col-sm-4">Gia hạn đến:</label>
												<div class="col-sm-8">
													<%-- <html:text styleClass="form-control" styleId="usr"
														property="giaHanDen"/> --%>
													<input type="date" class="form-control" name="giaHanDen" id="txtGiaHan">
												</div>
											</div>
											<div class="form-group">
												<div class="col-sm-offset-4 col-sm-8">
													<html:submit property="xemTruoc"
														styleClass="btn btn-primary" styleId="btnGiaHan">Xem</html:submit>
												</div>
											</div>
											<div style="height: 30px;width: 461px;display: block;">
												<h6 style="color:red;text-align:center" id="gh"><bean:write name="thanhToanForm" property="thongBao"/></h6>
											</div>
										</div>
									</div>
								</div>
								<div class="row">
									
								</div>
							</html:form>
						</div>
						<div class="col-sm-6">
							<div class="panel panel-info">
								<div class="panel-heading">
									<h3 class="panel-title">
										<i class="fa fa-fw fa-info"></i> Thông tin thanh toán
									</h3>
								</div>
								<div class="panel-body">
									<html:form styleClass="form-horizontal" action="/thanhToan" acceptCharset="UTF-8"
									 method="POST" onsubmit="return loiThanhToan()">
										<div class="form-group">
											<label class="control-label col-sm-4">Số tiền cầm</label>
											<div class="col-sm-8">
												<html:text styleClass="form-control" readonly="true" property="maCTHD" styleId="cthd"/>
												<html:text styleClass="form-control" readonly="true" property="giaHanDen" styleId="ghd"/>
												<html:text styleClass="form-control" readonly="true"
														property="ngayKTHD" styleId="kthd"></html:text>
												<html:text styleClass="form-control" styleId="usr" property="soTienCam" readonly="true"/>
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-sm-4">Tình trạng gia
												hạn</label>
											<div class="col-sm-8">
												<html:text styleClass="form-control" readonly="true" property="tinhTrangGiaHan"></html:text>
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-sm-4" for="email">Ngày
												BĐHĐ</label>
											<div class="col-sm-8">
												<html:text styleClass="form-control" readonly="true" property="ngayBatDauHopDong"></html:text>
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-sm-4">Ngày KTHĐ</label>
											<div class="col-sm-8">
												<html:text styleClass="form-control" readonly="true" property="ngayKetThucHopDong"></html:text>
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-sm-4">Mức lãi suất</label>
											<div class="col-sm-8">
												<html:text styleClass="form-control" readonly="true" property="mucLaiSuat"></html:text>
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-sm-4">Tổng tiền TT</label>
											<div class="col-sm-8">
												<html:text styleClass="form-control" readonly="true" property="tongTien"></html:text>
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-sm-4" for="email">Tiền
												nợ TT</label>
											<div class="col-sm-8">
												<html:text styleClass="form-control" readonly="true" property="tienNo"></html:text>
											</div>
										</div>
										<div class="form-group">
											<div class="col-sm-offset-4 col-sm-8">
												<html:submit property="thanhToan" styleClass="btn btn-primary" styleId="btnThanhToan">Thanh toán</html:submit>
											</div>
										</div>
									</html:form>
								</div>
							</div>
						</div>
					<%-- </html:form> --%>
					</div>
				</div>
				<!-- /.row1 -->

				<!-- row2 -->
				<div class="row">
					<div class="col-lg-12">
						<div class="panel panel-success">
							<div class="panel-heading">
								<h3 class="panel-title">
									<i class="fa fa-check-square-o fa-fw" aria-hidden="true"></i>
									Thanh toán lãi
								</h3>
							</div>
							<div class="panel-body">
								<div class="row" style=" margin-right: 0px;margin-left:0px;">
									<div class="panel panel-warning">
										<div class="panel-body">
											<html:form styleClass="form-horizontal" action="/thanhToan" acceptCharset="UTF-8" method="POST">
												<div class="col-sm-12">
													<html:text styleClass="form-control" readonly="true" property="maCTHD" styleId="cthddonglai"/>
													<div class="col-sm-4">
														<div class="form-group">
															<label for="pwd">Tổng tiền gia hạn:</label> 
															<html:text styleClass="form-control" property="tongTienGiaHan" styleId="noGiaHan"/>
														</div>
													</div>
													<div class="col-sm-5">
														<div class="form-group">
															<label for="email">Tổng tiền gia hạn còn nợ:</label> 
															<html:text styleClass="form-control" property="tienNoGiaHan" styleId="tienNoGiaHan"/>
														</div>
													</div>
													<div class="col-sm-3">
														<div class="form-group" style="margin-top: 23px;">
															<html:submit property="dongLai" styleClass="form-control btn btn-primary" styleId="btnDongLai">Đóng lãi kỳ tiếp theo</html:submit>
														</div>
													</div>
												</div>
											</html:form>
										</div>
									</div>
								</div>
								<h3>
									<i class="fa fa-list fa-fw"></i>Danh sách đóng lãi
								</h3>
								<div class="table-responsive">
									<table class="table table-bordered table-hover table-striped">
										<thead>
											<tr>
												<th>Lần đóng lãi</th>
												<th>Mã CTHĐ</th>
												<th>Tình trạng</th>
												<th>Ngày đóng</th>
												<th>Số tiền đóng (vnd)</th>
											</tr>
										</thead>
										<tbody>
											<logic:iterate id="dl" name="thanhToanForm"
												property="listDongLai">
												<tr>
													<td><bean:write name="dl" property="maDongLai"></bean:write>
													</td>
													<td><bean:write name="dl" property="maCTHD"></bean:write>
													</td>
													<td><bean:write name="dl" property="tinhTrang1"></bean:write>
													</td>
													<td><bean:write name="dl" property="ngayDong"></bean:write>
													</td>
													<td><bean:write name="dl" property="soTienDong" format="###,###,###"></bean:write>
													</td>
												</tr>
											</logic:iterate>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- /.row2 -->
			</div>
			<!-- /.container-fluid -->
		</div>
		<!-- /#page-wrapper -->
	</div>
	<!-- /#wrapper -->
</body>

</html>
