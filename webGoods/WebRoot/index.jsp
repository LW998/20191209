<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i"
		rel="stylesheet">
	<title>家居网</title>
	<link rel="shortcut icon" type="image/icon"/>
	<link rel="stylesheet" href="css/font-awesome.min.css">
	<link rel="stylesheet" href="css/linearicons.css">
	<link rel="stylesheet" href="css/animate.css">
	<link rel="stylesheet" href="css/owl.carousel.min.css">
	<link rel="stylesheet" href="css/owl.theme.default.min.css">
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="css/bootsnav.css">
	<link rel="stylesheet" href="css/style.css">
	<link rel="stylesheet" href="css/responsive.css">
</head>
<body>
	<header id="home" class="welcome-hero">
	<div id="header-carousel" class="carousel slide carousel-fade"
		data-ride="carousel">
		<ol class="carousel-indicators">
			<li data-target="#header-carousel" data-slide-to="0" class="active"><span
				class="small-circle"></span></li>
			<li data-target="#header-carousel" data-slide-to="1"><span
				class="small-circle"></span>
			</li>
			<li data-target="#header-carousel" data-slide-to="2"><span
				class="small-circle"></span>
			</li>
		</ol>
		<div class="carousel-inner" role="listbox">
			<c:forEach items="${banners}" var="ban">
				<div class="item ${ban.itemclass}">
					<div class="single-slide-item slide${ban.slide}">
						<div class="container">
							<div class="welcome-hero-content">
								<div class="row">
									<div class="col-sm-7">
										<div class="single-welcome-hero">
											<div class="welcome-hero-txt">
												<h4>${ban.bannertitle}</h4>
												<h2>${ban.bannername}</h2>
												<p>${ban.bannercontent}</p>
											</div>
										</div>
									</div>
									<div class="col-sm-5">
										<div class="single-welcome-hero">
											<div class="welcome-hero-img">
												<img src="${ban.img}" alt="slider image">
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>

	<div class="top-area">
		<div class="header-area">
			<nav
				class="navbar navbar-default bootsnav  navbar-sticky navbar-scrollspy"
				data-minus-value-desktop="70" data-minus-value-mobile="55"
				data-speed="1000">
			<div class="container">
				<!-- Start Atribute Navigation -->
				<div class="attr-nav">
					<ul>
						<li class="search"><a href="#"><span
								class="lnr lnr-magnifier"></span>
						</a></li>
						<li class="nav-setting"><a href="#"><span
								class="lnr lnr-cog"></span>
						</a></li>
						<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">
						<span class="lnr lnr-cart"></span>
						<%-- <c:forEach items="${count}" var="c"> --%>
						<span class="badge badge-bg-1"id="cou">${c.count}</span>
						<%-- </c:forEach> --%>
						</a>
						<c id="delcar">
						<ul class="dropdown-menu cart-list s-cate"  id="eachprice" >
						<c:forEach items="${cars}" var="c">
                            <li class="single-cart-list">
                                <a href="#" class="photo"><img src="${c.img}" class="cart-thumb" alt="image" /></a>
                                <div class="cart-list-txt">
                                	<h6><a href="#">${c.goodsname}</a></h6>
                                	<p><span class="number">${c.number}</span> x - ￥<span class="goodsprice">${c.goodsprice}</span></p>
                                </div>
                                <%-- <div style="margin-left:30px;cursor: pointer;" class="delclick">
                                	<span class="lnr lnr-cross"></span>
                                	<input type="hidden" value="${c.goodsid}" class="del">
                                </div> --%>
                                <div style="margin-left:30px;">
                                	<a href="deletecarServlet?goodsid=${c.goodsid}"><span class="lnr lnr-cross"></span></a>
                                </div>
                            </li>
							
				        </c:forEach>
				        </c>
				        <%-- <c:forEach items="${sum}" var="s"> --%>
	                            <li class="total" id="totalprice">
	                                <span>总计: ￥ <span class="total">${s.sum}</span></span>
	                                <button class="btn-cart pull-right" onclick="window.location.href='#'">结算</button>
	                            </li>
	                   <%-- </c:forEach> --%>
	                       </ul>
						</li>
					</ul>
				</div>
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse"
						data-target="#navbar-menu">
						<i class="fa fa-bars"></i>
					</button>
					<a class="navbar-brand" href="index.html">家居网</a>

				</div>
				<div class="collapse navbar-collapse menu-ui-design"
					id="navbar-menu">
					<ul class="nav navbar-nav navbar-center" data-in="fadeInDown"
						data-out="fadeOutUp">
						<li class=" scroll active"><a href="#home">首页</a>
						</li>
						<li class="scroll"><a href="#new-arrivals">新品到货</a>
						</li>
						<li class="scroll"><a href="#feature">特色产品</a>
						</li>
						<li class="scroll"><a href="#blog">博客</a>
						</li>
						<li class="scroll"><a href="#newsletter">联系我们</a>
						</li>
					</ul>
				</div>
			</div>
			</nav>
		</div>
		<div class="clearfix"></div>
	</div>
	</header>
	<section id="new-arrivals" class="new-arrivals">
	
	<div class="container">
		<div class="section-header">
			<h2>新品到货</h2>
		</div>
		<div class="new-arrivals-content">
			<div class="row" id="addcar">
				<c:forEach items="${goods}" var="g">
					<div class="col-md-3 col-sm-4">
						<div class="single-new-arrival">
							<div class="single-new-arrival-bg">
								<img src="${g.img}" alt="new-arrivals images">
								<div class="single-new-arrival-bg-overlay"></div>
								<div class="new-arrival-cart">
										<%-- <p class="addclick" style="cursor: pointer;">
											<span class="lnr lnr-cart"></span>
											<a>添加到购物车</a>
											<input type="hidden" value="${g.goodsid}"  class="add">
										</p> --%>
										<p>
											<span class="lnr lnr-cart"></span>
											<a href="addcarServlet?goodsid=${g.goodsid}">添加到购物车</a>
										</p>
									</div>
							</div>
							<h4>
								<a href="#">${g.goodsname}</a>
							</h4>
							<p class="arrival-product-price">￥ ${g.goodsprice}</p>
							
						</div>
					</div>
					</c:forEach>
			</div>
		</div>
	</div>
	</section>
	<section id="sofa-collection">
	<div class="owl-carousel owl-theme" id="collection-carousel">
	<c:forEach items="${middles}" var="mid">
		<div class="sofa-collection collectionbg${mid.slide}">
			<div class="container">
				<div class="sofa-collection-txt">
					<h2>${mid.bannertitle}</h2>
					<p>${mid.bannercontent}</p>

				</div>
			</div>
		</div>
	</c:forEach>
	</div>
	</section>
	<section id="feature" class="feature">
	<div class="container">
		<div class="section-header">
			<h2>特色产品</h2>
		</div>
		<!--/.section-header-->
		<div class="feature-content">
			<div class="row">
				<c:forEach items="${features}" var="f">
					<div class="col-sm-3">
						<div class="single-feature">
							<a href="${f.url}"><img src="${f.img}" alt="feature image">
							</a>
							<div class="single-feature-txt text-center">
								<h3>
									<a href="${f.url}">${f.goodsname}</a>
								</h3>
								<h5>￥ ${f.goodsprice}</h5>
							</div>
						</div>
					</div>
				</c:forEach>
			
			</div>
		</div>
	</div>
	</section>
	<section id="blog" class="blog">
	<div class="container">
		<div class="section-header">
			<h2>最新博客</h2>
		</div>
		<div class="blog-content">
			<div class="row">
				<c:forEach items="${blogs}" var="b">
					<div class="col-sm-4">
						<div class="single-blog">
							<div class="single-blog-img">
								<img src="${b.img}" alt="blog image">
								<div class="single-blog-img-overlay"></div>
							</div>
							<div class="single-blog-txt">
								<h2>
									<a href="${b.articlesurl}">${b.blogtitle}</a>
								</h2>
								<h3>
									By <a href="${b.authorurl}">${b.blogauthor}</a> / ${b.blogtime}
								</h3>
								<p>${b.blogcontent}</p>
							</div>
						</div>

					</div>
				</c:forEach>
				
			</div>
		</div>
	</div>
	</section>
	<section id="clients" class="clients">
	<div class="container">
		<div class="owl-carousel owl-theme" id="client">
		<c:forEach items="${bottoms}" var="bot">
			<div class="item">
				<a href="${bot.url}"><img src="${bot.img}" alt="brand-image" /></a>
			</div>
		</c:forEach>
		</div>
	</div>
	</section>
	<section id="newsletter" class="newsletter">
	<div class="container">
		<div class="hm-footer-details">
			<div class="row">
				<c:forEach items="${foots}" var="f">
					<div class=" col-md-3 col-sm-6 col-xs-12">
						<div class="hm-footer-widget">
							<div class="hm-foot-title">
								<h4>${f.footname}</h4>
							</div>
							<div class="hm-foot-menu">
								<ul>
									<li><a href="${f.titleoneurl}">${f.titleone}</a></li>
									<li><a href="${f.titletwourl}">${f.titletwo}</a></li>
									<li><a href="${f.titlethreeurl}">${f.titlethree}</a></li>
									<li><a href="${f.titlefoururl}">${f.titlefour}</a></li>
									<li><a href="${f.titlefiveurl}">${f.titlefive}</a></li>
								</ul>
							</div>
						</div>
					</div>
				</c:forEach>
				<div class=" col-md-3 col-sm-6  col-xs-12">
					<div class="hm-footer-widget">
						<div class="hm-foot-title">
							<h4>更多信息</h4>
						</div>
						<div class="hm-foot-para">
							<p>留下你的邮箱，以方便于了解更多信息</p>
						</div>
						<div class="hm-foot-email">
							<div class="foot-email-box">
								<input type="text" class="form-control" placeholder="Email">
							</div>
							<div class="foot-email-subscribe">
								<span><i class="fa fa-location-arrow"></i>
								</span>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</section>
	<footer id="footer" class="footer">
	<div class="container">
		<div class="hm-footer-copyright text-center">
			<div class="footer-social">
				<a href="#"><i class="fa fa-wechat"></i>
				</a> <a href="#"><i class="fa fa-qq"></i>
				</a> <a href="#"><i class="fa fa-weibo"></i>
				</a> <a href="#"><i class="fa fa-mobile-phone"></i>
				</a> <a href="#"><i class="fa fa-windows"></i>
				</a>
			</div>
			<p>&copy;copyright.</p>
		</div>
	</div>
	<div id="scroll-Top">
		<div class="return-to-top">
			<i class="fa fa-angle-up " id="scroll-top" data-toggle="tooltip"
				data-placement="top" title="" data-original-title="Back to Top"
				aria-hidden="true"></i>
		</div>
	</div>
	</footer>
<script src="js/jquery.js"></script>

	<script src="js/bootstrap.min.js"></script>
	<script src="js/bootsnav.js"></script>
	<script src="js/owl.carousel.min.js"></script>

	<script src="js/custom.js"></script>
	<script src="js/my.js"></script>
</body>	
</html>