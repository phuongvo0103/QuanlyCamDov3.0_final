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
	                                                <h3 class="panel-title"><i class="fa fa-calendar"></i> Hàng thanh lý</h3>
	                                            </div>
	                                            <div class="panel-body">
	                                                <div class="row">
	                                                   <div class="col-sm-4">
	                                                   		<button type="button" class="btn btn-default" id="btnHide">Cập nhật hàng thanh lý</button>
	                                                   		<script type="text/javascript">
	                                                   			$(function(){
	                                                   				
	                                                   				/* kiểm tra có phải là số hay không */
	                                                   				function isPositiveInteger(n) {
	                                                   				    return n >>> 0 === parseFloat(n);
	                                                   				}
	                                                   				
	                                                   				$('#hideClass').hide();
	                                                   				
	                                                   				var i=1;
	                                                   				
	                                                   				$('#btnHide').click(function(){
	                                                   					i%2==0?$('#hideClass').hide():$('#hideClass').show();
	                                                   					i++;
	                                                   				});
	                                                   			});
	                                                   			
	                                                   			function batLoi(){
	                                                   				
	                                                   				var soTienthanhly=$('#soTienthanhly').val();
	                                                   				
	                                                   				if (isPositiveInteger(soTienthanhly)==false) {
																		$('#thanhly').html("Vui lòng nhập số");
																		return false;
																	}
	                                                   				if (soTienthanhly==0 || soTienthanhly<0) {
																		$('#thanhly').html("Tiền thanh lý phải lớn hơn 0 !");
																		return false;
																	}
	                                                   				return true;
	                                                   			}
	                                                   		</script>
	                                                   </div>
	                                                   <div class="col-sm-4" id="hideClass">
	                                                   		<div class="panel panel-default">
	                                                   			<div class="panel-body">
	                                                   				<html:form action="/cap-nhat-thanh-ly" method="post" acceptCharset="UTF-8">
																	  <div class="form-group" onsubmit="return batLoi()">
																	    <label>Tên sản phẩm</label>
																	    <html:select property="maTaiSan" styleClass="form-control" value="">
																	    	<logic:present name="capNhatHangThanhLyForm" property="listTS">
																	    		<html:optionsCollection name="capNhatHangThanhLyForm" property="listTS" 
																	    		label="tenTaiSan" value="maTaiSan"/>
																	    	</logic:present>
																	    </html:select>
																	  </div>
																	  <div class="form-group">
																	    <label>Tiền thanh lý</label>
																	    <html:text property="soTienthanhly" styleClass="form-control" styleId="soTienthanhly"/>
																	    <h6 id="thanhly" style="color:red"></h6>
																	  </div>
																	  <div class="row">
																	  	<div class="col-sm-12">
																	  		<div class="col-sm-6">
																	  			<html:submit property="submit" styleClass="form-control btn btn-primary" value="Cập nhật"/>
																	  		</div>
																	  		<div class="col-sm-6">
																	  			<html:reset styleClass="form-control btn btn-danger" value="Hủy"/>
																	  		</div>
																	  	</div>
																	  </div>
																	</html:form>
	                                                   			</div>
	                                                   		</div>
	                                                   </div>
	                                                   <div class="col-sm-4"></div>
	                                                </div>
	                                            </div>
	                                        </div>
	                                    </div>
	                                </div>
	
	                                    <!-- end row -->
	                                <div class="row">
	                                    <div class="col-lg-12">
	                                        
	                                    <!-- ds- -->
	                                        <div class="panel panel-success">
	                                            <div class="panel-heading">
	                                                <h3 class="panel-title"><i class="fa fa-list fa-fw"></i>Danh Sách hàng thanh lý</h3>
	                                            </div>
	                                            <div class="panel-body">
	                                                <div class="table-responsive">
	                                                    <table class="table table-bordered table-hover table-striped">
	                                                        <thead>
	                                                            <tr>
	                                                                <th>Mã Thanh Lý</th>
																	<th>Tên sản phẩm</th>
																	<th>Tình trạng</th>
					                                                <th>Tiền thanh lý</th>
					                                                <th>Tác vụ</th>
	                                                            </tr>
	                                                        </thead>
	                                                        <tbody>
	                                                            <logic:present name="capNhatHangThanhLyForm" property="listTL">
	                                                            	<logic:iterate id="tl" name="capNhatHangThanhLyForm" property="listTL">
								                                          <tr>
								                                              <td><bean:write name="tl" property="maThanhLy"/></td>
																			  <td hidden="hidden"><bean:write name="tl" property="maTaiSan"/></td>
								                                              <td><bean:write name="tl" property="tenTaiSan"/></td>
								                                              <td><bean:write name="tl" property="trangThai"/></td>
								                                              <td><bean:write name="tl" property="soTienThanhLy"/></td>
								                                              <td>
								                                              	<button type="button" class="btn btn-success btn-xs btnCapNhat">Cập nhật</button>
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
	                                                        <div class="dataTables_paginate paging_simple_numbers" id="dataTables-example_paginate">
	                                                        <ul class="pagination">
	                                                            <li class="paginate_button previous disabled" aria-controls="dataTables-example" tabindex="0" id="dataTables-example_previous">
	                                                                <a href="#">Trước</a></li>
	                                                            <%-- <li class="paginate_button" aria-controls="dataTables-example" tabindex="0">
	                                                                <logic:present name="hopDongForm" property="pages">
		                                                              	<logic:iterate name="hopDongForm" property="pages" id="a">
																			<html:link action="/themHopDong.do" paramName="a" paramId="page">
																				<bean:write name="a" />
																			</html:link>
																		</logic:iterate>
		                                                              </logic:present>
	                                                             </li> --%>
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
