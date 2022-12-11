package com.mt.dao;

import java.util.Collection;

import com.mt.entity.ShoppingCart;

public interface ShoppingCartDAO {
	public void add(ShoppingCart item);
	public void remove(int id);
	public int getAmout();
	public int getCount();
	public Collection<ShoppingCart> getAll();
	public void clear();
	public ShoppingCart update(int idGiay, int soLuong);
}
