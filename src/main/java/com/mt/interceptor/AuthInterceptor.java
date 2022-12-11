package com.mt.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.HandlerInterceptor;

import com.mt.dao.SessionDAO;
import com.mt.entity.KhachHang;


@Service
public class AuthInterceptor implements HandlerInterceptor {	
	@Autowired
	SessionDAO session;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		String uri = request.getRequestURI();
		KhachHang user = (KhachHang) session.get("user"); // lấy từ session
		String error = "";
		if (user != null) { 
			if (uri.startsWith("/admin") && user.isQuyen()) {
				if(!user.isQuyen()) {					
					error = "Khong du quyen truy cap!";
				}
			}
		}else {
			error = "Vui long dang nhap!";
		}
		if (error.length() > 0) { // có lỗi
			session.set("security-uri", uri);
			response.sendRedirect("/login?error=" + error);
			return false;
		}
		return true;
	}
}
