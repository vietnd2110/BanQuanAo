<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="true"%>.
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>

<!-- breadcrumb -->
<div class="container mt-5">
	<div class="bread-crumb flex-w p-l-25 p-r-15 p-t-30 p-lr-0-lg">
		<a href="index.html" class="stext-109 cl8 hov-cl1 trans-04"> Home
			<i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
		</a> <span class="stext-109 cl4"> Shoping Cart </span>
	</div>
</div>


<!-- Shoping Cart -->

<div class="container">
	<div class="bg0 p-t-75 p-b-85">
		<div class="row">
			<div class="col-lg-11 col-xl-7 m-lr-auto m-b-50">
				<div class="m-l-25 m-r--38 m-lr-0-xl">
					<div class="row">
						<div class="col">
							<c:if test="${not empty sessionScope.message}">
								<div class="alert alert-success" role="alert">
									${sessionScope.message}
									<c:remove var="message" scope="session" />
								</div>
							</c:if>
							<c:if test="${not empty sessionScope.error}">
								<div class="alert alert-danger" role="alert">
									${sessionScope.error}
									<c:remove var="error" scope="session" />
								</div>
							</c:if>
						</div>
					</div>
					<div class="wrap-table-shopping-cart">
						<div class="table-responsive">
							<table class="table">
								<thead>
									<tr>
										<th scope="col">#</th>
										<th scope="col">Product</th>
										<th scope="col"></th>
										<th scope="col">Price</th>
										<th scope="col">Quantity</th>
										<th scope="col">Thành Tiền</th>
										<th colspan="2"></th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${listCart}" var="cart">
										<tr class="text-center">
											<th scope="row"></th>
											<td><img
												src="/Assiment/uploads/${cart.product.img != null ? cart.product.img : ''}"
												width="50" alt="IMG"></td>
											<td>${cart.product.ten}</td>
											<td><fmt:formatNumber value="${cart.product.donGia}"
													pattern="#,###">
												</fmt:formatNumber> <b> Đ</b></td>
											<td>${cart.quantity}</td>
											<td><fmt:formatNumber value="${cart.total}"
													pattern="#,###"></fmt:formatNumber><b> Đ</b></td>

											<td>
												<!-- Button trigger modal -->
												<button type="button" class="btn btn-secondary"
													data-toggle="modal" data-target="#deleteCart_${cart.id}">
													X</button> <!-- Modal -->
												<div class="modal fade mt-5" id="deleteCart_${cart.id}"
													tabindex="-1" aria-labelledby="exampleModalLabel"
													aria-hidden="true">
													<div class="modal-dialog mt-5">
														<div class="modal-content mt-5">
															<div class="modal-header">
																<h5 class="modal-title" id="exampleModalLabel">Bạn
																	có thực sự muốn xóa ?</h5>
																<button type="button" class="close" data-dismiss="modal"
																	aria-label="Close">
																	<span aria-hidden="true">&times;</span>
																</button>
															</div>
															<div class="modal-body">
																<span class="float-start">Tên Sản Phẩm: <b>${cart.product.ten}</b>
																</span>
															</div>
															<div class="modal-footer">
																<a href="/Assiment/Features/delete?idCart=${cart.id}"
																	class="btn btn-danger">Xóa</a>
																<button type="button" class="btn btn-secondary"
																	data-dismiss="modal">Close</button>
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
					<div
						class="flex-w flex-sb-m bor15 p-t-18 p-b-15 p-lr-40 p-lr-15-sm">
						<div class="flex-w flex-m m-r-20 m-tb-5">
							<input
								class="stext-104 cl2 plh4 size-117 bor13 p-lr-20 m-r-10 m-tb-5"
								type="text" name="coupon" placeholder="Coupon Code">
							<div
								class="flex-c-m stext-101 cl2 size-118 bg8 bor13 hov-btn3 p-lr-15 trans-04 pointer m-tb-5">
								Apply coupon</div>
						</div>
						<div
							class="flex-c-m stext-101 cl2 size-119 bg8 bor13 hov-btn3 p-lr-15 trans-04 pointer m-tb-10">
							Update Cart</div>
					</div>
				</div>
			</div>


			<div class="col-sm-10 col-lg-7 col-xl-5 m-lr-auto m-b-50">




				<form action="/Assiment/Order" method="post">
					<div
						class="bor10 p-lr-40 p-t-30 p-b-40 m-l-63 m-r-40 m-lr-0-xl p-lr-15-sm">
						<h4 class="mtext-109 cl2 p-b-30">Cart Totals</h4>

						<div class="flex-w flex-t p-t-27 p-b-33">
							<div class="size-208">
								<span class="mtext-101 cl2"> Tổng Tiền: </span>
							</div>

							<div class="size-209 p-t-1">
								<span class="mtext-110 cl2"> <fmt:formatNumber
										value="${sum}" pattern="#,###"></fmt:formatNumber> <b> Đ</b>
								</span>
							</div>
						</div>

						<!-- Button trigger modal -->
						<button type="button" class="btn btn-primary" data-toggle="modal"
							data-target="#exampleModal">Thanh Toán</button>


						<!-- Modal -->
						<div class="modal fade mt-5" id="exampleModal" tabindex="-1"
							aria-labelledby="exampleModalLabel" aria-hidden="true">
							<div class="modal-dialog mt-5">
								<div class="modal-content mt-5">
									<div class="modal-header">
										<h5 class="modal-title" id="exampleModalLabel">Bạn Có
											Chắc Chắn Là Đặt Hàng Không ?</h5>
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<div class="modal-body">
										<input name="sum=${sum}" />
									</div>
									<div class="modal-footer">
										<button type="submit" class="btn btn-primary">ĐỒNG
											Ý</button>
										<button type="button" class="btn btn-secondary"
											data-dismiss="modal">Close</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>



