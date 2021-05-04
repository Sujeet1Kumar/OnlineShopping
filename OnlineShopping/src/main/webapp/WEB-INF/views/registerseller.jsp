<%@include file="head.jsp"%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>Register Page</title>
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
<script src="js/registerseller.js"></script>
</head>
<body>
	<h3 style="text-align: center;">Register Here</h3>
	<div class="row">
		<div class="col-sm-3"></div>
		<div class="col-sm-6">
			<div class="card">
				<div class="card-body">
					<form class="was-validated">
						<div class="form-group">
							<label for="username">Full Name:</label> <input type="text"
								class="form-control" id="username" placeholder="Enter username"
								name="username" required>
						</div>
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

</body>
</html>
