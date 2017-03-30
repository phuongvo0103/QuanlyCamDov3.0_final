<%@page import="com.sun.xml.internal.bind.v2.schemagen.xmlschema.Import"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles"%>
<%@taglib uri="http://java.sun.com/jstl/fmt" prefix="fmt"%>
<%@ page import="bo.DangNhapBO" %>
<!Doctype html>
<html lang="en" class="no-js">
<head>
<title>SE18 - CẦM ĐỒ MỌI LÚC MỌI NƠI</title>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<meta name="author" content="HRProDesign">
<!-- Icons -->
<link rel="shortcut icon" href="custom/images/favicon.png">

<!-- <link href='http://fonts.googleapis.com/css?family=Lato:300,400,700,900' rel='stylesheet' type='text/css'> -->
<!-- <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet"> -->

<link rel="stylesheet" type="text/css"
	href="custom/css/bootstrap.min.css" media="screen">
<link rel="stylesheet" type="text/css"
	href="custom/css/owl.carousel.css" media="screen">
<link rel="stylesheet" type="text/css" href="custom/css/owl.theme.css"
	media="screen">
<link rel="stylesheet" type="text/css"
	href="custom/css/jquery.bxslider.css" media="screen">
<link rel="stylesheet" type="text/css"
	href="custom/css/magnific-popup.css" media="screen">
<link rel="stylesheet" type="text/css"
	href="custom/css/font-awesome.css" media="screen">
<link rel="stylesheet" type="text/css" href="custom/css/animate.css"
	media="screen">

<!-- REVOLUTION BANNER CSS SETTINGS -->
<link rel="stylesheet" type="text/css" href="custom/css/settings.css"
	media="screen" />
<link rel="stylesheet" type="text/css" href="custom/css/style.css"
	media="screen">

<link rel="stylesheet" type="text/css" href="custom/css/normalize.css" />
<link rel="stylesheet" type="text/css" href="custom/css/bookblock.css" />
<link rel="stylesheet" type="text/css" href="custom/css/component.css" />
<script src="custom/js/modernizr.custom.js"></script>

<script type="text/javascript" src="custom/js/jquery.min.js"></script>
<script type="text/javascript" src="custom/js/jquery.migrate.js"></script>
<script type="text/javascript" src="custom/js/owl.carousel.min.js"></script>
<script type="text/javascript"
	src="custom/js/jquery.magnific-popup.min.js"></script>
<script type="text/javascript" src="custom/js/jquery.bxslider.min.js"></script>
<script type="text/javascript" src="custom/js/jquery.appear.js"></script>
<script type="text/javascript" src="custom/js/jquery.countTo.js"></script>
<script type="text/javascript" src="custom/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="custom/js/jquery.imagesloaded.min.js"></script>
<script type="text/javascript" src="custom/js/jquery.isotope.min.js"></script>
<script type="text/javascript" src="custom/js/retina-1.1.0.min.js"></script>
<script type="text/javascript" src="custom/js/plugins-scroll.js"></script>
<script type="text/javascript" src="custom/js/smooth-scroll.js"></script>
<script type="text/javascript" src="custom/js/waypoint.min.js"></script>
<!-- SLIDER REVOLUTION 4.x SCRIPTS  -->
<script type="text/javascript"
	src="custom/js/jquery.themepunch.tools.min.js"></script>
<script type="text/javascript"
	src="custom/js/jquery.themepunch.revolution.min.js"></script>
<!-- 
  	<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script>
	<script type="text/javascript" src="js/gmap3.min.js"></script> -->
<script type="text/javascript" src="custom/js/script.js"></script>

