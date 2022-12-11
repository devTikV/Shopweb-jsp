package com.mt.controller;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mt.dao.AccountDAO;
import com.mt.dao.GiayDAO;
import com.mt.dao.OrderDAO;
import com.mt.dao.OrderDetailDAO;
import com.mt.dao.SessionDAO;
import com.mt.dao.ShoppingCartDAO;
import com.mt.entity.ChiTietDonHang;
import com.mt.entity.ChiTietDonHangPK;
import com.mt.entity.DonHang;
import com.mt.entity.Giay;
import com.mt.entity.KhachHang;
import com.mt.entity.ShoppingCart;
import com.mt.validate.OrderValidate;

@Controller
@RequestMapping("/order")
public class OrderController {
	@Autowired
	ShoppingCartDAO shoppingCartDAO;
	@Autowired
	SessionDAO session;
	@Autowired
	GiayDAO giayDAO;
	@Autowired
	OrderDAO orderDAO;
	@Autowired
	OrderDetailDAO orderDetailDAO;
	@Autowired
	AccountDAO khachHangDAO;
	
	@GetMapping("result")
	public String result(Model model) {
		model.addAttribute("tongSoLuongGioHang", shoppingCartDAO.getCount());
		model.addAttribute("tongTienGioHang", shoppingCartDAO.getAmout());
		KhachHang khachHang = (KhachHang) session.get("user");
		if (khachHang != null) {
			model.addAttribute("sessionKhachHang", khachHang);
		}
		return "customer/orderResult";
	}
	
	@GetMapping("")
	public String showOrder(Model model) {
		int soNgay = 3;// Số ngày giao dự kiến
		Date date = new Date(new Date().getTime() + soNgay * 24 * 60 * 60 * 1000); // tính theo mili giây
		model.addAttribute("ngayGiaoDuKien", date);
		Collection<ShoppingCart> listSanPham = shoppingCartDAO.getAll();
		model.addAttribute("listSanPham", listSanPham);
		model.addAttribute("tongSoLuongGioHang", shoppingCartDAO.getCount());
		model.addAttribute("tongTienGioHang", shoppingCartDAO.getAmout());
		KhachHang khachHang = (KhachHang) session.get("user");
		if (khachHang != null) {
			model.addAttribute("sessionKhachHang", khachHang);
		}
		return "customer/order";
	}

	@PostMapping("")
	public String order(@RequestParam String fullname, @RequestParam String phone,@RequestParam String[] countProduct,
			@RequestParam String location,@RequestParam String note, 
			@RequestParam String total,@RequestParam("expectedDate") String expectedDateString,
			@RequestParam String[] idProduct,@RequestParam String username) throws ParseException {
		OrderValidate orderValidate=new OrderValidate();
		List<String> listCheckOrder=new ArrayList<>();
		listCheckOrder.add(location);
		listCheckOrder.add(fullname);
		listCheckOrder.add(total);
		listCheckOrder.add(note);
		listCheckOrder.add(expectedDateString);
		listCheckOrder.add(phone);
		if(!orderValidate.listIsNullOrEmpty(listCheckOrder)) {
			
			//Add Đơn hàng
			DonHang dh=new DonHang();
			dh.setDiaChi(location);
			dh.setTenNguoiNhan(fullname);
			dh.setTongTien(Integer.parseInt(total));
			dh.setGhiChuKhachHang(note);
			Timestamp now=new Timestamp(new Date().getTime());
			dh.setNgayDatHang(now);
			Date expectedDate=new SimpleDateFormat("dd-MM-yyyy").parse(expectedDateString);  
			dh.setNgayGiaoDuKien(expectedDate);
			dh.setSoDienThoai(phone);
			if(username!=null && !username.isEmpty()) {
				dh.setKhachHang(khachHangDAO.findById(username).get());				
			}
			dh.setTrangThai("Đã xác nhận");
			DonHang newDonHang=orderDAO.saveAndFlush(dh);
			
			//Add CTĐH
			for(int i=0;i<idProduct.length;i++) {
				int maGiay=Integer.parseInt(idProduct[i]);
				Giay giay=giayDAO.findById(maGiay).get();
				ChiTietDonHangPK ctdhPK=new ChiTietDonHangPK();
				ctdhPK.setMaDonHang(newDonHang.getMaDonHang());
				ctdhPK.setMaGiay(maGiay);
				ChiTietDonHang ctdh=new ChiTietDonHang();
				ctdh.setId(ctdhPK);
				ctdh.setGiay(giay);
				ctdh.setSoLuong(Integer.parseInt(countProduct[i]));
				ctdh.setDonHang(newDonHang);
				ctdh.setDonGia(giay.getDonGia());
				orderDetailDAO.save(ctdh);
			}
			
			//Clear giỏ hàng
			shoppingCartDAO.clear();
		}
		return "redirect:/order/result";
	}
}
