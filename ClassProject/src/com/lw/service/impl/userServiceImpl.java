package com.lw.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lw.enity.user;
import com.lw.mapper.userMapper;
import com.lw.service.userService;

@Service
public class userServiceImpl implements userService {
	@Autowired
	private userMapper Umapper;

	public user login(user us) {
		return Umapper.login(us);
	}

	public boolean reg(user us) {
		boolean flag = false;
		try {
				us.setName(us.getName());
				us.setPwd(us.getPwd());
				us.setAddr(us.getAddr());
				us.setTel(us.getTel());
				Umapper.reg(us);
				flag = true;
		} catch (Exception e) {
			flag = false;
		}
		return flag;
	}

	public boolean decide(user us) {
		return Umapper.decide(us) !=0;
	}

}
