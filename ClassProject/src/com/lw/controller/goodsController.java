package com.lw.controller;


import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.lw.enity.goods;
import com.lw.service.goodsService;

@Controller
public class goodsController {
	@Autowired
	private goodsService Gservice;
	
	//商品分类显示
	@RequestMapping(value="Show.action", method=RequestMethod.POST)
	public String zShow(HttpSession session) {
		//session中传入查询过后的信息
		session.setAttribute("zgoods",Gservice.zShow());
		session.setAttribute("qgoods",Gservice.qShow());
		session.setAttribute("sgoods",Gservice.sShow());
		session.setAttribute("jgoods",Gservice.jShow());
		session.setAttribute("ygoods",Gservice.yShow());
		//跳转页面
		return "/index.jsp";
	}
	
	//查询全部商品
	@RequestMapping(value = "Showall.action", method = RequestMethod.POST)
	public void Showall(HttpSession session,HttpServletResponse response) throws IOException {
		response.setCharacterEncoding("utf-8");
		PrintWriter out=response.getWriter();
		//创建json对象
		Gson gson=new GsonBuilder().serializeNulls().setPrettyPrinting().create();
		//页面传入json数据
		out.write(gson.toJson(Gservice.ShowGoods()));
	}
	
	
	//按作者搜索
	@RequestMapping(value="gname.action")
	public void queryName(String gname,HttpSession session,HttpServletResponse response) throws IOException {
		response.setCharacterEncoding("utf-8");
		PrintWriter out=response.getWriter();
		//创建json对象
		Gson gson=new GsonBuilder().serializeNulls().setPrettyPrinting().create();
		//页面传入json数据
		out.write(gson.toJson(Gservice.queryName(gname)));
		
	}
	
	@RequestMapping(value="publi.action")
	public void queryPubli(String publi,HttpSession session,HttpServletResponse response) throws IOException{
		response.setCharacterEncoding("utf-8");
		PrintWriter out=response.getWriter();
		//创建json对象
		Gson gson=new GsonBuilder().serializeNulls().setPrettyPrinting().create();
		//页面传入json数据
		out.write(gson.toJson(Gservice.queryPubli(publi)));
	}
	@RequestMapping(value="author.action")
	public void queryAuthor(String author,HttpSession session,HttpServletResponse response)throws IOException {
		response.setCharacterEncoding("utf-8");
		PrintWriter out=response.getWriter();
		//创建json对象
		Gson gson=new GsonBuilder().serializeNulls().setPrettyPrinting().create();
		//页面传入json数据
		out.write(gson.toJson(Gservice.queryAuthor(author)));
	}
}
