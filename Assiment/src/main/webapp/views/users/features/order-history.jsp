<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Favicon -->
<link rel="icon" type="image/png"
	href="/Assiment/images/icons/favicon.png" />

<!-- Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link
	href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap"
	rel="stylesheet" />

<!-- Icons. Uncomment required icon fonts -->
<link rel="stylesheet" href="/Assiment/assets/vendor/fonts/boxicons.css" />

<!-- Core CSS -->
<link rel="stylesheet" href="/Assiment/css/core.css"
	class="template-customizer-core-css" />
<link rel="stylesheet" href="/Assiment/css/theme-default.css"
	class="template-customizer-theme-css" />
<link rel="stylesheet" href="/Assiment/css/demo.css" />

<link rel="stylesheet"
	href="/Assiment/fontawesome-free-6.0.0-web/css/all.min.css">

<script src="/Assiment/assets/vendor/js/helpers.js"></script>
</head>
<body>
	<div class="container">
		<div class="row mt-5 mb-5">
			<div class="col-12">
				<div class="card mt-4">
					<h5 class="card-header">Lịch Sử Đặt Hàng</h5>
					<div class="table-responsive">
						<table class="table table-dark table-striped">
							<thead>
								<tr>
									<th>ID</th>
									<th>Ngày Đặt Hàng</th>
									<th>Duyệt</th>
									<th>Tông Tiền</th>

								</tr>
							</thead>
							<tbody class="table-border-bottom-0">
								<c:forEach items="${order}" var="order">
									<tr>
										<td>${order.id}</td>
										<td><fmt:formatDate value="${order.date}"
												pattern="dd-MM-yyyy" /></td>
										<c:if test="${order.status == 0}">
											<td class="text-danger">${order.status == 0 ? 'Chờ':'Đã Duyệt'}</td>
										</c:if>
										<c:if test="${order.status != 0}">
											<td class="text-success">${order.status == 0 ? 'Chờ':'Đã Duyệt'}</td>
										</c:if>
										<td><fmt:formatNumber
										value="${sum}" pattern="#,###"></fmt:formatNumber>
									<b> Đ</b></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script src="/Assiment/js/jquery.min.js"></script>
	<script src="/Assiment/js/popper.min.js"></script>
	<script src="/Assiment/js/bootstrap.min.js"></script>
	<!-- <script src="css/perfect-scrollbar.js"></script> -->

	<script src="/Assiment/js/perfect-scrollbar.js"></script>
	<script src="/Assiment/assets/vendor/js/menu.js"></script>
	<script src="/Assiment/js/main-admin.js"></script>
</body>
</html>