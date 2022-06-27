<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>

<section class="bg0 p-t-23 p-b-140 mt-5">

	<div class="container mt-5">
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
						${sessionScope.error} a
						<c:remove var="error" scope="session" />
					</div>
				</c:if>
			</div>
		</div>
		<form action="/Assiment/Product" method="get">
			<div class="flex-w flex-sb-m p-b-52">
				<div class="flex-w flex-l-m filter-tope-group m-tb-10">
					<c:forEach items="${listCategory}" var="category">
						<button name="id" value="${category.id}"
							class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5">${category.ten}</button>
					</c:forEach>
				</div>
				<div class="flex-w flex-c-m m-tb-10">
					<div
						class="flex-c-m stext-106 cl6 size-104 bor4 pointer hov-btn3 trans-04 m-r-8 m-tb-4 js-show-filter">
						<i
							class="icon-filter cl2 m-r-6 fs-15 trans-04 zmdi zmdi-filter-list"></i>
						<i
							class="icon-close-filter cl2 m-r-6 fs-15 trans-04 zmdi zmdi-close dis-none"></i>
						Filter
					</div>

					<div
						class="flex-c-m stext-106 cl6 size-105 bor4 pointer hov-btn3 trans-04 m-tb-4 js-show-search">
						<i class="icon-search cl2 m-r-6 fs-15 trans-04 zmdi zmdi-search"></i>
						<i
							class="icon-close-search cl2 m-r-6 fs-15 trans-04 zmdi zmdi-close dis-none"></i>
						Search
					</div>
				</div>

				<!-- Filter -->
				<div class="dis-none panel-filter w-full p-t-10">
					<div
						class="wrap-filter flex-w bg6 w-full p-lr-40 p-t-27 p-lr-15-sm">
						<div class="filter-col1 p-r-15 p-b-27">
							<div class="mtext-102 cl2 p-b-15">Sort By</div>
							<ul>
								<li class="p-b-6"><a href="#"
									class="filter-link stext-106 trans-04"> Default </a></li>

								<li class="p-b-6"><a href="#"
									class="filter-link stext-106 trans-04"> Popularity </a></li>

								<li class="p-b-6"><a href="#"
									class="filter-link stext-106 trans-04"> Average rating </a></li>

								<li class="p-b-6"><a href="#"
									class="filter-link stext-106 trans-04 filter-link-active">
										Newness </a></li>

								<li class="p-b-6"><a href="#"
									class="filter-link stext-106 trans-04"> Price: Low to High
								</a></li>

								<li class="p-b-6"><a href="#"
									class="filter-link stext-106 trans-04"> Price: High to Low
								</a></li>
							</ul>
						</div>

						<div class="filter-col2 p-r-15 p-b-27">
							<div class="mtext-102 cl2 p-b-15">Price</div>

							<ul>
								<li class="p-b-6"><a href="#"
									class="filter-link stext-106 trans-04 filter-link-active">
										All </a></li>

								<li class="p-b-6"><a href="#"
									class="filter-link stext-106 trans-04"> $0.00 - $50.00 </a></li>

								<li class="p-b-6"><a href="#"
									class="filter-link stext-106 trans-04"> $50.00 - $100.00 </a></li>

								<li class="p-b-6"><a href="#"
									class="filter-link stext-106 trans-04"> $100.00 - $150.00 </a></li>

								<li class="p-b-6"><a href="#"
									class="filter-link stext-106 trans-04"> $150.00 - $200.00 </a></li>

								<li class="p-b-6"><a href="#"
									class="filter-link stext-106 trans-04"> $200.00+ </a></li>
							</ul>
						</div>

						<div class="filter-col3 p-r-15 p-b-27">
							<div class="mtext-102 cl2 p-b-15">Color</div>

							<ul>
								<li class="p-b-6"><span class="fs-15 lh-12 m-r-6"
									style="color: #222;"> <i class="zmdi zmdi-circle"></i>
								</span> <a href="#" class="filter-link stext-106 trans-04"> Black </a></li>

								<li class="p-b-6"><span class="fs-15 lh-12 m-r-6"
									style="color: #4272d7;"> <i class="zmdi zmdi-circle"></i>
								</span> <a href="#"
									class="filter-link stext-106 trans-04 filter-link-active">
										Blue </a></li>

								<li class="p-b-6"><span class="fs-15 lh-12 m-r-6"
									style="color: #b3b3b3;"> <i class="zmdi zmdi-circle"></i>
								</span> <a href="#" class="filter-link stext-106 trans-04"> Grey </a></li>

								<li class="p-b-6"><span class="fs-15 lh-12 m-r-6"
									style="color: #00ad5f;"> <i class="zmdi zmdi-circle"></i>
								</span> <a href="#" class="filter-link stext-106 trans-04"> Green </a></li>

								<li class="p-b-6"><span class="fs-15 lh-12 m-r-6"
									style="color: #fa4251;"> <i class="zmdi zmdi-circle"></i>
								</span> <a href="#" class="filter-link stext-106 trans-04"> Red </a></li>

								<li class="p-b-6"><span class="fs-15 lh-12 m-r-6"
									style="color: #aaa;"> <i class="zmdi zmdi-circle-o"></i>
								</span> <a href="#" class="filter-link stext-106 trans-04"> White </a></li>
							</ul>
						</div>

						<div class="filter-col4 p-b-27">
							<div class="mtext-102 cl2 p-b-15">Tags</div>

							<div class="flex-w p-t-4 m-r--5">
								<a href="#"
									class="flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5">
									Fashion </a> <a href="#"
									class="flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5">
									Lifestyle </a> <a href="#"
									class="flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5">
									Denim </a> <a href="#"
									class="flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5">
									Streetstyle </a> <a href="#"
									class="flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5">
									Crafts </a>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="row isotope-grid">
				<c:forEach items="${listProduct}" var="product">
					<div class="col-sm-6 col-md-4 col-lg-3 p-b-35 isotope-item women">

						<!-- Block2 -->
						 <div class="block2">
							<div class="card" >
								<img src="/Assiment/uploads/${product.img}" style="width=100%;" 
									alt="IMG-PRODUCT">

							</div>
							<div class="block2-txt flex-w flex-t p-t-14">
								<div class="block2-txt-child1 flex-col-l ">
									<a href="product-detail.html"
										class="stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6">
										${product.ten} </a> <span class="stext-105 cl3"> <fmt:formatNumber
											value="${product.donGia}" pattern="#,###"></fmt:formatNumber>
										Đ


										<button type="button" class="btn btn-primary"
											data-toggle="modal" data-target="#exampleModal_${product.id}">Xem
											Chi Tiết</button> <!-- Modal -->
										<div class="modal fade mt-5" id="exampleModal_${product.id}"
											tabindex="-1" aria-labelledby="exampleModalLabel"
											aria-hidden="true">
											<div class="modal-dialog modal-lg mt-5">
												<div class="modal-content">
													<div class="modal-header">
														<h5 class="modal-title" id="exampleModalLabel">Chi
															Tiết Sản Phẩm</h5>
														<button type="button" class="close" data-dismiss="modal"
															aria-label="Close">
															<span aria-hidden="true">&times;</span>
														</button>
													</div>
													<form action="/Assiment/ShoppingCart?idPro=${product.id}"
														method="post">
														<div class="modal-body">
															<div class="row">
																<div class="col">
																	<img src="/Assiment/uploads/${product.img}" width="70%"
																		alt="IMG-PRODUCT">
																</div>
																<div class="col">																.
																	<div class="form-group">
																		<label>Tên Sản Phẩm: <b>${product.ten}</b></label>
																	</div>
																	<div class="form-group">
																		<label>Giá: <b> <fmt:formatNumber
																					value="${product.donGia}" pattern="#,###"></fmt:formatNumber>
																				Đ
																		</b>
																		</label>
																	</div>
																	<div class="form-group">
																		<label>Số Lượng: </label> <input type="number"
																			name="quantity" value="1"
																			class="form-control text-dark" required="required">
																	</div>

																	<div class="form-group">
																		<label for="exampleFormControlSelect1">Màu:</label> <select
																			name="mauSac" class="form-control"
																			id="exampleFormControlSelect1" required="required">
																			<option disabled="disabled" selected="selected">Chọn
																				Màu</option>
																			<option value="xanh">Xanh</option>
																			<option value="do">Đỏ</option>
																			<option value="trang">Trắng</option>
																			<option value="hong">Hồng</option>
																		</select>
																	</div>

																	<div class="form-group">
																		<label for="exampleFormControlSelect1">Size:</label> <select
																			name="kichThuoc" class="form-control"
																			id="exampleFormControlSelect1" required="required">
																			<option disabled="disabled" selected="selected">Chọn
																				Size</option>
																			<option value="L">L</option>
																			<option value="M">M</option>
																			<option value="XL">XL</option>
																			<option value="XXL">XXL</option>
																		</select>
																	</div>


																</div>
															</div>
														</div>
														<div class="modal-footer">
															<%-- <a href="/Assiment/ShoppingCart?idPro=${product.id}"
																class="btn btn-primary">Thêm Vào Giỏ Hàng</a> --%>
															<button class="btn btn-success">Thêm Vào Giỏ
																Hàng</button>
															<button type="button" class="btn btn-secondary"
																data-dismiss="modal">Close</button>
														</div>
													</form>
												</div>
											</div>
										</div>





									</span>
								</div>
								<div class="block2-txt-child2 flex-r p-t-3">
									<a href="#"
										class="btn-addwish-b2 dis-block pos-relative js-addwish-b2">
										<img class="icon-heart1 dis-block trans-04"
										src="/Assiment/images/icons/icon-heart-01.png" alt="ICON">
										<img class="icon-heart2 dis-block trans-04 ab-t-l"
										src="/Assiment/images/icons/icon-heart-02.png" alt="ICON">
									</a>
								</div>
							</div>

						</div> 
						


					</div>
				</c:forEach>
			</div>
		</form>
		<!-- Load more -->
		<div class="flex-c-m flex-w w-full p-t-45">
			<a href="#"
				class="flex-c-m stext-101 cl5 size-103 bg2 bor1 hov-btn1 p-lr-15 trans-04">
				Load More </a>
		</div>
	</div>
</section>




