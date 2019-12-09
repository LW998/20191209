
var sub=document.getElementById('submit');
sub.onclick= function(){
	if(document.getElementById('name').value=='' && document.getElementById('pwd').value==''){
		toastr.info("用户名和密码不能为空");
	}else if(document.getElementById('name').value==''){
		toastr.info("用户名不能为空");
	}else if(document.getElementById('pwd').value==''){
		toastr.info("密码不能为空");
	}else{
   	 $.ajax({
            type: "POST",
            contentType: 'application/x-www-form-urlencoded',
            url:"login.action",
            data: {
                name:document.getElementById('name').value,
                pwd:document.getElementById('pwd').value,
            },
            success: function (data) {
	            console.log(data);
	            if(data.length !== null) {
	            	if (data==='0'){
	            	toastr.error("登录失败，用户名和密码不匹配");
	            	document.getElementById('name').value='';
	            	document.getElementById('pwd').value='';
	            	}else{
	            		window.location.href='http://localhost:8080/ClassProject/index.jsp';
	            		toastr.success("登录成功");
	            	}
	            }else{
	            	console.log(data);
	            }
            },
            error: function (e) {
                console.log(e.status);
                console.log(e.responseText);
                document.write(e.responseText);
            },
        });
	};
};

var mod = document.getElementById('myModal');
mod.onkeydown = function (event) {
    var e = event || window.event || arguments.callee.caller.arguments[0];
    if (e && e.keyCode == 13) {
    	if(document.getElementById('name').value=='' && document.getElementById('pwd').value==''){
    		toastr.info("用户名和密码不能为空");
    	}else if(document.getElementById('name').value==''){
    		toastr.info("用户名不能为空");
    	}else if(document.getElementById('pwd').value==''){
    		toastr.info("密码不能为空");
    	}else{
    	$.ajax({
            type: "POST",
            contentType: 'application/x-www-form-urlencoded',
            url:"login.action",
            data: {
                name:document.getElementById('name').value,
                pwd:document.getElementById('pwd').value,
            },
            success: function (data) {
	            console.log(data);
	            if(data.length !== null) {
	            	if (data==='0'){
	            		toastr.error("登录失败，用户名和密码不匹配");
	            		document.getElementById('name').value='';
		            	document.getElementById('pwd').value='';
	            	}else{
	            		window.location.href='http://localhost:8080/ClassProject/index.jsp';
	            	}
	            }else{
	            	console.log(data);
	            }
            },
            error: function (e) {
                console.log(e.status);
                console.log(e.responseText);
                document.write(e.responseText);
            },
        });
    	};
    };
};

var carts = document.getElementById('carts');
var cid =document.getElementById('userid');
carts.onclick = function(){
if(cid===null){
	 toastr.info("请先登录后查看购物车");
	}else{
 	$.ajax({
            type: "POST",
            contentType: 'application/x-www-form-urlencoded',
            url:"mycart.action",
            data: {
                uid:document.getElementById('userid').value,
            },
            success: function (data) {
	            if(data.length !== null) {
	            //document.write(data);
	            window.location.href='http://localhost:8080/ClassProject/cart.jsp';
	            }else{
	            	console.log(data);
	            }
            },
            error: function (e) {
                console.log(e.status);
                console.log(e.responseText);
                document.write(e.responseText);
            },
        });
};
};

var prices=document.querySelectorAll('.prices');
var p=null;
var ar=null;
for (i=0;i<prices.length;i++){
        p = prices[i].innerHTML.split('.');
        if (p.length < 2) {
            ar = p[0] + '.00';
        } else {  
            p[1].length < 2 ? p[1] = p[1] + '0' : null;
            ar = p.join('.');
        }
       prices[i].innerHTML = ar;
}

