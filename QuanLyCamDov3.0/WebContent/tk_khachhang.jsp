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

    <script src="sidebar-menu.js"></script>


    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

    <title>Thống kê- Khách hàng</title>

    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/sb-admin.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="css/font-awesome.min.css" rel="stylesheet" type="text/css">
    
      <!-- ajax -->
    <script type="text/javascript">
    
	    function format_curency(a) {
	      	a.value = a.value.replace(/(\d)(?=(\d{3})+(?!\d))/g, ",");
	    }
	    
    	//load data ajax server -> client
    	function loadDataAjax(){
    		
    		var nam=$('#rsnam').val();
			var thang=$('#rsthang').val();
			var page=$('.rsPage').val();
			page=1;
			
			//alert(page);
		
			if (nam!="" && thang!="") {
				$.ajax({
					type:'POST',
					async: false,
					url:'/QuanLyCamDov1.0.4/thong-ke-khach-hang.do',
					data: "nam="+nam+"&thang="+thang+"&page="+page+"",
					cache:false,
					dataType:'json',
					success: function (response){
						var arr = [], tong=0;
						var entries = [];
						
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
						
						 alert(arr.length);
						 
						if(arr.length!=0){
							
	 						for ( var re in JsonList) {
	    					    	 
	    					    	rs+="<tr>"
				                        	+"<th>"
							                	+""+JsonList[re].maKhachHang+""
											+"</th>"
							                +"<td>"
							                	+""+JsonList[re].tenKhachHang+""
							                +"</td>"
							                +"<td>"
							                	+""+JsonList[re].soCMND+""
											+"</td>"
							                +"<td>"
							                	+""+JsonList[re].gioiTinh+""
							                +"</td>"
							                 +"<td>"
							                	+""+JsonList[re].diaChi+""
							                +"</td>"
							                +"<td>"
							                	+""+JsonList[re].taiSan.tenTaiSan+""
							                +"</td>"
							                +"<td>"
							                	+""+JsonList[re].chiTietHopDong.ngayCam+""
							                +"</td>"
							                +"<td>"
							                	+""+JsonList[re].chiTietHopDong.ngayTra+""
							                +"</td>"
							                +"<td>"
							                	+""+JsonList[re].chiTietHopDong.soTienCam.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,")+""
							                +"</td>"
				                    	+"</tr>"
				                    	
				                    	//tinh tong tien
				                    	tong+=JsonList[re].chiTietHopDong.soTienCam;
				                    	
				                    	//$('#showall').append(rs);
				                    	// $(rs).appendTo("#showall tbody");
								}
						}else{
							rs="";
						}
						
						//phân trang
						var showPage="";
						for ( var p in JsonPages) {
							showPage+="<a href=\"#\" class=\"rsPage\">"+JsonPages[p]+"</a>";
							 
						}
						
						//danh sách thông tin
							var info="<div class=\"row\">"+"<label>"+thang+"</label></div>"
	                    +"<div class=\"row\">"+"<label>"+nam+"</label></div>"
	                    +"<div class=\"row\">"+"<label>"+arr.length+"</label></div>"
	                    +"<div class=\"row\">"+"<label>"+tong.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,")+"</label></div>"
	                    
	                  //hien thi table danh sach
				 	   $('#showall tbody').html(rs);
		              
	             		//hien thi phân trang
	             		$('#showPaging').html(showPage);
	             		
	                    //hien thi thong tin
		                $('#showInfo').html(info);
	                    
		                tong=0;
					},
					error: function(e){
						/* if (nam=="" || nam==null) {
							alert('vui long chon nam');
							return;
						}
						
						if (thang=="" || thang==null) {
							alert('vui long chon thang');
							return;
						} */
	                }
				});
			}
    	}
    	
    	//su kien lay data
    	$(function(){
			
    		$('#rsthang').change(function(){
    			loadDataAjax();
    		});
    		
    		$('#rsnam').change(function(){
    			loadDataAjax();
    		});
    	});
    	
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
                            Thống kê <small>Khách hàng</small>
                        </h1>
                    </div>
                </div>
                <!-- /.row -->

               <!-- col-lg-3 col-md-6 -->
                <!-- /.row -->

                <div class="row">
                    <div class="col-lg-12">
                                <div class="row">
                                    <div class="col-sm-8">
                                        <div class="panel panel-info">
                                            <div class="panel-heading">
                                                <h3 class="panel-title"><i class="fa fa-calendar"></i> Chọn thông tin đầy đủ</h3>
                                            </div>
                                            <div class="panel-body">
                                                <div class="row">
                                                    <!-- <div class="col-lg-3"></div> -->
                                                    <html:form action="/thong-ke.do?action=listkhachhang" method="post">
                                                    	<div class="col-sm-6">
	                                                        <div class="panel panel-warning">
	                                                            <div class="panel-heading">
	                                                                <h3 class="panel-title"><i class="fa fa-calendar"></i> Chọn năm</h3>
	                                                            </div>
	                                                            <div class="panel-body">
	                                                                <div class="form-group">
	                                                                	<html:select property="nam" value="... Chọn năm ..." styleClass="form-control" styleId="rsnam">
	                                                                		<html:option value="" >... Chọn năm ...</html:option>
	                                                                		<html:option value="2016">2016</html:option>
	                                                                		<html:option value="2017">2017</html:option>
	                                                                	</html:select>
	                                                                </div>
	                                                            </div>
	                                                        </div>
	                                                    </div>
	                                                    <div class="col-sm-6">
	                                                        <div class="panel panel-warning">
	                                                            <div class="panel-heading">
	                                                                <h3 class="panel-title"><i class="fa fa-calendar"></i> Chọn tháng</h3>
	                                                            </div>
	                                                            <div class="panel-body">
	                                                                <div class="form-group">
	                                                                  <html:select property="thang" styleClass="form-control"  value="... Chọn tháng ..." styleId="rsthang">
	                                                                  		<html:option value="" >... Chọn tháng ...</html:option>
	                                                                		<html:option value="1">1</html:option>
	                                                                		<html:option value="2">2</html:option>
	                                                                		<html:option value="3">3</html:option>
	                                                                		<html:option value="4">4</html:option>
	                                                                		<html:option value="5">5</html:option>
	                                                                		<html:option value="6">6</html:option>
	                                                                		<html:option value="7">7</html:option>
	                                                                		<html:option value="8">8</html:option>
	                                                                		<html:option value="9">9</html:option>
	                                                                		<html:option value="10">10</html:option>
	                                                                		<html:option value="11">11</html:option>
	                                                                		<html:option value="12">12</html:option>
	                                                                	</html:select>
	                                                                </div>
	                                                            </div>
	                                                        </div>
	                                                    </div>
	                                                    <div class="row">
	                                                    	<div class="col-sm-4"></div>
	                                                    	<div class="col-sm-4">
	                                                    		<!-- <div class="col-sm-4"></div> -->
	                                                    		<%-- <div><html:submit styleClass="form-control btn btn-primary" value="Thống kê"></html:submit></div> --%>
	                                                    		<!-- <div class="col-sm-4"></div> -->
	                                                    	</div>
	                                                    	<div class="col-sm-4"></div>
	                                                    </div>
                                                    </html:form>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-4">
                                            <div class="panel panel-info">
                                                <div class="panel-heading">
                                                    <h3 class="panel-title"><i class="fa fa-info-circle"></i> Thông Tin</h3>
                                                </div>
                                                <div class="panel-body">
                                                    <div class="row" style="margin-left: 2px;">
                                                        <div class="col-sm-4">
                                                            <div class="row"><label>Tháng : </label></div>
                                                            <div class="row"><label>Năm : </label></div>
                                                            <div class="row"><label>Số lượng : </label></div>
                                                            <div class="row"><label>Tổng tiền: </label></div>
                                                        </div>
                                                        <div class="col-sm-8" id="showInfo">
                                                           <!--  hien thi thong tin -->
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                    </div>
                                </div>

                                    <!-- end row -->
                                <div class="row">
                                    <div class="col-lg-12">
                                        
                                    <!-- - -->
                                        <div class="panel panel-primary">
                                            <div class="panel-heading">
                                                <h3 class="panel-title"><i class="fa fa-list-alt fa-fw"></i> Khách hàng</h3>
                                            </div>
                                            <div class="panel-body">
                                                <div class="table-responsive">
                                                    <table class="table table-bordered table-hover table-striped" id="showall">
                                                        <thead>
                                                            <tr>
                                                                <th>Mã Khách Hàng</th>
                                                                <th>Tên khách hàng</th>
                                                                <th>Số CMND</th>
                                                                <th>Giới Tính</th>
                                                                <th>Địa chỉ</th>
                                                                <th>Tên sản phẩm</th>
                                                                <th>Ngày cầm</th>
                                                                <th>Ngày trả</th>
                                                                <th>Số tiền cầm</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                        	<!-- hien thi table danh sach -->
                                                        </tbody>
                                                    </table>
                                                  <%--  <h3> <bean:write name="formThongKe" property="massage"/></h3> --%>
                                                </div>
                                               <!--  end table -->
                                               <div class="row">
                                                   <div class="col-sm-4"></div>
                                                    <div class="col-sm-4">
                                                        <div class="dataTables_paginate paging_simple_numbers" id="dataTables-example_paginate">
	                                                        <ul class="pagination">
	                                                        	<!-- hiển thị phân trang -->
	                                                        	
	                                                            <li class="paginate_button previous disabled" aria-controls="dataTables-example" tabindex="0" id="dataTables-example_previous">
	                                                                <a href="#">Trước</a></li>
	                                                            <li class="paginate_button" aria-controls="dataTables-example" tabindex="0"  id="showPaging">
	                                                            	<%-- <html:link paramProperty="page" paramName=""  action="#"></html:link> --%>
	                                                            	
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
						<h1  id="info"></h1>
       			 	</div>
    			</div>
    		</div>
     		<!-- /.container-fluid -->
    	</div>
    	<!-- /#page-wrapper -->
  </div>
    <!-- /#wrapper -->

</body>