/*$(function () {
    $(".myNav").on("click", "li", function () {
        $(".myNav > li").removeClass("active");
        $(this).addClass("active");
    })
})*/
var reg = document.getElementById('registerer');
var inputs = reg.getElementsByTagName('input');
var m = reg.getElementsByClassName('msg');
var b = reg.getElementsByClassName('sub')[0];
var arr = [];
var telReg= /^1(3|4|5|6|7|8|9)\d{9}$/;
var nameReg = /^[a-zA-Z0-9_-]{4,16}$/;
var pwdReg = /^[a-zA-Z\d_]{8,}$/;

inputs[0].addEventListener('change', function () {
    if (nameReg.test(inputs[0].value)) {
    	 $.ajax({
             type: "POST",
             url:"decide.action",
             data: {
                 name:document.getElementById('username').value,
             },
             success: function (data) {
 	            console.log(data);
 	            if(data.length !== null) {
 	            	if (data==='1'){
 	            		m[0].innerHTML = '用户名已存在';
 	 	 	              m[0].style.color = 'red';
 	            	}else{
 	            		m[0].innerHTML = '√';
	                   m[0].style.color = 'green';
 	            	}
 	            }else{
 	            	alert(data);
 	            }
             },
             //请求失败，包含具体的错误信息
             error: function (e) {
                 console.log(e.status);
                 console.log(e.responseText);
                 document.write(e.responseText);
             }
         })
    } else {
        m[0].innerHTML = '用户名不合法';
        m[0].style.color = 'red';
    }

})
//判断密码8位以上
inputs[1].addEventListener('change', function () {
    if (inputs[1].value.length < 6) {
        m[1].innerHTML = '请输入6位以上密码';
        m[1].style.color = 'red';
    } else {
        m[1].innerHTML = '√';
        m[1].style.color = 'green';
    }
})
// 判断二次密码一致
inputs[2].addEventListener('change', function () {
    if (inputs[1].value != inputs[2].value) {
        m[2].innerHTML = '二次密码输入不一致';
        m[2].style.color = 'red';
    } else if (inputs[1].value) {
        m[2].innerHTML = '√';
        m[2].style.color = 'green';
    }
})
inputs[3].addEventListener('change', function () {
    if (inputs[3].value) {
        m[3].innerHTML = '√';
        m[3].style.color = 'green';
    } else {
        m[3].innerHTML = '请填写地址';
        m[3].style.color = 'red';
    }
})
inputs[4].addEventListener('change', function () {
    if (telReg.test(inputs[4].value)) {
        m[4].innerHTML = '√';
        m[4].style.color = 'green';
    } else {
        m[4].innerHTML = '手机号格式不对';
        m[4].style.color = 'red';
    }
})
// 提交
b.addEventListener('click', function () {
    arr = []
    if (!inputs[0].value) {
        m[0].innerHTML = '用户名不能为空';
        m[0].style.color = 'red';
    }
    if (!inputs[1].value) {
        m[1].innerHTML = '密码不能为空';
        m[1].style.color = 'red';
    }
    if (!inputs[2].value) {
        m[2].innerHTML = '确认密码不能为空';
        m[2].style.color = 'red';
    }
    if (!inputs[3].value) {
        m[3].innerHTML = '请填写地址';
        m[3].style.color = 'red';
    }
    if (!inputs[4].value) {
        m[4].innerHTML = '手机号码不能为空';
        m[4].style.color = 'red';
    }
    if (inputs[5].checked == true) {
        m[5].innerHTML = '√';
        m[5].style.display = 'none';
    } else {
        m[5].innerHTML = '请勾选同意';
        m[5].style.color = 'red';
    }
    for (var i = 0; i < m.length; i++) {
        arr.push(m[i].innerHTML)
    }
    console.log(arr)
    var end = arr.every(function (item, index) {
        return item == '√';
    })
    if (end) {
        // document.getElementsByClassName("con").onsubmit();
        $.ajax({
            //请求方式
            type: "POST",
            //请求的媒体类型
            //contentType: "application/json;charset=UTF-8",
            //请求地址
//            url: "user/reg.action?name="+document.getElementById('username').value+
//            "&pwd="+document.getElementById('pwd').value+
//            "&addr="+document.getElementById('addr').value+
//            "&tel="+document.getElementById('tel').value,
            url:"reg.action",
            //数据，json字符串
            data: {
                name:document.getElementById('username').value,
                pwd:document.getElementById('pwd').value,
                addr:document.getElementById('addr').value,
                tel:document.getElementById('tel').value,
            },
            //请求成功
            success: function (data) {
            	 //document.write(result)
	            console.log(data);
	            
	            if(data.length !== null) {
	            	document.write(data);
	            }else{
	            	alert(data);
	            }
            },
            //请求失败，包含具体的错误信息
            error: function (e) {
                console.log(e.status);
                console.log(e.responseText);
                document.write(e.responseText);
            }
        })
    }
})