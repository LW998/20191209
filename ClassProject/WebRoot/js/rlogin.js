
var sub=document.getElementById('submit');

sub.onclick= function(){
	if(document.getElementById('name').value=='' && document.getElementById('pwd').value==''){
		toastr.info("用户名和密码不能为空");
	}else if(document.getElementById('name').value==''){
		toastr.info("用户名不能为空");
	}else if(document.getElementById('lpwd').value==''){
		toastr.info("密码不能为空");
	}else{
   	 $.ajax({
            type: "POST",
            contentType: 'application/x-www-form-urlencoded',
            url:"rlogin.action",
            data: {
                name:document.getElementById('name').value,
                pwd:document.getElementById('lpwd').value,
            },
            success: function (data) {
	            console.log(data);
	            if(data.length !== null) {
	            	if (data==='0'){
	            		toastr.error("登录失败，用户名和密码不匹配");
		            	document.getElementById('name').value='';
		            	document.getElementById('lpwd').value='';
	            	}else{
	            		window.location.href='http://localhost:8080/ClassProject/register.jsp';
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
    	}else if(document.getElementById('lpwd').value==''){
    		toastr.info("密码不能为空");
    	}else{
    	$.ajax({
            type: "POST",
            contentType: 'application/x-www-form-urlencoded',
            url:"rlogin.action",
            data: {
                name:document.getElementById('name').value,
                pwd:document.getElementById('lpwd').value,
            },
            success: function (data) {
	            console.log(data);
	            if(data.length !== null) {
	            	if (data==='0'){
	            		toastr.error("登录失败，用户名和密码不匹配");
		            	document.getElementById('name').value='';
		            	document.getElementById('lpwd').value='';
	            	}else{
	            		window.location.href='http://localhost:8080/ClassProject/register.jsp';
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
};

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