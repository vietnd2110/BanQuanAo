<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="en" class="light-style layout-menu-fixed" dir="ltr"
	data-theme="theme-default" data-assets-path="/Assiment/assets/"
	data-template="vertical-menu-template-free">

<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />

<title></title>

<meta name="description" content="" />
<!-- Favicon -->
<link rel="icon" type="image/x-icon"
	href="/Assiment/assets/img/favicon/favicon.ico" />

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

<script src="/Assiment/assets/vendor/js/helpers.js"></script>
<style>
body {
	background-color: rgb(107, 112, 112);
}
</style>
</head>

<body>

	<div class="container">
		<div class="row mb-5 mt-5">
			<div class="col-12 col-sm-12 col-md-6  offset-md-3 mt-5 mb-5">
				<div class="card mt-3 ">
					<div class="card-header bg-gray p-0">
						<h2 class="text-center text-white mt-3">Edit Profile</h2>
					</div>
					<div class="card-body mt-4">
						<div class="row">
							<c:if test="${not empty message}">
								<div class="alert alert-success" role="alert">${message}</div>
							</c:if>
							<c:if test="${not empty error}">
								<div class="alert alert-danger" role="alert">${error}</div>
							</c:if>

						</div>
						<form action="/Assiment/EditProfile" method="post">
							
							<div class="row">
								<div class="col-12 col-sm-6">
									<div class="form-group mt-3">
										<label for="hoTen">Họ Và Tên</label> <input type="text"
											class="form-control mt-2" name="hoTen" id="hoTen" value="${user.hoTen}"
											placeholder="Họ Và Tên">
									</div>
									<div class="form-group mt-3">
										<label for="sdt">Số Điện Thoại</label> <input type="number"
											class="form-control mt-2" name="sdt" id="sdt" value="${user.sdt}"
											placeholder="Số Điện Thoại">
									</div>
									<div class="form-group mt-3">
										<label for="diaChi">Địa Chỉ</label> <input type="text"
											class="form-control mt-2" name="diaChi" id="diaChi" value="${user.diaChi}"
											placeholder="Địa Chỉ">
									</div>

								</div>
								<div class="col-12 col-sm-6">
									<div class="form-group mt-3">
										<label for="email">Chọn Hình Ảnh</label> 
										<input type="file" name="avatar" id="avatar"
										class="form-control mt-2" />
									</div>

									<div class="form-group mt-3">
										<label for="email">Email</label> <input type="text"
											class="form-control mt-2" name="email" id="email" value="${user.email}"
											placeholder="Email">
									</div>

									<div class="form-group mt-3">
										<label for="">Giới Tính</label>
									</div>
									<div class="form-check form-check-inline mt-2 p-0 ">
										<div class="form-check form-check-inline">
											<input class="form-check-input" type="radio" id="active"
												name="gioiTinh" value="1" ${user.gioiTinh == 1 ? 'checked':''}> <label
												class="form-check-label" for="active">Nam</label>
										</div>
										<div class="form-check form-check-inline">
											<input class="form-check-input" type="radio" id="inactive"
												name="gioiTinh" value="0" ${user.gioiTinh == 0 ? 'checked':''}> <label
												class="form-check-label" for="inactive">Nữ</label>
										</div>
									</div>
								</div>
							</div>
							<div class="row m-0 mt-3">
								<button type="submit" class="btn btn-success my-4">Edit Profile</button>
							</div>
							
						</form>
					</div>
				</div>

			</div>
		</div>
	</div>
	<script src="/Assiment/js/jquery.min.js"></script>
	<script src="/Assiment/js/popper.min.js"></script>
	<script src="/Assiment/js/bootstrap.min.js"></script>
</body>

</html>