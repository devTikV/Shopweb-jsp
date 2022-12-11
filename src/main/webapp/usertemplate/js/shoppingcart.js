$('.btnXoa').on('click', (element) => {
	//Lấy nút hiện tại
	const thisBtn = $(element.currentTarget);
	//Lấy data từ masanpham
	const masp = thisBtn.data("masanpham");
	var gioHangElement = $('#checkout_items');
	var tongTienElement = $('#tongTien');
	$.ajax({
		url: "/shopping-cart/deleteItem",
		method: "POST",
		// type: "application/json",
		data: {
			maSanPham: masp
		},
		success: function(response) {
			if (response !== "fail") {
				const obj = JSON.parse(response);
				console.log(obj)
				if (obj.tongTien != -1) {
					thisBtn.closest('.sanPham').remove();
				}
				gioHangElement.html(obj.soLuong);
				var tongTien=obj.tongTien;
				if (tongTien != 0) {
					var tongTienFormat = tongTien.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1.");
					tongTienElement.html('Tổng tiền: ' + tongTienFormat + ' đ');
				} else {
					$('#gioHangTonTai').remove();
					$('.containerGioHang').html('<div style="text-align: center; font-size: 30px;color: gray;">Bạn chưa mua sản phẩm nào</div>');
				}

			}

		}
	});
});/**
 * 
 */