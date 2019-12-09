package com.lw.service;


import com.lw.enity.user;

public interface userService {
	public user login(user us);

	public boolean reg(user us);
	
	public boolean decide(user us);
}