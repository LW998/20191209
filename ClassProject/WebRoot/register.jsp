<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>注册</title>
    <link rel="stylesheet" href="css/register.css">
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

    #registerer {
        width: 80%;
    }

    .container {
        margin: 5% auto;
    }

    .container h2 {
        margin-left: 20%;
        margin-bottom: 5%;
        width: 40%;
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
                <li style="margin-top: 40%;"><a href="index.jsp#myModal" class="lnr lnr-home">&nbsp;&nbsp;首页</a></li>
                <li><a href="goods.jsp" class="lnr lnr-store">&nbsp;&nbsp;商品</a></li>
                <li class="active"><a href="register.jsp" class="lnr lnr-link">&nbsp;&nbsp;注册</a></li>
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
                                              登录<span id="msg" style="color:red;margin-left: 20%;"></span>
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
                                    <input type="password" class="form-control" id="lpwd"
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
        <div id="registerer">
            <div class='container'>
            <h2 id="tip"></h2>
                <h2 class="btn btn-lg btn-success fa fa-user ">用户注册</h2>
                <form method="POST" action="reg" class="con">
                    <div class="row">
                        <div class="left">
                            <label>用户名:</label>
                        </div>
                        <div class="right">
                            <input type="text" id="username" name="name"/>
                        </div>
                        <div class="tip">
                            <span class="msg">请输入四位以上用户名</span>
                        </div>
                    </div>
                    <div class="row">
                        <div class="left">
                            <label>密码:</label>
                        </div>
                        <div class="right">
                            <input type="password" />
                        </div>
                        <div class="tip">
                            <span class="msg">请输入6位以上密码</span>
                        </div>
                    </div>

                    <div class="row">
                        <div class="left">
                            <label>确认密码:</label>
                        </div>
                        <div class="right">
                            <input type="password" id="pwd" name="pwd"/>
                        </div>
                        <div class="tip">
                            <span class="msg">请再次确认密码</span>
                        </div>
                    </div>

                    <div class="row">
                        <div class="left">
                            <label>地址:</label>
                        </div>
                        <div class="right">
                            <input type="text" id="addr" name="addr"/>
                        </div>
                        <div class="tip">
                            <span class="msg">请输入地址</span>
                        </div>
                    </div>
                    <div class="row">
                        <div class="left">
                            <label>手机号码:</label>
                        </div>
                        <div class="right">
                            <input type="text" id="tel" name="tel"/>
                        </div>
                        <div class="tip">
                            <span class="msg">请输入11位手机号码</span>
                        </div>
                    </div>
                    <div class="row">
                        <div class="left">
                        </div>
                        <div class="right">
                            <div class="sub btn btn-toolbar">立即注册</div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="left">
                        </div>
                        <div class="right">
                            <input type="checkbox" value="1" />
                            <p class="read">我已阅读并同意用户条款</p>
                        </div>
                        <div class="tip">
                            <span class="msg"></span>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</body>
<script src="js/jquery-2.2.4.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/toastr.min.js"></script>
<script src="js/reg.js"></script>
<script src="js/rlogin.js"></script>
</html>