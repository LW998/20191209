package com.lw.bean;

public class carBean {
	private Integer goodsid;
	private Integer number;
	public Integer getGoodsid() {
		return goodsid;
	}
	public void setGoodsid(Integer goodsid) {
		this.goodsid = goodsid;
	}
	public Integer getNumber() {
		return number;
	}
	public void setNumber(Integer number) {
		this.number = number;
	}
	@Override
	public String toString() {
		return "carBean [goodsid=" + goodsid + ", number=" + number + "]";
	}
	
}
