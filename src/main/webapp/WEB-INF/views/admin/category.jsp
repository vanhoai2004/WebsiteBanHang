<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Admin | Category</title>
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
            <h1 class="m-0">Category</h1>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <!-- Main content -->
    <section class="content">
	<div class="container-fluid">
      <div class="row">
        <div class="col-md-12">
          <div class="card card-primary">
            <div class="card-header">
              <h3 class="card-title">New or Edit</h3>

              <div class="card-tools">
                <button type="button" class="btn btn-tool" data-card-widget="collapse" title="Collapse">
                  <i class="fas fa-minus"></i>
                </button>
              </div>
            </div>
            
			  <div class="card-body">
            
            <form action="/admin/category/update" method="post">
			    <input type="hidden" name="categoryId" value="${item.categoryId}" />
			    <div class="form-group">
			        <label for="name">Name</label>
			        <input type="text" name="name" value="${item.name}" class="form-control" />
			    </div>
			    <div class="form-group">
			        <label for="description">Description</label>
			        <input type="text" name="description" value="${item.description}" class="form-control" />
			    </div>
			    <hr>
			    <button type="submit" class="btn bg-gradient-success btn-md">Submit</button>
			    <a href="/admin/category" class="btn btn-md">Reset</a>
			    <h5>${message}</h5>
			</form>
            
            
            </div> 
            <!-- /.card-body -->
          </div>
          <!-- /.card -->
        </div>
	  </div>
	  </div>
    </section>
	<br/><br/>
    <!-- /.content -->
    
    
    
    
    <!-- Main content -->
    <section class="content">
      <div class="card">
              <div class="card-header">
                <h3 class="card-title">List Categories</h3>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
              	<form action="/admin/category/search" method="post">
					<div class="d-flex mb-3">
						<input class="form-control mr-2" name="keywords" value="${keywords}">
						<button class="btn btn-primary">Search</button>
					</div>
				</form>
                <table id="example2" class="table table-bordered table-striped">
                  <thead>
	                  <tr>
	                    <th>ID</th>
	                    <th>Name</th>
	                    <th>Description</th>
	                    <th>Action</th>
	                  </tr>
                  </thead>
                  <tbody>
	                  <c:forEach var="item" items="${items}">
	                  		<tr>
	                  			<td>${item.categoryId}</td>
	                  			<td>${item.name}</td>
	                  			<td>${item.description}</td>
	                  			<td>	                  				
	                  				<a href="/admin/category/edit/${item.categoryId}" class="btn btn-block btn-success btn-sm">Edit</a>
	                  				<a href="/admin/category/delete/${item.categoryId}" class="btn btn-block btn-danger btn-sm">Delete</a>
	                  			</td>
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