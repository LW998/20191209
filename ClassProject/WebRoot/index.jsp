<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>首页</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/toastr.css">
    <link rel="stylesheet" href="css/tab.css">
    <link rel="stylesheet" href="css/font-awesome.min.css">
    <link rel="stylesheet" href="css/linearicons.css">
</head>
<style>
    #main {
        display: flex;
    }

    #nav {
        width: 20%;
        height: 500px;
    }

    #nav_right {
        width: 80%;
        padding: -2%;
    }

    .input-group-btn select {
        height: 34px;
        background: white;
    }
    .ctn b{
    color:lightblue;
    height:30px;
    }
</style>


<body>
    <div id="main">
        <div id="nav">
            <ul class="nav nav-pills nav-stacked myNav col-md-12">
                <a class="navbar-brand" href="#" style="margin-bottom: 10%; color: #000;">迷你书城</a>
                <c:if test="${empty uid}">
                <p class="navP">游客，请先&nbsp;&nbsp;[<a data-toggle="modal" data-target="#myModal">登录</a>]&nbsp;&nbsp;或者&nbsp;&nbsp;[<a href="register.jsp">立即注册</a>]</p>
                 </c:if>
                 <c:if test="${not empty uid}">
                 <p class="navP">欢迎你&nbsp;&nbsp;${name}&nbsp;&nbsp;[<a href="loginout.action">注销</a>]</p>
                 <input type="hidden" value="${uid}" id="userid" />
                 </c:if>
                <li class="active" style="margin-top: 40%;" id="index"><a href="index.jsp" class="lnr lnr-home">&nbsp;&nbsp;首页</a></li>
                <li><a href="goods.jsp" class="lnr lnr-store">&nbsp;&nbsp;商品</a></li>
                <li><a href="register.jsp" class="lnr lnr-link">&nbsp;&nbsp;注册</a></li>
                <li id="c"><a class="lnr lnr-cart" id="mycart" style="cursor: pointer;">&nbsp;&nbsp;我的购物车</a></li>
            </ul>
        </div>
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
            aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×
                        </button>
                        <h4 class="modal-title" id="myModalLabel">
                                              登录
                        </h4>
                    </div>
                    <div class="modal-body">
                        <form method="POST"  class="form-horizontal" >
                            <div class="form-group">
                                <label for="inputEmail3" class="col-sm-2 control-label" >用户名</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" id="name" placeholder="请输入用户名">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputPassword3" class="col-sm-2 control-label">密码</label>
                                <div class="col-sm-8">
                                    <input type="password" class="form-control" id="pwd"
                                        placeholder="请输入密码">
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-offset-2 col-sm-8">
                                    <a class="btn btn-primary" id="submit">登录</a>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <div id="nav_right">
            <nav class="navbar navbar-default" role="navigation">
                <div class="container-fluid">
                    <form class="navbar-form navbar-default" role="search" style="margin-left: 20%;">
                        <div class="row">
                            <div class="input-group">
                                <div class="input-group-btn">
                                    <select class="btn btn-default" id="s">
                                        <option value="1">图书名称</option>
                                        <option value="2">图书作者</option>
                                        <option value="3">出版社</option>
                                    </select>
                                </div>
                                <input type="text" class="form-control" placeholder="搜索" id="val" autocomplete="off">
                            </div>
                             <a id="sear" class="btn btn-success fa fa-search"
                                style="font-size: 20px; cursor: pointer;"></a>
                        </div>
                    </form>
                    <button class="btn btn-success" type="button" style="position: absolute; top: 1%; right: 5%;" id="carts">
                    <i class="fa fa-cart-plus" style="font-size: 25px;"></i> <span class="badge" id="cartnum"><c:if test="${empty count}">0</c:if>${count}</span>
               		</button>
                </div>
            </nav>
            <div id="tabBox">
                <ul id="navBox" class="nav nav-tabs">
                    <li class="active">推荐</li>
                    <li class="">青春励志</li>
                    <li class="">社会科学</li>
                    <li class="">经济管理</li>
                    <li class="">教育</li>
                </ul>
                <div class="tab active">
                    <div class="container" id="a">  
                        <div class="row">
                            <ul class="tabs">
                            <c:forEach items='${zgoods}' var="z">
                                <li class="tab_list col-sm-4 col-md-2">
                                    <img src="${z.img}" class="img-responsive center-block"
                                        title="${z.description}">
                                    <div class="ctn">
                                        <p><a title="${z.description}" style="cursor: pointer;" class="bname">${z.gname}</a>
                                            <br>
                                            <b>${z.author}</b>
                                            <br>
                                            <i>${z.publi}</i>
                                        </p>
                                        <p><span>￥</span><span class="prices">${z.price}</span>
                                        </p>
                                    </div>
                                    <input type="hidden" value="${z.gid}" class="gid"/>
                                    <a class="btn btn-xs btn-info lnr lnr-cart add" style="cursor: pointer;">添加购物车</a>
                                </li>
                             </c:forEach>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="tab">
                    <div class="container">  
                        <div class="row">
                            <ul class="tabs">
							<c:forEach items='${qgoods}' var="q">
                                <li class="tab_list col-sm-4 col-md-2">
                                    <img src="${q.img}" class="img-responsive center-block"
                                        title="${q.description}">
                                    <div class="ctn">
                                        <p><a title="${q.description}" style="cursor: pointer;" class="bname">${q.gname}</a>
                                            <br>
                                            <b>${q.author}</b>
                                            <br>
                                            <i>${q.publi}</i>
                                        </p>
                                        <p><span>￥</span><span class="prices">${q.price}</span>
                                        </p>
                                    </div>
                                    <input type="hidden" value="${q.gid}" class="gid"/>
                                    <a class="btn btn-xs btn-info lnr lnr-cart add" style="cursor: pointer;">添加购物车</a>
                                </li>
                                </c:forEach>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="tab">
                    <div class="container">  
                        <div class="row">
                            <ul class="tabs">
                                <c:forEach items='${sgoods}' var="s">
                                <li class="tab_list col-sm-4 col-md-2">
                                    <img src="${s.img}" class="img-responsive center-block"
                                        title="${s.description}">
                                    <div class="ctn">
                                        <p><a title="${s.description}" style="cursor: pointer;" class="bname">${s.gname}</a>
                                            <br>
                                            <b>${s.author}</b>
                                            <br>
                                            <i>${s.publi}</i>
                                        </p>
                                        <p><span>￥</span><span class="prices">${s.price}</span>
                                        </p>
                                    </div>
                                    <input type="hidden" value="${s.gid}" class="gid"/>
                                    <a class="btn btn-xs btn-info lnr lnr-cart add" style="cursor: pointer;">添加购物车</a>
                                </li>
                                </c:forEach>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="tab">
                    <div class="container">  
                        <div class="row">
                            <ul class="tabs">
                                <c:forEach items='${jgoods}' var="j">
                                <li class="tab_list col-sm-4 col-md-2">
                                    <img src="${j.img}" class="img-responsive center-block"
                                        title="${j.description}">
                                    <div class="ctn">
                                        <p><a title="${j.description}" style="cursor: pointer;" class="bname">${j.gname}</a>
                                            <br>
                                            <b>${j.author}</b>
                                            <br>
                                            <i>${j.publi}</i>
                                        </p>
                                        <p><span>￥</span><span class="prices">${j.price}</span>
                                        </p>
                                    </div>
                                    <input type="hidden" value="${j.gid}" class="gid"/>
                                    <a class="btn btn-xs btn-info lnr lnr-cart add" style="cursor: pointer;">添加购物车</a>
                                </li>
                                </c:forEach>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="tab">
                    <div class="container">  
                        <div class="row">
                            <ul class="tabs">
                                <c:forEach items='${ygoods}' var="y">
                                <li class="tab_list col-sm-4 col-md-2">
                                    <img src="${y.img}" class="img-responsive center-block"
                                        title="${y.description}">
                                    <div class="ctn">
                                        <p><a title="${y.description}" style="cursor: pointer;" class="bname">${y.gname}</a>
                                            <br>
                                            <b>${y.author}</b>
                                            <br>
                                            <i>${y.publi}</i>
                                        </p>
                                        <p><span>￥</span><span class="prices">${y.price}</span>
                                        </p>
                                    </div>
                                    <input type="hidden" value="${y.gid}" class="gid"/>
                                    <a class="btn btn-xs btn-info lnr lnr-cart add" style="cursor: pointer;">添加购物车</a>
                                </li>
                                </c:forEach>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
<script src="js/jquery-2.2.4.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/toastr.min.js"></script>
<script src="js/my.js"></script>
<script src="js/login.js"></script>
<script>

</script>

</html>