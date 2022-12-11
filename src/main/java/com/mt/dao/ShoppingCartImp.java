package com.mt.dao;

import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.web.context.annotation.SessionScope;

import com.mt.entity.ShoppingCart;

@SessionScope
@Service
public class ShoppingCartImp implements ShoppingCartDAO {
	Map<Integer, ShoppingCart> maps=new HashMap<>();
	
	@Override
	public void add(ShoppingCart item) {
		ShoppingCart cartItem=maps.get(item.getMaGiay());//truy vấn giỏ hàng theo mã giày
		//Nếu chưa tồn tại
		if(cartItem==null) {			
			maps.put(item.getMaGiay(), item);
		}else {
			cartItem.setSoLuong(cartItem.getSoLuong()+1);
		}
	}
	@Override
	public void remove(int id) {
		maps.remove(id);
	}
	@Override
	public ShoppingCart update(int idGiay, int soLuong) {
		ShoppingCart cartItem=maps.get(idGiay);
		cartItem.setSoLuong(soLuong);
		return cartItem;
	}
	@Override
	public void clear() {
		maps.clear();
	}
	@Override
	public Collection<ShoppingCart> getAll(){
		return maps.values();
	}
	@Override
	public int getCount() {
		return maps.values().stream()
				.mapToInt(item->item.getSoLuong()).sum();
	}
	@Override
	public int getAmout() {
		return maps.values().stream()
				.mapToInt(item -> item.getSoLuong()*item.getDonGia())
				.sum();
	}
}
