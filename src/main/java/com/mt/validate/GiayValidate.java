package com.mt.validate;

import java.util.List;
import java.util.Optional;

public class GiayValidate {
	//Check ID
	public boolean checkIDGiay(String id) {
		try {
			Integer.parseInt(id);
			return true;
		} catch (Exception e) {
			return false;
		}
	}
	public boolean listIsNullOrEmpty(List<Optional<String>> list) {
		return (list.isEmpty()|| list==null)?true:false;
	}
}
