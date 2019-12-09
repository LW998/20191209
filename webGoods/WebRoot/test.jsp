<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
	<link rel="stylesheet" type="text/css" href="styles.css">

  </head>
  
  <body>
  <ul>
		<li class="dropdown">
		<a href="#" class="dropdown-toggle" data-toggle="dropdown">
		<span class="lnr lnr-cart"></span>
		<c:forEach items="${count}" var="c">
		<span class="badge badge-bg-1">${c.count}</span>
		</c:forEach>
		</a>
		<ul class="dropdown-menu cart-list s-cate" id="delcar">
		<c:forEach items="${cars}" var="c">
                        <li class="single-cart-list">
                            <a href="#" class="photo"><img src="${c.img}" class="cart-thumb" alt="image" /></a>
                            <div class="cart-list-txt">
                            	<h6><a href="#">${c.goodsname}</a></h6>
                            	<p><span class="number">${c.number}</span> x - ￥<span class="price">${c.goodsprice}</span></p>
                            </div>
                            <div style="margin-left:30px;cursor: pointer;" class="delclick">
                            	<span class="lnr lnr-cross"></span>
                            	<input type="hidden" value="${c.goodsid}" class="del">
                            </div>
                           <%--  <div style="margin-left:30px;">
                            	<a href="deletecarServlet?goodsid=${c.goodsid}"><span class="lnr lnr-cross"></span></a>
                            </div> --%>
                        </li>
			
        </c:forEach>
        <c:forEach items="${sum}" var="s">
                         <li class="total" id="totalprice">
                             <span>总计: ￥ <span class="total">${s.sum}</span></span>
                             <button class="btn-cart pull-right" onclick="window.location.href='#'">结算</button>
                         </li>
                </c:forEach>
                    </ul>
		</li>
</ul>
  </body>
  <script src="js/my.js"></script>
</html>