<!-- Revolution slider -->
<script type="text/javascript">

		jQuery(document).ready(function() {
						
			jQuery('.tp-banner').show().revolution(
			{
				dottedOverlay:"none",
				delay:10000,
				startwidth:960,
				startheight:680,
				hideThumbs:200,
				
				thumbWidth:100,
				thumbHeight:50,
				thumbAmount:5,
				
				navigationType:"bullet",
				
				touchenabled:"on",
				onHoverStop:"off",
				
				swipe_velocity: 0.7,
				swipe_min_touches: 1,
				swipe_max_touches: 1,
				drag_block_vertical: false,
										
				parallax:"mouse",
				parallaxBgFreeze:"on",
				parallaxLevels:[7,4,3,2,5,4,3,2,1,0],
										
				keyboardNavigation:"off",
				
				navigationHAlign:"center",
				navigationVAlign:"bottom",
				navigationHOffset:0,
				navigationVOffset:120,
				soloArrowLeftHOffset:250,
				soloArrowRightHOffset:250,
				shadow:0,
				fullWidth:"off",

				spinner:"spinner4",
				
				stopLoop:"off",
				stopAfterLoops:-1,
				stopAtSlide:-1,

				shuffle:"off",
				
				autoHeight:"off",						
				forceFullWidth:"off",												
										
				hideThumbsOnMobile:"off",
				hideNavDelayOnMobile:1500,						
				hideBulletsOnMobile:"off",
				hideArrowsOnMobile:"off",
				hideThumbsUnderResolution:0,
				
				hideSliderAtLimit:0,
				hideCaptionAtLimit:0,
				hideAllCaptionAtLilmit:0,
				startWithSlide:0,
				fullScreenOffsetContainer: ".header"	
			});
							
		});	//ready
		
	</script>

<style>
#header, .close {
	background-color: #337ab7;
	color: white !important;
	text-align: center;
	font-size: 30px;
}

