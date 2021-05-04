<%@include file="head.jsp"%>
<p:if test="${sessionScope.user==null}">
	<p:redirect url="/"></p:redirect>
</p:if>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Add Product</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="js/addproduct.js"></script>
</head>
<body>
	<p:if test="${sessionScope.user.role=='Seller'}">

		<h1 style="text-align: center;">
			<label>Welcome ${sessionScope.user.username}</label>
		</h1>
		<h3 style="text-align: center">Add Product</h3>
		<div class="row">
			<div class="col-sm-3"></div>
			<div class="col-sm-6">
				<div class="card">
					<div class="card-body">
						<form action="add" class="was-validated" method="post"
							enctype="multipart/form-data">
							<div class="form-group">
								<label for="productname">Product Name:</label> <input
									type="text" class="form-control" id="productname"
									placeholder="Enter product name" name="productname" required>
							</div>
							<div class="form-group">
								<label for="productprice">Product Price:</label> <input
									type="number" class="form-control" id="productprice"
									placeholder="Enter product price" name="productprice" required>
							</div>
							<div class="form-group">
								<label for="productimage">Image:</label> <input type="file"
									class="form-control-file border" name="imagefile" required>
							</div>
							<div class="form-group">
								<label for="sellerid">Seller Id:</label> <input type="text"
									class="form-control" id="sellerid"
									value="${sessionScope.user.email}" name="sellerid" required
									readonly>
							</div>
							<div class="form-group">
								<label for="sellername">Seller Name:</label> <input type="text"
									class="form-control" id="sellername"
									value="${sessionScope.user.username}" name="sellername"
									required readonly>
							</div>
							<div class="form-group" style="text-align: center;">
								<textarea rows="4" cols="50"
									placeholder="Enter description of product" id="description"
									name="description" required></textarea>
							</div>
							<div style="text-align: center;">
								<button type="submit" class="btn btn-primary" id="submit">Submit</button>
							</div>

						</form>
					</div>
				</div>
			</div>
		</div>
		<div class="col-sm-3"></div>
	</p:if>
</body>
</html>
