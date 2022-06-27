<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="true"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
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
			<button type="button" class="btn btn-success" data-bs-toggle="modal"
				data-bs-target="#exampleModalProduct">+ Create</button>

			<!-- Modal -->
			<div class="modal fade" id="exampleModalProduct" tabindex="-1"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog modal-lg">
					<div class="modal-content">
						<div class="modal-header bg-black ">
							<h5 class="modal-title text-white" id="exampleModalLabel">Thêm
								Mới Sản Phẩm</h5>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>
						<form action="/Assiment/Admin/ProductManagement/store"
							method="post" enctype="multipart/form-data">
							<div class="modal-body">
								<div class="card-body">
									<div class="row">
									
									<div class="form-group mt-3">
											<label for="">Tên Người Dùng </label> <select
												name="category_id" class="form-select">
												<c:forEach items="${lOrders}" var="lOrder">
													<option value="${lOrder.id}">${lOrder.userOder.hoTen}</option>
												</c:forEach>
											</select>
										</div>
									
										<div class="form-group mt-3">
											<label for="">Tên Sản Phẩm</label> <select
												name="category_id" class="form-select">
												<c:forEach items="${lProducts}" var="lProduct">
													<option value="${lProduct.id}">${lProduct.ten}</option>
												</c:forEach>
											</select>
										</div>
							
										<div class="form-group mt-3">
											<label for="price">Đơn Giá</label> <input type="number"
												class="form-control mt-2" name="price" id="price"
												placeholder="Đơn Giá">
										</div>

										<div class="form-group mt-3">
											<label for="quantity">Số Lượng</label> <input type="number"
												class="form-control mt-2" name="quantity" id="quantity"
												min="0" placeholder="Số Lượng">
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
				<h5 class="card-header">Quản Lý Chi Tiết Đơn Hàng</h5>
				<div class="table-responsive">
					<table class="table table-dark table-striped">
						<thead>
							<tr>
								<th>ID</th>
								<th>Người Dùng</th>
								<th>Sản Phẩm</th>
								<th>Đơn Giá</th>
								<th>Số Lượng</th>
								<th>Tổng Tiền</th>	
								<th colspan="2" class="text-center">Thao Tác</th>
							</tr>
						</thead>
						<tbody class="table-border-bottom-0">
							<c:forEach items="${listOrdetail}" var="orderdetai">													
								<tr>
									<td>${orderdetai.id}</td>
									<td>${orderdetai.order.id}</td>
									<td>${orderdetai.product.id}</td>
									<td>${orderdetai.quantity}</td>
									<td>${orderdetai.price}</td>
									
									<td></td>
									<td>
										<!-- Button trigger modal -->
										<button type="button" class="btn btn-warning"
											data-bs-toggle="modal"
											data-bs-target="#updateProduct_${product.id}">
											Update</button> <!-- Modal -->
										<div class="modal fade" id="updateProduct_${product.id}"
											tabindex="-1" aria-labelledby="exampleModalLabel"
											aria-hidden="true">
											<div class="modal-dialog modal-lg">
												<div class="modal-content">
													<div class="modal-header bg-black ">
														<h5 class="modal-title text-white" id="exampleModalLabel">Cập
															Nhật Sản Phẩm</h5>
														<button type="button" class="btn-close"
															data-bs-dismiss="modal" aria-label="Close"></button>
													</div>
													<form
														action="/Assiment/Admin/ProductManagement/update?id=${product.id}"
														method="post" enctype="multipart/form-data">
														<div class="modal-body modal-lg">
															<div class="card-body">

																<div class="row">
																	<div class="col-6">
																		<div class="form-group mt-5">
																			<img alt="Không có ảnh"
																				src="/Assiment/uploads/${product.img != null ? product.img: 'images/duc.jpg'}"
																				width="80%" class="img-fluid" />
																		</div>
																	</div>

																	<div class="col-6">

																		<div class="form-group mt-5">
																			<label for="ten" class="text-dark">Chọn Ảnh
																				Sản Phẩm </label> <input type="file" name="img" id="img"
																				class="form-control mt-2" />
																		</div>

																		<div class="form-group mt-3">
																			<label for="ten" class="text-dark">Tên Sản
																				Phẩm</label> <input type="text" class="form-control mt-2"
																				name="ten" id="ten" value="${product.ten}"
																				placeholder="Tên Sản Phẩm">
																		</div>
																		<div class="form-group mt-3">
																			<label for="soLuong" class="text-dark">Số
																				Lượng</label> <input type="number"
																				class="form-control mt-2" name="soLuong"
																				id="soLuong" min="0" value="${product.soLuong}"
																				placeholder="Số Lượng">
																		</div>
																		<div class="form-group mt-3">
																			<label for="donGia" class="text-dark">Đơn
																				Giá</label> <input type="number" class="form-control mt-2"
																				name="donGia" id="donGia" value="${product.donGia}"
																				placeholder="Đơn Giá">
																		</div>

																		<div class="form-group mt-3">
																			<label for="mauSac" class="text-dark">Màu
																				Sắc</label> <input type="text" class="form-control mt-2"
																				name="mauSac" id="mauSac" value="${product.mauSac}"
																				placeholder="Màu Sắc">
																		</div>

																		<div class="form-group mt-3">
																			<label for="kichThuoc" class="text-dark">Kích
																				Thước</label> <input type="text" class="form-control mt-2"
																				name="kichThuoc" id="kichThuoc"
																				value="${product.kichThuoc}"
																				placeholder="Kích Thước">
																		</div>

																		<div class="form-group mt-3">
																			<label for="" class="text-dark">Tên Thể
																				Loại</label> <select name="category_id"
																				class="form-select  mt-2">
																				<c:forEach items="${listCategory}" var="category">
																					<option value="${category.id}">${category.ten}</option>
																				</c:forEach>
																			</select>
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
											data-bs-target="#deleteProduct_${product.id}">
											Delete</button> <!-- Modal -->
										<div class="modal fade" id="deleteProduct_${product.id}"
											tabindex="-1" aria-labelledby="exampleModalLabel"
											aria-hidden="true">
											<div class="modal-dialog">
												<div class="modal-content">
													<div class="modal-header bg-black ">
														<h5 class="modal-title text-white" id="exampleModalLabel">Xóa
															Sản Phẩm</h5>
														<button type="button" class="btn-close"
															data-bs-dismiss="modal" aria-label="Close"></button>
													</div>

													<div class="modal-body">
														<span class="text-dark">Bạn có thực sự muốn
															xóa ?</span>
														<h4 class="text-dark">Tên Sản Phẩm: ${product.ten}</h4>
													</div>
													<div class="modal-footer">
														<a
															href="/Assiment/Admin/ProductManagement/delete?id=${product.id}"
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