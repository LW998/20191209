package com.lw.service;

import java.util.List;

import com.lw.enity.mycart;

public interface mycartService {
	public List<mycart> showCart(int uid);
	public boolean addcart(mycart m);
	public int cartQty(int uid);
	public boolean remall(mycart m);
	public int selcart(mycart m);
	public boolean upcart(mycart m);
	public boolean downcart(mycart m);
	public boolean valcart(mycart m);
}
