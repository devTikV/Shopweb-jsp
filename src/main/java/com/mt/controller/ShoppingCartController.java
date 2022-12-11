package com.mt.controller;

import java.util.Collection;

import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mt.dao.GiayDAO;
import com.mt.dao.SessionDAO;
import com.mt.dao.ShoppingCartDAO;
import com.mt.entity.Giay;
import com.mt.entity.KhachHang;
import com.mt.entity.ShoppingCart;
import com.mt.validate.GiayValidate;


@Controller
@RequestMapping("shopping-cart")
public class ShoppingCartController {
	@Autowired
	GiayDAO giayDAO;
	@Autowired
	ShoppingCartDAO shoppingCartDAO;
	@Autowired
	SessionDAO session;
	
	@GetMapping({"","views"})
	public String viewCart(Model model) {
		Collection<ShoppingCart> listGioHang = shoppingCartDAO.getAll();		
		model.addAttribute("listGioHang",listGioHang);
		model.addAttribute("tongTienGioHang",shoppingCartDAO.getAmout());
		model.addAttribute("tongSoLuongGioHang",shoppingCartDAO.getCount());
		KhachHang khachHang=(KhachHang) session.get("user");
		if(khachHang!=null) {
			model.addAttribute("sessionUsername",khachHang.getTaiKhoan());
		}
		return "customer/cart-items";
	}
	@PostMapping("addToCart")
	public ResponseEntity<String> addToCart(@RequestParam String maSanPham) throws JSONException {
		ShoppingCart cartItem=new ShoppingCart();
		Giay giay=giayDAO.findById(Integer.parseInt(maSanPham)).get();
		cartItem.setMaGiay(giay.getMaGiay());
		cartItem.setDonGia(giay.getDonGia());
		cartItem.setGiamGia(giay.getGiamGia());
		cartItem.setHinhAnh(giay.getHinhAnh());
		cartItem.setHangGiay(giay.getHangGiay());
		cartItem.setLoaiGiay(giay.getLoaiGiay());
		cartItem.setMoTa(giay.getMoTa());
		cartItem.setTenGiay(giay.getTenGiay());
		shoppingCartDAO.add(cartItem);
		
		int tongSoLuongGioHang = shoppingCartDAO.getCount();
		JSONObject json = new JSONObject();
		json.put("soLuong", tongSoLuongGioHang);
		return ResponseEntity.ok(String.valueOf(json));
	}
	@PostMapping("deleteItem")
	public ResponseEntity<String> deleteItem(@RequestParam String maSanPham) throws JSONException {
		if(new GiayValidate().checkIDGiay(maSanPham)) {
			shoppingCartDAO.remove(Integer.parseInt(maSanPham));
			int tongTien = shoppingCartDAO.getAmout();
			int tongSoLuongGioHang = shoppingCartDAO.getCount();
			JSONObject json = new JSONObject();
			json.put("soLuong", tongSoLuongGioHang);
			json.put("tongTien", tongTien);
			return ResponseEntity.ok(String.valueOf(json));
		}else {
			return ResponseEntity.ok("fail");
		}		
	}
	@PostMapping("deleteAllItem")
	public String deleteAllItem(Model model) {
		shoppingCartDAO.clear();
		return "redirect:/shopping-cart";
	}
}
