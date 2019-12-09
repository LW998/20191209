/*let addcar=document.getElementById('addcar');
let add=addcar.getElementsByClassName('add');
let addclick=addcar.getElementsByClassName('addclick');
for (i=0;i<add.length;i++){
	let a=add[i].value;
	addclick[i].onclick = function () {
        //alert(a);
		$.ajax({
	          //请求方式
	          type: "POST",
	          //请求地址
	          url: "http://localhost:8080/webGoods/addcarServlet",
	          contentType: "application/x-www-form-urlencoded;charset=UTF-8",
	          //数据，json字符串
	          data: { 'goodsid': a },
	          //请求成功
	          success: function (result) {
	        	  
	            if(result.length !== null) {
	            	document.write(result);
	            	
	            }else{
	            	alert(result)
	            }
	          },
	          //请求失败，包含具体的错误信息
	          error: function (e) {
	        	  history.go(0);
	        	  console.log(e.status);
	              console.log(e.responseText);
	              document.write(e.responseText);
	          }
	        });
    };
};

let delcar=document.getElementById('delcar');
let del=delcar.getElementsByClassName('del');
let delclick=delcar.getElementsByClassName('delclick');
for (i=0;i<del.length;i++){
	let a=del[i].value;
	delclick[i].onclick = function () {
        //alert(a);
		$.ajax({
	          //请求方式
	          type: "POST",
	          //请求地址
	          url: "http://localhost:8080/webGoods/deletecarServlet",
	          contentType: "application/x-www-form-urlencoded;charset=UTF-8",
	          data: { 'goodsid': a },
	          //请求成功
	          success: function (result) {
	            //document.write(result)
	            console.log(result)
	            
	            if(result.length !== null) {
	            	document.write(result);
	            	
	            }else{
	            	alert(result)
	            }
	          },
	          //请求失败，包含具体的错误信息
	          error: function (e) {
	        	  history.go(0);
	        	  console.log(e.status);
	              console.log(e.responseText);
	              document.write(e.responseText);
	          }
	        });
    };
};*/

let price = document.getElementById('eachprice');
let priceValue = price.getElementsByClassName('goodsprice');
let num =price.getElementsByClassName('number');
let total= document.getElementById('totalprice');
let totalValue=total.getElementsByClassName('total');
let count= document.getElementById('cou');
let sum=0;
let coun=0;
for (i=0;i<priceValue.length;i++){
	coun+=(Number(num[i].innerHTML));
	};
for (j=0;j<priceValue.length;j++){
sum+=(Number(num[j].innerHTML)*parseFloat(priceValue[j].innerHTML));
};
totalValue[0].innerHTML=Math.round(sum*100)/100;
count.innerHTML=coun;

/*		<buildCommand>
			<name>org.eclipse.wst.jsdt.core.javascriptValidator</name>
			<arguments>
			</arguments>
		</buildCommand>*/
