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
            <h1 class="text-center text-white display-6">Thanh toán</h1>
            <ol class="breadcrumb justify-content-center mb-0">
                <li class="breadcrumb-item"><a href="#">Home</a></li>
                <li class="breadcrumb-item"><a href="#">Pages</a></li>
                <li class="breadcrumb-item active text-white">Checkout</li>
            </ol>
        </div>
        <!-- Single Page Header End -->


        <!-- Checkout Page Start -->
        <div class="container-fluid py-5">
            <div class="container py-5">
                <h1 class="mb-4">Chi tiết thanh toán</h1>
                <form action="/site/checkout">
                    <div class="row g-5">
                        <div class="col-md-12 col-lg-6 col-xl-7">
                            <div class="form-item">
                                <label class="form-label my-3">Tên<sup>*</sup></label>
                                <input type="text" class="form-control" disabled value="${user.name}">
                            </div>
                            <div class="form-item">
                                <label class="form-label my-3">Số điện thoại<sup>*</sup></label>
                                <input type="tel" class="form-control" disabled value="${user.phoneNumber}">
                            </div>
                             <div class="form-item">
                                <label class="form-label my-3">Email<sup>*</sup></label>
                                <input type="email" class="form-control" disabled value="${user.email}">
                            </div>
                            <div class="form-item">
                                <label class="form-label my-3">Thành phố<sup>*</sup></label>
                                <input type="text" class="form-control">
                            </div>
                            <div class="form-item">
                                <label class="form-label my-3">Địa chỉ <sup>*</sup></label>
                                <input type="text" class="form-control" placeholder="Số nhà,tên đường, khu phố">
                            </div>
                            <div class="form-item my-3">
                            	<label class="form-label my-3">Lời nhắn</label>
                                <textarea name="text" class="form-control" spellcheck="false" cols="30" rows="7" placeholder=""></textarea>
                            </div>
                        </div>
                        <div class="col-md-12 col-lg-6 col-xl-5">
                            <div class="table-responsive">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th scope="col">Sản phẩm</th>
                                            <th scope="col">Tên</th>
                                            <th scope="col">Giá</th>
                                            <th scope="col">Số lượng</th>
                                            <th scope="col">Tổng cộng</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <c:set var="totalAmount" value="0" />
                                    <c:forEach var="item" items="${cartitem}">
                                        <tr>
                                            <th scope="row">
                                                <div class="d-flex align-items-center mt-2">
                                                    <img src="/images/${item.product.image}" class="img-fluid rounded-circle" style="width: 90px; height: 90px;" alt="">
                                                </div>
                                            </th>
                                            <td class="py-5">${item.product.name}</td>
                                            <td class="py-5">$ ${item.price}</td>
                                            <td class="py-5">${item.quantity}</td>
                                            <td class="py-5">${item.amount}</td>
                                        </tr>
                                    <c:set var="totalAmount" value="${totalAmount + (item.price * item.quantity)}" />
                                    </c:forEach>     
                                       
                                        <tr>
                                            <th scope="row">
                                            </th>
                                            <td class="py-5">
                                                <p class="mb-0 text-dark text-uppercase py-3">Tổng tiền</p>
                                            </td>
                                            <td class="py-5"></td>
                                            <td class="py-5"></td>
                                            <td class="py-5">
                                                <div class="py-3 border-bottom border-top">
                                                    <p class="mb-0 text-dark">$ ${totalAmount}</p>
                                                </div>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            
                            <div class="row g-4 text-center align-items-center justify-content-center pt-4">
                                <button type="button" class="btn border-secondary py-3 px-4 text-uppercase w-100 text-primary" onclick="showMessage()">Đặt hàng</button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <!-- Checkout Page End -->

<%@ include file="/common/site/footer.jsp" %>

<script>
    function showMessage() {
        alert("Đặt hàng thành công!");
        setTimeout(function() {
            window.location.href = '/site/index'; // Đổi thành đường dẫn của trang chủ của bạn
        }, 2000); // 2000 milliseconds = 2 giây
    }
</script>


</body>
</html>