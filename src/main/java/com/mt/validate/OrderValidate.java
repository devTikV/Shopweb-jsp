package com.mt.validate;

import java.util.List;

public class OrderValidate {
	public boolean listIsNullOrEmpty(List<String> list) {
		return (list.isEmpty()|| list==null)?true:false;
	}
}
