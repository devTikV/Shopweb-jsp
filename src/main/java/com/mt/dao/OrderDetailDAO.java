package com.mt.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.mt.entity.ChiTietDonHang;
import com.mt.entity.ChiTietDonHangPK;

public interface OrderDetailDAO extends JpaRepository<ChiTietDonHang, ChiTietDonHangPK> {
	
}
