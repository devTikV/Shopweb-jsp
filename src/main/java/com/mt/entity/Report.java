package com.mt.entity;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class Report {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int Thang1;
	private int Thang2;
	private int Thang3;
	private int Thang4;
	private int Thang5;
	private int Thang6;
	private int Thang7;
	private int Thang8;
	private int Thang9;
	private int Thang10;
	private int Thang11;
	private int Thang12;
}
