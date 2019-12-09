package com.lw.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.lw.service.mycartService;
import com.lw.enity.mycart;

@Controller
public class cartController {


	@Autowired
	private mycartService Cservice;
	
	//查询购物车信息
	@RequestMapping(value="mycart.action", method=RequestMethod.POST)
	public String mycart(Integer uid,HttpSession session){
		//session中传入查询过后的信息
		session.setAttribute("mycart", Cservice.showCart(uid));
		return "/cart.jsp";
	}
	
	//移除一个商品的记录
	@RequestMapping(value="remall.action", method=RequestMethod.POST)
	public void rem(mycart m,HttpSession session,HttpServletResponse response) throws IOException{
		//执行移除
		Cservice.remall(m);
		//更新session中的信息
		session.setAttribute("mycart", Cservice.showCart(m.getUid()));
		session.setAttribute("count", Cservice.cartQty(m.getUid()));
	}
	
	//添加商品
	@ResponseBody
	@RequestMapping(value="cartup.action")
	public String cartup(mycart m,HttpSession session,HttpServletResponse response){
		if (Cservice.selcart(m)==0){
			//执行添加
			Cservice.addcart(m);
			//更新session中的信息
			session.setAttribute("mycart", Cservice.showCart(m.getUid()));
			session.setAttribute("count", Cservice.cartQty(m.getUid()));
		}else{
			//执行增加
			Cservice.upcart(m);
			//更新session中的信息
			session.setAttribute("mycart", Cservice.showCart(m.getUid()));
			session.setAttribute("count", Cservice.cartQty(m.getUid()));
		}
		//页面返回值
		int cou=Cservice.cartQty(m.getUid());
		return cou+"";
	}
	
	//减少商品
	@RequestMapping(value="cartdown.action")
	public void cartdown(mycart m,HttpSession session,HttpServletResponse response) throws IOException {
		if (Cservice.selcart(m) == 1){
			//执行移除
			Cservice.remall(m);
			//更新session中的信息
			session.setAttribute("mycart", Cservice.showCart(m.getUid()));
			session.setAttribute("count", Cservice.cartQty(m.getUid()));
		}else{
			//执行减少
			Cservice.downcart(m);
			//更新session中的信息
			session.setAttribute("mycart", Cservice.showCart(m.getUid()));
			session.setAttribute("count", Cservice.cartQty(m.getUid()));
		}
	}
	
	@RequestMapping(value="valcart.action")
	public void valcart(mycart m,HttpSession session,HttpServletResponse response) throws IOException {
			Cservice.upcart(m);
			session.setAttribute("mycart", Cservice.showCart(m.getUid()));
			session.setAttribute("count", Cservice.cartQty(m.getUid()));
	}
	
}
