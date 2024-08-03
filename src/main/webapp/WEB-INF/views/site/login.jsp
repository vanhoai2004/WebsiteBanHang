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

    <div class="container-fluid" style="margin-top: 20px; margin-bottom: 10px;">
        <div class="row" style="width: 50%; margin:0 auto; padding: 20px;">
            <div class="col-sm-12">
                <center><h2>Đăng nhập</h2></center>
                <form action="/site/login" method="post">
                    <div class="form-group">
                        <input type="text" class="form-control" name="username" value=""
                            placeholder="Tên đăng nhập">
                    </div>

                    <div class="form-group">
                        <input type="password" class="form-control" name="password"
                            value="" placeholder="Mật khẩu">
                    </div>

                    <div class="form-group">
                        <div class="radio">
                            <label class="checkbox-inline"><input type="checkbox"
                                name="remember">Ghi nhớ</label>
                        </div>
                    </div>
                    <p style="color: red;">${message}</p>
                    <button type="submit" class="btn btn-primary">Đăng nhập</button>
                    <button type="reset" class="btn btn-primary">Hủy bỏ</button>
                    <p style="margin: 10px;">
                        Bạn chưa có tài khoản? <a href="site/register" style="color: red">Đăng ký</a>
                    </p>
                </form>
            </div>
        </div>
    </div>

    <%@ include file="/common/site/footer.jsp" %>
</body>
</html>
