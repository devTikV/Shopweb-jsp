package com.mt.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.mt.entity.KhachHang;

@Repository
public interface AccountDAO extends JpaRepository<KhachHang, String>  {
	
}
