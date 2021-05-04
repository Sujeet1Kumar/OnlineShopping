$(document).ready(function() {

	$("table tbody .tr td").click(function() {
		var text = $(this).find("button").text();
		if (text == "") {

		} else {
			var buyerid = $(this).closest(".tr").find('td.buyerid').text();
			var buyername = $(this).closest(".tr").find('td.buyername').text();
			var buyeremail = $(this).closest(".tr").find('td.buyeremail').text();

			if (text == "Delete Buyer") {
				alert("delete");
				alert(buyerid);
				alert(buyername);
				alert(buyeremail);

				$.post("deletebuyer", {
					id: buyerid,
					username: buyername,
					email: buyeremail,

				}, function(response) {
					location.reload();
				});
			}

		}
	});

});