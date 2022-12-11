package com.mt.entity;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Entity;
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
@Table(name="khachhangs")
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class KhachHang implements Serializable {
	@Id
	private String taiKhoan;
	private String matKhau;
	private String soDienThoai;
	private String tenKhachHang;
	private String diaChi;
	private boolean quyen;
	// bi-directional many-to-one association to DonHang
	@OneToMany
	@JoinColumn(name = "maDonHang")
	private List<DonHang> donhangs;
}
