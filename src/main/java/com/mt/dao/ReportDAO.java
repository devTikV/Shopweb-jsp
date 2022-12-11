package com.mt.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.query.Procedure;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.mt.entity.Report;

@Repository
public interface ReportDAO extends JpaRepository<Report, Integer>{
	@Procedure(procedureName = "DOANH_THU_NAM" )	
	Report getReport(@Param("year") int year);
}
