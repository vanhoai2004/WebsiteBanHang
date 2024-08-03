<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>Monkey</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="keywords">
<meta content="" name="description">
<%@ include file="/common/site/head.jsp"%>
</head>
<body>

	<%@ include file="/common/site/header.jsp" %>
	

	<!-- Single Page Header start -->
	<div class="container-fluid page-header py-5">
		<h1 class="text-center text-white display-6">Cửa hàng</h1>
		<ol class="breadcrumb justify-content-center mb-0">
			<li class="breadcrumb-item"><a href="#">Home</a></li>
			<li class="breadcrumb-item"><a href="#">Pages</a></li>
			<li class="breadcrumb-item active text-white">Shop</li>
		</ol>
	</div>
	<!-- Single Page Header End -->


	<!-- Fruits Shop Start-->
	<div class="container-fluid fruite py-5">
		<div class="container py-5">
			<h1 class="mb-4">Monkey shop</h1>
			<div class="row g-4">
				<div class="col-lg-12">
					<div class="row g-4">
						<div class="col-xl-3">
						</div>
						<div class="col-6"></div>
						<div class="col-xl-3">
							<div
								class="bg-light ps-3 py-3 rounded d-flex justify-content-between mb-4">
								<label for="category">Phân loại:</label>
								<select id="category" name="categoryId" class="border-0 form-select-sm bg-light me-3" form="categoryform">
								    <option value="0">Tất cả</option>
								    <option value="1">Laptop</option>
								    <option value="2">Màn hình</option>
								    <option value="3">Bàn phím</option>
								    <option value="4">Chuột</option>
								</select>
								
							</div>
						</div>
					</div>
					<div class="row g-4">
						<div class="col-lg-3">
							<div class="row g-4">
								<div class="col-lg-12">
									<div class="mb-3">
										<h4>Danh mục</h4>
										<ul class="list-unstyled fruite-categorie">
											<li>
												<div class="d-flex justify-content-between fruite-name">
													<a href="#"></i>Laptop</a>
													<span>(6)</span>
												</div>
											</li>
											<li>
												<div class="d-flex justify-content-between fruite-name">
													<a href="#"></i>Màn hình</a>
													<span>(6)</span>
												</div>
											</li>
											<li>
												<div class="d-flex justify-content-between fruite-name">
													<a href="#"></i>Bàn phím</a>
													<span>(4)</span>
												</div>
											</li>
											<li>
												<div class="d-flex justify-content-between fruite-name">
													<a href="#"></i>Chuột</a>
													<span>(6)</span>
												</div>
											</li>
											<li>
												<div class="d-flex justify-content-between fruite-name">
													<a href="#"></i>Tai nghe</a>
													<span>(0)</span>
												</div>
											</li>
										</ul>
									</div>
								</div>
								<!--  <div class="col-lg-12">
									<div class="mb-3">
										<h4 class="mb-2">Giá</h4>
										<form action="/shop/search" method="post">
										<div class="form-group d-flex" style="margin-bottom: 10px;">
									        <input name="min" value="${param.min}" class="form-control" style="margin-right: 5px;" placeholder="Min Price?">
									        <input name="max" value="${param.max}" class="form-control" placeholder="Max Price?">
									    </div>
									     <button type="submit" class="btn btn-primary">Tìm kiếm</button>
									    </form>
									</div>
								</div>-->
								<!-- <div class="col-lg-12">
									<div class="mb-3">
										<h4>Additional</h4>
										<div class="mb-2">
											<input type="radio" class="me-2" id="Categories-1"
												name="Categories-1" value="Beverages"> <label
												for="Categories-1"> Organic</label>
										</div>
										<div class="mb-2">
											<input type="radio" class="me-2" id="Categories-2"
												name="Categories-1" value="Beverages"> <label
												for="Categories-2"> Fresh</label>
										</div>
										<div class="mb-2">
											<input type="radio" class="me-2" id="Categories-3"
												name="Categories-1" value="Beverages"> <label
												for="Categories-3"> Sales</label>
										</div>
										<div class="mb-2">
											<input type="radio" class="me-2" id="Categories-4"
												name="Categories-1" value="Beverages"> <label
												for="Categories-4"> Discount</label>
										</div>
										<div class="mb-2">
											<input type="radio" class="me-2" id="Categories-5"
												name="Categories-1" value="Beverages"> <label
												for="Categories-5"> Expired</label>
										</div>
									</div>
								</div>-->

								<div class="col-lg-12">
									<div class="position-relative">
										<img src="/templates/site/img/bannerdung.png"
											class="img-fluid w-100 rounded" alt="">
										<div class="position-absolute"
											style="top: 50%; right: 10px; transform: translateY(-50%);">
											<!--  <h3 class="text-secondary fw-bold">
												Fresh <br> Fruits <br> Banner
											</h3>-->
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-9">
							<div class="row g-4 justify-content-center">
								<c:forEach var="product" items="${products}">
								<div class="col-md-6 col-lg-6 col-xl-4">
									<div class="rounded position-relative fruite-item">
										<div class="fruite-img">
											<img src="/images/${product.image}"
												class="img-fluid w-100 rounded-top" alt="">
										</div>
										<div
											class="p-4 border border-secondary border-top-0 rounded-bottom">
											<h4>${product.name}</h4>
											<p>${product.description}</p>
											<p class="text-dark fs-5 fw-bold mb-0">$${product.price}</p>
											<div class="d-flex justify-content-between flex-lg-wrap mt-2">
												<a href="/site/shop/view/${product.productId}" class="btn border border-secondary rounded-pill px-3 text-primary"><i class="fa fa-eye me-2 text-primary"></i> View</a>
												<form action="/site/cartitem/create" method="post" style="display:inline;">
												    <input type="hidden" name="productId" value="${product.productId}">
												    <button type="submit" class="btn border border-secondary rounded-pill px-3 text-primary">
												        <i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart
												    </button>
												</form>
											</div>
										</div>
									</div>
								</div>
								</c:forEach>
								
								
								
								<div class="col-12">
							        <div class="pagination d-flex justify-content-center mt-5">
							            <!-- Nút Previous -->
							            <c:if test="${currentPage > 0}">
							                <a href="/site/shop?page=${currentPage - 1}" class="rounded">&laquo;</a>
							            </c:if>
							            
							            <!-- Các trang -->
							            <c:forEach begin="0" end="${totalPages - 1}" varStatus="loop">
							                <c:set var="pageIndex" value="${loop.index}" />
							                <c:choose>
							                    <c:when test="${currentPage == pageIndex}">
							                        <a href="/site/shop?page=${pageIndex}" class="active rounded">${pageIndex + 1}</a>
							                    </c:when>
							                    <c:otherwise>
							                        <a href="/site/shop?page=${pageIndex}" class="rounded">${pageIndex + 1}</a>
							                    </c:otherwise>
							                </c:choose>
							            </c:forEach>
							            
							            <!-- Nút Next -->
							            <c:if test="${currentPage < totalPages - 1}">
							                <a href="/site/shop?page=${currentPage + 1}" class="rounded">&raquo;</a>
							            </c:if>
							        </div>
							    </div>
							</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Fruits Shop End-->
	
	<%@ include file="/common/site/footer.jsp" %>
	

</body>
</html>