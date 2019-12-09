package com.lw.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lw.bean.blogBean;
import com.lw.bean.footBean;
import com.lw.dao.blogDao;
import com.lw.dao.footDao;

@WebServlet("footServlet")
public class footServlet extends HttpServlet {

	private footDao foots = new footDao();
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=utf-8");//设置页面编码格式
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		List<footBean> foot = foots.queryFoot();
		HttpSession session = request.getSession();
		session.setAttribute("foots", foot);
		request.getRequestDispatcher("shopcarServlet").forward(request, response);
	}
}
