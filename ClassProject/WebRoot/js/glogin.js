
addcart();
addzero();
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
            url:"glogin.action",
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
	            		window.location.href='http://localhost:8080/ClassProject/goods.jsp';
	            	}
	            }else{
	            	console.log(data);
	            }
            },
            error: function (e) {
                console.log(e.status);
                console.log(e.responseText);
                document.write(e.responseText);
            }
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
            url:"glogin.action",
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

function addzero(){
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
}

var mycart = document.getElementById('mycart');
var cartid =document.getElementById('userid');
mycart.onclick = function(){
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

var carts = document.getElementById('carts');
var cid =document.getElementById('userid');
carts.onclick = function(){
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

function addcart(){
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
		            	toastr.success("添加 《"+bn+"》 成功");
		            	document.getElementById('cartnum').innerHTML=Number(data);
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
                        if (JSON.parse(data).length >0) {
                        	if(JSON.parse(data).length >10){
                        		allList = JSON.parse(data);
                            	all = JSON.parse(data);
                            	pageLength = JSON.parse(data).length;
                            	window.localStorage.setItem("gname",data);
                            	var pageLi = '' ;
                            	var page =  Math.ceil(pageLength / 10) > 0 ?  Math.ceil(pageLength / 10) : 1;
                            	for(var i = 0; i < page; i ++){
                            	pageLi += '<li onclick="limit('+ parseInt(i+1)+','+"'gname'"+')" style="cursor: pointer;"><a>'+parseInt(i+1)+'</a></li>';
                            	}
                            	console.log(pageLi);
                            	document.getElementById('page').innerHTML = pageLi;
                            	$("#page>li:nth-child(1)").addClass("active");
                            	console.log(document.getElementById('page'));
                            	limit(1,'gname');
                            	document.getElementById('page').className='pagination';
                        	}else{
                            for (var i = 0; i < JSON.parse(data).length; i++) {
                                p += '<li class="tab_list col-sm-4 col-md-2">';
                                p += '<img src="' + JSON.parse(data)[i]["img"] + '" class="img-responsive center-block" title="' + JSON.parse(data)[i]["description"] + '">';
                                p += ' <div class="ctn">';
                                p += '<p><a title="' + JSON.parse(data)[i]["description"] + '" style="cursor: pointer;" class="bname">' + JSON.parse(data)[i]["gname"] + '</a>';
                                p += '<br><b>' + JSON.parse(data)[i]["author"] + '</b><br><i>' + JSON.parse(data)[i]["publi"] + '</i></p>';
                                p += '<p><span>￥</span><span class="prices">' + JSON.parse(data)[i]["price"] + '</span></p>';
                                p += '</div>';
                                p += '<input type="hidden" value="' + JSON.parse(data)[i]["gid"] + '" class="gid"/>';
                                p += '<a class="btn btn-xs btn-info lnr lnr-cart add">添加购物车</a>';
                                +'</li>';
                                $('#a').html(p);
                            };
                            document.getElementById('page').className='pagination yin';
                        	};
                            p='';
                            addcart();
                            addzero();
                           
                        } else {
                        	 toastr.warning("抱歉，未找到您想要的书籍");
                             document.getElementById('page').className='pagination yin';
                             document.getElementById('val').value='';
                        };
                    },
                    error: function (e) {
                        console.log(e.status);
                        console.log(e.responseText);
                        document.write(e.responseText);
                    }
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
                        	if(JSON.parse(data).length >10){
                        		allList = JSON.parse(data);
                            	all = JSON.parse(data);
                            	pageLength = JSON.parse(data).length;
                            	window.localStorage.setItem("author",data);
                            	var pageLi = '' ;
                            	var page =  Math.ceil(pageLength / 10) > 0 ?  Math.ceil(pageLength / 10) : 1;
                            	for(var i = 0; i < page; i ++){
                            	pageLi += '<li onclick="limit('+ parseInt(i+1)+','+"'author'"+')" style="cursor: pointer;"><a>'+parseInt(i+1)+'</a></li>';
                            	}
                            	console.log(pageLi);
                            	document.getElementById('page').innerHTML = pageLi;
                            	$("#page>li:nth-child(1)").addClass("active");
                            	console.log(document.getElementById('page'));
                            	limit(1,'author');
                            	document.getElementById('page').className='pagination';
                        	}else{
                            for (var i = 0; i < JSON.parse(data).length; i++) {
                                p += '<li class="tab_list col-sm-4 col-md-2">';
                                p += '<img src="' + JSON.parse(data)[i]["img"] + '" class="img-responsive center-block" title="' + JSON.parse(data)[i]["description"] + '">';
                                p += ' <div class="ctn">';
                                p += '<p><a title="' + JSON.parse(data)[i]["description"] + '" style="cursor: pointer;" class="bname">' + JSON.parse(data)[i]["gname"] + '</a>';
                                p += '<br><b>' + JSON.parse(data)[i]["author"] + '</b><br><i>' + JSON.parse(data)[i]["publi"] + '</i></p>';
                                p += '<p><span>￥</span><span class="prices">' + JSON.parse(data)[i]["price"] + '</span></p>';
                                p += '</div>';
                                p += '<input type="hidden" value="' + JSON.parse(data)[i]["gid"] + '" class="gid"/>';
                                p += '<a class="btn btn-xs btn-info lnr lnr-cart add">添加购物车</a>';
                                +'</li>';
                                $('#a').html(p);
                            };
                            document.getElementById('page').className='pagination yin';
                        	};
                            p='';
                            addcart();
                            addzero();
                        } else {
                        	toastr.warning("抱歉，未找到您想要的书籍");
                            document.getElementById('page').className='pagination yin';
                            document.getElementById('val').value='';
                        };
                    },
                    error: function (e) {
                        console.log(e.status);
                        console.log(e.responseText);
                        document.write(e.responseText);
                    }
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
                        	if(JSON.parse(data).length >10){
                        		allList = JSON.parse(data);
                            	all = JSON.parse(data);
                            	pageLength = JSON.parse(data).length;
                            	window.localStorage.setItem("publi",data);
                            	var pageLi = '' ;
                            	var page =  Math.ceil(pageLength / 10) > 0 ?  Math.ceil(pageLength / 10) : 1;
                            	for(var i = 0; i < page; i ++){
                            	pageLi += '<li onclick="limit('+ parseInt(i+1)+','+"'publi'"+')" style="cursor: pointer;"><a>'+parseInt(i+1)+'</a></li>';
                            	}
                            	console.log(pageLi);
                            	document.getElementById('page').innerHTML = pageLi;
                            	$("#page>li:nth-child(1)").addClass("active");
                            	console.log(document.getElementById('page'));
                            	limit(1,'publi');
                                document.getElementById('page').className='pagination';
                        	}else{
                            for (var i = 0; i < JSON.parse(data).length; i++) {
                                p += '<li class="tab_list col-sm-4 col-md-2">';
                                p += '<img src="' + JSON.parse(data)[i]["img"] + '" class="img-responsive center-block" title="' + JSON.parse(data)[i]["description"] + '">';
                                p += ' <div class="ctn">';
                                p += '<p><a title="' + JSON.parse(data)[i]["description"] + '" style="cursor: pointer;" class="bname">' + JSON.parse(data)[i]["gname"] + '</a>';
                                p += '<br><b>' + JSON.parse(data)[i]["author"] + '</b><br><i>' + JSON.parse(data)[i]["publi"] + '</i></p>';
                                p += '<p><span>￥</span><span class="prices">' + JSON.parse(data)[i]["price"] + '</span></p>';
                                p += '</div>';
                                p += '<input type="hidden" value="' + JSON.parse(data)[i]["gid"] + '" class="gid"/>';
                                p += '<a class="btn btn-xs btn-info lnr lnr-cart add">添加购物车</a>';
                                +'</li>';
                                $('#a').html(p);
                                
                            };
                            document.getElementById('page').className='pagination yin';
                            };
                            p='';
                            addcart();
                            addzero();    
                        } else {
                        	toastr.warning("抱歉，未找到您想要的书籍");
                            document.getElementById('page').className='pagination yin';
                            document.getElementById('val').value='';
                        };
                    },
                    error: function (e) {
                        console.log(e.status);
                        console.log(e.responseText);
                        document.write(e.responseText);
                    }
                });
            }else{
            	toastr.error("未知错误");
            };
        };
    };
};
};
//当前商品数据
var allList = null;
//分页后的
var nowList = null;
var all = null;
var pageLength = null;

