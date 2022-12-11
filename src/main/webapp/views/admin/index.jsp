<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="apple-touch-icon" sizes="76x76"
	href="${pageContext.request.contextPath}/admin/assets/img/apple-icon.png">

	
<title>PHONESTORE ADMIN</title>
<!--     Fonts and icons     -->
<link rel="stylesheet" type="text/css"
	href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700,900|Roboto+Slab:400,700" />
<!-- Nucleo Icons -->
<link
	href="${pageContext.request.contextPath}/admin/assets/css/nucleo-icons.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath}/admin/assets/css/nucleo-svg.css"
	rel="stylesheet" />
<!-- Font Awesome Icons -->
<script src="https://kit.fontawesome.com/42d5adcbca.js"
	crossorigin="anonymous"></script>
<!-- Material Icons -->
<link
	href="https://fonts.googleapis.com/icon?family=Material+Icons+Round"
	rel="stylesheet">
<!-- CSS Files -->
<link id="pagestyle"
	href="${pageContext.request.contextPath}/admin/assets/css/material-dashboard.css?v=3.0.0"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath}/admin/custom/css/index.css"
	rel="stylesheet" />

</head>

<body class="g-sidenav-show  bg-gray-200">
	<aside
		class="sidenav navbar navbar-vertical navbar-expand-xs border-0 border-radius-xl my-3 fixed-start ms-3   bg-gradient-dark"
		id="sidenav-main">
		<div class="sidenav-header">
			<i
				class="fas fa-times p-3 cursor-pointer text-white opacity-5 position-absolute end-0 top-0 d-none d-xl-none"
				aria-hidden="true" id="iconSidenav"></i> <a class="navbar-brand m-0"
				href=" ${pageContext.request.contextPath}/admin/index "				
				class="navbar-brand-img h-100" alt="main_logo"> <span
				class="ms-1 font-weight-bold text-white"> PHONESTORE ADMIN</span>
			</a>
		</div>
		<hr class="horizontal light mt-0 mb-2">
		<div class="collapse navbar-collapse  w-auto  max-height-vh-100"
			id="sidenav-collapse-main">
			<ul class="navbar-nav">
				<li class="nav-item"><a
					class="nav-link text-white active bg-gradient-primary"
					href="${pageContext.request.contextPath}/admin/index">
						<div
							class="text-white text-center me-2 d-flex align-items-center justify-content-center">
							<i class="material-icons opacity-10">dashboard</i>
						</div> <span class="nav-link-text ms-1">Quản lý sản phẩm</span>
				</a></li>
				<li class="nav-item"><a class="nav-link text-white "
					href="${pageContext.request.contextPath}/admin/order">
						<div
							class="text-white text-center me-2 d-flex align-items-center justify-content-center">
							<i class="material-icons opacity-10">receipt_long</i>
						</div> <span class="nav-link-text ms-1">Quản lý đơn hàng</span>
				</a></li>
				<li class="nav-item"><a class="nav-link text-white "
					href="${pageContext.request.contextPath}/admin/statistical">
						<div
							class="text-white text-center me-2 d-flex align-items-center justify-content-center">
							<i class="material-icons opacity-10">table_view</i>
						</div> <span class="nav-link-text ms-1">Thống kê doanh thu</span>
				</a></li>				
				<li class="nav-item"><a class="nav-link text-white "
					href="${pageContext.request.contextPath}/admin/pages/quanlykhachhang.html">
						<div
							class="text-white text-center me-2 d-flex align-items-center justify-content-center">
							<i class="material-icons opacity-10">person</i>
						</div> <span class="nav-link-text ms-1">Quản lý khách hàng</span>
				</a></li>
				<li class="nav-item"><a class="nav-link text-white "
					href="/admin/logout">
						<div
							class="text-white text-center me-2 d-flex align-items-center justify-content-center">
							<i class="material-icons opacity-10">logout</i>
						</div> <span class="nav-link-text ms-1">Đăng xuất</span>
				</a></li>
			</ul>
		</div>
	</aside>
	<main
		class="main-content position-relative max-height-vh-100 h-100 border-radius-lg ">
		<!-- Navbar -->
		<nav
			class="navbar navbar-main navbar-expand-lg px-0 mx-4 shadow-none border-radius-xl"
			id="navbarBlur" navbar-scroll="true">
			<div class="container-fluid py-1 px-3">
				<nav aria-label="breadcrumb">
					<ol
						class="breadcrumb bg-transparent mb-0 pb-0 pt-1 px-0 me-sm-6 me-5">
						<li class="breadcrumb-item text-sm"><a
							class="opacity-5 text-dark" href="javascript:;">PHONESTORE
								Admin</a></li>
						<li class="breadcrumb-item text-sm text-dark active"
							aria-current="page">Quản lý sản phẩm</li>
					</ol>
					<h6 class="font-weight-bolder mb-0">Quản lý sản phẩm</h6>
				</nav>
				<div class="collapse navbar-collapse mt-sm-0 mt-2 me-md-0 me-sm-4"
					id="navbar">
					<form action="/admin/index" method="get"
						class="ms-md-auto pe-md-3 d-flex align-items-center">
						<div class="input-group input-group-outline">
							<label class="form-label">Nhập tên sản phẩm cần tìm</label> <input
								name="txtSearch" type="text" class="form-control">
						</div>
						<button style="margin-top: 20px;" class="btn btn-primary">
							<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
								fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
  <path
									d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z" />
