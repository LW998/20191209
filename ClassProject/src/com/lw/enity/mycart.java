package com.lw.enity;

import java.io.Serializable;

@SuppressWarnings("serial")
public class mycart  implements Serializable{
	private Integer uid;
	private Integer gid;
	private String gname;
	private Double price;
	private Integer qty;
	private String img;
	private Integer count;
	
	public Integer getUid() {
		return uid;
	}
	public void setUid(Integer uid) {
		this.uid = uid;
	}
	public Integer getGid() {
		return gid;
	}
	public void setGid(Integer gid) {
		this.gid = gid;
	}
	public String getGname() {
		return gname;
	}
	public void setGname(String gname) {
		this.gname = gname;
	}
	public Double getPrice() {
		return price;
	}
	public void setPrice(Double price) {
		this.price = price;
	}
	public Integer getQty() {
		return qty;
	}
	public void setQty(Integer qty) {
		this.qty = qty;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public Integer getCount() {
		return count;
	}
	public void setCount(Integer count) {
		this.count = count;
	}
	@Override
	public String toString() {
		return "mycart [uid=" + uid + ", gid=" + gid + ", gname=" + gname
				+ ", price=" + price + ", qty=" + qty + ", img=" + img
				+ ", count=" + count + "]";
	}
	
}
