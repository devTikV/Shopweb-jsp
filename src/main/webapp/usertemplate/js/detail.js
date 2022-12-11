$('.btnThem').on('click', (element)=>{
            	const thisBtn = $(element.currentTarget);
                const masp = thisBtn.data("magiay");
                const soLuong = $("#txtSoLuong").val();
                $.ajax({
                        url: "/Assignment/shopping-cart", 
                        method: "POST",
                        // type: "application/json",
                        data: {
                            maSanPham: masp,
                            soLuong: soLuong
                        },
                        success: function(response){
    						if(response.notLogin){
								location.href=location.origin+"/Assignment/sign-in?continueLogin=true&returnUrl="+location.href;
							}
    						//Giỏ hàng có ID là #checkout_items
    						//Set lại giá trị cho giỏ hàng
							$('#checkout_items').html(response.soLuong);
                        }});
            });