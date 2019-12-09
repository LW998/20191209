<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/toastr.css">
    <link rel="stylesheet" href="css/tab.css">
    <link rel="stylesheet" href="css/core-style.css">
    <link rel="stylesheet" href="css/font-awesome.min.css">
    <link rel="stylesheet" href="css/linearicons.css">
    <title>购物车</title>
</head>
<style>
    .price span {
        margin-top: 50%;
    }

    .main {
        display: flex;
    }

    #nav {
        width: 20%;
        height: 500px;
    }

    .container-fluid {
        width: 80%;
    }
    .yin{
    display:none;
    }
</style>

<body>
    <div class="main">

        <div id="nav">
            <ul class="nav nav-pills nav-stacked myNav col-md-12">
                <a class="navbar-brand" href="#" style="margin-bottom: 10%; color: #000;">迷你书城</a>
              	<p class="navP">欢迎你&nbsp;&nbsp;${name}&nbsp;&nbsp;[<a href="loginout.action">注销</a>]</p>
              	<input type="hidden" value="${uid}" id="userid"/>
		         <li style="margin-top: 40%;"><a href="index.jsp" class="lnr lnr-home">&nbsp;&nbsp;首页</a></li>
		         <li><a href="goods.jsp" class="lnr lnr-store">&nbsp;&nbsp;商品</a></li>
		         <li><a href="register.jsp" class="lnr lnr-link">&nbsp;&nbsp;注册</a></li>
		         <li class="active"><a class="lnr lnr-cart" id="mycart" style="cursor: pointer;">&nbsp;&nbsp;我的购物车</a></li>
            </ul>
        </div>
        <div class="container-fluid">
            <div class="row">
                <div class="col-8 col-lg-8">
                    <div class="cart-title mt-50">
                        <h2>购物车</h2>
                    </div>
                    <div class="cart-table clearfix">
                        <table class="table table-responsive">
                            <thead>
                                <tr>
                                    <th></th>
                                    <th>名称</th>
                                    <th>单价</th> 
                                    <th>数量</th>
                                </tr>
                            </thead>
                            <h2 id="em" class="yin" style="text-align: center; color:lightblue; position: relative;top: 200px;">购物车竟然是空的，快去选购喜爱的图书吧~</h2>
                            <tbody id="plusPri">
                                <c:forEach items="${mycart}" var="m">
                                <tr class="each">
                                    <td class="cart_product_img">
                                        <a href="#"><img src="${m.img}" alt="Product"></a>
                                    </td>
                                    <td class="cart_product_desc">
                                        <h5>${m.gname}</h5>
                                    </td>
                                    <td>
                                        <div class="price">
                                            	￥<span>${m.price}</span>
                                        </div>
                                    </td>
                                    <td class="qty">
                                        <div class="qty-btn d-flex">
                                            <div class="quantity">
                                                <a class="qty-minus"><i class="fa fa-minus" aria-hidden="true"></i></a>
                                                <input type="number" class="qty-text" id="qty2" step="1" min="1"
                                                    max="300" name="quantity" value="${m.qty}" readonly="readonly">
                                                <a class="qty-plus"><i class="fa fa-plus" aria-hidden="true"></i></a>
                                            </div>
                                            <input type="hidden" value="${m.gid}" class="gid" /> 
                                            <a class="btn btn-danger remall">删除</a>
                                        </div>
                                    </td>
                                </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
                
                <div class="col-5 col-lg-2">
                    <div class="cart-summary affix">
                        <h3>购物车总计</h3>
                        <ul class="summary-table">
                          	<li><span style="margin-right: 5%;">总共:</span><span style="color: red;" id="totalNum">${count}</span>&nbsp;&nbsp;件宝贝</li>
                            <li><span style="margin-right: 5%;">总价:</span>￥<span style="color: red;"
                                    id="totalPri"></span></li>
                            <li><span style="margin-right: 5%;">运费:</span>￥<span style="color: red;"
                                    id="freight"></span></li>
                            <li><span style="margin-right: 5%;">总计:</span>￥<span style="color: red;" id="total"></span>
                            </li>
                        </ul>
                        <div class="cart-btn">
                            <a href="#" class="btn amado-btn">结算</a>
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
<script src="js/cart.js"></script>
<script>
var plu = document.getElementById('plusPri');
var plusNb = plu.getElementsByClassName('qty-plus');
var minus = plu.getElementsByClassName('qty-minus');
var gid=document.getElementsByClassName('gid');
var addid =document.getElementById('userid');
var each = document.getElementsByClassName('each');
var remall = document.getElementsByClassName('remall');
for (var j = 0; j < minus.length; j++) {
	let g=gid[j].value;
    let q = plu.getElementsByClassName('qty-text')[j];
    let e = each[j];
    let r = remall[j];
    plusNb[j].onclick = function () {
        if (Number(q.value) < 300) {
            $.ajax({
            type: "POST",
            contentType: 'application/x-www-form-urlencoded',
            url:"cartup.action",
            data: {
                uid:document.getElementById('userid').value,
	            gid:g,
            },
            success: function (data) {
	            console.log(data);
            },
            error: function (e) {
                console.log(e.status);
                console.log(e.responseText);
                document.write(e.responseText);
            },
        });
        res = Number(q.value) + 1;
        q.value = res;
        plus();
      };
      plus();
    };
    minus[j].onclick = function () {
            $.ajax({
            type: "POST",
            contentType: 'application/x-www-form-urlencoded',
            url:"cartdown.action",
            data: {
                uid:document.getElementById('userid').value,
	            gid:g,
            },
            success: function (data) {
	            console.log(data);
            },
            error: function (e) {
                console.log(e.status);
                console.log(e.responseText);
                document.write(e.responseText);
            },
        });
        resM = q.value - 1;
        q.value = resM;
        if (q.value == 0) {
        e.style.display='none';
        }
       /*  if(document.getElementById('totalNum').innerHTML==0){
        	document.getElementById('em').className='';
        }else{
        	document.getElementById('em').className='yin';
        } */
        plus();
    };
    r.onclick =function(){
    	$.ajax({
            type: "POST",
            contentType: 'application/x-www-form-urlencoded',
            url:"remall.action",
            data: {
                uid:document.getElementById('userid').value,
	            gid:g,
            },
            success: function (data) {
	            console.log(data);
            },
            error: function (e) {
                console.log(e.status);
                console.log(e.responseText);
                document.write(e.responseText);
            },
        });
        e.style.display='none';
        plus();
    };
};
</script>
</html>