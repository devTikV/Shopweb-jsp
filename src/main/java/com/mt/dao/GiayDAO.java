package com.mt.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.mt.entity.Giay;

@Repository
public interface GiayDAO extends JpaRepository<Giay, Integer> {
	@Query("SELECT g FROM Giay g WHERE g.tenGiay like %?1%")
    List<Giay> findByName(String tenGiay);
}
