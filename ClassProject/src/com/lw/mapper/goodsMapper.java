package com.lw.mapper;

import java.util.List;

import com.lw.enity.goods;

public interface goodsMapper {
	 public List<goods> zShow();
	 public List<goods> jShow();
	 public List<goods> qShow();
	 public List<goods> sShow();
	 public List<goods> yShow();
	 public List<goods> ShowGoods();
	 public List<goods> queryName(String gname);
	 public List<goods> queryPubli(String publi);
	 public List<goods> queryAuthor(String author);
}