arry=JSON.parse(window.localStorage.getItem("seaname"));
if(arry != null){
for (var i = 0; i < arry.length; i++) {
    p += '<li class="tab_list col-sm-4 col-md-2">';
    p += '<img src="' + arry[i]["img"] + '" class="img-responsive center-block" title="' + arry[i]["description"] + '">';
    p += ' <div class="ctn">';
    p += '<p><a title="' + arry[i]["description"] + '" style="cursor: pointer;" class="bname">' + arry[i]["gname"] + '</a>';
    p += '<br><b>' + arry[i]["author"] + '</b><br><i>' + arry[i]["publi"] + '</i></p>';
    p += '<p><span>￥</span><span class="prices">' + arry[i]["price"] + '</span></p>';
    p += '</div>';
    p += '<input type="hidden" value="' + arry[i]["gid"] + '" class="gid"/>';
    p += '<a class="btn btn-xs btn-info lnr lnr-cart add">添加购物车</a>';
    +'</li>';
    $('#a').html(p);
	};
document.getElementById('page').className='pagination yin';
p='';
addcart();
addzero();
window.localStorage.removeItem("seaname");
}else{
	$.ajax({
        type: "POST",
        url:"Showall.action",
        data: {
        },
        success: function (data) {
        	allList = JSON.parse(data);
        	all = JSON.parse(data);
        	pageLength = JSON.parse(data).length;
        	window.localStorage.setItem("goods",data);
        	var pageLi = '' ;
        	var page =  Math.ceil(pageLength / 10) > 0 ?  Math.ceil(pageLength / 10) : 1;
        	for(var i = 0; i < page; i ++){
        	pageLi += '<li onclick="limit('+ parseInt(i+1)+','+"'goods'"+')" style="cursor: pointer;"><a>'+parseInt(i+1)+'</a></li>';
        	}
        	document.getElementById('page').innerHTML = pageLi;
        	$("#page>li:nth-child(1)").addClass("active");
        	limit(1,'goods');
        },
        error: function (e) {
            console.log(e.status);
            console.log(e.responseText);
        },
    });
};


