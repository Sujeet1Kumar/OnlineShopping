<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="p"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Project</title>
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
<script>
	$(document).ready(function() {
		$(".ab").mouseenter(function() {
			$(this).click();
		});
		$(".abc").mouseleave(function() {
			$(this).click();
		});
	});
</script>
</head>
<body>

	<p:choose>
		<p:when test="${sessionScope.user.role=='Buyer'}">
			<nav class="navbar navbar-expand-md bg-dark navbar-dark">
				<a class="navbar-brand" href="http://localhost:8080/OnlineShopping">
					<img src="https://img.icons8.com/nolan/50/online-order.png" />
				</a> <a class="navbar-brand">Welcome To Online Shopping</a>
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#collapsibleNavbar">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="collapsibleNavbar">
					<ul class="navbar-nav">
						<li class="nav-item"><a class="nav-link" href="show">Show
								Product</a></li>
						<li class="nav-item"><a class="nav-link" href="showorder">Show
								Order</a></li>
						<li class="nav-item"><a class="nav-link" href="showcart">Show
								Cart</a></li>
					</ul>
				</div>
				<div class="collapse navbar-collapse justify-content-end"
					id="navbarCollapse">
					<ul class="navbar-nav">
						<li class="nav-item">
							<h3 style="color: #00ffff;">${sessionScope.user.username}</h3>
						</li>
						<li class="nav-item"><a class="nav-link" href="logout">Logout</a>
						</li>
					</ul>
				</div>
			</nav>
		</p:when>
		<p:when test="${sessionScope.user.role=='Seller'}">
			<nav class="navbar navbar-expand-md bg-dark navbar-dark">
				<a class="navbar-brand" href="http://localhost:8080/OnlineShopping">
					<img src="https://img.icons8.com/nolan/50/online-order.png" />
				</a> <a class="navbar-brand">Welcome To Online Shopping</a>
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#collapsibleNavbar">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="collapsibleNavbar">
					<ul class="navbar-nav">
						<li class="nav-item"><a class="nav-link" href="addproduct">Add
								Product</a></li>
						<li class="nav-item"><a class="nav-link" href="show">Show
								Product</a></li>
						<li class="nav-item"><a class="nav-link" href="showorder">Show
								Order</a></li>
					</ul>
				</div>
				<div class="collapse navbar-collapse justify-content-end"
					id="navbarCollapse">
					<ul class="navbar-nav">
						<li class="nav-item">
							<h3 style="color: #00ffff;">${sessionScope.user.username}</h3>
						</li>
						<li class="nav-item"><a class="nav-link" href="logout">Logout</a>
						</li>
					</ul>
				</div>
			</nav>
		</p:when>
		<p:when test="${sessionScope.user.role=='Admin'}">
			<nav class="navbar navbar-expand-md bg-dark navbar-dark">
				<a class="navbar-brand" href="http://localhost:8080/OnlineShopping">
					<img src="https://img.icons8.com/nolan/50/online-order.png" />
				</a> <a class="navbar-brand">Welcome To Online Shopping</a>
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#collapsibleNavbar">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="collapsibleNavbar">
					<ul class="navbar-nav">
						<li class="nav-item"><a class="nav-link" href="show">Show
								Product</a></li>
						<li class="nav-item"><a class="nav-link" href="showseller">Show
								Sellers </a></li>
						<li class="nav-item"><a class="nav-link" href="showbuyer">Show
								Buyers</a></li>
					</ul>
				</div>
				<div class="collapse navbar-collapse justify-content-end"
					id="navbarCollapse">
					<ul class="navbar-nav">
						<li class="nav-item">
							<h3 style="color: #00ffff;">${sessionScope.user.username}</h3>
						</li>
						<li class="nav-item"><a class="nav-link" href="logout">Logout</a>
						</li>
					</ul>
				</div>
			</nav>
		</p:when>
		<p:otherwise>
			<nav class="navbar navbar-expand-md bg-dark navbar-dark abc">
				<a class="navbar-brand" href="http://localhost:8080/FullProject">
					<img src="https://img.icons8.com/nolan/50/online-order.png" />
				</a> <a class="navbar-brand">Welcome To Online Shopping</a>
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#collapsibleNavbar">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse justify-content-end"
					id="navbarCollapse">
					<ul class="navbar-nav">

						<li class="nav-item dropdown bc"><a
							class="nav-link dropdown-toggle navbardrop ab" href="#"
							data-toggle="dropdown"> Login </a>
							<div class="dropdown-menu">
								<a class="dropdown-item" href="login" id="buyer">Buyer</a> <a
									class="dropdown-item" href="loginseller" id="seller">Seller</a>
								<a class="dropdown-item" href="loginadmin" id="admin">Admin</a>
							</div></li>

						<li class="nav-item dropdown bc"><a
							class="nav-link dropdown-toggle navbardrop ab" href="#"
							data-toggle="dropdown"> Register </a>
							<div class="dropdown-menu">
								<a class="dropdown-item" href="register" id="buyer">Buyer</a> <a
									class="dropdown-item" href="registerseller" id="seller">Seller</a>
								<a class="dropdown-item" href="registeradmin" id="admin">Admin</a>
							</div></li>

					</ul>
				</div>
			</nav>
		</p:otherwise>
	</p:choose>
</body>
</html>