package com.mt.controller;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mt.dao.ReportDAO;
import com.mt.dao.SessionDAO;
import com.mt.entity.KhachHang;
import com.mt.entity.Report;

@Controller
@RequestMapping("admin/statistical")
public class StatisticalAdminController {
	@Autowired
	ReportDAO reportDAO;
	
	@Autowired
	SessionDAO session;
	
	@GetMapping("")
	@Transactional(readOnly = true)
	public String index(Model model, @RequestParam("year") Optional<String> yearString) {
		KhachHang user = (KhachHang) session.get("user");
		if(!user.isQuyen()) {			
			String error="Khong du quyen truy cap!";
			return "redirect:/login?error="+error;
		}
		model.addAttribute("sessionAdmin", user);
		int year=yearString.isPresent()?Integer.parseInt(yearString.get()):2021;
		Report report=reportDAO.getReport(year);
		model.addAttribute("report", report);
		model.addAttribute("yearChoosen",year);
		System.out.println("size: "+report.getThang1());
		return "admin/statistical/index";
	}
}
