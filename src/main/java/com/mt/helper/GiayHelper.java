package com.mt.helper;

import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Part;

import com.mt.entity.Giay;



public class GiayHelper {
	public int getTotalPage(int soSanPham,List<Giay> list) {
		int tongSoSanPham = list.size();
		int tongSoTrang = 1;
		float tempFloat = (float) tongSoSanPham / soSanPham;
		int tempInt = (int) tempFloat;
		if (tempFloat - tempInt > 0) {
			tongSoTrang = tempInt + 1;
		} else {
			tongSoTrang = tempInt;
		}
		return tongSoTrang;
	}
	
	public String uploadImage(HttpServletRequest req) throws IOException, ServletException {
		// đường dẫn thư mục tính từ gốc của website
		File dir = new File(req.getServletContext().getRealPath("/images/sp"));
		if (!dir.exists()) { // tạo nếu chưa tồn tại
			dir.mkdirs();
		}
		// lưu các file upload vào thư mục sp
		Part photo = req.getPart("hinhAnh"); // file hình
		String filePath = photo.getSubmittedFileName();
		Path p = Paths.get(filePath); // creates a Path object
		String tenHinhAnh = p.getFileName().toString();
		File photoFile = new File(dir, filePath);
		if (!photoFile.exists()) {
			photo.write(photoFile.getAbsolutePath());
		}
		return tenHinhAnh;
	}
}
