<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>Giỏ hàng</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="Colo Shop Template">
<meta name="viewport" content="width=device-width, initial-scale=1">
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
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/usertemplate/styles/contact_styles.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/usertemplate/styles/contact_responsive.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Quicksand:wght@300;400;500;600;700&display=swap"
	rel="stylesheet">
</head>
<style>
.colorSanPham {
	color: #26aa99;
}

.containerThanhToan {
	background-color: rgb(248, 246, 246);
	margin: 20px 0;
	padding: 20px;
}

.centerCustom {
	line-height: 100px;
	height: 100px;
}

.activeCustom {
	background-color: #f9bf4c !important;
}

.btn-custom {
	background-color: #fff;
}

.btn-custom:hover {
	background-color: #f9bf4c;
}

.center2 {
	line-height: 50px;
	height: 50px;
}

.itemDatHang {
	margin: 10px 0;
}

.text-center {
	text-align: center;
}
.colorTitleOrder{
	color:#f69113;
}
</style>
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
									<c:when test="${empty sessionKhachHang}">
										<div class="">
											<a class="login1" href="/login?urlReturn=order">Đăng nhập</a> <span> |
											</span> <a class="login1" href="/register">Đăng ký</a>
										</div>
										<ul class="navbar_user">
											<li class="checkout"><a href="/shopping-cart"> <i
													class="fa fa-shopping-cart" aria-hidden="true"></i> <span
													id="checkout_items" class="checkout_items">${tongSoLuongGioHang}</span>
											</a></li>
										</ul>
									</c:when>
									<c:otherwise>
										<ul class="navbar_user">
											<div class="dropdown">
												<i onclick="myFunction()" class="fa fa-user dropbtn "
													aria-hidden="true"> Hi, ${sessionKhachHang.taiKhoan}</i>
												<div id="myDropdown" class="dropdown-content">
													<a style="text-align: center;"
														href="/logout?urlReturn=order">Đăng xuất</a>
												</div>
											</div>
											<li class="checkout"><a
												href="/shopping-cart?maGioHang=maGioHang"> <i
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
							<li><a href="index.html">Home</a></li>
							<li class="active"><a href="/order""><i
									class="fa fa-angle-right" aria-hidden="true"></i>Thanh toán</a></li>
						</ul>
					</div>

					<!-- Main Content -->
					<form active="/order" method="post" >						
						<div class="row">
							<div class="col-lg-12">
								<div class="containerThanhToan">
									<h4 class="colorTitleOrder">
										<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
											fill="currentColor" class="bi bi-geo-alt" viewBox="0 0 16 16">
								<path
												d="M12.166 8.94c-.524 1.062-1.234 2.12-1.96 3.07A31.493 31.493 0 0 1 8 14.58a31.481 31.481 0 0 1-2.206-2.57c-.726-.95-1.436-2.008-1.96-3.07C3.304 7.867 3 6.862 3 6a5 5 0 0 1 10 0c0 .862-.305 1.867-.834 2.94zM8 16s6-5.686 6-10A6 6 0 0 0 2 6c0 4.314 6 10 6 10z" />
								<path
												d="M8 8a2 2 0 1 1 0-4 2 2 0 0 1 0 4zm0 1a3 3 0 1 0 0-6 3 3 0 0 0 0 6z" />
							</svg>
										Địa chỉ nhận hàng
									</h4>
									<div class="row">
										<input type="hidden" name="username" value="${ sessionKhachHang.taiKhoan }" />
										<div class="col-4">
											<input class="form_input input_name input_ph" type="text"
												name="fullname" placeholder="Tên người nhận*"
												required="required" data-error="Tên không được bỏ trống."
												value="${ sessionKhachHang.tenKhachHang }">
											<input
												class="form_input input_name input_ph" type="text"
												name="phone" placeholder="Số điện thoại*" required="required"
												data-error="Số điện thoại không được bỏ trống."
												value="${ sessionKhachHang.soDienThoai }">
										</div>
										<div style="padding-top: 26px;" class="col-8">
											<textarea id="input_message" class="input_ph input_message"
												name="location" placeholder="Địa chỉ giao hàng*" rows="5">${ sessionKhachHang.diaChi }</textarea>
										</div>
									</div>
								</div>
								<div class="containerThanhToan">
									<div class="row">
										<h4 class="col-6 colorTitleOrder">
											<svg xmlns="http://www.w3.org/2000/svg" width="16"
												height="16" fill="currentColor" class="bi bi-tags"
												viewBox="0 0 16 16">
								<path
													d="M3 2v4.586l7 7L14.586 9l-7-7H3zM2 2a1 1 0 0 1 1-1h4.586a1 1 0 0 1 .707.293l7 7a1 1 0 0 1 0 1.414l-4.586 4.586a1 1 0 0 1-1.414 0l-7-7A1 1 0 0 1 2 6.586V2z" />
								<path
													d="M5.5 5a.5.5 0 1 1 0-1 .5.5 0 0 1 0 1zm0 1a1.5 1.5 0 1 0 0-3 1.5 1.5 0 0 0 0 3zM1 7.086a1 1 0 0 0 .293.707L8.75 15.25l-.043.043a1 1 0 0 1-1.414 0l-7-7A1 1 0 0 1 0 7.586V3a1 1 0 0 1 1-1v5.086z" />
							</svg>
											Sản phẩm
										</h4>
										<div class="col-2 colorSanPham text-center">Đơn giá</div>
										<div class="col-2 colorSanPham text-center">Số lượng</div>
										<div class="col-2 colorSanPham text-center">Thành tiền</div>
									</div>

									<c:forEach items="${listSanPham }" var="item">
										<input type="hidden" name="idProduct" value="${item.maGiay}" />
										<input type="hidden" name="countProduct" value="${item.soLuong}" />
										<div class="itemDatHang">
											<div class="row">
												<div class="col-6">
													<img
														src="${pageContext.request.contextPath}/images/sp/${item.hinhAnh}"
														class="rounded" width="50" height="50" alt="...">
													${item.tenGiay}
												</div>
												<div class="col-2 center2 text-center">
													<fmt:formatNumber value="${item.donGia}" /> đ
													<input type="hidden" value="${item.donGia}" />
												</div>
												<div class="col-2 center2 text-center">
													<fmt:formatNumber value="${item.soLuong}" />
												</div>
												<div class="col-2 center2 text-center">
													<fmt:formatNumber value="${item.donGia*item.soLuong}" /> đ
												</div>
											</div>
										</div>
									</c:forEach>

								</div>
								<div class="containerThanhToan">
									<div class="row">
										<h5 class="col-5 colorTitleOrder">PHƯƠNG THỨC THANH TOÁN</h5>
										<div class="col-7">
											<div id="btn1" class="btn btn-custom activeCustom">Thanh
												toán khi nhận hàng</div>
											<div id="btn2" class="btn btn-custom ">Momo</div>
											<div id="btn3" class="btn btn-custom ">Thẻ ghi nợ</div>
										</div>
									</div>
								</div>
								<div class="containerThanhToan">
									<div class="row">
										<div class="col-5">
											<input class="form_input input_name input_ph" type="text"
												name="note" placeholder="Lưu ý cho shop...">
										</div>
										<div class="col-3 centerCustom colorSanPham text-center">NGÀY
											GIAO DỰ KIẾN</div>
										<div class="col-3 centerCustom text-center">
											<fmt:formatDate var="ngayGiao" pattern="dd-MM-yyy" value="${ngayGiaoDuKien}" />
											${ngayGiao}
											<input name="expectedDate" type="hidden" value="${ngayGiao}" />
										</div>
										<div class="col-1 centerCustom">12.000 đ</div>

									</div>
								</div>
								<div class="row">
									<div class="col-12">
										<p
											style="float: right; color: red; font-size: 20px; display: flex;">
											Tổng tiền:
											<fmt:formatNumber value="${tongTienGioHang+12000}" /> đ
											<input name="total" type="hidden" value="${tongTienGioHang+12000}"  />
										</p>
									</div>

								</div>
								<div class="row">
									<div class="col-12">
										<button style="float: right;"
											class="newsletter_submit_btn trans_300">Đặt hàng</button>
									</div>

								</div>
							</div>
						</div>
					</form>

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
							<p>Đăng ký nhận bảng tin để được nhận ưu đãi 20% khi mua hàng
								lần đầu</p>
						</div>
					</div>
					<div class="col-lg-6">
						<form>
							<div
								class="newsletter_form d-flex flex-md-row flex-column flex-xs-column align-items-center justify-content-lg-end justify-content-center">
								<input id="newsletter_email" type="email"
									placeholder="Địa chỉ email của bạn" required="required"
									data-error="Valid email is required.">
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
		src="${pageContext.request.contextPath}/usertemplate/js/custom.js"></script>
	<script
		src="${pageContext.request.contextPath}/usertemplate/js/shoppingcart.js"></script>
	<script
		src="${pageContext.request.contextPath}/usertemplate/js/custom2.js"></script>
	<script>
		$(document).ready(function() {
			$('#btn1, #btn2, #btn3').click(function() {
				$('#btn1, #btn2, #btn3').removeClass('activeCustom');
				$(this).addClass('activeCustom');
			});
		});
	</script>

</body>

</html>