package com.lw.bean;

public class bannerBean {
	private String itemclass;
	private String slide;
	private String categorize;
	private String bannertitle;
	private String bannername;
	private String bannercontent;
	private String img;
	private String url;
	
	public String getItemclass() {
		return itemclass;
	}
	public void setItemclass(String itemclass) {
		this.itemclass = itemclass;
	}
	public String getSlide() {
		return slide;
	}
	public void setSlide(String slide) {
		this.slide = slide;
	}
	public String getCategorize() {
		return categorize;
	}
	public void setCategorize(String categorize) {
		this.categorize = categorize;
	}
	public String getBannertitle() {
		return bannertitle;
	}
	public void setBannertitle(String bannertitle) {
		this.bannertitle = bannertitle;
	}
	public String getBannername() {
		return bannername;
	}
	public void setBannername(String bannername) {
		this.bannername = bannername;
	}
	public String getBannercontent() {
		return bannercontent;
	}
	public void setBannercontent(String bannercontent) {
		this.bannercontent = bannercontent;
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
		return "bannerBean [itemclass=" + itemclass + ", slide=" + slide
				+ ", bannertitle=" + bannertitle + ", bannername=" + bannername
				+ ", bannercontent=" + bannercontent + ", img=" + img + "]";
	}
	
	
}
