package com.mt.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.mt.entity.DonHang;
import com.mt.entity.Giay;

@Repository
public interface OrderDAO extends JpaRepository<DonHang, Integer> {
	@Query("SELECT o FROM DonHang o WHERE o.trangThai like %?1%")
    List<DonHang> findByStatus(String trangThai);
}
