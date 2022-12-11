$(document).ready(() => {
	$('.btnAddToCart').on('click', (element) => {
		const thisBtn = $(element.currentTarget);
		const masp = thisBtn.data("masanpham");
		console.log("clickBtnAddToCart")
		$.ajax({
			url: "/shopping-cart/addToCart",
			method: "POST",
			// type: "application/json",
			data: {
				maSanPham: masp
			},
			success: function(response) {
				const obj = JSON.parse(response);
				console.log(obj)			
				$('#checkout_items').html(obj.soLuong);
			}
		});
	});

	$('.items').flyto({
		item: '.shoes_img', // item cần bay đến giỏ hàng
		target: '.checkout', // giỏ hàng
		button: '.btnAddToCart' // button add vào giỏ hàng
	});

	$('.chuyenTrang').on('click', (element) => {
		var soTrangChuyen = $(element.currentTarget).html();
		$('#soTrangHienTai').html(soTrangChuyen);
	});

	$('li.liSoTrang').on('click', (element) => {
		const thisBtn = $(element.currentTarget);
		const url = thisBtn.find("a").attr("href");
		location.href = location.origin + url;
	});

});


