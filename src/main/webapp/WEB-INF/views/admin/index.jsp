<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Admin | Home</title>
<%@ include file="/common/admin/head.jsp"%>
</head>
<body class="hold-transition sidebar-mini layout-fixed">
	<div class="wrapper">

		<%@ include file="/common/admin/navbar.jsp"%>

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<div class="content-header">
				<div class="container-fluid">
					<div class="row mb-2">
						<div class="col-sm-6">
							<h1 class="m-0">Home</h1>
						</div>
						<!-- /.col -->
					</div>
					<!-- /.row -->
				</div>
				<!-- /.container-fluid -->
			</div>
			<!-- /.content-header -->

			<!-- Main content -->
			<section class="content">
				<div class="card">
					<div class="card-header">
						<h3 class="card-title">Thống kê hàng</h3>
					</div>
					<!-- /.card-header -->
					<div class="card-body">
						<table id="example1" class="table table-bordered table-striped">
							<thead>
								<tr>
									<th>Loại sản phẩm</th>
									<th>Tổng giá</th>
									<th>Số sản phẩm</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="item" items="${items}">
									<tr>
										<td>${item.groupColumn.name}</td>
										<td>${item.sum}</td>
										<td>${item.count}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<!-- /.card-body -->
				</div>


			</section>
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->
		
		<footer class="main-footer">
			<strong>Copyright by Hoai</strong>
			<div class="float-right d-none d-sm-inline-block">
				<b>Version</b> 1.0.0
			</div>
		</footer>

	</div>
	<!-- ./wrapper -->
	<%@ include file="/common/admin/footer.jsp"%>

	<script>
		$(function() {
			$("#example1").DataTable(
					{
						"responsive" : true,
						"lengthChange" : false,
						"autoWidth" : false,
						"buttons" : [ "copy", "csv", "excel", "pdf", "print",
								"colvis" ]
					}).buttons().container().appendTo(
					'#example1_wrapper .col-md-6:eq(0)');

			$('#example2').DataTable({
				"paging" : true,
				"lengthChange" : false,
				"searching" : false,
				"ordering" : true,
				"info" : true,
				"autoWidth" : false,
				"responsive" : true,
			});
		});

		$('#selectVideo').change(function() {
			var videoHref = $(this).val();
			$.ajax({
				url : 'admin/favorites?href=' + videoHref,
				type : 'GET',
				contentType : 'application/json'
			}).done(function(data) {
				$('#example2').dataTable({
					destroy : true,
					"paging" : true,
					"lengthChange" : false,
					"searching" : false,
					"ordering" : true,
					"info" : true,
					"autoWidth" : false,
					"responsive" : true,
					"aaData" : data,
					"columns" : [ {
						"data" : "username"
					}, {
						"data" : "email"
					} ]
				});
			}).fail(function(error) {
				$('#example2').dataTable().fnClearTable();
			});
		});
	</script>


</body>
</html>
