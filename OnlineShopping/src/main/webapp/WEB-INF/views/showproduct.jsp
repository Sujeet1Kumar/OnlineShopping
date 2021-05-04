<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="p"%>
<p:if test="${sessionScope.user==null}">
	<p:redirect url="/"></p:redirect>
</p:if>
<%@include file="head.jsp"%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>Show Product</title>
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
<script src="js/showproduct.js"></script>
</head>
<body>

	<p:choose>

		<p:when test="${products.size() > 0}">

			<p:forEach items="${products}" var="product">
				<div class="container-fluid">
					<div class="row">
						<div class="col-sm-4">
							<img
								src="<p:url value="/productimages/${product.productimage}"/>"
								style="border: 5px solid black; border-radius: 25px; width: 100%; height: 375px;">
						</div>
						<div class="col-sm-8">


							<div style="text-align: center;">
								<table class="table table-hover">
									<thead>
										<tr>
											<th>Product ID :</th>
											<th>Product Name :</th>
											<th>Price :</th>
											<th>Seller ID :</th>
											<th>Seller Name :</th>
										</tr>
									</thead>
									<tbody>

										<tr class="tr">
											<td class="productid">${product.productid}</td>
											<td class="productname">${product.productname}</td>
											<td class="productprice">${product.productprice}</td>
											<td class="sellerid">${product.sellerid}</td>
											<td class="sellername">${product.sellername}</td>
											<td class="description" style="display: none;">${product.description}</td>
											<td class="productimage" style="display: none;">${product.productimage}</td>
											<p:if test="${sessionScope.user.role=='Buyer'}">
												<td>
													<button class="btn btn-primary">Buy Now</button>
												</td>
												<td>
													<button class="btn btn-dark">Add To Cart</button>
												</td>
											</p:if>
											<p:if test="${sessionScope.user.role=='Seller'}">
												<td>
													<button class="btn btn-danger">Delete Product</button>
												</td>
												<td></td>
											</p:if>
											<p:if test="${sessionScope.user.role=='Admin'}">
												<td>
													<button class="btn btn-danger">Delete Product</button>
												</td>
											</p:if>
										</tr>


									</tbody>
								</table>

								<div style="text-align: center;">
									<label style="border: 5px solid red; border-radius: 25px;">Description
										: ${product.description}</label>
								</div>
							</div>

						</div>
					</div>
					<label id="buyername" style="display: none">${sessionScope.user.username}</label><br>
					<label id="buyerid" style="display: none">${sessionScope.user.email}</label><br>
					<hr>
				</div>

			</p:forEach>
		</p:when>
		<p:otherwise>
			<h1 style="text-align: center;">Sorry, There Is No Product
				Available</h1>
		</p:otherwise>
	</p:choose>

</body>
</html>