var gid=document.getElementsByClassName('gid');
var add=document.getElementsByClassName('add');
var addid =document.getElementById('userid');
var bname= document.getElementsByClassName('bname');
for (i=0;i<add.length;i++){
let g=gid[i].value;
let bn=bname[i].innerHTML;
add[i].onclick=function(){
if(addid===null){
	 toastr.info("请先登录后添加商品");
	}else{
$.ajax({
            type: "POST",
            url:"cartup.action",
            data: {
                uid:document.getElementById('userid').value,
                gid:g,
            },
            success: function (data) {
	            if(data.length !== null) {
	            	document.getElementById('cartnum').innerHTML=Number(data);
	            	console.log(data);
	            	toastr.success("添加 《"+bn+"》 成功");
	            }else{
	            	console.log(data);
	            }
            },
            error: function (e) {
                console.log(e.status);
                console.log(e.responseText);
                document.write(e.responseText);
            },
    });
	};
};
};

var mycart = document.getElementById('mycart');
mycart.onclick = function(){
var cartid =document.getElementById('userid');
	if(cartid === null){
		toastr.info("请先登录后查看购物车");
	}else{
 	$.ajax({
            type: "POST",
            contentType: 'application/x-www-form-urlencoded',
            url:"mycart.action",
            data: {
                uid:document.getElementById('userid').value,
            },
            success: function (data) {
	            if(data.length !== null) {
	            //document.write(data);
	           	window.location.href='http://localhost:8080/ClassProject/cart.jsp';
	            }else{
	            	console.log(data);
	            }
            },
            error: function (e) {
                console.log(e.status);
                console.log(e.responseText);
                document.write(e.responseText);
            },
        });
};
};
var selVal = document.querySelectorAll('#s option');
var inpVal = document.getElementById('val');
var seaSub = document.getElementById('sear');
var p = "";
seaSub.onclick = function () {
	var str = inpVal.value;
	var restr='';
	var parReg=/[`~!@#$^&*+()-=|{}':;',\\\[\]\.<>\/?~！@#￥……&*（）~·%——|_{}《》“”【】‘’`'；：""'。，、？\s]/g;
	for (var j=0;j<str.length;j++){
		restr = restr +str.substr(j, 1).replace(parReg, '');
	}
	inpVal.value=restr;
	if(inpVal.value==''){
		toastr.info("请输入要搜索的内容，请勿输入非法字符");
	}else{
    for (var i = 0; i < selVal.length; i++) {
        if (selVal[i].selected) {
            if (selVal[i].value == 1) {
                $.ajax({
                    type: "POST",
                    url: "gname.action",
                    data: {
                        gname: inpVal.value,
                    },
                    success: function (data) {
                        if (JSON.parse(data).length > 0) {
                            console.log(JSON.parse(data));
                          	window.localStorage.setItem("seaname",data);
                          	window.location.href="http://localhost:8080/ClassProject/goods.jsp";
                        } else {
                        	document.getElementById('val').value='';
                        	toastr.warning("抱歉，未找到您想要的书籍");
                        };
                    },
                    error: function (e) {
                        console.log(e.status);
                        console.log(e.responseText);
                        document.write(e.responseText);
                    },
                });
            } else if (selVal[i].value == 2) {
                $.ajax({
                    type: "POST",
                    url: "author.action",
                    data: {
                        author: inpVal.value,
                    },
                    success: function (data) {
                        if (JSON.parse(data).length >0) {
                            console.log(JSON.parse(data));
                             window.localStorage.setItem("seaname",data);
                             window.location.href="http://localhost:8080/ClassProject/goods.jsp";
                        } else {
                        	document.getElementById('val').value='';
                        	toastr.warning("抱歉，未找到您想要的书籍");
                        };
                    },
                    error: function (e) {
                        console.log(e.status);
                        console.log(e.responseText);
                        document.write(e.responseText);
                    },
                });
            } else  if (selVal[i].value == 3) {
                $.ajax({
                    type: "POST",
                    url: "publi.action",
                    data: {
                        publi: inpVal.value,
                    },
                    success: function (data) {
                        if (JSON.parse(data).length >0) {
                          console.log(JSON.parse(data));
                          window.localStorage.setItem("seaname",data);
                          window.location.href="http://localhost:8080/ClassProject/goods.jsp";
                        } else {
                        	document.getElementById('val').value='';
                        	toastr.warning("抱歉，未找到您想要的书籍");
                        };
                    },
                    error: function (e) {
                        console.log(e.status);
                        console.log(e.responseText);
                        document.write(e.responseText);
                    },
                });
            }else{
            	toastr.error("未知错误");
            };
        };
    };
};
};
