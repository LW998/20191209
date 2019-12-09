package com.lw.enity;

//用户实体类
public class user {
	private Integer uid;
	private String name;
	private String pwd;
	private String addr;
	private String tel;

	public Integer getUid() {
		return uid;
	}

	public void setUid(Integer uid) {
		this.uid = uid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	@Override
	public String toString() {
		return "user [uid=" + uid + ", name=" + name + ", pwd=" + pwd
				+ ", addr=" + addr + ", tel=" + tel + "]";
	}
}
