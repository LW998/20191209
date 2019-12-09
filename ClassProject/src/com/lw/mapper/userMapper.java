package com.lw.mapper;

import com.lw.enity.user;

public interface userMapper {
	public user login(user us);

	public void reg(user us);
	
	public int decide(user us);

}
