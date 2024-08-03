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
</head>
<body>
<%@ include file="/common/site/header.jsp" %>

 <!-- Single Page Header start -->
        <div class="container-fluid page-header py-5">
            <h1 class="text-center text-white display-6">Giỏ hàng</h1>
            <ol class="breadcrumb justify-content-center mb-0">
                <li class="breadcrumb-item"><a href="#">Home</a></li>
                <li class="breadcrumb-item"><a href="#">Pages</a></li>
                <li class="breadcrumb-item active text-white">Cart</li>
            </ol>
        </div>
        <!-- Single Page Header End -->


        <!-- Cart Page Start -->
        <div class="container-fluid py-5">
            <div class="container py-5">
                <div class="table-responsive">
                    <table class="table">
                        <thead>
                          <tr>
                            <th scope="col">Sản phẩm</th>
                            <th scope="col">Tên</th>
                            <th scope="col">Giá</th>
                            <th scope="col">Số lượng</th>
                            <th scope="col">Tổng tiền</th>
                            <th scope="col">Loại bỏ</th>
                          </tr>
                          <c:set var="no" value="1"></c:set>
                        </thead>
                        <tbody>
                        <!-- 
                        <c:forEach var="item" items="${cartItems}">
                        <form action="/site/cart/update" method="post">
                            <tr>
                                <th scope="row">
                                    <div class="d-flex align-items-center">
                                        <img src="/images/${item.product.image}" class="img-fluid me-5 rounded-circle" style="width: 80px; height: 80px;" alt="">
                                    </div>
                                </th>
                                <td>
                                    <p class="mb-0 mt-4">${item.product.productId}</p>
                                </td>
                                <td>
                                    <p class="mb-0 mt-4">${item.price} $</p>
                                </td>
                                
                                <td>
								    <div class="input-group quantity mt-4" style="width: 100px;">
								        <div class="input-group-btn">
								            <button class="btn btn-sm btn-minus rounded-circle bg-light border" type="button">
								                <i class="fa fa-minus"></i>
								            </button>
								        </div>
								        <input type="text" class="form-control form-control-sm text-center border-0 quantity-input" name="quantity" value="${item.quantity}">
								        <div class="input-group-btn">
								            <button class="btn btn-sm btn-plus rounded-circle bg-light border" type="button">
								                <i class="fa fa-plus"></i>
								            </button>
								        </div>
								    </div>
								</td>
                                
                                <td>
                                    <p class="mb-0 mt-4">${totalAmount} $</p>
                                </td>
                                <td>
                                    <a href="/site/cart/remove/${item.product.productId}" class="btn btn-md rounded-circle bg-light border mt-4" >
                                        <i class="fa fa-times text-danger"></i>
                                    </a>
                                </td>
                            
                            </tr>
                        </form> 
                        </c:forEach>  -->
                        
                        	<c:set var="totalAmount" value="0" />
                        	<c:forEach var="item" items="${items}">
						        <tr>
						            <th scope="row">
						                <div class="d-flex align-items-center">
						                    <img src="/images/${item.product.image}" class="img-fluid me-5 rounded-circle" style="width: 80px; height: 80px;" alt="">
						                </div>
						            </th>
						            <td>
						                <p class="mb-0 mt-4">${item.product.productId}</p>
						            </td>
						            <td>
						                <p class="mb-0 mt-4">${item.price} $</p>
						            </td>
						            
						            <td>
						                <div class="input-group quantity mt-4" style="width: 100px;">
						                    <div class="input-group-btn">
						                        <a href="/site/cartitem/updateQuantity?productId=${item.product.productId}&quantity=${item.quantity - 1}" class="btn btn-sm btn-minus rounded-circle bg-light border ${item.quantity <= 1 ? 'disabled' : ''}">
						                            <i class="fa fa-minus"></i>
						                        </a>
						                    </div>
						                    <input type="text" class="form-control form-control-sm text-center border-0 quantity-input" name="quantity" value="${item.quantity}">
						                    <div class="input-group-btn">
						                        <a href="/site/cartitem/updateQuantity?productId=${item.product.productId}&quantity=${item.quantity + 1}"  class="btn btn-sm btn-plus rounded-circle bg-light border" type="button">
						                            <i class="fa fa-plus"></i>
						                        </a>
						                    </div>
						                </div>
						            </td>
						            
						            <td>
						                <p class="mb-0 mt-4 total-price" data-unit-price="${item.price}">${item.price * item.quantity} $</p>
						            </td>
						            <td>
						                <a href="/site/cartitem/delete/${item.id}" class="btn btn-md rounded-circle bg-light border mt-4" >
						                    <i class="fa fa-times text-danger"></i>
						                </a>
						            </td>
						        </tr>
						        <c:set var="totalAmount" value="${totalAmount + (item.price * item.quantity)}" />
							</c:forEach>
                        </tbody>
                    </table>
                </div>
                
                <div class="total-container mt-4">
				    <h4>Tổng số tiền: ${totalAmount} $</span></h4>
				</div>
                
                
                
                <div class="row g-4 justify-content-end">
                    <div class="col-8"></div>
                    <div class="col-sm-8 col-md-7 col-lg-6 col-xl-4">
                        <div>
                            <a href="/site/checkout" class="btn border-secondary rounded-pill px-4 py-3 text-primary text-uppercase mb-4 ms-4" >Thanh toán</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Cart Page End -->

<%@ include file="/common/site/footer.jsp" %>


</body>
</html>