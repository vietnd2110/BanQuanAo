<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="true"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<div class="container">

	<div class="row mt-5 mb-5">

		<div class="col-12">
			<div class="row mt-3">
				<c:if test="${not empty sessionScope.message}">
					<div class="col">
						<div class="alert alert-success fs-4" role="alert">
							${sessionScope.message}
							<c:remove var="message" scope="session" />
						</div>
					</div>
				</c:if>
				<c:if test="${not empty sessionScope.error}">
					<div class="col">
						<div class="alert alert-danger fs-4" role="alert">
							${sessionScope.error}
							<c:remove var="error" scope="session" />
						</div>
					</div>
				</c:if>
			</div>

			<!-- Button trigger modal -->
			<button type="button" class="btn btn-success mt-3"
				data-bs-toggle="modal" data-bs-target="#exampleModalProduct">+
				Create</button>

			<!-- Modal -->
			<div class="modal fade" id="exampleModalProduct" tabindex="-1"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog modal-lg">
					<div class="modal-content">
						<div class="modal-header bg-black ">
							<h5 class="modal-title text-white" id="exampleModalLabel">Thêm
								Mới Người Dùng</h5>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>
						<form action="/Assiment/Admin/UserManagement/store" method="post"
							enctype="multipart/form-data">
							<div class="modal-body">
								<div class="card-body">
									<div class="row">
										<div class="col">
											<div class="row">
												<div class="col-6">
													<img
														src="${user.avatar != null ? user.avatar: 'images/duc.jpg'}"
														alt="" width="100%" class="img-fluid">
												</div>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-12 col-sm-6">
											<div class="form-group mt-3">
												<label for="hoTen">Họ Và Tên</label> <input type="text"
													class="form-control mt-2" name="hoTen" id="hoTen"
													placeholder="Họ Và Tên">
											</div>
											<div class="form-group mt-3">
												<label for="sdt">Số Điện Thoại</label> <input
													type="number" class="form-control mt-2" name="sdt" id="sdt"
													placeholder="Số Điện Thoại">
											</div>
											<div class="form-group mt-3">
												<label for="diaChi">Địa Chỉ</label> <input type="text"
													class="form-control mt-2" name="diaChi" id="diaChi"
													placeholder="Địa Chỉ">
											</div>
											<div class="form-group mt-3">
												<label for="">Phân Quyền</label>
											</div>
											<div class="form-check form-check-inline mt-2 p-0 ">
												<div class="form-check form-check-inline">
													<input class="form-check-input" type="radio" id="role1"
														name="role" value="1"> <label
														class="form-check-label" for="active">Admin</label>
												</div>
												<div class="form-check form-check-inline">
													<input class="form-check-input" type="radio" id="role2"
														name="role" value="0"> <label
														class="form-check-label" for="inactive">User</label>
												</div>
											</div>

										</div>
										<div class="col-12 col-sm-6">
											<div class="form-group mt-3">
												<label for="avatar">Ảnh </label> <input type="file"
													name="avatar" id="avatar" class="form-control mt-2" />
											</div>
											<div class="form-group mt-3">
												<label for="email">Email</label> <input type="text"
													class="form-control mt-2" name="email" id="email"
													placeholder="Email">
											</div>
											<div class="form-group mt-3">
												<label for="password">Mật Khẩu</label> <input
													type="password" class="form-control mt-2" name="password"
													id="password" placeholder="Mật Khẩu">
											</div>
											<div class="form-group mt-3">
												<label for="">Giới Tính</label>
											</div>
											<div class="form-check form-check-inline mt-2 p-0 ">
												<div class="form-check form-check-inline">
													<input class="form-check-input" type="radio" id="active"
														name="gioiTinh" value="1"> <label
														class="form-check-label" for="active">Nam</label>
												</div>
												<div class="form-check form-check-inline">
													<input class="form-check-input" type="radio" id="inactive"
														name="gioiTinh" value="0"> <label
														class="form-check-label" for="inactive">Nữ</label>
												</div>
											</div>
										</div>
									</div>

								</div>
							</div>
							<div class="modal-footer">
								<button type="submit" class="btn btn-success">Create</button>
								<button type="button" class="btn btn-secondary"
									data-bs-dismiss="modal">Close</button>
							</div>
						</form>
					</div>
				</div>
			</div>


			<div class="card mt-4">
				<h5 class="card-header">Quản Lý Người Dùng</h5>
				<div class="table-responsive">
					<table class="table table-dark table-striped">
						<thead>
							<tr class="text-center">
								<th>ID</th>
								<th>Họ Và Tên</th>
								<th>Giới Tính</th>
								<th>Số Điện Thoại</th>
								<th>Địa Chỉ</th>
								<th>Email</th>
								<th>Ảnh</th>
								<th>Quyền Truy Cập</th>
								<th colspan="2" class="text-center">Thao Tác</th>
							</tr>
						</thead>
						<tbody class="table-border-bottom-0">
							<c:forEach items="${list}" var="items">
								<tr>
									<td>${items.id}</td>
									<td>${items.hoTen}</td>
									<td>${items.gioiTinh == '1' ? "Nam":"Nữ"}</td>
									<td>${items.sdt}</td>
									<td>${items.diaChi}</td>
									<td>${items.email}</td>
									<td>${items.avatar}</td>
									<td>${items.role == '1' ? "Admin": "User"}</td>
									<td>
										<!-- Button trigger modal -->
										<button type="button" class="btn btn-warning"
											data-bs-toggle="modal"
											data-bs-target="#updateProduct_${items.id}">Update</button> <!-- Modal -->
										<div class="modal fade" id="updateProduct_${items.id}"
											tabindex="-1" aria-labelledby="exampleModalLabel"
											aria-hidden="true">
											<div class="modal-dialog modal-lg">
												<div class="modal-content">
													<div class="modal-header bg-black ">
														<h5 class="modal-title text-white" id="exampleModalLabel">Cập
															Nhật Người Dùng</h5>
														<button type="button" class="btn-close"
															data-bs-dismiss="modal" aria-label="Close"></button>
													</div>
													<form
														action="/Assiment/Admin/UserManagement/update?id=${items.id}"
														method="post" enctype="multipart/form-data">
														<div class="modal-body">
															<div class="card-body">
																
																<div class="row">
																	<div class="col-6">
																		<div class="form-group mt-3">
																			<img
																				src="/Assiment/uploads/${items.avatar != null ? items.avatar: 'images/duc.jpg'}"
																				alt="aaaa" width="80%" class="img-fluid">
																		</div>
																		
																		
																		<div class="form-group mt-4">
																			<label for="avatar" class="text-dark">Ảnh</label> <input
																				type="file" name="avatar" id="avatar"
																				class="form-control mt-2" text-dark />
																		</div>
																		
																	</div>
																	<div class="col-6">
																		<div class="form-group mt-3">
																			<label for="hoTen" class="text-dark">Họ Và
																				Tên</label> <input type="text" class="form-control mt-2"
																				name="hoTen" id="hoTen" value="${items.hoTen}"
																				placeholder="Họ Và Tên">
																		</div>
																		<div class="form-group mt-3">
																			<label for="sdt" class="text-dark">Số Điện
																				Thoại</label> <input type="number"
																				class="form-control mt-2" name="sdt" id="sdt"
																				value="${items.sdt}" placeholder="Số Điện Thoại">
																		</div>
																		<div class="form-group mt-3">
																			<label for="diaChi" class="text-dark">Địa
																				Chỉ</label> <input type="text" class="form-control mt-2"
																				name="diaChi" id="diaChi" value="${items.diaChi}"
																				placeholder="Địa Chỉ">
																		</div>
																		<div class="form-group mt-3">
																			<label for="" class="text-dark">Phân Quyền</label>
																		</div>
																		<div class="form-check form-check-inline mt-2 p-0 ">
																			<div class="form-check form-check-inline">
																				<input class="form-check-input" type="radio"
																					id="role1" name="role" value="1"
																					${items.role == 1 ? 'checked':''}> <label
																					class="form-check-label text-dark" for="active">Admin</label>
																			</div>
																			<div class="form-check form-check-inline">
																				<input class="form-check-input" type="radio"
																					id="role2" name="role" value="0"
																					${items.role == 0 ? 'checked': ''}> <label
																					class="form-check-label text-dark" for="inactive">User</label>
																			</div>
																		</div>

																		<div class="form-group mt-3">
																			<label for="email" class="text-dark">Email</label> <input
																				type="text" class="form-control mt-2" name="email"
																				id="email" value="${items.email}"
																				placeholder="Email">
																		</div>
																		<div class="form-group mt-3">
																			<label for="" class="text-dark">Giới Tính</label>
																		</div>
																		<div class="form-check form-check-inline mt-2 p-0 ">
																			<div class="form-check form-check-inline">
																				<input class="form-check-input" type="radio"
																					id="active" name="gioiTinh" value="1"
																					${items.gioiTinh == 1 ? 'checked':'' }> <label
																					class="form-check-label text-dark" for="active">Nam</label>
																			</div>
																			<div class="form-check form-check-inline">
																				<input class="form-check-input" type="radio"
																					id="inactive" name="gioiTinh" value="0"
																					${items.gioiTinh == 0 ? 'checked':'' }> <label
																					class="form-check-label text-dark" for="inactive">Nữ</label>
																			</div>
																		</div>
																	</div>
																</div>

															</div>
														</div>
														<div class="modal-footer">
															<button type="submit" class="btn btn-warning">Update</button>
															<button type="button" class="btn btn-secondary"
																data-bs-dismiss="modal">Close</button>
														</div>
													</form>
												</div>
											</div>
										</div>
									</td>
									<td>
										<!-- Button trigger modal -->
										<button type="button" class="btn btn-danger"
											data-bs-toggle="modal"
											data-bs-target="#deleteProduct_${items.id}">Delete</button> <!-- Modal -->
										<div class="modal fade" id="deleteProduct_${items.id}"
											tabindex="-1" aria-labelledby="exampleModalLabel"
											aria-hidden="true">
											<div class="modal-dialog">
												<div class="modal-content">
													<div class="modal-header bg-black ">
														<h5 class="modal-title text-white" id="exampleModalLabel">Xóa
															Người Dùng</h5>
														<button type="button" class="btn-close"
															data-bs-dismiss="modal" aria-label="Close"></button>
													</div>
													<div class="modal-body">
														<div class="card-body">
															<h4 class="text-dark">Bạn Có Thực Sự Muốn xóa
																?</h4>
															<span class="text-dark">Tên Người Dùng:
																${items.hoTen}</span>
														</div>
													</div>
													<div class="modal-footer">
														<a
															href="/Assiment/Admin/UserManagement/delete?id=${items.id}"
															class="btn btn-danger">Delete</a>
														<button type="button" class="btn btn-secondary"
															data-bs-dismiss="modal">Close</button>
													</div>
												</div>
											</div>
										</div>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>