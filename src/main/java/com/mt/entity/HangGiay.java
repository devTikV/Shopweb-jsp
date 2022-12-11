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
@Table(name="hanggiays")
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class HangGiay  implements Serializable {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int maHang;
	private String tenHang;
	@OneToMany(mappedBy = "hangGiay")
	List<Giay> giays;
	
}
