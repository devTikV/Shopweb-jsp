package com.mt.entity;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Data
@Entity
@Table(name="loaigiays")
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class LoaiGiay implements Serializable {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int maLoaiGiay;
	private int gioiTinh;
	private String tenLoai;

	//bi-directional many-to-one association to Giay
	@OneToMany(mappedBy="loaiGiay")
	private List<Giay> giays;
}
