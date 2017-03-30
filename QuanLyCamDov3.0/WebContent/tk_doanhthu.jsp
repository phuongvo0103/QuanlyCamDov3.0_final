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
	
		<!-- biểu đồ -->
	<!-- <script type="text/javascript" src="/js/jquery.canvasjs.min.js"></script> -->
	<script type="text/javascript" src="js/canvasjs.min.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="js/bootstrap.min.js"></script>

	
<title>Thống kê- Doanh thu</title>

<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="css/sb-admin.css" rel="stylesheet">

<link href="css/style.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="css/font-awesome.min.css" rel="stylesheet" type="text/css">

<!-- biều đồ -->
<script type="text/javascript">
	
   	//load data ajax server -> client
	function loadDataAjax(){
		
		var nam=$('#rsnam').val();
		var dataPointss=[];
		
		$.ajax({
			type:'POST',
			async: false,
			url:'/QuanLyCamDov1.0.4/thong-ke-doanh-thu.do',
			data: "nam="+nam+"",
			cache:false,
			dataType:'json',
			success: function (response){
				
				for ( var re in response){
						dataPointss.push({x: new Date(response[re].ngayThanhToan), y: Math.round(response[re].tongDoanhThu), 
							indexLabel: "thu được", markerType: "triangle",  markerColor: "#6B8E23", markerSize: 12});
						
				    }
					
					displayChart(dataPointss,nam);	
			},
			error: function(e){
				alert('loi '+e);
            }
		});
	
	}
   	
	//su kien lay data
	$(function(){
		
		$('#rsnam').change(function(){
			loadDataAjax();
		});
	});
   	
	
	function displayChart(dataPointss,nam){
		/* thống kê theo tháng của năm */  
		  var chart = new CanvasJS.Chart("chartContainer",
				    {
				      title:{
				       text: "Doanh thu tháng/năm "+nam+""   
				     },
				     theme: "theme4",
				     animationEnabled: true,
				     axisX: {
				       valueFormatString: "MMM"      
				      },
				      axisY:{
				        valueFormatString: "#0"
				      },
				     data: [
				     {        
				      type: "line",
				      showInLegend: true,
				      legendText: "BShop Share",
				      dataPoints: dataPointss
				    	/* [   
				    		
					      	{ x: new Date(2017, 01, 1), y: 30, indexLabel: "gain", markerType: "triangle",  markerColor: "#6B8E23", markerSize: 12},
					      	{ x: new Date(2017, 02, 1) , y: 50, indexLabel: "loss", markerType: "cross", markerColor: "tomato" , markerSize: 12  },
					      	{ x: new Date(2017, 03, 1) , y: 20, indexLabel: "loss", markerType: "cross", markerColor: "tomato" , markerSize: 12 },
					      	{ x: new Date(2017, 04, 1) , y: 40, indexLabel: "gain", markerType: "triangle", markerColor: "#6B8E23", markerSize: 12 },
					      	{ x: new Date(2017, 05, 1) , y: 80, indexLabel: "gain", markerType: "triangle", markerColor: "#6B8E23", markerSize: 12 },
					      	{ x: new Date(2017, 06, 1) , y: 10, indexLabel: "loss", markerType: "cross", markerColor: "tomato" , markerSize: 12 },
					      	{ x: new Date(2017, 07, 1) , y: 60, indexLabel: "loss", markerType: "cross", markerColor: "tomato" , markerSize: 12 },
					      	{ x: new Date(2017, 08, 1) , y: 70, indexLabel: "gain", markerType: "triangle", markerColor: "#6B8E23", markerSize: 12 },
					      	{ x: new Date(2017, 09, 1) , y: 10, indexLabel: "loss", markerType: "cross", markerColor: "tomato" , markerSize: 12 }
				      	] */
				    }
				    ]
				  });

				chart.render();
	}
	
  window.onload = function () {
	  /* thống kê theo tháng của năm */  
	  var chart = new CanvasJS.Chart("chartContainer",
			    {
			      title:{
			       text: "Doanh thu tháng/năm"   
			     },
			     theme: "theme4",
			     animationEnabled: true,
			     axisX: {
			       valueFormatString: "MMM"      
			      },
			      axisY:{
			        valueFormatString: "#0"
			      },
			     data: [
			     {        
			      type: "line",
			      showInLegend: true,
			      legendText: "BShop Share",
			      dataPoints:
			    	[ 
				      	/* { x: new Date(2017, 01, 1), y: 30, indexLabel: "gain", markerType: "triangle",  markerColor: "#6B8E23", markerSize: 12},
				      	{ x: new Date(2017, 02, 1) , y: 50, indexLabel: "loss", markerType: "cross", markerColor: "tomato" , markerSize: 12  },
				      	{ x: new Date(2017, 03, 1) , y: 20, indexLabel: "loss", markerType: "cross", markerColor: "tomato" , markerSize: 12 },
				      	{ x: new Date(2017, 04, 1) , y: 40, indexLabel: "gain", markerType: "triangle", markerColor: "#6B8E23", markerSize: 12 },
				      	{ x: new Date(2017, 05, 1) , y: 80, indexLabel: "gain", markerType: "triangle", markerColor: "#6B8E23", markerSize: 12 },
				      	{ x: new Date(2017, 06, 1) , y: 10, indexLabel: "loss", markerType: "cross", markerColor: "tomato" , markerSize: 12 },
				      	{ x: new Date(2017, 07, 1) , y: 60, indexLabel: "loss", markerType: "cross", markerColor: "tomato" , markerSize: 12 },
				      	{ x: new Date(2017, 08, 1) , y: 70, indexLabel: "gain", markerType: "triangle", markerColor: "#6B8E23", markerSize: 12 },
				      	{ x: new Date(2017, 09, 1) , y: 10, indexLabel: "loss", markerType: "cross", markerColor: "tomato" , markerSize: 12 }  */
			      	] 
			    }
			    ]
			  });

			chart.render();
			
	/* thống kê theo năm */
	 var chart1 = new CanvasJS.Chart("chartContainer1",
				{
					title:{
						text: "Doanh thu theo năm"
					},
					exportFileName: "Pie Chart",
					exportEnabled: true,
			                animationEnabled: true,
					legend:{
						verticalAlign: "bottom",
						horizontalAlign: "center"
					},
					data: [
					{       
						type: "pie",
						showInLegend: true,
						toolTipContent: "{name}: <strong>{y}vnđ</strong>",
						indexLabel: "{name} {y}",
						dataPoints: [
							<logic:present name="formThongKe" property="listDT">
								<logic:iterate id="dt" name="formThongKe" property="listDT">
									{  y: <bean:write name="dt" property="tongDoanhThu" format="#"/>,  name:"<bean:write name="dt" property="nam"/>"},									
								</logic:iterate>
							</logic:present>
								/* {y:20,name:"2016",exploded: true},
								{y:70,name:"2017"}, */
						]
				}
				]
				});
				chart1.render();
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
				<div class="row">
					<div class="col-lg-12">
						<h1 class="page-header">
							Thống kê <small>Doanh thu</small>
						</h1>
					</div>
				</div>
				<!-- /.row -->
				<!-- col-lg-3 col-md-6 -->
				<!-- /.row -->
				<!-- end row -->
			</div>
			<!-- /.row -->
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-primary">
						<div class="panel-heading">
							<h3 class="panel-title">
								<i class="fa fa-fw fa-table"></i> Thống kê doanh thu theo tháng và năm
							</h3>
						</div>
						<div class="panel-body">
							<!-- <div id="morris-area-chart"></div> -->
							<div class="row">
								<div class="col-lg-12">
									<div class="col-sm-4">
										<div class="panel panel-success">
											<div class="panel-heading">
												<h3 class="panel-title">
													<i class="fa fa-money fa-fw"></i> Chọn năm
												</h3>
											</div>
											<div class="panel-body">
												<div class="form-group">
													<html:select property="nam" value=".. Chọn năm .."
														styleClass="form-control" styleId="rsnam">
														<html:option value="">.. Chọn năm ..</html:option>
														<html:option value="2016">2016</html:option>
														<html:option value="2017">2017</html:option>
													</html:select>
												</div>
											</div>
										</div>
									</div>
									<div class="col-sm-4">
									</div>
									<div class="col-sm-4"></div>
								</div>
							</div>
							<div class="row">
								<div class="col-sm-7">
									<div class="panel panel-info">
											<div class="panel-heading">
												<h3 class="panel-title">
													<i class="fa fa-calendar"></i> Thông kê theo tháng/năm (triệu/vnđ)
												</h3>
											</div>
											<div class="panel-body">
												<!-- bieeu đồ 1 -->
												<div id="chartContainer" style="height: 300px; width: 100%;">
												</div>
											</div>
										</div>
									</div>
									<div class="col-sm-5" style="padding-left: 0px;">
									<div class="panel panel-info">
										<div class="panel-heading">
											<h3 class="panel-title">
												<i class="fa fa-info-circle"></i> Thống kê theo năm (triệu/vnđ)
											</h3>
										</div>
										<div class="panel-body">
											<!-- biều đồ 2 -->
											<div id="chartContainer1" style="height: 300px; width: 100%;"></div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- /.container-fluid -->

					</div>
					<!-- /#page-wrapper -->

				</div>
			</div>
		</div>
	</div>
	<!-- /#wrapper -->
</body>

</html>
