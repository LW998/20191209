package com.lw.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lw.enity.goods;
import com.lw.mapper.goodsMapper;
import com.lw.service.goodsService;

@Service
public class goodsServiceImpl implements goodsService {
	@Autowired
	private goodsMapper Gmapper;
	public List<goods> zShow() {
		return Gmapper.zShow();
	}

	public List<goods> jShow() {
		return Gmapper.jShow();
	}

	public List<goods> qShow() {
		return Gmapper.qShow();
	}

	public List<goods> sShow() {
		return Gmapper.sShow();
	}

	public List<goods> yShow() {
		return Gmapper.yShow();
	}
	public List<goods> ShowGoods() {	
		return Gmapper.ShowGoods();
	}

	public List<goods> queryName(String gname) {
		return Gmapper.queryName(gname);
	}

	public List<goods> queryPubli(String publi) {
		return Gmapper.queryPubli(publi);
	}

	public List<goods> queryAuthor(String author) {
		return Gmapper.queryAuthor(author);
	}

}
