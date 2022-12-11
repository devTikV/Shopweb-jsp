package com.mt.entity;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Column;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;


@Data
@Entity
@Table(name="giays")
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class Giay  implements Serializable {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int maGiay;
	private int donGia;
	private double giamGia;
	private String hinhAnh;
	private String moTa;
	private String tenGiay;
	
	@OneToMany(mappedBy = "giay")
	private List<ChiTietDonHang> chiTietDonHangs;
	// bi-directional many-to-one association to HangGiay
	@ManyToOne
	@JoinColumn(name = "maHang")
	private HangGiay hangGiay;

	// bi-directional many-to-one association to LoaiGiay
	@ManyToOne
	@JoinColumn(name = "maLoaiGiay")
	private LoaiGiay loaiGiay;
	

}
