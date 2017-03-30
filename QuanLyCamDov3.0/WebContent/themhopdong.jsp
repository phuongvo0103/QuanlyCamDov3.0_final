<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>
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
    <link href="css/vinh.css" rel="stylesheet">

    <!-- Morris Charts CSS -->
    <!-- <link href="css/morris.css" rel="stylesheet"> -->

    <!-- Custom Fonts -->
    <link href="css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

<script type="text/javascript">

/* kiểm tra có phải là số hay không */
	function isPositiveInteger(n) {
	    return n >>> 0 === parseFloat(n);
	}
	
	function batLoi() {
		var tenKH = $('#tenKhachHang').val().trim();
		var soCMND = $('#soCMND').val();
		var diaChi = $('#diaChi').val().trim();

		var check = true;

		if (tenKH == null || tenKH.length == 0) {
			$('#ten').html("Vui lòng nhập tên khách hàng !");
			check = false;
		}
		
		if (soCMND == 0 || soCMND.length > 10) {
			$('#so').html("Nhập số CMND không quá hoặc nhỏ hơn 10 số.");
			check = false;
		}
		
		if (isPositiveInteger(soCMND)==false) {
			$('#so').html("CMND bắt buộc phải là số");
			check = false;
		}
		
		
		if (diaChi == null || diaChi.length==0) {
			$('#diachi').html(
					"Vui lòng nhập địa chỉ cho chúng tôi biết bạn ở đâu ?");
			check = false;
		}
		return check;
	}
</script>

</head>

<body>

	<div id="wrapper">

        <!-- Navigation -->
        <jsp:include page="menu.jsp"></jsp:include>
        <!-- end Navigation -->
		
		<div id="page-wrapper">

            <div class="container-fluid">

                <!-- Page Heading -->
                <!-- <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                            Hệ thống <small>Quản lý hợp đồng</small>
                        </h1>
                    </div>
                </div> -->
                <!-- /.row -->

               <!-- col-lg-3 col-md-6 -->
                <!-- /.row -->

                <div class="row">
                    <div class="col-lg-12">
            			<div class="row">
                                    <div class="col-sm-12">
	                                        <div class="panel panel-info">
	                                            <div class="panel-heading">
	                                                <h3 class="panel-title"><i class="fa fa-calendar"></i> Khách hàng</h3>
	                                            </div>
	                                            <div class="panel-body">
	                                                <div class="row">
	                                                   <div class="col-sm-3"></div>
	                                                   <div class="col-sm-6">
	                                                   		<html:form action="/themHopDong" method="post" acceptCharset="UTF-8" onsubmit="return batLoi()">
															  <div class="form-group">
															    <label>Tên khách hàng<span style="color:red">*</span></label>
															    <html:text property="tenKhachHang" styleClass="form-control" styleId="tenKhachHang"/>
															    <h6 style="color:red" id="ten"></h6>
															  </div>
															  <div class="form-group">
															    <label>Giới tính<span style="color:red">*</span></label>
															    <div class="col-sm-12">
															    	<div class="col-sm-6">
															    		<label class="radio-inline">
															    			<html:radio property="gioiTinh" value="0">Nữ</html:radio>
															    		</label>
															    		<label class="radio-inline">
															    			<html:radio property="gioiTinh" value="1">Nam</html:radio>
															    		</label>
															    	</div>
															    </div>
															  </div><br>
															  <div class="form-group">
															    <label>Số CMND<span style="color:red">*</span></label>
															    <html:text property="soCMND" styleClass="form-control" styleId="soCMND"/>
															    <h6 style="color:red" id="so"></h6>
															  </div>
															  <div class="form-group">
															    <label>Địa chỉ<span style="color:red">*</span></label>
															    <html:textarea property="diaChi" styleClass="form-control" styleId="diaChi"/>
															    <h6 style="color:red" id="diachi"></h6>
															  </div>
															  <div class="row">
															  	<div class="col-sm-4"></div>
															  	<div class="col-sm-4">
															  		<div class="col-sm-6">
															  			<html:submit property="themHopDong" styleClass="btn btn-primary" value="Thêm"/>
															  		</div>
															  		<div class="col-sm-6">
															  			<html:reset styleClass="btn btn-danger" value="Hủy"/>
															  		</div>
															  	</div>
															  	<div class="col-sm-4"></div>
															  </div>
															</html:form>
	                                                   </div>
	                                                   <div class="col-sm-3"></div>
	                                                </div>
	                                            </div>
	                                        </div>
	                                    </div>
	                                </div>
	
	                                    <!-- end row -->
	                                <div class="row">
	                                    <div class="col-lg-12">
	                                        
	                                    <!-- hợp đồng sắp hết hạn- -->
	                                        <div class="panel panel-success">
	                                            <div class="panel-heading">
	                                                <h3 class="panel-title"><i class="fa fa-list fa-fw"></i>Danh Sách Hợp Đồng</h3>
	                                            </div>
	                                            <div class="panel-body">
	                                                <div class="table-responsive">
	                                                    <table class="table table-bordered table-hover table-striped">
	                                                        <thead>
	                                                            <tr>
	                                                                <th>Mã HĐ</th>
																	<th>Tên Khách Hàng</th>
																	<th>Số CMND</th>
					                                                <th>Giới tính</th>
																	<th>Địa chỉ</th>
																	<th>Thao Tác</th>
	                                                            </tr>
	                                                        </thead>
	                                                        <tbody>
	                                                            <logic:present name="hopDongForm" property="listHopDong">
	                                                            	<logic:iterate id="hd" name="hopDongForm" property="listHopDong">
								                                          <tr>
								                                              <td><bean:write name="hd" property="maHopDong"/></td>
								                                              <td><bean:write name="hd" property="tenKhachHang"/></td>
								                                              <td><bean:write name="hd" property="soCMND"/></td>
								                                              <td><bean:write name="hd" property="gioiTinh"/></td>
																			  <td><bean:write name="hd" property="diaChi"/></td>
								                                      	 <td>
							                                        		<bean:define id="maHopDong" name="hd" property="maHopDong"></bean:define>
															            	<html:link action="/themChiTietHopDong.do?maHopDong=${maHopDong}">
															              		<span class="glyphicon glyphicon-plus">Thêm chi tiết</span>
															            	</html:link>
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
	                                                        <div class="dataTables_paginate paging_simple_numbers" id="dataTables-example_paginate">
	                                                        <ul class="pagination">
	                                                            <li class="paginate_button previous disabled" aria-controls="dataTables-example" tabindex="0" id="dataTables-example_previous">
	                                                                <a href="#">Trước</a></li>
	                                                            <li class="paginate_button" aria-controls="dataTables-example" tabindex="0">
	                                                                <logic:present name="hopDongForm" property="pages">
		                                                              	<logic:iterate name="hopDongForm" property="pages" id="a">
																			<html:link action="/themHopDong.do" paramName="a" paramId="page">
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
	                                            </div>
	                                       </div>
	                                </div>
	                            </div>
	                        </div>
					 </div>
    			</div>
    		</div>
    		<!-- /.container-fluid -->
    	</div>
        <!-- /#page-wrapper -->
    </div>
    <!-- /#wrapper -->

</body>

</html>
