plus();

function plus() {
    //元素最外层div
    var plusPri = document.getElementById('plusPri');
    //商品价格
    var pri = plusPri.querySelectorAll('.price span');
    //商品数量
    var qty = plusPri.getElementsByClassName('qty-text');
    //总价
    var totalPri = document.getElementById('totalPri');
    //运费
    var freight = document.getElementById('freight');
    //总计
    var total = document.getElementById('total');
    //初始变量
    var totalNum = document.getElementById('totalNum');
    var every = document.getElementsByClassName('each');
    var res = null;
    var totRes = null;
    var priRes = null;
    var ar = null;
    var num = null;
    //循环拿出价格框里的值
    for (var x = 0; x < pri.length; x++) {
        //通过小数点分隔变成数组
        p = pri[x].innerHTML.split('.');
        //判断数组长度，如果小于2说明价格无小数
        if (p.length < 2) {
            //在价格后加.00
            ar = p[0] + '.00';
        } else {
            //不小于2说明小数点后有值
            //判断第二项的长度，小于2说明只有一位小数
            //在小数点后补0变成两位小数
            p[1].length < 2 ? p[1] = p[1] + '0' : null;
            //数组转字符串
            ar = p.join('.');
        }
        //让页面显示转换后的价格
        pri[x].innerHTML = ar;
    }
    //循环取出价格
    for ( var i = 0; i < pri.length; i++) {
    	if(every[i].style.display=='none'){
    		qty[i].value=0;
    		pri[i].innerHTML=0;
    	}
        //让数量*价格
        res += Number(qty[i].value) * parseFloat(pri[i].innerHTML);
        num += Number(qty[i].value);
    }
    if(num==null){
    	totalNum.innerHTML=0;
    }else{
    	totalNum.innerHTML=num;
    }
    //如果价格大于88运费为0，小于88运费为12
    res == null || num==0 ?freight.innerHTML = '0.00':(res > 88?freight.innerHTML = '0.00' : freight.innerHTML = '12.00');
    //总价加上0运费
    sum = res + Number(freight.innerHTML);
    //总价+运费的值四舍五入转为字符串
    a = (Math.round(sum * 100) / 100).toString();
    //总价的值四舍五入
    b = (Math.round(res * 100) / 100).toString();
    //总价+运费的值补零
    c = a.split('.');
    if (c.length < 2) {
        priRes = c[0] + '.00';
    } else {
        c[1].length < 2 ? c[1] = c[1] + '0' : null;
        priRes = c.join('.');
    }
    //总价补零
    d = b.split('.');
    if (d.length < 2) {
        totRes = d[0] + '.00';
    } else {
        d[1].length < 2 ? d[1] = d[1] + '0' : null;
        totRes = d.join('.');
    }
    //赋值
    totalPri.innerHTML = totRes;
    total.innerHTML = priRes;
    if(document.getElementById('totalNum').innerHTML==0){
    	document.getElementById('em').className='';
    }else{
    	document.getElementById('em').className='yin';
    }
}

$(function () {
    $(".myNav").on("click", "li", function () {
        $(".myNav > li").removeClass("active");
        $(this).addClass("active");
    })
});

var mycart = document.getElementById('mycart');
mycart.onclick = function(){
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
