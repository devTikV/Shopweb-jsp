package com.mt.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mt.dao.GiayDAO;
import com.mt.dao.HangGiayDAO;
import com.mt.dao.LoaiGiayDAO;
import com.mt.dao.SessionDAO;
import com.mt.entity.Giay;
import com.mt.entity.KhachHang;
import com.mt.helper.GiayHelper;
import com.mt.validate.GiayValidate;

@Controller
@RequestMapping("admin")
public class AdminController {
	@Autowired
	private GiayDAO giayDAO;
	@Autowired
	private LoaiGiayDAO loaiGiayDAO;
	@Autowired
	private HangGiayDAO hangGiayDAO;

	@Autowired
	SessionDAO session;

	GiayHelper giayHelper = new GiayHelper();
	GiayValidate giayValidate = new GiayValidate();

	@GetMapping({ "", "index" })
	public String index(Model model,@RequestParam Optional<String> txtSearch,
			@RequestParam("soTrang") Optional<String> soTrangString,
			@RequestParam("message") Optional<Boolean> message ) {
		List<Giay> list=new ArrayList<>();
		KhachHang user = (KhachHang) session.get("user");
		if(!user.isQuyen()) {			
			String error="Khong du quyen truy cap!";
			return "redirect:/login?error="+error;
		}
		model.addAttribute("sessionAdmin", user);
		if(txtSearch.isPresent()) {
			list = giayDAO.findByName(txtSearch.get());
		}else {
			int soTrang = soTrangString.isEmpty() ? 1 : Integer.parseInt(soTrangString.get());
			model.addAttribute("soTrangHienTai", soTrang);
			int soSanPham = 6;
			model.addAttribute("soSanPhamHienTai", soSanPham);
			int tongSoTrang = giayHelper.getTotalPage(soSanPham, giayDAO.findAll());
			model.addAttribute("tongSoTrang", tongSoTrang);
			// Trang số "soTrang-1", số sản phẩm hiển thị "soSanPham"
			Pageable pageable = PageRequest.of(soTrang - 1, soSanPham);
			Page<Giay> pageGiay = giayDAO.findAll(pageable);
			list = pageGiay.getContent();			
		}
		model.addAttribute("listGiay", list);
		KhachHang khachHang = (KhachHang) session.get("userAdmin");
		if (khachHang != null) {
			model.addAttribute("sessionUsername", khachHang.getTaiKhoan());
		}
		if(message.isPresent()) {
			if(message.get()) {
				model.addAttribute("message","Xóa thành công!");		
			}else {
				model.addAttribute("message","Xóa thất thất bại!");
			}
		}
		return "admin/index";
	}

	@GetMapping("index/update")
	public String showUpdate(Model model, @RequestParam("maGiay") Optional<String> maGiayString,
			@RequestParam("message") Optional<Boolean> message) {
		KhachHang user = (KhachHang) session.get("user");
		if(!user.isQuyen()) {			
			String error="Khong du quyen truy cap!";
			return "redirect:/login?error="+error;
		}
		model.addAttribute("sessionAdmin", user);
		int maGiay = maGiayString.isEmpty() ? 1 : Integer.parseInt(maGiayString.get());
		Giay giay = giayDAO.findById(maGiay).get();
		model.addAttribute("giayItem", giay);
		model.addAttribute("listLoaiGiay", loaiGiayDAO.findAll());
		model.addAttribute("listHangGiay", hangGiayDAO.findAll());		
		if(message.isPresent()) {
			if(message.get()) {
				model.addAttribute("message","Lưu thành công!");		
			}else {
				model.addAttribute("message","Lưu thất bại!");
			}
		}
		return "admin/update";
	}

