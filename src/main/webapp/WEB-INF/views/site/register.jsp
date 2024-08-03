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
    <style>
        .form-group {
            margin-bottom: 15px; /* Thêm khoảng cách giữa các ô nhập */
        }
    </style>
</head>
<body style="padding-top: 100px;">
    <%@ include file="/common/site/header.jsp" %>

    <div class="container" style="margin-top: 10px; margin-bottom: 10px;">
        <div class="row" style="width: 50%; margin: 0 auto; padding: 20px;">
            <div class="col-sm-12">
                <center><h2>Đăng ký</h2></center>
                <form action="/site/register/create" method="post">
                    <div class="form-group">
                        <input type="text" class="form-control" name="username" value=""
                            placeholder="Tên đăng nhập">
                    </div>

                    <div class="form-group">
                        <input type="password" class="form-control" name="password"
                            value="" placeholder="Mật Khẩu">
                    </div>

					<div class="form-group">
                        <input type="text" class="form-control" name="name" value=""
                            placeholder="Tên người dùng">
                    </div>

                    <div class="form-group">
                        <input type="text" class="form-control" name="email" value=""
                            placeholder="Email">
                    </div>
                    
                    <div class="form-group">
                        <input type="text" class="form-control" name="phoneNumber" value=""
                            placeholder="Số điện thoại">
                    </div>

                    <button type="submit" class="btn btn-primary">Đăng ký</button>
                    <a href="/site/register" class="btn btn-primary">Hủy bỏ</a>
                    <p style="margin: 10px;">
                        Bạn đã có tài khoản? <a href="site/login" style="color: red">Đăng nhập</a>
                    </p>
                </form>
            </div>
        </div>
    </div>

    <%@ include file="/common/site/footer.jsp" %>
</body>
</html>
