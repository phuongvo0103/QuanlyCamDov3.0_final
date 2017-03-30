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
    
     <style>
	  .modal-header, h4, .close {
	      background-color: #5cb85c;
	      color:white !important;
	      text-align: center;
	      font-size: 18px;
	  }
	  
	  div#myModalDel {
	    padding-left: 210px;
	}
  </style>		
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
                                <h3 class="panel-title"><i class="fa fa-fw fa-table"></i> Quản lý tài sản</h3>
                            </div>
                            <div class="panel-body">
                                <!-- <div id="morris-area-chart"></div> -->

                                <div class="row">
                                    <div class="col-sm-12">
                                    	<button type="button" class="btn btn-info" id="myBtn">Thêm mới tài sản</button>
                                    </div>
                                </div>
                                <div class="row">
                                	<div class="col-sm-4"></div>
                                	<div class="col-sm-4"></div>
                                	<div class="col-sm-4">
	                                		<div class="input-group">
	                                				<%-- <html:text styleId="rsTenTaiSan" styleClass="form-control" style="margin: 0" property="tenTaiSan"/> --%>
	                                				<input type="text" id="rsTenTaiSan" class="form-control" style="margin: 0" placeholder="tìm kiếm tên sản phẩm"/>
									      			<span class="input-group-addon"><i class="fa fa-search"></i></span></div>
                                	</div>
                                </div><br>

                                    <!-- end row -->
                                <div class="row">
                                    <div class="col-lg-12">
                                        
                                    <!-- hợp đồng sắp hết hạn- -->
                                        <div class="panel panel-danger">
                                            <div class="panel-heading">
                                                <h3 class="panel-title"><i class="fa fa-list fa-fw"></i> Danh sách tài sản</h3>
                                            </div>
                                            <div class="panel-body">
                                                <div class="table-responsive">
                                                    <table class="table table-bordered table-hover table-striped" id="showall">
                                                        <thead>
                                                        	<tr align="center">
																	<th>Mã tài sản</th>
																	<th>Tên tài sản</th>
																	<th>Loại tài sản</th>
																	<!-- <th>Mô tả</th> -->
																	<th>Hình ảnh</th>
																	<th colspan="2">Thao tac</th>
																</tr>
                                                        </thead>
                                                        <tbody>
                                                            <logic:present name="formTaiSan" property="list">
                                                            	<logic:iterate name="formTaiSan" property="list" id="ts">
                                                            		<tr class="odd gradeX" align="center">
																		<td class="maTaiSan"><bean:write name="ts" property="maTaiSan"/></td>
																		<td class = "tenTaiSan"><bean:write name="ts" property="tenTaiSan"/></td>
																		<td ><bean:write name="ts" property="loaiTaiSan.tenLoaiTaiSan"/></td>
																		<%-- <td><bean:write name="ts" property="moTa"/></td> --%>
																		<td><img src = "<bean:write name="ts" property="hinhAnh"/>" alt = "product" style = "height: 50px; weight: 50px"/></td>
																		<td class="center">
																			<a href="#">
																				<button type="button" class="btn btn-xs btn-danger myBtnDel"><i class="fa fa-trash-o  fa-fw"></i>xóa</button>
																			</a>
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
                                                              <logic:present name="formTaiSan" property="pages">
                                                              	<logic:iterate name="formTaiSan" property="pages" id="a">
																	<html:link action="/tai-san.do" paramName="a" paramId="page">
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
                                                  <!--  <div class="col-sm-4"> -->
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
    			<!-- Modal insert-->
					<div class="modal fade" id="myModal" role="dialog">
						<div class="modal-dialog">
							
							<!-- Modal content-->
							<div class="modal-content">
								<div class="modal-header" style="padding:35px 50px;">
									<button type="button" class="close" data-dismiss="modal">&times;</button>
									<h4><span class="fa fa-lock"></span> Thêm tài sản mới</h4>
								</div>
								<div class="modal-body" style="padding:40px 50px;">
									
									<html:form action="/tai-san" acceptCharset="UTF-8" method="post" enctype="multipart/form-data">
										<div id = "themthanhcong">
										</div>
										<div class="form-group">
											<label for="mataisan"><span class="fa fa-user"></span> Mã tài sản</label>
											<html:text styleClass="form-control" styleId="mataisan" property="maTaiSan" readonly="true"/>
										</div>
										<div class="form-group">
											<label for="tentaisan"><span class="fa fa-eye"></span> Tên tài sản</label>
											<html:text styleClass="form-control" styleId="tentaisan" 
												 onblur = "validate()" property="tenTaiSan"/>
											<div id = "div1"></div>
										</div>
										<div class = "form-group">
											<label>Loại tài sản</label>
											<html:select property="maLoaiTaiSan" value="..chon.." styleClass="form-control">
												<html:option value="">..chon..</html:option>
												<html:optionsCollection name="formTaiSan" property="listLoaiTS" label="tenLoaiTaiSan"
												value="maLoaiTaiSan"/>
											</html:select>
											<div id = "div2"></div>
										</div>
										<div class="form-group">
											<label for="tinhtrang"><span class="fa fa-user"></span> Tình trạng </label>
											<html:text styleClass="form-control" styleId="tinhtrang" onblur = "validate()" property="tinhTrang"/>
											<div id = "div3"></div>
										</div>
										<div class="form-group">
											<label for="mota"><span class="fa fa-user"></span> Mô tả </label>
											<html:text styleClass="form-control" styleId="mota" onblur = "validate()" property="moTa"/>
											<div id = "div4"></div>
										</div>
										<div class="form-group" style = "height: 50px">
											<label for="hinhanh"><span class="fa fa-user"></span> Hình ảnh </label>
											<html:file styleClass="form-control" styleId="hinhanh" onblur = "validate()"
												style = "height: 30px; padding-top: 5px; padding-bottom: 30px" property="formFile"/>
											<div id = "div5"></div>
									</div>
										<div class = "row" style = "margin-top: 30px">
											<div class = "col-lg-6">
												<html:submit styleClass="btn btn-success btn-block" onclick = "validate()" property="submit" value="them"></html:submit>
											</div>
											<div class = "col-lg-6">
												<button type="reset" class="btn btn-danger btn-block"><span class="fa fa-times"></span> Reset </button>
											</div>
										</div>
									</html:form>
								</div>
							</div>
      
						</div>
					</div> 
    			<!-- end modal insert -->
    			
    			<!-- Modal delete-->
					<div class="modal fade" id="myModalDel" role="dialog">
					    <div class="modal-dialog modal-sm">
					      <div class="modal-content">
					        <div class="modal-header">
					        	<button type="button" class="close" data-dismiss="modal">&times;</button>
					          <div class="row">
					          	<h4 class="modal-title"><span class="fa fa-question-circle"></span> Bạn có muốn xóa?</h4>
					          	<h5  class="tents"></h5>
					          </div>
					        </div>
					        <div class="modal-body">
					          <div class="row">
					          	<html:form action="/tai-san" method="post">
					          		<div class="row">
					          			<html:text property="maTaiSan" styleId="mats" styleClass="rsMaTaiSan"></html:text>
					          			<script type="text/javascript">
					          				$(function(){
					          					$('#mats').hide();
					          				});
					          			</script>
					          		</div>
					          		<div class="row" style="    margin-left: 0px;    margin-right: 0px;">
					          			<div class="col-sm-6">
					          				<html:submit styleClass="btn btn-primary btn-block" property="submit" value="Xóa"/>
							          	</div>
							          	<div class="col-sm-6">
							          		<button type="submit" class="btn btn-danger btn-block" data-dismiss="modal"><span>Hủy</span></button>
							          	</div>
					          		</div>
					          	</html:form>
					          </div>
					        </div>
					      </div>
					    </div>
					  </div>
    			<!-- end modal delete -->
    <!-- /#wrapper -->
	      <!-- ajax -->
    <script type="text/javascript">
    	
    	//load data ajax server -> client
    	function loadDataAjax(key){
    		
    		//var ten=$('#rsTenTaiSan').val();
			
			//alert(page);
			
			$.ajax({
				type:'POST',
				async: true,
				url:'/QuanLyCamDov1.0.4/tim-kiem-tai-san.do',
				data: "tenTaiSan="+key+"",
				cache:false,
				dataType:'json',
				success: function (response){
					var arr = [];
					
					var rs="";
				
					
					for ( var key in response) {
                    	//set data from json to array
                    	arr.push(key);
                    	
                    	console.log(arr);
					}
					
					/* $.each(response, function(key, value) {
					      var tblRow = "<tr>" + "<td>" + f.id + "</td>" + "<td>" + f.user.username + "</td>" + "<td>" + f.message + "</td>" + "<td> " + f.location + "</td>" +  "<td>" + f.at + "</td>" + "</tr>"
					       $(tblRow).appendTo("#showall tbody");
					 }); */
					
					if(arr.length!=0){
						
 						for ( var re in response) {
    					    	 
    					    	rs+="<tr class=\"odd gradeX\" align=\"center\">"
			                        	+"<td class=\"maTaiSan\">"
						                	+""+response[re].maTaiSan+""
										+"</td>"
						                +"<td class=\"tenTaiSan\">"
						                	+""+response[re].tenTaiSan+""
						                +"</td>"
						                +"<td>"
						                	+""+response[re].loaiTaiSan.tenLoaiTaiSan+""
										+"</td>"
						                +"<td>"
						                	+""+response[re].moTa+""
						                +"</td>"
						                +"<td>"
						                	+"<img src="+response[re].hinhAnh+" alt = \"product\" style = \"height: 50px; weight: 50px\"/>"
						                +"</td>"
						                +"<td class=\"center\">"
										+"<a href=\"#\">"
											+"<button type=\"button\" class=\"btn btn-xs btn-danger myBtnDel\"><i class=\"fa fa-trash-o  fa-fw\"></i>xóa</button>"
										+"</a>"
										+"</td>"
			                    	+"</tr>"
			                    	
			                    	//$('#showall').append(rs);
			                    	// $(rs).appendTo("#showall tbody");
							}
					}else{
						rs="";
					}
                    
                  //hien thi table danh sach
			 	   $('#showall tbody').html(rs);
                  
				},
				error: function(e){
					//alert('loi '+e);
                }
			});
		
    	}
    	
    	//su kien lay data
    	$(function(){
    		var timeoutID = null;

    	    function findMember(key) {
    	      console.log('search: ' + key);
    	      loadDataAjax(key);
    	    }

    	    $('#rsTenTaiSan').keyup(function(e) {
    	      clearTimeout(timeoutID);
    	      timeoutID = setTimeout(findMember.bind(undefined, e.target.value), 500);
    	    });
    	    
    		/* $('#rsTenTaiSan').keyup(function(){
    			loadDataAjax(); 
    		}); */
    	});
    	
    	
    	$(function(){
			$("#myBtn").click(function(){
				$("#myModal").modal();
			});
			

			
			$(".myBtnDel").click(function(){
				$("#myModalDel").modal();
				
				//lấy giá trị của một cột trong table td masv
		 		    var $maTaiSan = $(this).closest("tr")   // Finds the closest row <tr> 
		 		                       .find(".maTaiSan")     // Gets a descendent with class="maTaiSan"
		 		                       .text();      // Retrieves the text within <td>
		 		 
		 		  //lấy giá trị của một cột trong table td masv
		 		    var $tenTaiSan = $(this).closest("tr")   // Finds the closest row <tr> 
		 		                       .find(".tenTaiSan")     // Gets a descendent with class="tenTaiSan"
		 		                       .text();      // Retrieves the text within <td>
		 		                       
		 		 //set value for input maTaiSan
			 		  $('.rsMaTaiSan').each(function(){
			             	$(this).val($maTaiSan.trim());
			       		 });
		 		 
			 	//set value for input tenTaiSan
			 		  $('.tents').html($tenTaiSan);
			
			});
		});
    	
    </script>
    
    <!-- end ajax -->
</body>

</html>