	@PostMapping("index/update")
	public String update(Model model,@RequestParam("maGiay") Optional<String> maGiayString,
			@RequestParam("tenGiay") String tenGiayString, @RequestParam("donGia") Optional<String> donGiaString,
			@RequestParam("giamGia") Optional<String> giamGiaString, @RequestParam("moTa") String moTaString,
			@RequestParam("maLoaiGiay") Optional<String> maLoaiGiayString,
			@RequestParam("maHangGiay") Optional<String> maHangGiayString,
			HttpServletRequest req) throws IOException, ServletException {
		String tenHinhAnh = giayHelper.uploadImage(req).equals("") ? req.getParameter("hinhAnhTonTai") : giayHelper.uploadImage(req);
		boolean message=true;
		List<Optional<String>> list = new ArrayList<>();
		list.add(maGiayString);
		list.add(maLoaiGiayString);
		list.add(maHangGiayString);
		list.add(giamGiaString);
		list.add(donGiaString);
		if (!giayValidate.listIsNullOrEmpty(list)) {
			Giay giay = giayDAO.findById(Integer.parseInt(maGiayString.get())).get();
			giay.setTenGiay(tenGiayString);
			giay.setGiamGia(Double.parseDouble(giamGiaString.get())/100);
			giay.setDonGia(Integer.parseInt(donGiaString.get()));
			giay.setMoTa(moTaString);
			giay.setLoaiGiay(loaiGiayDAO.findById(Integer.parseInt(maLoaiGiayString.get())).get());
			giay.setHangGiay(hangGiayDAO.findById(Integer.parseInt(maHangGiayString.get())).get());
			giay.setHinhAnh(tenHinhAnh);
			giayDAO.save(giay);
			message=true;
		}else {
			message=false;		
		}
		return "redirect:/admin/index/update?maGiay="+Integer.parseInt(maGiayString.get())+"&message="+message;
	}
	@GetMapping("index/insert")
	public String showInsert(Model model,
			@RequestParam("message") Optional<Boolean> message) {
		KhachHang user = (KhachHang) session.get("user");
		if(!user.isQuyen()) {			
			String error="Khong du quyen truy cap!";
			return "redirect:/login?error="+error;
		}
		model.addAttribute("sessionAdmin", user);
		model.addAttribute("listLoaiGiay", loaiGiayDAO.findAll());
		model.addAttribute("listHangGiay", hangGiayDAO.findAll());
		if(message.isPresent()) {
			if(message.get()) {
				model.addAttribute("message","Thêm thành công!");		
			}else {
				model.addAttribute("message","Thêm thất thất bại!");
			}
		}
		return "admin/insert";
	}
	@GetMapping("index/delete")
	public String delete(@RequestParam("idGiay") Optional<String> maGiayString) {
		int maGiay = maGiayString.isEmpty() ? -1 : Integer.parseInt(maGiayString.get());
		if(maGiay!=-1) {
			giayDAO.delete(giayDAO.findById(maGiay).get());
			return "redirect:/admin/index?message="+true;
		}else {
			return "redirect:/admin/index?message="+false;			
		}
	}
	
	@PostMapping("index/insert")
	public String insert(Model model,
			@RequestParam("tenGiay") String tenGiayString, @RequestParam("donGia") Optional<String> donGiaString,
			@RequestParam("giamGia") Optional<String> giamGiaString, @RequestParam("moTa") String moTaString,
			@RequestParam("maLoaiGiay") Optional<String> maLoaiGiayString,
			@RequestParam("maHangGiay") Optional<String> maHangGiayString,
			HttpServletRequest req) throws IOException, ServletException {
		String tenHinhAnh = giayHelper.uploadImage(req).equals("") ? req.getParameter("hinhAnhTonTai") : giayHelper.uploadImage(req);
		boolean message=true;
		List<Optional<String>> list = new ArrayList<>();
		list.add(maLoaiGiayString);
		list.add(maHangGiayString);
		list.add(giamGiaString);
		list.add(donGiaString);
		if (!giayValidate.listIsNullOrEmpty(list)) {
			Giay giay = new Giay();
			giay.setTenGiay(tenGiayString);
			giay.setGiamGia(Double.parseDouble(giamGiaString.get())/100);
			giay.setDonGia(Integer.parseInt(donGiaString.get()));
			giay.setMoTa(moTaString);
			giay.setLoaiGiay(loaiGiayDAO.findById(Integer.parseInt(maLoaiGiayString.get())).get());
			giay.setHangGiay(hangGiayDAO.findById(Integer.parseInt(maHangGiayString.get())).get());
			giay.setHinhAnh(tenHinhAnh);
			giayDAO.save(giay);
			message=true;
		}else {
			message=false;		
		}
		return "redirect:/admin/index/insert?message="+message;
	}
	@GetMapping("/logout")
	public String logout(@RequestParam Optional<String> urlReturn) {
		session.clear();
		return urlReturn.isPresent()?"redirect:/admin/" +urlReturn.get():"redirect:/admin";
	}
	
}
