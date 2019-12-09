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

import com.lw.bean.bannerBean;
import com.lw.dao.bannerDao;

@WebServlet("bannerServlet")
public class bannerServlet extends HttpServlet {

	private bannerDao banner = new bannerDao();
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");//设置页面编码格式
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		List<bannerBean> banners = banner.queryBanner();
		List<bannerBean> middle = banner.middleBanner();
		List<bannerBean> bottom = banner.bottomBanner();
		HttpSession session = request.getSession();
		session.setAttribute("banners", banners);
		session.setAttribute("middles", middle);
		session.setAttribute("bottoms", bottom);
		request.getRequestDispatcher("goodsServlet").forward(request, response);
	}
}
