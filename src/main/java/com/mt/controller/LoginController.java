package com.mt.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mt.dao.AccountDAO;
import com.mt.dao.SessionDAO;
import com.mt.entity.KhachHang;
import com.mt.message.MESSAGE_CONSTANT;
import com.mt.validate.AccountValidate;

@Controller
@RequestMapping("")
public class LoginController {
	String path="";
	MESSAGE_CONSTANT MESSAGE=new MESSAGE_CONSTANT();
	AccountValidate accountValidate=new AccountValidate();
	@Autowired
	AccountDAO accountDAO;
	@Autowired
	SessionDAO session;

	@GetMapping("/login")
	public String login(Model model,@RequestParam Optional<String> urlReturn,@RequestParam Optional<String> error) {
		path=urlReturn.isPresent()?urlReturn.get():"";
		if(error.isPresent()) {
			model.addAttribute("message", error.get());
		}
		return "customer/login";
	}

	@GetMapping("/logout")
	public String logout(@RequestParam Optional<String> urlReturn) {
		session.clear();
		return urlReturn.isPresent()?"redirect:/" +urlReturn.get():"redirect:/";
	}

	@PostMapping("/login")
	public String login(Model model, @RequestParam String username, @RequestParam String password) {
		boolean loginSuccess = false;
		List<String> listCheck=new ArrayList<>();
		listCheck.add(username);
		listCheck.add(password);
		if (!accountValidate.listIsNullOrEmpty(listCheck)) {
			List<KhachHang> list = accountDAO.findAll();
			for (KhachHang account : list) {
				if (username.equalsIgnoreCase(account.getTaiKhoan()) && password.equals(account.getMatKhau())) {
					session.set("user", account);
					loginSuccess = true;
					break;
				}
			}
		}
		if(loginSuccess) {
			KhachHang account=(KhachHang) session.get("user");
			if(account.isQuyen()) {
				return "redirect:/admin/index";
			}else {
				return !path.isEmpty() ? "redirect:/"+path : "redirect:/index";								
			}
		}else {
			return "redirect:/login";
		}
	}
}
