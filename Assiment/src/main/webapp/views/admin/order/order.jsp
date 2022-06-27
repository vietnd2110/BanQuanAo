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
			<div class="card mt-4">
				<h5 class="card-header">Quản Lý Đơn Hàng</h5>
				<div class="table-responsive">
					<table class="table table-dark table-striped">
						<thead>
							<tr class="text-center">
								<th>ID</th>
								<th>Ngày Đặt</th>
								<th>Họ Tên</th>
								<th>Số Điện Thoại</th>
								<th>Địa Chỉ</th>
								<th>Email</th>
								<th>Duyệt</th>
								<th>Tổng Tiền</th>
								<th colspan="2" class="text-center">Thao Tác</th>
							</tr>
						</thead>
						<tbody class="table-border-bottom-0">
							<c:forEach items="${listOrder}" var="order">
								<tr>
									<td>${order.id}</td>
									<td><fmt:formatDate value="${order.date}"
											pattern="dd-MM-yyyy" /></td>
									<td>${order.userOder.hoTen}</td>
									<td>${order.userOder.sdt}</td>
									<td>${order.userOder.diaChi}</td>
									<td>${order.userOder.email}</td>
									<c:if test="${order.status == 0}">
										<td class="text-danger">${order.status == 0 ? 'Chờ':'Đã Duyệt'}</td>
									</c:if>
									<c:if test="${order.status != 0}">
										<td class="text-success">${order.status == 0 ? 'Chờ':'Đã Duyệt'}</td>
									</c:if>
									<td hidden=""><input name="user_id=${order.userOder.id}"/></td>
									<td>${sum}</td>
									<td>
										<!-- Button trigger modal -->
										<button type="button" class="btn btn-warning"
											data-bs-toggle="modal"
											data-bs-target="#updateProduct_${order.id}">Xác
											Nhận</button> <!-- Modal -->
										<div class="modal fade" id="updateProduct_${order.id}"
											tabindex="-1" aria-labelledby="exampleModalLabel"
											aria-hidden="true">
											<div class="modal-dialog modal-lg">
												<div class="modal-content">
													<div class="modal-header bg-black ">
														<h5 class="modal-title text-white" id="exampleModalLabel">Bạn
															Có Muốn Xác Nhận Đơn Hàng Không ?</h5>
														<button type="button" class="btn-close"
															data-bs-dismiss="modal" aria-label="Close"></button>
													</div>
													<form
														action="/Assiment/Admin/OrderManagement/update?idOder=${order.id}" method="post">
														<div class="modal-body">
															<div class="form-group mt-3">
																<label for="" class="text-dark">Xác Nhận</label>
															</div>
															<div class="form-check form-check-inline mt-2 p-0 ">
																<div class="form-check form-check-inline">
																	<input class="form-check-input" type="radio" id="role1"
																		name="status" value="1" ${order.status != 0 ? 'checked':''}> <label
																		class="form-check-label text-dark" for="active">Duyệt</label>
																</div>
																<div class="form-check form-check-inline">
																	<input class="form-check-input" type="radio" id="role2"
																		name="status" value="0" ${order.status == 0 ? 'checked':''}> <label
																		class="form-check-label text-dark" for="inactive">Chờ</label>
																</div>
															</div>
														</div>
														<div class="modal-footer">
															<button type="submit" class="btn btn-success">Xác
																Nhận</button>
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
											data-bs-target="#deleteOrder_${order.id}">Hủy Đơn</button> <!-- Modal -->
										<div class="modal fade" id="deleteOrder_${order.id}"
											tabindex="-1" aria-labelledby="exampleModalLabel"
											aria-hidden="true">
											<div class="modal-dialog modal-lg">
												<div class="modal-content">
													<div class="modal-header bg-black ">
														<h5 class="modal-title text-white" id="exampleModalLabel">Bạn
															Có Thực Sự Muốn Hủy Đơn Hàng Không ?</h5>
														<button type="button" class="btn-close"
															data-bs-dismiss="modal" aria-label="Close"></button>
													</div>
													<div class="modal-body">
														<div class="card-body">
															<span class="text-dark">Đơn Hàng Của: <b>${order.userOder.hoTen}</b>
															</span>
														</div>
													</div>
													<div class="modal-footer">
														<a
															href="/Assiment/Admin/OrderManagement/delete?idOrder=${order.id}"
															class="btn btn-danger">Hủy Đơn</a>
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