.modal-footer {
	background-color: #f9f9f9;
}
</style>
</head>
<body>

	<!-- Container -->
	<div id="container">
		<!-- Header
		    ================================================== -->
		<header class="clearfix">
			<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
				<div class="container">
					<!-- Brand and toggle get grouped for better mobile display -->
					<div class="navbar-header">
						<button type="button" class="navbar-toggle collapsed"
							data-toggle="collapse"
							data-target="#bs-example-navbar-collapse-1">
							<span class="sr-only">Toggle navigation</span> <span
								class="icon-bar"></span> <span class="icon-bar"></span> <span
								class="icon-bar"></span>
						</button>
						<a class="navbar-brand" href="index.html">B<span>Shop</span></a>
					</div>

					<!-- Collect the nav links, forms, and other content for toggling -->
					<div class="collapse navbar-collapse"
						id="bs-example-navbar-collapse-1">
						<ul class="nav navbar-nav navbar-right navigate-section">
							<li><a class="active" href="#home-section">TRANG CHỦ</a></li>
							<li><a href="#shop-section">HÀNG THANH LÝ</a></li>
							<li><a href="#contact-section">LIÊN HỆ</a></li>
							<li style="padding: 17px 15px;"><button type="button"
									class="btn btn-default" id="myBtn">Đăng nhập</button></li>
						</ul>
					</div>
					<!-- /.navbar-collapse -->
				</div>
				<!-- /.container-fluid -->
			</nav>
		</header>
		<!-- End Header -->

		<!-- home-section 
			================================================== -->
		<section id="home-section" class="slider1">

			<!--
			#################################
				- THEMEPUNCH BANNER -
			#################################
			-->
			<div class="tp-banner-container">
				<div class="tp-banner">
					<ul>
						<!-- SLIDE  -->
						<li data-transition="fade" data-slotamount="7"
							data-masterspeed="500" data-saveperformance="on"
							data-title="Intro Slide">
							<!-- MAIN IMAGE --> <img src="custom/images/slide/4.jpg"
							alt="slidebg1" data-lazyload="custom/images/slide/5.jpg"
							data-bgposition="center top" data-bgfit="cover"
							data-bgrepeat="no-repeat"> <!-- LAYERS --> <!-- LAYER NR. 1 -->
							<div
								class="tp-caption small_text lft tp-resizeme rs-parallaxlevel-0"
								data-x="325" data-y="240"
								data-customin="x:0;y:0;z:0;rotationX:0;rotationY:0;rotationZ:0;scaleX:0;scaleY:0;skewX:0;skewY:0;opacity:0;transformPerspective:600;transformOrigin:50% 50%;"
								data-speed="500" data-start="1200"
								data-easing="Power3.easeInOut" data-splitin="none"
								data-splitout="none" data-elementdelay="0.05"
								data-endelementdelay="0.1"
								style="z-index: 7; margin-left: -50px; max-width: auto; max-height: auto; white-space: nowrap;">
								<h4>HỆ THỐNG CẦM ĐỒ MỌI LÚC MỌI NƠI</h4>
							</div> <!-- LAYER NR. 2 -->
							<div
								class="tp-caption finewide_medium_white customin tp-resizeme rs-parallaxlevel-0"
								data-x="90" data-y="282"
								data-customin="x:0;y:0;z:0;rotationX:0;rotationY:0;rotationZ:0;scaleX:0;scaleY:0;skewX:0;skewY:0;opacity:0;transformPerspective:600;transformOrigin:50% 50%;"
								data-speed="500" data-start="1800"
								data-easing="Power3.easeInOut" data-splitin="none"
								data-splitout="none" data-elementdelay="0.1"
								data-endelementdelay="0.1"
								style="z-index: 8; margin-left: -200px; max-width: auto; max-height: auto; white-space: nowrap;">
								TIN CẬY <span style="color: #1a88e8">NHANH CHÓNG </span> THÂN
								THIỆN<br>
							</div> <!-- LAYER NR. 3 -->
							<div
								class="tp-caption small_text lfr tp-resizeme rs-parallaxlevel-0"
								data-x="365" data-y="368"
								data-customin="x:0;y:0;z:0;rotationX:0;rotationY:0;rotationZ:0;scaleX:0;scaleY:0;skewX:0;skewY:0;opacity:0;transformPerspective:600;transformOrigin:50% 50%;"
								data-speed="500" data-start="2200"
								data-easing="Power3.easeInOut" data-splitin="none"
								data-splitout="none" data-elementdelay="0.05"
								data-endelementdelay="0.1"
								style="z-index: 7; margin-left: -100px; max-width: auto; max-height: auto; white-space: nowrap;">
									200 Nguyễn Văn Linh - Thành Phố Đà Nẵng<br>
									Liên hệ với chúng tôi : 01212159592
								</div>

						</li>

						<!-- SLIDE  -->
						<li data-transition="fade" data-slotamount="7"
							data-masterspeed="2000" data-saveperformance="on"
							data-title="Ken Burns Slide">
							<!-- MAIN IMAGE --> <img src="custom/images/dummy.png" alt="2"
							data-lazyload="custom/images/slide/4.jpg"
							data-bgposition="right top" data-kenburns="on"
							data-duration="12000" data-ease="Power0.easeInOut"
							data-bgfit="115" data-bgfitend="100"
							data-bgpositionend="center bottom"> <!-- LAYERS --> <!-- LAYER NR. 1 -->
							<div
								class="tp-caption small_text lft tp-resizeme rs-parallaxlevel-0"
								data-x="0" data-y="190"
								data-customin="x:0;y:0;z:0;rotationX:0;rotationY:0;rotationZ:0;scaleX:0;scaleY:0;skewX:0;skewY:0;opacity:0;transformPerspective:600;transformOrigin:50% 50%;"
								data-speed="500" data-start="1200"
								data-easing="Power3.easeInOut" data-splitin="none"
								data-splitout="none" data-elementdelay="0.05"
								data-endelementdelay="0.1"
								style="z-index: 7; max-width: auto; max-height: auto; white-space: nowrap;">PHỤC
								VỤ MỌI LÚC</div> <!-- LAYER NR. 2 -->
							<div
								class="tp-caption finewide_medium_white customin tp-resizeme rs-parallaxlevel-0 padd-lf-none"
								data-x="0" data-y="232"
								data-customin="x:0;y:0;z:0;rotationX:0;rotationY:0;rotationZ:0;scaleX:0;scaleY:0;skewX:0;skewY:0;opacity:0;transformPerspective:600;transformOrigin:50% 50%;"
								data-speed="500" data-start="1800"
								data-easing="Power3.easeInOut" data-splitin="none"
								data-splitout="none" data-elementdelay="0.1"
								data-endelementdelay="0.1"
								style="z-index: 8; max-width: auto; max-height: auto; white-space: nowrap;">
								<div style="color: #1a88e8; font-family: Time New Roman;">100%
									TÀI SẢN ĐƯỢC ĐẢM BẢO</div>
								ĐÁNH GIÁ SÁT THỊ TRƯỜNG <br>
							</div> <!-- LAYER NR. 3 -->
							<!-- <div
								class="tp-caption small_text lfr tp-resizeme rs-parallaxlevel-0"
								data-x="0" data-y="376"
								data-customin="x:0;y:0;z:0;rotationX:0;rotationY:0;rotationZ:0;scaleX:0;scaleY:0;skewX:0;skewY:0;opacity:0;transformPerspective:600;transformOrigin:50% 50%;"
								data-speed="500" data-start="2200"
								data-easing="Power3.easeInOut" data-splitin="none"
								data-splitout="none" data-elementdelay="0.05"
								data-endelementdelay="0.1"
								style="z-index: 7; max-width: auto; max-height: auto; white-space: nowrap;">
								<div style="color: #1a88e8; font-family: Time New Roman;">GIẢI
									NGÂN NHANH</div>
							</div> -->
						</li>
						<!-- SLIDE  -->
						<li data-transition="fade" data-slotamount="7"
							data-masterspeed="1000" data-saveperformance="on"
							data-title="Parallax 3D">
							<!-- MAIN IMAGE --> <img src="custom/images/slide/3.jpg"
							alt="3dbg" data-lazyload="custom/images/slide/7.jpg"
							data-bgposition="center top" data-bgfit="cover"
							data-bgrepeat="no-repeat"> <!-- LAYERS --> <!-- LAYER NR. 1 -->
							<div
								class="tp-caption small_text lft tp-resizeme rs-parallaxlevel-0"
								data-x="325" data-y="240"
								data-customin="x:0;y:0;z:0;rotationX:0;rotationY:0;rotationZ:0;scaleX:0;scaleY:0;skewX:0;skewY:0;opacity:0;transformPerspective:600;transformOrigin:50% 50%;"
								data-speed="500" data-start="1200"
								data-easing="Power3.easeInOut" data-splitin="none"
								data-splitout="none" data-elementdelay="0.05"
								data-endelementdelay="0.1"
								style="z-index: 7; margin-left: -450px; margin-top: -240px; max-width: auto; max-height: auto; white-space: nowrap;">
								<!-- <h4 style="color:red;font-weight: bold; font-family:Time New Roman;">MỪNG KHAI TRƯƠNG TỪ 3/4/2017 - 4/4/2017</h4> -->
							</div> <!-- LAYER NR. 2 -->
							<div
								class="tp-caption finewide_medium_white customin tp-resizeme rs-parallaxlevel-0"
								data-x="90" data-y="282"
								data-customin="x:0;y:0;z:0;rotationX:0;rotationY:0;rotationZ:0;scaleX:0;scaleY:0;skewX:0;skewY:0;opacity:0;transformPerspective:600;transformOrigin:50% 50%;"
								data-speed="500" data-start="1800"
								data-easing="Power3.easeInOut" data-splitin="none"
								data-splitout="none" data-elementdelay="0.1"
								data-endelementdelay="0.1"
								style="z-index: 8; margin-left: -300px; margin-top: -250px; max-width: auto; max-height: auto; white-space: nowrap;">
								<div style="color: blue; font-family: Time New Roman;">
									HỆ THỐNG CẦM ĐỒ SE18 .XIN CHÀO QUÝ KHÁCH</div>
							</div>
						</li>
					</ul>
					<div class="tp-bannertimer"></div>
				</div>
			</div>
		</section>
		<!-- End home section -->

		<!-- product-marketing-section
			================================================== -->
		<div id="product-marketing-section">
			<div class="marketing-box">
				<div class="product">
					<img alt="" src="custom/images/bg/guide.jpg">
					<div class="hover-mark">
						<h2>CẦM ĐỒ XE MÁY</h2>
						<p>
							Bảo quản cẩn thận <br> Chấp nhận tất cả các dòng xe trên thị
							trường <br> Cam kết tài sản còn nguyên vẹn
						</p>
						<h3 class="offer">
							<span>100%</span>
						</h3>
					</div>
				</div>
				<div class="product">
					<img alt="" src="custom/images/bg/vang.jpg">
					<div class="hover-mark">
						<h2>CẦM CÁC ĐỒ TRANG SỨC</h2>
						<p>An toàn - tin cậy - giá cả sát với thị trường</p>
					</div>
				</div>
				<div class="product">
					<img alt="" src="custom/images/bg/deal.jpg">
					<div class="hover-mark">
						<h2>Cầm giấy tờ tùy thân</h2>
						<p>
							CMND - giấy phép lái xe - sổ hộ khẩu <br> 100.000đ cho mỗi
							loại
						</p>
					</div>
				</div>
				<div class="product">
					<img alt="" src="custom/images/bg/shiping.jpg">
					<div class="hover-mark">
						<h2>CẦM ĐỒ ĐIỆN THOẠI LAPTOP</h2>
						<p>
							Tài sản được niêm phong.<br> Bảo quản an toàn tuyệt đối
						</p>
					</div>
				</div>
			</div>
		</div>
		<!-- End product-marketing-section -->

		<!-- shop-section
			================================================== -->
		<div id="shop-section">
			<div id="scroll-wrap" class="container">
				<div class="title-section">
					<h1>Hàng Thanh Lý</h1>
				</div>
				<div id="bookshelf" class="bookshelf products-box">
					<!-- Book Item-->
					<logic:present name="hangThanhLyForm" property="listTL">
						<logic:iterate id="tl" name="hangThanhLyForm" property="listTL">
							<figure class="product-post"
								style="padding: 0 0; background: #f9f6f6;">
								<div class="book" data-book="book-1"
									style="background-image: url(<bean:write name="tl" property="hinhAnh"/>);
																		    padding: 0;
																		    margin: 0;
																		    background-size: cover;
																		    width: 100%;">
									<%-- <img alt="" src="<bean:write name="tl" property="hinhAnh"/>"> --%>
								</div>
								<div class="buttons">
									<a href="#">Chi Tiết</a>
								</div>
								<span><bean:write name="tl" property="tenTaiSanThanhLy" /></span>
								<div class="product-links">
									<span style="font-size: 22px;"><b>Giá: </b>
									<bean:write name="tl" property="soTienThanhLy" /></span>
								</div>
							</figure>
						</logic:iterate>
					</logic:present>
					<!--End Book Item-->
				</div>
				<div class="title-section">
					<div class="dataTables_paginate paging_simple_numbers"
						id="dataTables-example_paginate">
						<ul class="pagination">
							<li class="paginate_button" aria-controls="dataTables-example"
								tabindex="0"><logic:present name="hangThanhLyForm"
									property="pages">
									<logic:iterate name="hangThanhLyForm" property="pages" id="a">
										<html:link action="/thanh-ly-tai-san.do" paramName="a"
											paramId="page">
											<bean:write name="a" />
										</html:link>
									</logic:iterate>
								</logic:present></li>
						</ul>
					</div>
				</div>
			</div>

		</div>
		<!-- shop-section -->

		<!-- END INSIDE BOOKS -->
		<!-- contact-section 
			================================================== -->
		<section id="contact-section">

			<div class="contact-info">
				<div class="container">
					<div class="title-section white">
						<h1>Liên Hệ</h1>
						<span></span>
					</div>
					<div class="contact-info-box">
						<div class="row">
							<div class="col-md-4">
								<span><i class="fa fa-map-marker"></i></span>
								<h2>Địa Chỉ</h2>
								<p>
									200 Nguyễn Văn Linh <br> Thành Phố Đà Nẵng
								</p>
							</div>
							<div class="col-md-4">
								<span><i class="fa fa-phone"></i></span>
								<h2>Số Điện Thoại</h2>
								<p>
									Phone: +841212159592 <br> Fax: +135009845362
								</p>
							</div>
							<div class="col-md-4">
								<span><i class="fa fa-envelope"></i></span>
								<h2>Email </h2>
								<p>
									huongvmt@svtt.fst <br> support@bshop.com
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		<!-- End contact section -->


		<!-- footer 
			================================================== -->
		<footer>
			<div class="container">
				<h2>Social Media</h2>
				<ul class="social-list">
					<li><a class="facebook" href="#"><i class="fa fa-facebook"></i></a></li>
					<li><a class="twitter" href="#"><i class="fa fa-twitter"></i></a></li>
					<li><a class="twitter" href="#"><i class="fa fa-instagram"></i></a></li>
					<li><a class="rss" href="#"><i class="fa fa-rss"></i></a></li>
					<li><a class="google" href="#"><i
							class="fa fa-google-plus"></i></a></li>
					<li><a class="linkedin" href="#"><i class="fa fa-linkedin"></i></a></li>
					<li><a class="pinterest" href="#"><i
							class="fa fa-pinterest"></i></a></li>
				</ul>
				<p class="copyright">&copy; Copyright 2017. BSHOP. All rights
					reserved.</p>
			</div>
		</footer>
		<!-- End footer -->

		<!-- Modal -->
		<div class="modal fade" id="myModal" role="dialog">
			<div class="modal-dialog">

				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header" id="header">
						<h4>
							<span class="fa fa-lock" aria-hidden="true"></span> Đăng nhập hệ
							thống
						</h4>
					</div>
					<div class="modal-body" style="padding: 40px 50px;">
						<html:form action="/thanh-ly-tai-san" method="post"
							acceptCharset="UTF-8" onsubmit="return batLoi()">
							<div class="form-group">
								<label for="usrname"><span class="fa fa-user"
									aria-hidden="true"></span> Tài Khoản</label>
								<html:text property="taiKhoan" styleClass="form-control"
									styleId="tkhoan"/>
									<h6 style="color:red" id="tk"></h6>
							</div>
							<div class="form-group">
								<label for="psw"><span class="fa fa-eye"
									aria-hidden="true"></span> Mật Khẩu</label>
								<html:password property="matKhau" styleClass="form-control"
									styleId="mkhau"/>
								<h6 style="color:red" id="mk"></h6>

							</div>
							<div class="col-sm-12">
								<div class="col-sm-6">
									<html:submit property="submit" value="Đăng nhập"
										styleClass="btn btn-success btn-block">
										<span class="fa fa-power-off" aria-hidden="true"></span>
									</html:submit>
								</div>
								<div class="col-sm-6">
									<button type="button" class="btn btn-danger btn-block"
										data-dismiss="modal">
										<span class="fa fa-times" aria-hidden="true"></span> Hủy bỏ
									</button>
								</div>
							</div>
						</html:form>
					</div>
					<div class="modal-footer">
						<h6 style="text-align: center; color: red;" id="loi">
							<html:errors />
						</h6>
					</div>
				</div>
			</div>
		</div>
		<script type="text/javascript">
			$(document).ready(function(){
			    $("#myBtn").click(function(){
			        $("#myModal").modal();
			    });
			    
			    $('#tkhoan').attr("placeholder", "nhập tài khoản");
			    $('#mkhau').attr("placeholder", "nhập mật khẩu");
			
			});
			
			function batLoi(){
				var tk=$('#tkhoan').val().trim();
				var mk=$('#mkhau').val().trim();
				var check=true;

				if(tk==null || tk.length==0 || mk==null || mk.length==0){
					$('#loi').html("Tài khoản hoặc mật khẩu không được rỗng");
					check=false;
				}
				return check;
			}
		</script>
	</div>
	<!-- End Container -->

	<script src="custom/js/bookblock.min.js"></script>
	<script src="custom/js/classie.js"></script>
	<script src="js/bookshelf.js"></script>
</body>
</html>