<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="p"%>
<%@include file="head.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Login Page</title>
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
<script src="js/loginseller.js"></script>
</head>
<body>
	<p:if test="${sessionScope.user==null}">
		<h3 style="text-align: center">Login Here</h3>
		<div class="row">
			<div class="col-sm-3"></div>
			<div class="col-sm-6">
				<div class="card">
					<div class="card-body">
						<form class="was-validated" method="post">
							<div class="form-group">
								<label for="email">Email:</label> <input type="text"
									class="form-control" id="email" placeholder="Enter username"
									name="email" required>
							</div>
							<div class="form-group">
								<label for="password">Password:</label> <input type="password"
									class="form-control" id="password" placeholder="Enter password"
									name="password" required>
							</div>
							<div style="text-align: center;">
								<button type="button" class="btn btn-primary" id="submit">Submit</button>
							</div>

						</form>
					</div>
				</div>
			</div>
		</div>
		<div class="col-sm-3"></div>
	</p:if>
	<p:if test="${sessionScope.user!=null}">
		<h1 style="text-align: center">Welcome
			${sessionScope.user.username}</h1>
	</p:if>
</body>
</html>
