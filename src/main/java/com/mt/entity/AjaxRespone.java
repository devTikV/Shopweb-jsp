package com.mt.entity;

public class AjaxRespone {
	private int tongTienGioHang;
	private int tongSoLuongGioHang;
	private String message="";
	public int getTongTienGioHang() {
		return tongTienGioHang;
	}
	public void setTongTienGioHang(int tongTienGioHang) {
		this.tongTienGioHang = tongTienGioHang;
	}
	public int getTongSoLuongGioHang() {
		return tongSoLuongGioHang;
	}
	public void setTongSoLuongGioHang(int tongSoLuongGioHang) {
		this.tongSoLuongGioHang = tongSoLuongGioHang;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	
}
