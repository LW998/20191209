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
import com.lw.dao.blogDao;

@WebServlet("blogServlet")
public class blogServlet extends HttpServlet {

	private blogDao blogs = new blogDao();
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");//设置页面编码格式
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		List<blogBean> blog = blogs.queryBolg();
		HttpSession session = request.getSession();
		session.setAttribute("blogs", blog);
		request.getRequestDispatcher("footServlet").forward(request, response);
	}
}
