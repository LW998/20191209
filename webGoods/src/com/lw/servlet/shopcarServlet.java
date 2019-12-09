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

import com.lw.bean.goodsBean;
import com.lw.bean.shopCarBean;
import com.lw.dao.shopcarDao;


@WebServlet("shopcarServlet")
public class shopcarServlet extends HttpServlet {

	private shopcarDao car = new shopcarDao();
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");//设置页面编码格式
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		List<shopCarBean> cars = car.queryShopCar();
//		List<shopCarBean> count=car.queryCount();
//		List<shopCarBean> sum=car.queryTotal();
		HttpSession session = request.getSession();
		session.setAttribute("cars", cars);
//		session.setAttribute("count", count);
//		session.setAttribute("sum", sum);
		request.getRequestDispatcher("index.jsp").forward(request, response);
	}
}
