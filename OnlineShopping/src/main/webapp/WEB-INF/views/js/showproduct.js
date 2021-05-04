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
			var productimage = $(this).closest(".tr").find('td.productimage').text();
			var buyerid = $("#buyerid").text();
			var buyername = $("#buyername").text();

			if (text == "Buy Now") {
				alert("Buy");

				$.post("order", {
					productid: productid,
					productname: productname,
					productprice: productprice,
					productimage: productimage,
					buyerid: buyerid,
					buyername: buyername,
					sellerid: sellerid,
					sellername: sellername,
					description: description,

				}, function(response) {
					location.reload();
				});
			}

			if (text == "Add To Cart") {
				alert("Cart");

				$.post("cart", {
					productid: productid,
					productname: productname,
					productprice: productprice,
					productimage: productimage,
					buyerid: buyerid,
					buyername: buyername,
					sellerid: sellerid,
					sellername: sellername,
					description: description,

				}, function(response) {
					location.reload();
				});
			}

			if (text == "Delete Product") {
				alert("delete");

				$.post("delete", {
					productid: productid,
					productname: productname,
					productprice: productprice,
					productimage: productimage,
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