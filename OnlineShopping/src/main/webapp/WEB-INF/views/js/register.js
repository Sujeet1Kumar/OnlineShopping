$(document).ready(function() {
	$("#submit").click(function() {
		var username = $("#username").val();
		var email = $("#email").val()
		var password = $("#password").val();
		var role = "Buyer";
		alert(username);
		alert(email);
		alert(password);
		{
			$.post("signup", {
				username: username,
				email: email,
				password: password,
				role: role,
			}, function(response) {
				if (response == "Successful Register") {
					alert(response);
					location.replace("http://localhost:8080/OnlineShopping/login");
				}
				if (response == "Sorry, This Email Has Already Taken") {
					alert(response);
					location.reload();
				}

			});
		}
	});
});