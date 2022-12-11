<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>PHONESTORE Categories</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="Colo Shop Template">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" type="image/x-icon"
	href="${pageContext.request.contextPath}/images/favicon.png">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/usertemplate/styles/bootstrap4/bootstrap.min.css">
<link
	href="${pageContext.request.contextPath}/usertemplate/plugins/font-awesome-4.7.0/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/usertemplate/plugins/OwlCarousel2-2.2.1/owl.carousel.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/usertemplate/plugins/OwlCarousel2-2.2.1/owl.theme.default.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/usertemplate/plugins/OwlCarousel2-2.2.1/animate.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/usertemplate/plugins/jquery-ui-1.12.1.custom/jquery-ui.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/usertemplate/styles/categories_styles.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/usertemplate/styles/categories_responsive.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/usertemplate/styles/custom.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Quicksand:wght@300;400;500;600;700&display=swap"
	rel="stylesheet">
</head>

<body>
	<div class="super_container">

		<!-- Header -->

		<header class="header trans_300">

			<!-- Top Navigation -->

			<div class="top_nav">
				<div class="container">
					<div class="row">
						<div class="col-md-6">
							<div class="top_nav_left">Miễn phí vận chuyển cho đơn hàng
								trên 200.000đ</div>
						</div>
						<div class="col-md-6 text-right">
							<div class="top_nav_right">
								<ul class="top_nav_menu">

									<!-- Currency / Language / My Account -->

									<li class="currency">Hotline 0989989999
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>

			<!-- Main Navigation -->

			<div class="main_nav_container">
				<div class="container">
					<div class="row">
						<div class="col-lg-12 text-right">
							<div class="logo_container">
								<a href="/index" class="logo pull-left"><img src="/images/logo.png" class="site_logo" alt style="width: 200px; height: 70px;"></a>
					<nav id="menu" class="pull-right">
							</div>
							<nav class="navbar">
								<ul class="navbar_menu">
									<li><a href="/index">Trang chủ</a></li>
									<li><a href="/index">Mua sắm</a></li>
									<li><a href="/index">liên hệ</a></li>
								</ul>
								<c:choose>
									<c:when test="${empty sessionUsername}">
										<div class="">
											<a class="login1" href="/login?urlReturn=index">Đăng nhập</a>
											<span> | </span> <a class="login1" href="/register">Đăng
												ký</a>
										</div>
										<ul class="navbar_user">
											<li class="checkout"><a href="/shopping-cart/views">
													<i class="fa fa-shopping-cart" aria-hidden="true"></i> <span
													id="checkout_items" class="checkout_items">${tongSoLuongGioHang}</span>
											</a></li>
										</ul>
									</c:when>
									<c:otherwise>
										<ul class="navbar_user">
											<div class="dropdown">
												<i onclick="myFunction()" class="fa fa-user dropbtn "
													aria-hidden="true"> Hi, ${sessionUsername}</i>
												<div id="myDropdown" class="dropdown-content">
													<a style="text-align: center;"
														href="logout?urlReturn=index">Đăng xuất</a>
												</div>
											</div>
											<li class="checkout"><a href="/shopping-cart"> <i
													class="fa fa-shopping-cart" aria-hidden="true"></i> <span
													id="checkout_items" class="checkout_items">${tongSoLuongGioHang}</span>
											</a></li>
										</ul>
									</c:otherwise>
								</c:choose>
								<div class="hamburger_container">
									<i class="fa fa-bars" aria-hidden="true"></i>
								</div>
							</nav>
						</div>
					</div>
				</div>
			</div>

		</header>

		<div class="fs_menu_overlay"></div>

		<div class="container product_section_container">
			<div class="row">
				<div class="col product_section clearfix">

					<!-- Breadcrumbs -->

					<div class="breadcrumbs d-flex flex-row align-items-center">
						<ul>
							<li><a href="/index">Home</a></li>
							<li class="active"><a href="/index""><i
									class="fa fa-angle-right" aria-hidden="true"></i>Mua sắm</a></li>
						</ul>
					</div>

					<!-- Sidebar -->

					<div class="sidebar">
						<div class="sidebar_section">
							<div class="sidebar_title">
								<h5>Danh mục</h5>
							</div>
							<ul class="sidebar_categories">
								<li><a href="#"> Tất cả</a></li>
								<li class="active"><a href="#"><i
										class="fa fa-angle-double-right" aria-hidden="true"></i> Iphone</a></li>
								<li class="active"><a href="#"><i
										class="fa fa-angle-double-right" aria-hidden="true"></i> Samsung</a></li>
								<li class="active"><a href="#"><i
										class="fa fa-angle-double-right" aria-hidden="true"></i> ANKER</a></li>								
							</ul>
						</div>

						<!-- Price Range Filtering -->
						
						<!-- Sizes -->
						

						<!-- Color -->
						<div class="sidebar_section">
							<div class="sidebar_title">
								<h5>Color</h5>
							</div>
							<ul class="checkboxes">
								<li><i class="fa fa-square-o" aria-hidden="true"></i><span>Black</span></li>
								<li class="active"><i class="fa fa-square"
									aria-hidden="true"></i><span>Pink</span></li>
								<li><i class="fa fa-square-o" aria-hidden="true"></i><span>White</span></li>
								<li><i class="fa fa-square-o" aria-hidden="true"></i><span>Blue</span></li>
								<li><i class="fa fa-square-o" aria-hidden="true"></i><span>Orange</span></li>
								<li><i class="fa fa-square-o" aria-hidden="true"></i><span>White</span></li>
								<li><i class="fa fa-square-o" aria-hidden="true"></i><span>Blue</span></li>
								<li><i class="fa fa-square-o" aria-hidden="true"></i><span>Orange</span></li>
								<li><i class="fa fa-square-o" aria-hidden="true"></i><span>White</span></li>
								<li><i class="fa fa-square-o" aria-hidden="true"></i><span>Blue</span></li>
								<li><i class="fa fa-square-o" aria-hidden="true"></i><span>Orange</span></li>
							</ul>
							<div class="show_more">
								<span><span>+</span>Show More</span>
							</div>
						</div>

					</div>

					<!-- Main Content -->

					<div class="main_content">

						<!-- Products -->

						<div class="products_iso">
							<div class="row">
								<div class="col">

									<!-- Product Sorting -->

									<div
										class="product_sorting_container product_sorting_container_top">
										<ul class="product_sorting">
											<li><span class="type_sorting_text">Tất cả</span> <i
												class="fa fa-angle-down"></i>
												<ul class="sorting_type">
													<a href="#"><li class="type_sorting_btn"><span>Tất
																cả</span></li></a>
													<a href="#"><li class="type_sorting_btn"><span>Iphone</span></li></a>
													<a href="#"><li class="type_sorting_btn"><span>SamSung</span></li></a>
													<a href="#"><li class="type_sorting_btn"><span>ANKER</span></li></a>
													<a href="#"><li class="type_sorting_btn"><span>Apple</span></li></a>
												</ul></li>
											<li><span>Show</span> <span class="num_sorting_text">${soSanPhamHienTai}</span>
												<ul class="sorting_num">
													<li name="soSanPham" class="num_sorting_btn liSoTrang"><a
														href="/index?soTrang=1&soSanPham=6"><span>6</span></a></li>
													<li name="soSanPham" class="num_sorting_btn  liSoTrang"><a
														href="/index?soTrang=1&soSanPham=9"><span>9</span></a></li>
													<li name="soSanPham" class="num_sorting_btn liSoTrang"><a
														href="/index?soTrang=1&soSanPham=12"><span>12</span></a></li>
												</ul></li>
										</ul>
										<div class="pages d-flex flex-row align-items-center">
											<div class="page_current">
												<span>${soTrangHienTai }</span>
												<ul class="page_selection">
													<%
													Object tongSoTrangString = request.getAttribute("tongSoTrang");
													tongSoTrangString = tongSoTrangString != null ? tongSoTrangString.toString() : "1";
													int tongSoTrang = Integer.parseInt(tongSoTrangString.toString());
													for (int i = 1; i <= tongSoTrang; i++) {
													%>
													<li><a class="chuyenTrang"
														href="/index?soTrang=<%= i %>&soSanPham=${soSanPhamHienTai} "><%=i%></a></li>
													<%
													}
													%>
												</ul>
											</div>
											<div class="page_total">
												<span>of</span> ${tongSoTrang}
											</div>
											<div id="next_page" class="page_next">
												<a href="#"><i class="fa fa-long-arrow-right"
													aria-hidden="true"></i></a>
											</div>
										</div>
									</div>

									<!-- Product Grid -->

									<section class="items">
										<div class="product-grid row">
											<!-- Product 1 -->
											<c:forEach var="item" items="${listGiay}">
												<a href="/detail?idProduct=${item.maGiay}">
													<div class="product-item col-4">
														<div class="product discount product_filter">
															<div class="product_image">
																<img class="shoes_img" src="images/sp/${item.hinhAnh}"
																	alt="">
															</div>
															<div class="favorite favorite_left"></div>
															<fmt:formatNumber var="giaGiam"
																value="${item.giamGia*100}" maxFractionDigits="0" />
															<div
																class="product_bubble product_bubble_right product_bubble_red d-flex flex-column align-items-center">
																<span><div>-${giaGiam}%</div></span>
															</div>
															<div class="product_info">
																<h6 class="">
																	<a href="/detail?idProduct=${item.maGiay}">${item.tenGiay }</a>
																</h6>
																<fmt:formatNumber var="giaSauKhiGiam"
																	value="${item.donGia*(1-item.giamGia)}"
																	maxFractionDigits="0" />
																<div class="product_price">
																	<span>${item.donGia}đ </span>${giaSauKhiGiam}đ
																</div>
															</div>
														</div>
														<button data-masanpham="${item.maGiay}"
															class="blue_button add_to_cart_button btnAddToCart btn-info">THÊM VÀO GIỎ HÀNG</button>
													</div>
												</a>
											</c:forEach>
										</div>
									</section>
									<!-- Product Sorting -->

									<div
										class="product_sorting_container product_sorting_container_bottom clearfix">


									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<!-- Benefit -->

			<div class="benefit">
				<div class="container">
					<div class="row benefit_row">
						<div class="col-lg-3 benefit_col">
							<div class="benefit_item d-flex flex-row align-items-center">
								<div class="benefit_icon">
									<i class="fa fa-truck" aria-hidden="true"></i>
								</div>
								<div class="benefit_content">
									<h6>Miễn phí vận chuyển</h6>
									<p>Miễn phí vận chuyển cho đơn hàng từ 200,000đ</p>
								</div>
							</div>
						</div>
						<div class="col-lg-3 benefit_col">
							<div class="benefit_item d-flex flex-row align-items-center">
								<div class="benefit_icon">
									<i class="fa fa-money" aria-hidden="true"></i>
								</div>
								<div class="benefit_content">
									<h6>Thanh toán linh hoạt</h6>
									<p>Thanh toán sau khi nhận hàng hoặc thanh toán qua thẻ</p>
								</div>
							</div>
						</div>
						<div class="col-lg-3 benefit_col">
							<div class="benefit_item d-flex flex-row align-items-center">
								<div class="benefit_icon">
									<i class="fa fa-undo" aria-hidden="true"></i>
								</div>
								<div class="benefit_content">
									<h6>45 ngày đổi trả</h6>
									<p>Miễn phí đổi trả cho đơn hàng dưới 45 ngày</p>
								</div>
							</div>
						</div>
						<div class="col-lg-3 benefit_col">
							<div class="benefit_item d-flex flex-row align-items-center">
								<div class="benefit_icon">
									<i class="fa fa-clock-o" aria-hidden="true"></i>
								</div>
								<div class="benefit_content">
									<h6>Mở cả tuần</h6>
									<p>8h - 21h</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<!-- Newsletter -->

			<div class="newsletter">
				<div class="container">
					<div class="row">
						<div class="col-lg-6">
							<div
								class="newsletter_text d-flex flex-column justify-content-center align-items-lg-start align-items-md-center text-center">
								<h4>Bảng tin</h4>
								<p>Đăng ký nhận bảng tin để được nhận ưu đãi 20% khi mua
									hàng lần đầu</p>
							</div>
						</div>
						<div class="col-lg-6">
							<form action="/sendMail" method="post">
								<div
									class="newsletter_form d-flex flex-md-row flex-column flex-xs-column align-items-center justify-content-lg-end justify-content-center">
									<input id="newsletter_email" type="email"
										placeholder="Địa chỉ email của bạn" required="required"
										name="txtTo" data-error="Valid email is required.">
									<button id="newsletter_submit" type="submit"
										class="newsletter_submit_btn trans_300" value="Submit">Đăng
										ký</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>

			<!-- Footer -->

			<footer class="footer">
				<div class="container">
					<div class="row">
						<div class="col-lg-6">
							<div
								class="footer_nav_container d-flex flex-sm-row flex-column align-items-center justify-content-lg-start justify-content-center text-center">
								<ul class="footer_nav">
									<li><a href="#">Blog</a></li>
									<li><a href="#">FAQs</a></li>
									<li><a href="contact.html">Contact us</a></li>
								</ul>
							</div>
						</div>
						<div class="col-lg-6">
							<div
								class="footer_social d-flex flex-row align-items-center justify-content-lg-end justify-content-center">
								<ul>
									<li><a href="#"><i class="fa fa-facebook"
											aria-hidden="true"></i></a></li>
									<li><a href="#"><i class="fa fa-twitter"
											aria-hidden="true"></i></a></li>
									<li><a href="#"><i class="fa fa-instagram"
											aria-hidden="true"></i></a></li>
									<li><a href="#"><i class="fa fa-skype"
											aria-hidden="true"></i></a></li>
									<li><a href="#"><i class="fa fa-pinterest"
											aria-hidden="true"></i></a></li>
								</ul>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-lg-12">
							<div class="footer_nav_container">
								
							</div>
						</div>
					</div>
				</div>
			</footer>
		</div>
		<script
			src="${pageContext.request.contextPath}/usertemplate/js/jquery-3.2.1.min.js"></script>
		<script
			src="${pageContext.request.contextPath}/flytocart/jquery-ui-1.13.1/jquery-ui.min.js"></script>
		<script
			src="${pageContext.request.contextPath}/flytocart/assets/js/flyto.js"></script>
		<script
			src="${pageContext.request.contextPath}/usertemplate/js/custom.js"></script>
		<script
			src="${pageContext.request.contextPath}/usertemplate/js/categories.js"></script>
		<script
			src="${pageContext.request.contextPath}/usertemplate/js/custom2.js"></script>
</body>

</html>