package com.lw.enity;

import java.io.Serializable;

//商品实体类
@SuppressWarnings("serial")
public class goods implements Serializable{
	private Integer gid;
	private String gname;
	private String categorize;
	private Double price;
	private String author;
	private String publi;
	private String description;
	private String img;
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
	public String getCategorize() {
		return categorize;
	}
	public void setCategorize(String categorize) {
		this.categorize = categorize;
	}
	public Double getPrice() {
		return price;
	}
	public void setPrice(Double price) {
		this.price = price;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getPubli() {
		return publi;
	}
	public void setPubli(String publi) {
		this.publi = publi;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	@Override
	public String toString() {
		return "goods [gid=" + gid + ", gname=" + gname + ", categorize="
				+ categorize + ", price=" + price + ", author=" + author
				+ ", publi=" + publi + ", description=" + description
				+ ", img=" + img + "]";
	}
}
