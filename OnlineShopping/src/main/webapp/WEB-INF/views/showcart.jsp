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
<script src="js/showcart.js"></script>
</head>
<body>

	<p:choose>

		<p:when test="${cart.size() > 0}">

			<p:forEach items="${cart}" var="cart">
				<div class="container-fluid">
					<div class="row">
						<div class="col-sm-4">
							<img src="<p:url value="/productimages/${cart.productimage}"/>"
								style="border: 5px solid black; border-radius: 25px; width: 100%; height: 375px;">
						</div>
						<div class="col-sm-8">


							<div style="text-align: center;">
								<table class="table table-hover">
									<thead>
										<tr>
											<th>Product ID :</th>
											<th>Product Name :</th>
											<th>Buyer ID :</th>
											<th>Buyer Name :</th>
											<th>Price :</th>
											<th>Seller ID :</th>
											<th>Seller Name :</th>
										</tr>
									</thead>
									<tbody>
										<tr class="tr">
											<td class="productid">${cart.productid}</td>
											<td class="productname">${cart.productname}</td>
											<td class="buyerid">${cart.buyerid}</td>
											<td class="buyername">${cart.buyername}</td>
											<td class="productprice">${cart.productprice}</td>
											<td class="sellerid">${cart.sellerid}</td>
											<td class="sellername">${cart.sellername}</td>
											<td class="description" style="display: none">${cart.description}</td>
											<td class="productimage" style="display: none;">${cart.productimage}</td>
											<p:if test="${sessionScope.user.role=='Buyer'}">
												<td>
													<button class="btn btn-primary">Buy Now</button>
												</td>
												<td>
													<button class="btn btn-danger">Remove From Cart</button>
												</td>
											</p:if>
										</tr>


									</tbody>
								</table>
								<div style="text-align: center;">
									<label style="border: 5px solid red; border-radius: 25px;">Description
										: ${cart.description}</label>
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
			<h1 style="text-align: center;">Your Cart Is Empty!</h1>
		</p:otherwise>
	</p:choose>

</body>
</html>