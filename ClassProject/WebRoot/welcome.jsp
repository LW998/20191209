<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  <meta charset="UTF-8">
  <title>首页</title>
   <link rel="stylesheet" href="css/bootstrap.min.css">
  </head>
  <style>
.preloader{
	position: fixed;
	top: 0;
	left: 0;
	height: 100%;
	width: 100%;
	display: table;
	background: #fff;
	z-index: 9999;
}

.preloder-wrap{
	display: table-cell;
	vertical-align: middle;
}

.preloder-inner {
	width: 200px;
	height: 100px;
	margin: 0 auto;
}
.ball {
	width: 10px;
	height: 10px;
	margin: 10px auto;
	border-radius: 50px;
}

.ball:nth-child(1) {
	background: #ff005d;
	-webkit-animation: right 1s infinite ease-in-out;
	-moz-animation: right 1s infinite ease-in-out;
	animation: right 1s infinite ease-in-out;
}

.ball:nth-child(2) {
	background: #35ff99;
	-webkit-animation: left 1.1s infinite ease-in-out;
	-moz-animation: left 1.1s infinite ease-in-out;
	animation: left 1.1s infinite ease-in-out;
}

.ball:nth-child(3) {
	background: #008597;
	-webkit-animation: right 1.05s infinite ease-in-out;
	-moz-animation: right 1.05s infinite ease-in-out;
	animation: right 1.05s infinite ease-in-out;
}

.ball:nth-child(4) {
	background: #ffcc00;
	-webkit-animation: left 1.15s infinite ease-in-out;
	-moz-animation: left 1.15s infinite ease-in-out;
	animation: left 1.15s infinite ease-in-out;
}

.ball:nth-child(5) {
	background: #2d3443;
	-webkit-animation: right 1.1s infinite ease-in-out;
	-moz-animation: right 1.1s infinite ease-in-out;
	animation: right 1.1s infinite ease-in-out;
}

.ball:nth-child(6) {
	background: #ff7c35;
	-webkit-animation: left 1.05s infinite ease-in-out;
	-moz-animation: left 1.05s infinite ease-in-out;
	animation: left 1.05s infinite ease-in-out;
}

.ball:nth-child(7) {
	background: #4d407c;
	-webkit-animation: right 1s infinite ease-in-out;
	-moz-animation: right 1s infinite ease-in-out;
	animation: right 1s infinite ease-in-out;
}
@-webkit-keyframes right {
	0%   { -webkit-transform: translate(-15px);   }
	50%  { -webkit-transform: translate(15px);    }
	100% { -webkit-transform: translate(-15px);   }
}

@-webkit-keyframes left {
	0%   { -webkit-transform: translate(15px);    }
	50%  { -webkit-transform: translate(-15px);   }
	100% { -webkit-transform: translate(15px);    }
}

@-moz-keyframes right {
	0%   { -moz-transform: translate(-15px);   }
	50%  { -moz-transform: translate(15px);    }
	100% { -moz-transform: translate(-15px);   }
}

@-moz-keyframes left {
	0%   { -moz-transform: translate(15px);    }
	50%  { -moz-transform: translate(-15px);   }
	100% { -moz-transform: translate(15px);    }
}

@keyframes right {
	0%   { transform: translate(-15px);  }
	50%  { transform: translate(15px);   }
	100% { transform: translate(-15px);  }
}

@keyframes left {
	0%   { transform: translate(15px);   }
	50%  { transform: translate(-15px);  }
	100% { transform: translate(15px);   }
}
  </style>
  
  <body>
    <div class="preloader">
    <div class="preloder-wrap">
        <div class="preloder-inner">
            <div class="ball"></div>
            <div class="ball"></div>
            <div class="ball"></div>
            <div class="ball"></div>
            <div class="ball"></div>
            <div class="ball"></div>
            <div class="ball"></div>
        </div>
    </div>
</div>
  </body>
  <script src="js/jquery-2.2.4.min.js"></script>
  <script>
  window.onload=function(){
 		$.ajax({
            type: "POST",
            url:"Show.action",
            data: {
                
            },
            success: function (data) {
	            if(data.length !== null) {
	            	window.location.href='http://localhost:8080/ClassProject/index.jsp';
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
</script>
</html>
