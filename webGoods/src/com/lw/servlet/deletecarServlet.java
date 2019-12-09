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

import com.lw.bean.carBean;
import com.lw.bean.goodsBean;
import com.lw.bean.shopCarBean;
import com.lw.dao.carDao;
import com.lw.dao.shopcarDao;


@WebServlet("deletecarServlet")
public class deletecarServlet extends HttpServlet {

	private carDao cars = new carDao();
	private shopcarDao shopcar = new shopcarDao();
	public static int toInt(String strNum ){
		  Integer integer = new Integer(strNum);
		  return integer.parseInt(strNum);
	}
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("application/json;charset=utf-8");//设置页面编码格式
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		carBean car= new carBean();
		Integer goodsid=toInt(request.getParameter("goodsid"));
		car.setGoodsid(goodsid);
		cars.delete(goodsid);
		List<shopCarBean> shopcars = shopcar.queryShopCar();
//		List<shopCarBean> count=shopcar.queryCount();
//		List<shopCarBean> sum=shopcar.queryTotal();
		HttpSession session = request.getSession();
		session.setAttribute("cars", shopcars);
//		session.setAttribute("count", count);
//		session.setAttribute("sum", sum);
		response.sendRedirect("index.jsp");
	}
}