</svg>
						</button>
					</form>
					<ul class="navbar-nav  justify-content-end">
						<div style="margin-top: 20px;" class="dropdown nav-item d-flex align-items-center">

							<i class="fa fa-user dropbtn btn btn-success dropdown-toggle"
								aria-hidden="true" id="dropdownMenuButton"
								data-toggle="dropdown" aria-haspopup="true"
								aria-expanded="false"> Hi, ${sessionAdmin.taiKhoan}</i>
							<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
								<a class="dropdown-item" href="/admin/logout?urlReturn=index">Đăng
									xuất</a>

							</div>
						</div>
						<li class="nav-item d-xl-none ps-3 d-flex align-items-center">
							<a href="javascript:;" class="nav-link text-body p-0"
							id="iconNavbarSidenav">
								<div class="sidenav-toggler-inner">
									<i class="sidenav-toggler-line"></i> <i
										class="sidenav-toggler-line"></i> <i
										class="sidenav-toggler-line"></i>
								</div>
						</a>
					</ul>
				</div>
			</div>
		</nav>
		<!-- End Navbar -->
		<div class="container-fluid py-4">
			<h5>${message}</h5>
			<%--Start Body--%>
			<div class="row">
				<div class="position-relative mt-n4 mx-3 " style="color: red">
					${deleted}</div>
				<div class="position-relative mt-n4 mx-3 " style="color: red">
					${inserted}</div>
				<div class="col-12">
					<form class="card my-4" action="/admin/index/insert" method="get">
						<div class="position-relative mt-n4 mx-3 ">
							<button class="btn btn-success" style="float: right;">Thêm
								sản phẩm mới</button>
						</div>
					</form>
					<div class="card my-4">
						<div
							class="card-header p-0 position-relative mt-n4 mx-3 z-index-2">
							<div
								class="bg-gradient-primary shadow-primary border-radius-lg pt-4 pb-3">
								<h6 class="text-white text-capitalize ps-3">Danh sách</h6>
							</div>
						</div>
						<div class="card-body px-0 pb-2">
							<div class="table-responsive p-0">
								<table class="table align-items-center mb-0">
									<thead>
										<tr>
											<th
												class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Mã
												sản phẩm</th>
											<th
												class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Sản phẩm</th>
											<th
												class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Đơn
												giá</th>
											<th
												class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Giảm
												giá (%)</th>
											<th
												class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Loại
												sản phẩm</th>
											<th
												class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Hãng
												sản phẩm</th>
											<th
												class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Thao
												tác</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="item" items="${listGiay}">
											<tr>
												<td class="align-middle text-center text-sm">
													<p class="text-xs font-weight-bold mb-0">${item.maGiay}</p>
												</td>
												<td>
													<div class="d-flex px-2 py-1">
														<div>
															<img
																src="${pageContext.request.contextPath}/images/sp/${item.hinhAnh}"
																class="avatar avatar-sm me-3 border-radius-lg"
																alt="user1">
														</div>
														<div class="d-flex flex-column justify-content-center">
															<h6 class="mb-0 text-sm">${item.tenGiay}</h6>
														</div>
													</div>
												</td>
												<td class="align-middle text-center"><span
													class="text-secondary text-xs font-weight-bold">${item.donGia}</span>
												</td>
												<td class="align-middle text-center"><c:set
														var="giamGia" value="${item.giamGia*100}" /> <span
													class="text-secondary text-xs font-weight-bold"> <fmt:formatNumber
															value="${giamGia}" minFractionDigits="0"
															maxFractionDigits="0" />
												</span></td>
												<td class="align-middle text-center"><span
													class="text-secondary text-xs font-weight-bold">${item.loaiGiay.tenLoai}</span>
												</td>
												<td class="align-middle text-center"><span
													class="text-secondary text-xs font-weight-bold">${item.hangGiay.tenHang}</span>
												</td>
												<td class="align-middle text-center"><a
													href="/admin/index/update?maGiay=${item.maGiay}"
													class="text-secondary font-weight-bold text-xs"> Chi
														tiết </a> <a href="/admin/index/delete?idGiay=${item.maGiay}"
													onclick="return confirm('Bạn có muốn xóa ${item.tenGiay} không?');"
													class="text-secondary font-weight-bold text-xs"
													style="margin-left: 10px;"> Xóa </a></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
					<div id="numberPageID">
						<%
						Object tongSoTrangString = request.getAttribute("tongSoTrang");
						tongSoTrangString = tongSoTrangString != null ? tongSoTrangString.toString() : "1";
						int tongSoTrang = Integer.parseInt(tongSoTrangString.toString());
						Object soTrangHienTaiString = request.getAttribute("soTrangHienTai");
						if (soTrangHienTaiString != null) {
						int soTrangHienTai = Integer.parseInt(soTrangHienTaiString.toString());
						for (int i = 1; i <= tongSoTrang; i++) {
							if (i == soTrangHienTai) {
						%>
						<a href="/admin/index?soTrang=<%=i%>"
							class="btn btn-success numberPage activeCustom"><%=i%></a>
						<%
						} else {
						%>
						<a href="/admin/index?soTrang=<%=i%>"
							class="btn btn-success numberPage"><%=i%></a>
						<%
						}
						}
						}
						%>
					</div>
				</div>
			</div>
			<%--End Body --%>
			<footer class="footer py-4  ">
				<div class="container-fluid">
					<div class="row align-items-center justify-content-lg-between">
						<div class="col-lg-6 mb-lg-0 mb-4">
							
						</div>
						<div class="col-lg-6">
							<ul
								class="nav nav-footer justify-content-center justify-content-lg-end">
								<li class="nav-item"><a href="#"
									class="nav-link text-muted" target="_blank">About Us</a></li>
								<li class="nav-item"><a href="#"
									class="nav-link text-muted" target="_blank">Blog</a></li>
								<li class="nav-item"><a href="#"
									class="nav-link pe-0 text-muted" target="_blank">License</a></li>
							</ul>
						</div>
					</div>
				</div>
			</footer>
		</div>
	</main>
	<div class="fixed-plugin">
		<a class="fixed-plugin-button text-dark position-fixed px-3 py-2">
			<i class="material-icons py-2">settings</i>
		</a>
		<div class="card shadow-lg">
			<div class="card-header pb-0 pt-3">
				<div class="float-start">
					<h5 class="mt-3 mb-0">Material UI Configurator</h5>
					<p>See our dashboard options.</p>
				</div>
				<div class="float-end mt-4">
					<button
						class="btn btn-link text-dark p-0 fixed-plugin-close-button">
						<i class="material-icons">clear</i>
					</button>
				</div>
				<!-- End Toggle Button -->
			</div>
			<hr class="horizontal dark my-1">
			<div class="card-body pt-sm-3 pt-0">
				<!-- Sidebar Backgrounds -->
				<div>
					<h6 class="mb-0">Sidebar Colors</h6>
				</div>
				<a href="javascript:void(0)" class="switch-trigger background-color">
					<div class="badge-colors my-2 text-start">
						<span class="badge filter bg-gradient-primary active"
							data-color="primary" onclick="sidebarColor(this)"></span> <span
							class="badge filter bg-gradient-dark" data-color="dark"
							onclick="sidebarColor(this)"></span> <span
							class="badge filter bg-gradient-info" data-color="info"
							onclick="sidebarColor(this)"></span> <span
							class="badge filter bg-gradient-success" data-color="success"
							onclick="sidebarColor(this)"></span> <span
							class="badge filter bg-gradient-warning" data-color="warning"
							onclick="sidebarColor(this)"></span> <span
							class="badge filter bg-gradient-danger" data-color="danger"
							onclick="sidebarColor(this)"></span>
					</div>
				</a>
				<!-- Sidenav Type -->
				<div class="mt-3">
					<h6 class="mb-0">Sidenav Type</h6>
					<p class="text-sm">Choose between 2 different sidenav types.</p>
				</div>
				<div class="d-flex">
					<button class="btn bg-gradient-dark px-3 mb-2 active"
						data-class="bg-gradient-dark" onclick="sidebarType(this)">Dark</button>
					<button class="btn bg-gradient-dark px-3 mb-2 ms-2"
						data-class="bg-transparent" onclick="sidebarType(this)">Transparent</button>
					<button class="btn bg-gradient-dark px-3 mb-2 ms-2"
						data-class="bg-white" onclick="sidebarType(this)">White</button>
				</div>
				<p class="text-sm d-xl-none d-block mt-2">You can change the
					sidenav type just on desktop view.</p>
				<!-- Navbar Fixed -->
				<div class="mt-3 d-flex">
					<h6 class="mb-0">Navbar Fixed</h6>
					<div class="form-check form-switch ps-0 ms-auto my-auto">
						<input class="form-check-input mt-1 ms-auto" type="checkbox"
							id="navbarFixed" onclick="navbarFixed(this)">
					</div>
				</div>
				<hr class="horizontal dark my-3">
				<div class="mt-2 d-flex">
					<h6 class="mb-0">Light / Dark</h6>
					<div class="form-check form-switch ps-0 ms-auto my-auto">
						<input class="form-check-input mt-1 ms-auto" type="checkbox"
							id="dark-version" onclick="darkMode(this)">
					</div>
				</div>
				<hr class="horizontal dark my-sm-4">
				<a class="btn btn-outline-dark w-100" href="">View documentation</a>
				<div class="w-100 text-center">
					<a class="github-button"
						href="https://github.com/creativetimofficial/material-dashboard"
						data-icon="octicon-star" data-size="large" data-show-count="true"
						aria-label="Star creativetimofficial/material-dashboard on GitHub">Star</a>
					<h6 class="mt-3">Thank you for sharing!</h6>
					<a
						href="https://twitter.com/intent/tweet?text=Check%20Material%20UI%20Dashboard%20made%20by%20%40CreativeTim%20%23webdesign%20%23dashboard%20%23bootstrap5&amp;url=https%3A%2F%2Fwww.creative-tim.com%2Fproduct%2Fsoft-ui-dashboard"
						class="btn btn-dark mb-0 me-2" target="_blank"> <i
						class="fab fa-twitter me-1" aria-hidden="true"></i> Tweet
					</a> <a
						href="https://www.facebook.com/sharer/sharer.php?u=https://www.creative-tim.com/product/material-dashboard"
						class="btn btn-dark mb-0 me-2" target="_blank"> <i
						class="fab fa-facebook-square me-1" aria-hidden="true"></i> Share
					</a>
				</div>
			</div>
		</div>
	</div>
	<!--   Core JS Files   -->
	<script
		src="${pageContext.request.contextPath}/admin/assets/js/core/popper.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/admin/assets/js/core/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/admin/assets/js/plugins/perfect-scrollbar.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/admin/assets/js/plugins/smooth-scrollbar.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/admin/assets/js/plugins/chartjs.min.js"></script>
	<script>
		var ctx = document.getElementById("chart-bars").getContext("2d");

		new Chart(ctx, {
			type : "bar",
			data : {
				labels : [ "M", "T", "W", "T", "F", "S", "S" ],
				datasets : [ {
					label : "Sales",
					tension : 0.4,
					borderWidth : 0,
					borderRadius : 4,
					borderSkipped : false,
					backgroundColor : "rgba(255, 255, 255, .8)",
					data : [ 50, 20, 10, 22, 50, 10, 40 ],
					maxBarThickness : 6
				}, ],
			},
			options : {
				responsive : true,
				maintainAspectRatio : false,
				plugins : {
					legend : {
						display : false,
					}
				},
				interaction : {
					intersect : false,
					mode : 'index',
				},
				scales : {
					y : {
						grid : {
							drawBorder : false,
							display : true,
							drawOnChartArea : true,
							drawTicks : false,
							borderDash : [ 5, 5 ],
							color : 'rgba(255, 255, 255, .2)'
						},
						ticks : {
							suggestedMin : 0,
							suggestedMax : 500,
							beginAtZero : true,
							padding : 10,
							font : {
								size : 14,
								weight : 300,
								family : "Roboto",
								style : 'normal',
								lineHeight : 2
							},
							color : "#fff"
						},
					},
					x : {
						grid : {
							drawBorder : false,
							display : true,
							drawOnChartArea : true,
							drawTicks : false,
							borderDash : [ 5, 5 ],
							color : 'rgba(255, 255, 255, .2)'
						},
						ticks : {
							display : true,
							color : '#f8f9fa',
							padding : 10,
							font : {
								size : 14,
								weight : 300,
								family : "Roboto",
								style : 'normal',
								lineHeight : 2
							},
						}
					},
				},
			},
		});

		var ctx2 = document.getElementById("chart-line").getContext("2d");

		new Chart(ctx2, {
			type : "line",
			data : {
				labels : [ "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct",
						"Nov", "Dec" ],
				datasets : [ {
					label : "Mobile apps",
					tension : 0,
					borderWidth : 0,
					pointRadius : 5,
					pointBackgroundColor : "rgba(255, 255, 255, .8)",
					pointBorderColor : "transparent",
					borderColor : "rgba(255, 255, 255, .8)",
					borderColor : "rgba(255, 255, 255, .8)",
					borderWidth : 4,
					backgroundColor : "transparent",
					fill : true,
					data : [ 50, 40, 300, 320, 500, 350, 200, 230, 500 ],
					maxBarThickness : 6

				} ],
			},
			options : {
				responsive : true,
				maintainAspectRatio : false,
				plugins : {
					legend : {
						display : false,
					}
				},
				interaction : {
					intersect : false,
					mode : 'index',
				},
				scales : {
					y : {
						grid : {
							drawBorder : false,
							display : true,
							drawOnChartArea : true,
							drawTicks : false,
							borderDash : [ 5, 5 ],
							color : 'rgba(255, 255, 255, .2)'
						},
						ticks : {
							display : true,
							color : '#f8f9fa',
							padding : 10,
							font : {
								size : 14,
								weight : 300,
								family : "Roboto",
								style : 'normal',
								lineHeight : 2
							},
						}
					},
					x : {
						grid : {
							drawBorder : false,
							display : false,
							drawOnChartArea : false,
							drawTicks : false,
							borderDash : [ 5, 5 ]
						},
						ticks : {
							display : true,
							color : '#f8f9fa',
							padding : 10,
							font : {
								size : 14,
								weight : 300,
								family : "Roboto",
								style : 'normal',
								lineHeight : 2
							},
						}
					},
				},
			},
		});

		var ctx3 = document.getElementById("chart-line-tasks").getContext("2d");

		new Chart(ctx3, {
			type : "line",
			data : {
				labels : [ "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct",
						"Nov", "Dec" ],
				datasets : [ {
					label : "Mobile apps",
					tension : 0,
					borderWidth : 0,
					pointRadius : 5,
					pointBackgroundColor : "rgba(255, 255, 255, .8)",
					pointBorderColor : "transparent",
					borderColor : "rgba(255, 255, 255, .8)",
					borderWidth : 4,
					backgroundColor : "transparent",
					fill : true,
					data : [ 50, 40, 300, 220, 500, 250, 400, 230, 500 ],
					maxBarThickness : 6

				} ],
			},
			options : {
				responsive : true,
				maintainAspectRatio : false,
				plugins : {
					legend : {
						display : false,
					}
				},
				interaction : {
					intersect : false,
					mode : 'index',
				},
				scales : {
					y : {
						grid : {
							drawBorder : false,
							display : true,
							drawOnChartArea : true,
							drawTicks : false,
							borderDash : [ 5, 5 ],
							color : 'rgba(255, 255, 255, .2)'
						},
						ticks : {
							display : true,
							padding : 10,
							color : '#f8f9fa',
							font : {
								size : 14,
								weight : 300,
								family : "Roboto",
								style : 'normal',
								lineHeight : 2
							},
						}
					},
					x : {
						grid : {
							drawBorder : false,
							display : false,
							drawOnChartArea : false,
							drawTicks : false,
							borderDash : [ 5, 5 ]
						},
						ticks : {
							display : true,
							color : '#f8f9fa',
							padding : 10,
							font : {
								size : 14,
								weight : 300,
								family : "Roboto",
								style : 'normal',
								lineHeight : 2
							},
						}
					},
				},
			},
		});
	</script>
	<script>
		var win = navigator.platform.indexOf('Win') > -1;
		if (win && document.querySelector('#sidenav-scrollbar')) {
			var options = {
				damping : '0.5'
			}
			Scrollbar.init(document.querySelector('#sidenav-scrollbar'),
					options);
		}
	</script>
	<!-- Github buttons -->
	<script async defer src="https://buttons.github.io/buttons.js"></script>
	<!-- Control Center for Material Dashboard: parallax effects, scripts for the example pages etc -->
	<script
		src="${pageContext.request.contextPath}/admin/assets/js/material-dashboard.min.js?v=3.0.0"></script>
	<script
		src="${pageContext.request.contextPath}/admin/assets/js/customAdmin.js"></script>
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
		integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>
</body>

</html>