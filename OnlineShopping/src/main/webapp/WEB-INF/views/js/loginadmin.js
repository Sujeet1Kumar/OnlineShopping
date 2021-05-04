$(document).ready(function() {
	$("#submit").click(function() {
		var email = $("#email").val()
		var password = $("#password").val();
		var role = "Admin";
		{
			$.post("signin", {
				email: email,
				password: password,
				role: role,
			}, function(response) {
				alert(response);
				location.reload();
			});
		}
	});
});