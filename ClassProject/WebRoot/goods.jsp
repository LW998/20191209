<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>商品</title>
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
    .yin{
    display: none;
    }
    .input-group-btn select {
        height: 34px;
        background: white;
    }
    .pagination{
    position: relative;
    top:10%;
    left :43.6%;
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
                <li style="margin-top: 40%;"><a href="index.jsp" class="lnr lnr-home">&nbsp;&nbsp;首页</a></li>
                <li class="active"><a href="goods.jsp" class="lnr lnr-store">&nbsp;&nbsp;商品</a></li>
                <li><a href="register.jsp" class="lnr lnr-link">&nbsp;&nbsp;注册</a></li>
                <li><a class="lnr lnr-cart" id="mycart" style="cursor: pointer;">&nbsp;&nbsp;我的购物车</a></li>
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
            <nav class="navbar navbar-default navbar-fixed-top" role="navigation">
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
                    <button class="btn btn-success" type="button" style="position: absolute; top: 1%; right: 5%;" id="carts" autocomplete="off">
                    <i class="fa fa-cart-plus" style="font-size: 25px;"></i> <span class="badge" id="cartnum"><c:if test="${empty count}">0</c:if>${count}</span>
                </button>
                </div>
            </nav>
            <div class="container" style="margin-top: 3%;">  
                <div class="row">
                    <ul class="tabs" id="a">
                    <c:forEach items='${allgoods}' var="all">
                                <li class="tab_list col-sm-4 col-md-2">
                                    <img src="${all.img}" class="img-responsive center-block" title="${all.description}">
                                    <div class="ctn">
                                        <p>
                                        <a title="${all.description}" style="cursor: pointer;" class="bname">${all.gname}</a>
                                           <br>
                                           <b>${all.author}</b>
                                           <br>
                                           <i>${all.publi}</i>
                                         </p>
                                        <p><span>￥</span><span class="prices">${all.price}</span></p>
                                    </div>
                                    <input type="hidden" value="${all.gid}" class="gid"/>
                                    <a class="btn btn-xs btn-info lnr lnr-cart add">添加购物车</a>
                                </li>
                         </c:forEach>
                    </ul>
                </div>
            </div>
            <ul class="pagination" id="page">
				
			</ul>
        </div>
</body>
<script src="js/jquery-2.2.4.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/toastr.min.js"></script>
<script src="js/glogin.js"></script>
<script>

</script>

</html>