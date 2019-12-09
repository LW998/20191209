package com.lw.bean;

public class blogBean {
	private String blogtitle;
	private String blogauthor;
	private String blogtime;
	private String blogcontent;
	private String img;
	private String articlesurl;
	private String authorurl;
	public String getBlogtitle() {
		return blogtitle;
	}
	public void setBlogtitle(String blogtitle) {
		this.blogtitle = blogtitle;
	}
	public String getBlogauthor() {
		return blogauthor;
	}
	public void setBlogauthor(String blogauthor) {
		this.blogauthor = blogauthor;
	}
	public String getBlogtime() {
		return blogtime;
	}
	public void setBlogtime(String blogtime) {
		this.blogtime = blogtime;
	}
	public String getBlogcontent() {
		return blogcontent;
	}
	public void setBlogcontent(String blogcontent) {
		this.blogcontent = blogcontent;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getArticlesurl() {
		return articlesurl;
	}
	public void setArticlesurl(String articlesurl) {
		this.articlesurl = articlesurl;
	}
	public String getAuthorurl() {
		return authorurl;
	}
	public void setAuthorurl(String authorurl) {
		this.authorurl = authorurl;
	}
	@Override
	public String toString() {
		return "blogBean [blogtitle=" + blogtitle + ", blogauthor="
				+ blogauthor + ", blogtime=" + blogtime + ", blogcontent="
				+ blogcontent + ", img=" + img + ", articlesurl=" + articlesurl
				+ ", authorurl=" + authorurl + "]";
	}
	
}
