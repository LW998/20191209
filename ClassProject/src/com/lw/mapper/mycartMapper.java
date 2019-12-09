package com.lw.mapper;

import java.util.List;


import com.lw.enity.mycart;

public interface mycartMapper {
	public List<mycart> showCart(int uid);
	public int cartQty(int uid);
	public void remall(mycart m);
	public int selcart(mycart m);
	public void upcart(mycart m);
	public void downcart(mycart m);
	public void addcart(mycart m);
	public void valcart(mycart m);
}
