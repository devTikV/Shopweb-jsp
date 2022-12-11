package com.mt.entity;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

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
@Table(name="donhangs")
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class DonHang {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int maDonHang;
	private String diaChi;
	private String tenNguoiNhan;
	private int tongTien;
	private String ghiChuAdmin;
	private String ghiChuKhachHang;
	private Timestamp ngayDatHang;
	private Date ngayGiaoDuKien;
	private String soDienThoai;
	private String trangThai;

	@OneToMany(mappedBy="donHang")
	private List<ChiTietDonHang> chiTietDonHangs;
	//bi-directional many-to-one association to KhachHang
	@ManyToOne
	@JoinColumn(name = "taiKhoan")
	private KhachHang khachHang;
}
