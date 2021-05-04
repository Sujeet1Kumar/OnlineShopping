$(document).ready(function() {

	$("table tbody .tr td").click(function() {
		var text = $(this).find("button").text();
		if (text == "") {

		} else {
			var productid = new Number($(this).closest(".tr").find('td.productid').text());
			var productname = $(this).closest(".tr").find('td.productname').text();
			var productprice = $(this).closest(".tr").find('td.productprice').text();
			var sellerid = $(this).closest(".tr").find('td.sellerid').text();
			var sellername = $(this).closest(".tr").find('td.sellername').text();
			var description = $(this).closest(".tr").find('td.description').text();
			var buyername = $(this).closest(".tr").find('td.buyername').text();
			var buyerid = $(this).closest(".tr").find('td.buyerid').text();
			var description = $(this).closest(".tr").find('td.description').text();
			var productimage = $(this).closest(".tr").find('td.productimage').text();

			if (text == "Delete Order") {
				alert("delete");

				$.post("deleteorder", {
					productid: productid,
					productname: productname,
					buyerid: buyerid,
					buyername: buyername,
					productimage: productimage,
					productprice: productprice,
					sellerid: sellerid,
					sellername: sellername,
					description: description,

				}, function(response) {
					location.reload();
				});
			}
		}
	});

});