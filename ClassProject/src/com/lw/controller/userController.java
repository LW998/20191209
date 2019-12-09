package com.lw.controller;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lw.enity.user;
import com.lw.service.mycartService;
import com.lw.service.userService;

@Controller
public class userController {
	@Autowired
	private userService Uservice;
	@Autowired
	private mycartService Cservice;
	

	//登录
	@ResponseBody
	@RequestMapping(value="login.action", method=RequestMethod.POST)
	public String login(user us, HttpSession session) {
		user u=new user();
		u=Uservice.login(us);
		if (u==null){
			//用户不存在
			return "0";
		}else{
			//session中传入查询过后的信息
			session.setAttribute("count", Cservice.cartQty(u.getUid()));
			session.setAttribute("uid", u.getUid());
			session.setAttribute("name", u.getName());
			//跳转页面
			return "/index.jsp";
		}
	}
	

	@ResponseBody
	@RequestMapping(value="glogin.action", method=RequestMethod.POST)
	public String glogin(user us, HttpSession session) {
		user u=new user();
		u=Uservice.login(us);
		if (u==null){
			return "0";
		}else{
			session.setAttribute("count", Cservice.cartQty(u.getUid()));
			session.setAttribute("uid", u.getUid());
			session.setAttribute("name", u.getName());
			return "/index.jsp";
		}
	}
	
	@ResponseBody
	@RequestMapping(value="rlogin.action", method=RequestMethod.POST)
	public String rlogin(user us, HttpSession session) {
		user u=new user();
		u=Uservice.login(us);
		if (u==null){
			return "0";
		}else{
			session.setAttribute("count", Cservice.cartQty(u.getUid()));
			session.setAttribute("uid", u.getUid());
			session.setAttribute("name", u.getName());
			return "/goods.jsp";
		}
	}
	
	//注册
	@RequestMapping(value="reg.action", method=RequestMethod.POST)
	public String reg(user us) {
		if (Uservice.reg(us)) {
			//注册成功跳转
			System.out.println("注册成功");
			return "/index.jsp";
		} else {
			//注册失败跳转
			System.out.println( "注册失败");
			return "/register.jsp";
		}
	}
	//判断用户是否存在
	@ResponseBody
	@RequestMapping(value="decide.action", method=RequestMethod.POST)
	public String decide(user us) {
		if (Uservice.decide(us)) {
			//存在
			return "1";
		} else {
			//不存在
			return "0";
		}
	}
	//注销登录
	@RequestMapping(value="loginout.action", method=RequestMethod.GET)
	public String loginout(HttpServletRequest request,HttpServletResponse response,HttpSession session) {
	    session = request.getSession();
	    //清除session中的信息
	    session.removeAttribute("name");
        session.removeAttribute("uid");
        session.removeAttribute("count");
		return "forward:/index.jsp";
	}
	
	@RequestMapping(value="gloginout.action", method=RequestMethod.GET)
	public String gloginout(HttpServletRequest request,HttpServletResponse response,HttpSession session) {
	    session = request.getSession();
	    session.removeAttribute("name");
        session.removeAttribute("uid");
        session.removeAttribute("count");
		return "forward:/goods.jsp";
	}
	
	@RequestMapping(value="rloginout.action", method=RequestMethod.GET)
	public String rloginout(HttpServletRequest request,HttpServletResponse response,HttpSession session) {
	    session = request.getSession();
        session.removeAttribute("name");
        session.removeAttribute("uid");
        session.removeAttribute("count");
		return "forward:/register.jsp";
	}
}
