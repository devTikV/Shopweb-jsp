package com.mt.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Embeddable;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Embeddable
public class ChiTietDonHangPK implements Serializable {
	@Column(name="maDonHang", insertable=false, updatable=false)
	private int maDonHang;

	@Column(name="maGiay", insertable=false, updatable=false)
	private int maGiay;
}
