package com.lw.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lw.enity.mycart;
import com.lw.mapper.mycartMapper;
import com.lw.service.mycartService;

@Service
public class mycartServiceImpl implements mycartService {

	@Autowired
	private mycartMapper Cmapper;

	//查询购物车
	public List<mycart> showCart(int uid) {
		return Cmapper.showCart(uid);
	}

	//创建购物记录
	public boolean addcart(mycart m) {
		boolean flag = false;
		try {
				m.setUid(m.getUid());
				m.setGid(m.getGid());
				Cmapper.addcart(m);
				flag = true;
		} catch (Exception e) {
			flag = false;
		}
		return flag;
	}

	//查询购物车数量
	public int cartQty(int uid) {
		return Cmapper.cartQty(uid);
	}

	//移除一个商品的记录
	public boolean remall(mycart m) {
		boolean flag = false;
		try {
			m.setUid(m.getUid());
			m.setGid(m.getGid());
			Cmapper.remall(m);
			flag = true;
		} catch (Exception e) {
			flag = false;
		}
		return flag;
	}

	//查询商品的数量
	public int selcart(mycart m) {
		m.setUid(m.getUid());
		m.setGid(m.getGid());
		return Cmapper.selcart(m);
	}

	//添加商品的数量
	public boolean upcart(mycart m) {
		boolean flag = false;
		try {
			m.setUid(m.getUid());
			m.setGid(m.getGid());
			Cmapper.upcart(m);
			flag = true;
		} catch (Exception e) {
			flag = false;
		}
		return flag;
	}

	//减少商品数量
	public boolean downcart(mycart m) {
		boolean flag = false;
		try {
			m.setUid(m.getUid());
			m.setGid(m.getGid());
			Cmapper.downcart(m);
			flag = true;
		} catch (Exception e) {
			flag = false;
		}
		return flag;
	}

	public boolean valcart(mycart m) {
		boolean flag = false;
		try {
			m.setUid(m.getUid());
			m.setGid(m.getGid());
			m.setQty(m.getQty());
			Cmapper.valcart(m);
			flag = true;
		} catch (Exception e) {
			flag = false;
		}
		return flag;
	}
}
