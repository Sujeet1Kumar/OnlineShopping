$(document).ready(function() {

	$("table tbody .tr td").click(function() {
		var text = $(this).find("button").text();
		if (text == "") {

		} else {
			var sellerid = $(this).closest(".tr").find('td.sellerid').text();
			var sellername = $(this).closest(".tr").find('td.sellername').text();
			var selleremail = $(this).closest(".tr").find('td.selleremail').text();

			if (text == "Delete Seller") {
				alert("delete");
				alert(sellerid);
				alert(sellername);
				alert(selleremail);

				$.post("deleteseller", {
					id: sellerid,
					username: sellername,
					email: selleremail,

				}, function(response) {
					location.reload();
				});
			}

		}
	});

});