function limit(p1,d){
	p1 = p1 ? p1 : 1;
	nowList = allList.splice((p1-1)*10,10);
	allList = JSON.parse(window.localStorage.getItem(d));
	for (var i = 0; i < nowList.length; i++) {
	  p += '<li class="tab_list col-sm-4 col-md-2">';
	  p += '<img src="' + nowList[i]["img"] + '" class="img-responsive center-block" title="' + nowList[i]["description"] + '">';
	  p += ' <div class="ctn">';
	  p += '<p><a title="' + nowList[i]["description"] + '" style="cursor: pointer;" class="bname">' + nowList[i]["gname"] + '</a>';
	  p += '<br><b>' + nowList[i]["author"] + '</b><br><i>' + nowList[i]["publi"] + '</i></p>';
	  p += '<p><span>￥</span><span class="prices">' + nowList[i]["price"] + '</span></p>';
	  p += '</div>';
	  p += '<input type="hidden" value="' + nowList[i]["gid"] + '" class="gid"/>';
	  p += '<a class="btn btn-xs btn-info lnr lnr-cart add">添加购物车</a>';
	  +'</li>';
	  $('#a').html(p);
	};
	p = '';
	addcart();
	addzero();
};


$(function () {
    $("#page").on("click", "li", function () {
        $("#page > li").removeClass("active");
        $(this).addClass("active");
    });
});


