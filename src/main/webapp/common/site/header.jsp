<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- Spinner Start -->
<div id="spinner"
	class="show w-100 vh-100 bg-white position-fixed translate-middle top-50 start-50  d-flex align-items-center justify-content-center">
	<div class="spinner-grow text-primary" role="status"></div>
</div>
<!-- Spinner End -->


<!-- Navbar start -->
<div class="container-fluid fixed-top">
	<div class="container px-0">
		<nav class="navbar navbar-light bg-white navbar-expand-xl">
			<a href="site/index" class="navbar-brand">
			<h1 class="text-primary display-6">Monkey</h1></a>
			<button class="navbar-toggler py-2 px-3" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
				<span class="fa fa-bars text-primary"></span>
			</button>
			<div class="collapse navbar-collapse bg-white" id="navbarCollapse">
				<div class="navbar-nav mx-auto">
					<a href="site/index" class="nav-item nav-link">Xin chào ${user.name}</a>
					<a href="site/index" class="nav-item nav-link">Trang chủ</a> 
					<a href="site/shop" class="nav-item nav-link">Cửa hàng</a> 
					<a href="site/checkout" class="nav-item nav-link">Thanh toán</a>
					<a href="site/contact" class="nav-item nav-link">Liên hệ</a>
					
				</div>
				<div class="d-flex m-3 me-0">
					<a href="site/cartitem" class="position-relative me-4 my-auto"> <i
						class="fa fa-shopping-bag fa-2x"></i> 
					</a> 
					<div class="nav-item dropdown">
						<a href="#" class="nav-link dropdown-toggle my-auto"
							data-bs-toggle="dropdown"><i class="fas fa-user fa-2x"></i></a>
						<div class="dropdown-menu m-0 bg-secondary rounded-0">
							<c:if test="${empty sessionScope.user}">
				                <a href="/site/login" class="dropdown-item">Đăng nhập</a>
				                <a href="/site/register" class="dropdown-item">Đăng ký</a>
				            </c:if>
				            <c:if test="${sessionScope.user.isAdmin}">
						        <a href="/admin/home" class="dropdown-item">Trang Admin</a>
						    </c:if>
				            <c:if test="${not empty sessionScope.user}">
               					<a href="/site/logout" class="dropdown-item">Đăng xuất</a>
               				</c:if>
							
						</div>
					</div>
				</div>

			</div>
	</div>
	</nav>
</div>
</div>
<!-- Navbar End -->