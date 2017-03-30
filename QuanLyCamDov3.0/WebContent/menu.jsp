<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles"%>
<!-- Navigation -->
<nav class="navbar navbar-inverse navbar-fixed-top " role="navigation">
	<!-- Brand and toggle get grouped for better mobile display -->
	<div class="navbar-header">
		<button type="button" class="navbar-toggle" data-toggle="collapse"
			data-target=".navbar-ex1-collapse">
			<span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span>
			<span class="icon-bar"></span> <span class="icon-bar"></span>
		</button>
		<a class="navbar-brand" href="thanh-ly-tai-san.do">SE18 Admin</a>
	</div>
	<!-- Top Menu Items -->
	<ul class="nav navbar-right top-nav">
		<li class="dropdown"><a href="" class="dropdown-toggle"
			data-toggle="dropdown"><i class="fa fa-user"></i> <logic:empty
					name="hangThanhLyForm">
					<jsp:forward page="thanh-ly-tai-san.do"></jsp:forward>
				</logic:empty> <logic:empty name="hangThanhLyForm" property="taiKhoan">
					<jsp:forward page="thanh-ly-tai-san.do"></jsp:forward>
				</logic:empty> <logic:notEmpty name="hangThanhLyForm" property="taiKhoan">
					<bean:define id="a" name="hangThanhLyForm" property="taiKhoan"></bean:define>
					<bean:write name="a" />
				</logic:notEmpty> <b class="caret"></b></a>
			<ul class="dropdown-menu">
				<li><a href="thanh-ly-tai-san.do"><i
						class="fa fa-fw fa-power-off"></i> Log Out</a></li>
			</ul></li>
	</ul>
	<!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
	<div class="collapse navbar-collapse navbar-ex1-collapse">
		<ul class="nav navbar-nav side-nav">
			<li><a href="thong-ke.do?action=hopdonghethan"><i
					class="fa fa-home"></i> Trang chủ</a></li>
			<li><a href="javascript:;" data-toggle="collapse"
				data-target="#QuanLyHopDong"><i class="fa fa-fw fa-table"></i>
					Quản lý hợp đồng <i class="fa fa-fw fa-caret-down"></i></a>
				<ul id="QuanLyHopDong" class="collapse">
					<li><a href="themHopDong.do"> Thêm Hợp Đồng</a></li>
					<li><a href="danhsachhopdong.do"> Danh Sách Hợp Đồng</a></li>
				</ul></li>
			<li><a href="tai-san.do"><i class="fa fa-fw fa-desktop"></i>
					Quản lý tài sản</a></li>
			<li><a href="javascript:;" data-toggle="collapse"
				data-target="#demo"><i class="fa fa-fw fa-bar-chart-o"></i>
					Thống kê <i class="fa fa-fw fa-caret-down fa fa-bar-chart-o fa-fw"></i></a>
				<ul id="demo" class="collapse">
					<li><a href="thong-ke.do?action=listsanpham"> Sản phầm
							trong kho</a></li>
					<li><a href="thong-ke.do?action=listkhachhang"> Khách hàng</a>
					</li>
					<li class="active"><a href="thong-ke.do?action=listthanhtoan">
							Doanh thu theo tháng và năm</a></li>
				</ul></li>
		</ul>
	</div>
	<!-- /.navbar-collapse -->
</nav>