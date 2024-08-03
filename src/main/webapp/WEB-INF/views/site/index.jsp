<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
<title>Monkey</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="keywords">
<meta content="" name="description">
<%@ include file="/common/site/head.jsp" %>
</style>
</head>
<body>

	<%@ include file="/common/site/header.jsp" %>

	<!-- Hero Start -->
	<div class="container-fluid py-5 mb-5 hero-header">
		<div class="container py-5">
			<div class="row g-5 align-items-center">
				<div class="col-md-12 col-lg-7">
					<h4 class="mb-3 text-secondary">100% Chính hãng</h4>
					<h1 class="mb-5 display-3 text-primary">Máy tính và phụ kiện
						công nghệ</h1>
				</div>
			</div>
		</div>
	</div>
	<!-- Hero End -->


	<!-- Featurs Section Start -->
	<div class="container-fluid featurs py-5">
		<div class="container py-5">
			<div class="row g-4">
				<div class="col-md-6 col-lg-3">
					<div class="featurs-item text-center rounded bg-light p-4">
						<div
							class="featurs-icon btn-square rounded-circle bg-secondary mb-5 mx-auto">
							<i class="fas fa-car-side fa-3x text-white"></i>
						</div>
						<div class="featurs-content text-center">
							<h5>Miễn phí vận chuyển</h5>
							<p class="mb-0">Cho đơn hàng trên 1 triệu</p>
						</div>
					</div>
				</div>
				<div class="col-md-6 col-lg-3">
					<div class="featurs-item text-center rounded bg-light p-4">
						<div
							class="featurs-icon btn-square rounded-circle bg-secondary mb-5 mx-auto">
							<i class="fas fa-user-shield fa-3x text-white"></i>
						</div>
						<div class="featurs-content text-center">
							<h5>Thanh toán bảo mật</h5>
							<p class="mb-0">Thanh toán bảo mật 100%</p>
						</div>
					</div>
				</div>
				<div class="col-md-6 col-lg-3">
					<div class="featurs-item text-center rounded bg-light p-4">
						<div
							class="featurs-icon btn-square rounded-circle bg-secondary mb-5 mx-auto">
							<i class="fas fa-exchange-alt fa-3x text-white"></i>
						</div>
						<div class="featurs-content text-center">
							<h5>Hoàn trả trong 30 ngày</h5>
							<p class="mb-0">Hoàn trả tiền trong 30 ngày</p>
						</div>
					</div>
				</div>
				<div class="col-md-6 col-lg-3">
					<div class="featurs-item text-center rounded bg-light p-4">
						<div
							class="featurs-icon btn-square rounded-circle bg-secondary mb-5 mx-auto">
							<i class="fa fa-phone-alt fa-3x text-white"></i>
						</div>
						<div class="featurs-content text-center">
							<h5>Hỗ trợ 24/7</h5>
							<p class="mb-0">Hỗ trợ nhanh chóng mọi lúc</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Featurs Section End -->


	<!-- Bestsaler Product Start -->
	<div class="container-fluid py-5">
		<div class="container py-5">
			<div class="text-center mx-auto mb-5" style="max-width: 700px;">
				<h1 class="display-4">Sản phẩm bán chạy nhất</h1>
			</div>
			<div class="row g-4">
			
			 <c:forEach var="item" items="${items}">
				<div class="col-lg-6 col-xl-4">
					<div class="p-4 rounded bg-light">
						<div class="row align-items-center">
							<div class="col-6">
								<img src="/images/${item.image}"
									class="img-fluid rounded-circle w-100" alt="">
							</div>
							<div class="col-6">
								<a href="#" class="h5">${item.name}</a>
								<h4 class="mb-3">${item.price} $</h4>
								<form action="/site/cartitem/create" method="post" style="display:inline;">
								    <input type="hidden" name="productId" value="${item.productId}">
								    <button type="submit" class="btn border border-secondary rounded-pill px-3 text-primary">
								        <i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart
								    </button>
								</form>
								
								<!-- <a href="/site/cartitem/create?productId=${item.productId}"
									class="btn border border-secondary rounded-pill px-3 text-primary"><i
									class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a> -->
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
				
			</div>
		</div>
	</div>
	<!-- Bestsaler Product End -->

	<!-- Fruits Shop Start -->
	<div class="container-fluid fruite py-5">
		<div class="container py-5">
			<div class="tab-class text-center">
				<div class="row g-4">
					<div class="col-lg-4 text-start">
						<h1>Danh sách sản phẩm</h1>
					</div>
					<div class="col-lg-8 text-end">
						<ul class="nav nav-pills d-inline-flex text-center mb-5">
							<ul class="nav nav-pills d-inline-flex text-center mb-5">
				                <li class="nav-item"><a href="site/index?categoryId=0" class="category d-flex m-2 py-2 bg-light rounded-pill"> <span class="text-dark" style="width: 130px;">Tất cả</span></a></li>
				                <li class="nav-item"><a href="site/index?categoryId=1" class="category d-flex py-2 m-2 bg-light rounded-pill"> <span class="text-dark" style="width: 130px;">Laptop</span></a></li>
				                <li class="nav-item"><a href="site/index?categoryId=2" class="category d-flex m-2 py-2 bg-light rounded-pill"> <span class="text-dark" style="width: 130px;">Bàn phím</span></a></li>
				                <li class="nav-item"><a href="site/index?categoryId=3" class="category d-flex m-2 py-2 bg-light rounded-pill"> <span class="text-dark" style="width: 130px;">Màn hình</span></a></li>
				                <li class="nav-item"><a href="site/index?categoryId=4" class="category d-flex m-2 py-2 bg-light rounded-pill"> <span class="text-dark" style="width: 130px;">Chuột</span></a></li>
				            </ul>
						</ul>
					</div>
				</div>
				<div class="tab-content">
					<div id="tab-1" class="tab-pane fade show p-0 active">
						<div class="row g-4" id="product-list">
							<div class="col-lg-12">
								<div class="row g-4">
								
								 <c:forEach var="item" items="${products}">
	                                <div class="col-md-6 col-lg-4 col-xl-3">
	                                    <div class="rounded position-relative fruite-item">
	                                        <div class="fruite-img">
	                                            <img src="/images/${item.image}" class="img-fluid w-100 rounded-top" alt="">
	                                        </div>
	                                        <div class="p-4 border border-secondary border-top-0 rounded-bottom">
	                                            <h4>${item.name}</h4>
	                                            <p>${item.description}</p>
	                                            <p class="text-dark fs-5 fw-bold mb-0">$ ${item.price}</p>
	                                            <div class="d-flex justify-content-between flex-lg-wrap">
	                                            	<a href="/site/shop/view/${item.productId}" class="btn border border-secondary rounded-pill px-3 text-primary"><i class="fa fa-eye me-2 text-primary"></i> View</a>
	                                                <form action="/site/cartitem/create" method="post" style="display:inline;">
													    <input type="hidden" name="productId" value="${item.productId}">
													    <button type="submit" class="btn border border-secondary rounded-pill px-3 text-primary">
													        <i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart
													    </button>
													</form>
	                                            </div>
	                                        </div>
	                                    </div>
	                                </div>
	                            </c:forEach>

								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Fruits Shop End-->


	<!-- Fact Start -->
	<div class="container-fluid py-5">
		<div class="container">
			<div class="bg-light p-5 rounded">
				<div class="row g-4 justify-content-center">
					<div class="col-md-6 col-lg-6 col-xl-3">
						<div class="counter bg-white rounded p-5">
							<i class="fa fa-users text-secondary"></i>
							<h4>khách hàng hài lòng</h4>
							<h1>1963</h1>
						</div>
					</div>
					<div class="col-md-6 col-lg-6 col-xl-3">
						<div class="counter bg-white rounded p-5">
							<i class="fa fa-users text-secondary"></i>
							<h4>chất lượng dịch vụ</h4>
							<h1>99%</h1>
						</div>
					</div>
					<div class="col-md-6 col-lg-6 col-xl-3">
						<div class="counter bg-white rounded p-5">
							<i class="fa fa-users text-secondary"></i>
							<h4>chứng nhận chất lượng</h4>
							<h1>33</h1>
						</div>
					</div>
					<div class="col-md-6 col-lg-6 col-xl-3">
						<div class="counter bg-white rounded p-5">
							<i class="fa fa-users text-secondary"></i>
							<h4>sản phẩm có sẵn</h4>
							<h1>123</h1>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Fact Start -->


	<!-- Tastimonial Start -->
	<div class="container-fluid testimonial py-5">
		<div class="container py-5">
			<div class="testimonial-header text-center">
				<h4 class="text-primary">Đánh giá</h4>
				<h1 class="display-5 mb-5 text-dark">Đánh giá của khách hàng!</h1>
			</div>
			<div class="owl-carousel testimonial-carousel">
				<div class="testimonial-item img-border-radius bg-light rounded p-4">
					<div class="position-relative">
						<i
							class="fa fa-quote-right fa-2x text-secondary position-absolute"
							style="bottom: 30px; right: 0;"></i>
						<div class="mb-4 pb-4 border-bottom border-secondary">
							<p class="mb-0">Shop này rất đáng tin cậy! Mua bàn phím và cáp sạc, tất cả đều hoạt động tốt. Nhân viên hỗ trợ nhiệt tình và thường có khuyến mãi hấp dẫn. Chắc chắn sẽ ủng hộ dài lâu!</p>
						</div>
						<div class="d-flex align-items-center flex-nowrap">
							<div class="bg-secondary rounded">
								<img src="/templates/site/img/testimonial-1.jpg" class="img-fluid rounded"
									style="width: 100px; height: 100px;" alt="">
							</div>
							<div class="ms-4 d-block">
								<h4 class="text-dark">Khách hàng</h4>
								<div class="d-flex pe-5">
									<i class="fas fa-star text-primary"></i> <i
										class="fas fa-star text-primary"></i> <i
										class="fas fa-star text-primary"></i> <i
										class="fas fa-star text-primary"></i> <i class="fas fa-star"></i>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="testimonial-item img-border-radius bg-light rounded p-4">
					<div class="position-relative">
						<i
							class="fa fa-quote-right fa-2x text-secondary position-absolute"
							style="bottom: 30px; right: 0;"></i>
						<div class="mb-4 pb-4 border-bottom border-secondary">
							<p class="mb-0">Rất hài lòng với dịch vụ của shop! PC gaming mình mua hoạt động rất tốt, giá cả hợp lý. Giao hàng nhanh chóng và đóng gói cẩn thận. Sẽ giới thiệu bạn bè tới mua.</p>
						</div>
						<div class="d-flex align-items-center flex-nowrap">
							<div class="bg-secondary rounded">
								<img src="/templates/site/img/testimonial-1.jpg" class="img-fluid rounded"
									style="width: 100px; height: 100px;" alt="">
							</div>
							<div class="ms-4 d-block">
								<h4 class="text-dark">Khách hàng</h4>
								<div class="d-flex pe-5">
									<i class="fas fa-star text-primary"></i> <i
										class="fas fa-star text-primary"></i> <i
										class="fas fa-star text-primary"></i> <i
										class="fas fa-star text-primary"></i> <i
										class="fas fa-star text-primary"></i>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="testimonial-item img-border-radius bg-light rounded p-4">
					<div class="position-relative">
						<i
							class="fa fa-quote-right fa-2x text-secondary position-absolute"
							style="bottom: 30px; right: 0;"></i>
						<div class="mb-4 pb-4 border-bottom border-secondary">
							<p class="mb-0">Shop bán đồ công nghệ này rất tuyệt vời! Mình đã mua laptop và phụ kiện, tất cả đều chất lượng. Nhân viên tư vấn nhiệt tình và am hiểu. Chắc chắn sẽ quay lại!</p>
						</div>
						<div class="d-flex align-items-center flex-nowrap">
							<div class="bg-secondary rounded">
								<img src="/templates/site/img/testimonial-1.jpg" class="img-fluid rounded"
									style="width: 100px; height: 100px;" alt="">
							</div>
							<div class="ms-4 d-block">
								<h4 class="text-dark">Khách hàng</h4>
								<div class="d-flex pe-5">
									<i class="fas fa-star text-primary"></i> <i
										class="fas fa-star text-primary"></i> <i
										class="fas fa-star text-primary"></i> <i
										class="fas fa-star text-primary"></i> <i
										class="fas fa-star text-primary"></i>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Tastimonial End -->

	<%@ include file="/common/site/footer.jsp" %>
	
	
	
<script>
    document.addEventListener('DOMContentLoaded', function() {
        // Lặp qua từng đường dẫn có class là "nav-link"
        document.querySelectorAll('a.category').forEach(function(link) {
            link.addEventListener('click', function(event) {
                event.preventDefault();
                // Thực hiện load lại trang
                history.pushState({}, '', this.href);
                window.location.reload(true);
            });
        });

        // Cuộn đến phần tử có id "product-list" sau khi trang đã load lại
        var isNavLinkClicked = false; // Biến để kiểm tra xem đã click vào nav-link hay chưa
        document.querySelectorAll('a.category').forEach(function(link) {
            link.addEventListener('click', function(event) {
                isNavLinkClicked = true;
            });
        });

        window.addEventListener('load', function() {
            if (isNavLinkClicked) {
                var productElement = document.getElementById('product-list');
                if (productElement) {
                    productElement.scrollIntoView({ behavior: 'smooth' });
                }
            }
        });
    });
</script>


</body>
</html>