<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="true"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<div class="container">
	<div class="row">
		<div class="col-12">
			<div class="col-12 ">
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
							<div class="alert alert-success fs-4" role="alert">
								${sessionScope.error}
								<c:remove var="error" scope="session" />
							</div>
						</div>
					</c:if>
				</div>
				<div class="row mt-5">
					<div class="col-3">
						<!-- Button trigger modal -->
						<button type="button" class="btn btn-success"
							data-bs-toggle="modal" data-bs-target="#exampleModal">+
							Create</button>

						<!-- Modal -->
						<div class="modal fade" id="exampleModal" tabindex="-1"
							aria-labelledby="exampleModalLabel" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header bg-black ">
										<h5 class="modal-title text-white" id="exampleModalLabel">Thêm
											Mới Thể Loại</h5>
										<button type="button" class="btn-close"
											data-bs-dismiss="modal" aria-label="Close"></button>
									</div>
									<form action="/Assiment/Admin/CategoryManagement/store"
										method="post">
										<div class="modal-body">
											<div class="card-body">
												<div class="form-group">
													<label for="ten">Tên Thể Loại</label> <input type="text"
														class="form-control mt-2" name="ten" id="ten"
														placeholder="Tên Thể Loại">
												</div>
												<div class="form-group mt-3">
													<label for="">Tên Người Dùng</label> <select
														class="form-select" name="user_id">

														<c:forEach items="${listUser}" var="user">
															<option value="${user.id }">${user.hoTen}</option>
														</c:forEach>
													</select>
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
					</div>
				</div>

				<div class="card mt-3 mb-5">
					<h5 class="card-header">Quản Lý Thể Loại</h5>
					<div class="table-responsive">
						<table class="table table-dark table-striped">
							<thead>
								<tr>
									<th>Id</th>
									<th>Tên Thể Loại</th>
									<th>Tên Người Tạo</th>
									<th colspan="2" class="text-center">Thao Tác</th>
								</tr>
							</thead>
							<tbody class="table-border-bottom-0">
								<c:forEach items="${listCate}" var="item">
									<tr>
										<td>${item.id}</td>
										<td>${item.ten}</td>
										<td>${item.user.hoTen}</td>
										<td>
											<!-- Button trigger modal -->
											<button type="button" class="btn btn-warning"
												data-bs-toggle="modal"
												data-bs-target="#updateModal_${item.id}">Update</button> <!-- Modal -->
											<div class="modal fade" id="updateModal_${item.id}"
												tabindex="-1" aria-labelledby="exampleModalLabel"
												aria-hidden="true">
												<div class="modal-dialog">
													<div class="modal-content">
														<div class="modal-header bg-black ">
															<h5 class="modal-title text-white" id="exampleModalLabel">Cập
																Nhât Thể Loại</h5>
															<button type="button" class="btn-close"
																data-bs-dismiss="modal" aria-label="Close"></button>
														</div>
														<form
															action="/Assiment/Admin/CategoryManagement/update?id=${item.id}"
															method="post">
															<div class="modal-body">
																<div class="card-body">
																	<div class="form-group">
																		<label for="ten" class="text-dark">Tên Thể
																			Loại</label> <input type="text" class="form-control mt-2"
																			name="ten" id="ten" value="${item.ten}"
																			placeholder="Tên Thể Loại">
																	</div>
																	<div class="form-group mt-3">
																		<label for="" class="text-dark">Tên Người
																			Tạo</label> <select class="form-select" name="user_id">

																			<c:forEach items="${listUser}" var="user">
																				<option value="${user.id }">${user.hoTen}</option>
																			</c:forEach>
																		</select>
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
												data-bs-target="#deleteModal_${item.id}">Delete</button> <!-- Modal -->
											<div class="modal fade" id="deleteModal_${item.id}"
												tabindex="-1" aria-labelledby="exampleModalLabel"
												aria-hidden="true">
												<div class="modal-dialog">
													<div class="modal-content">
														<div class="modal-header bg-black ">
															<h5 class="modal-title text-white" id="exampleModalLabel">Xóa
																Thể Loại</h5>
															<button type="button" class="btn-close"
																data-bs-dismiss="modal" aria-label="Close"></button>
														</div>
														<div class="modal-body">
															<div class="card-body">
																<span class="text-dark">Bạn Có thực Sự Muốn
																	Xóa Không ?</span>
																<h5 class="text-dark">Tên Thể Loại: ${item.ten}</h5>
															</div>
														</div>
														<div class="modal-footer">
															<a
																href="/Assiment/Admin/CategoryManagement/delete?id=${item.id}"
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
</div>