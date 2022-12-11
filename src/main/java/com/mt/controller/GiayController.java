package com.mt.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mt.dao.GiayDAO;
import com.mt.dao.MailerService;
import com.mt.dao.SessionDAO;
import com.mt.dao.ShoppingCartDAO;
import com.mt.entity.Giay;
import com.mt.entity.KhachHang;
import com.mt.entity.MailInfo;
import com.mt.helper.GiayHelper;
import com.mt.helper.MailerHelper;
import com.mt.message.MAIL_CONSTANT;
import com.mt.validate.GiayValidate;

@Controller
@RequestMapping("/")
public class GiayController {
	@Autowired
	private GiayDAO giayDAO;
	
	@Autowired
	private ShoppingCartDAO shoppingCartDAO;
	
	@Autowired
	SessionDAO session;
	
	@Autowired
	MailerService mailer;
	
	MAIL_CONSTANT MAIL_INFO=new MAIL_CONSTANT();
	GiayHelper giayHelper=new GiayHelper();
	
	@GetMapping({"","index"})
	public String showGiay(Model model,@RequestParam Optional<String> message, 
			@RequestParam("soTrang") Optional<String> soTrangString,
			@RequestParam("soSanPham") Optional<String> soSanPhamString) {
		int soTrang=soTrangString.isEmpty()?1:Integer.parseInt(soTrangString.get());
		model.addAttribute("soTrangHienTai", soTrang);
		int soSanPham=soTrangString.isEmpty()?6:Integer.parseInt(soSanPhamString.get());
		model.addAttribute("soSanPhamHienTai", soSanPham);
		int tongSoTrang=giayHelper.getTotalPage(soSanPham, giayDAO.findAll());
		model.addAttribute("tongSoTrang", tongSoTrang);
		//Trang số "soTrang-1", số sản phẩm hiển thị "soSanPham"
		Pageable pageable = PageRequest.of(soTrang-1, soSanPham);
		Page<Giay> pageGiay=giayDAO.findAll(pageable);
		List<Giay> list=pageGiay.getContent();
		if(message.isPresent()) {
			model.addAttribute("message",message.get());
		}
		model.addAttribute("listGiay",list);
		model.addAttribute("tongSoLuongGioHang",shoppingCartDAO.getCount());
		KhachHang khachHang=(KhachHang) session.get("user");
		if(khachHang!=null) {
			model.addAttribute("sessionUsername",khachHang.getTaiKhoan());
		}
		return "customer/categories";
	}
	
	@GetMapping("/detail")
	public String detail(Model model,@RequestParam String idProduct) {
		Giay giay=new GiayValidate().checkIDGiay(idProduct)?giayDAO.findById(Integer.parseInt(idProduct)).get():null;
		model.addAttribute("giay",giay);
		model.addAttribute("tongSoLuongGioHang",shoppingCartDAO.getCount());
		KhachHang khachHang=(KhachHang) session.get("user");
		if(khachHang!=null) {
			model.addAttribute("sessionUsername",khachHang.getTaiKhoan());
		}
		return "customer/detail";
	}
	
	@PostMapping("/sendMail")
	public String send(Model model, 
			@RequestParam String txtTo){
		MailInfo mail = new MailInfo();
		mail.setTo(txtTo);
		mail.setSubject(MAIL_INFO.REGISTER_SALE_SUBJECT);
		mail.setBody(MAIL_INFO.REGISTER_SALE_CONTENT);
		//Gửi mail
		mailer.queue(mail);
		return "redirect:/sendMail/result";
	}
	
	@GetMapping("/sendMail/result")
	public String sendMail(Model model) {
		return "customer/sendMailResult";
	}
	
}
