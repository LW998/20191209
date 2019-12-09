package com.lw.bean;

public class goodsBean {
	private Integer goodsid;
	private String categorize;
	private String goodsname;
	private Double goodsprice;
	private String img;
	private String url;
	public Integer getGoodsid() {
		return goodsid;
	}
	public void setGoodsid(Integer goodsid) {
		this.goodsid = goodsid;
	}
	
	public String getCategorize() {
		return categorize;
	}
	public void setCategorize(String categorize) {
		this.categorize = categorize;
	}
	public String getGoodsname() {
		return goodsname;
	}
	public void setGoodsname(String goodsname) {
		this.goodsname = goodsname;
	}
	public Double getGoodsprice() {
		return goodsprice;
	}
	public void setGoodsprice(Double goodsprice) {
		this.goodsprice = goodsprice;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	@Override
	public String toString() {
		return "goodsBean [goodsid=" + goodsid + ", categorize=" + categorize
				+ ", goodsname=" + goodsname + ", goodsprice=" + goodsprice
				+ ", img=" + img + ", url=" + url + "]";
	}
	
}
