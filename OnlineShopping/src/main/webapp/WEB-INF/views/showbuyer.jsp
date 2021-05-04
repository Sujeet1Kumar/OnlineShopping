<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="p"%>
<p:if test="${sessionScope.user==null}">
	<p:redirect url="/"></p:redirect>
</p:if>
<%@include file="head.jsp"%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>Show Sellers</title>
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
<script src="js/showbuyer.js"></script>
</head>
<body>

	<p:choose>

		<p:when test="${buyers.size() > 0}">

			<p:forEach items="${buyers}" var="buyer">
				<div class="container-fluid">
					<div class="row">
						<div class="col-sm-2"></div>
						<div class="col-sm-8">


							<div style="text-align: center;">
								<table class="table table-hover">
									<thead>
										<tr>
											<th>Buyer ID :</th>
											<th>Buyer Name :</th>
											<th>Email :</th>
										</tr>
									</thead>
									<tbody>

										<tr class="tr">
											<td class="buyerid">${buyer.id}</td>
											<td class="buyername">${buyer.username}</td>
											<td class="buyeremail">${buyer.email}</td>
											<td>
												<button class="btn btn-danger">Delete Buyer</button>
											</td>
										</tr>


									</tbody>
								</table>
							</div>
						</div>
						<div class="col-sm-2"></div>
					</div>
				</div>
				<hr>
			</p:forEach>
		</p:when>
		<p:otherwise>
			<h1 style="text-align: center;">Sorry, There Is No Buyer
				Available</h1>
		</p:otherwise>
	</p:choose>

</body>
</html>