<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%
 	String path = request.getContextPath();
 	String basePath = request.getScheme()+"://"+request.getServerName()+":"
 			+request.getServerPort()+path;
 %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录</title>
<script type="text/javascript" src="<%=basePath%>/js/jquery.min.js">
</script>
<script type="text/javascript" src="<%=basePath%>/js/main.js"></script>
<style type="text/css">
	*{
		margin: 0;
		padding: 0;
	}
	#wrapper{
		background-image:url("<%=basePath%>/images/ui/loginWindowBg1920.png");
		background-size:100% 100%;
		position:absolute;
		width: 100%;
		height:100%;
	}
	#loginWindow{
		background-color:rgba(232,232,232,0.5);
		width: 250px;
		height: 350px;
		position: absolute;
		left:29%;
		top:22%;
	}
	#logo{
		width: 100px;
		height: 100px;
		margin: 20px auto;
	}
	#logoword{
		position: absolute;
		left:50%;
		top:25%;
	}
</style>
</head>
<body>
	<div id="wrapper">
		<div id="loginWindow">
			<div id="logo" >
				<img alt="picture not found" src="<%=basePath%>/images/ui/logo.png" width="100px" height="100px;">
			</div>
			<input id="username"  type="text" name="username" placeholder="用户名">
			<input id="password"  type="password" name="password" placeholder="密码">
			<button id="login" >我要登录</button>
			<button id="register" >我要注册</button>
		</div>
		<div id="logoword">
			<img alt="pic not found" src="<%=basePath%>/images/ui/logoWord.png">
		</div>
	</div>
</body>
<script type="text/javascript">
	$(document).ready(function() {
		$("input").css({"width":"246px","height":"30px","border-radius":"8px","font-size":"15px","border-bottom":"1px solid gray","border-left":"0px solid gray","border-top":"0px solid gray","border-right":"0px solid gray","background-color":"rgba(0,0,0,0)"});
		$("#password").css("margin-top","15px");
		$("button").css({"width":"244px","height":"45px","border":"0","border-radius":"8px","color":"white","font-size":"15px","cursor":"auto"});
		$("#login").css({"background":"linear-gradient(to bottom,rgb(66,66,66) 0%,rgb(111,111,111) 50%,rgb(66,66,66) 100%)","margin":"15px 2px 0px 2px"});
		$("#register").css({"background":"linear-gradient(to bottom,rgb(188,188,188) 0%,rgb(144,144,144) 50%,rgb(189,192,188) 100%)","margin":"5px 2px 0px 2px"});
		//登录按钮点击事件
		$("#login").click(function () {
			var username = $("#username").val(); //获得了用户输入的用户名
			var password = $("#password").val();
			console.log("username",username); 
			console.log("password",password);
			if(!isVaild(username)){
				alert("用户名不能为空!")
				return;
			}
			if(!isVaild(password)){
				alert("密码不能为空!")
				return;
			}		
			var user={username:username,password:password};
			//request(method,url,data,contentType,successCallBack,errorCallBack,async)
			request("POST","<%=basePath%>/userInfo/login",JSON.stringify(user),"application/json",successLoginCallBack,serverError,true);
		});
		//注册按钮点击事件
		$("#register").click(function () {
			window.location.href = "register.jsp";
		});
		//获取缓存
		request("POST","<%=basePath%>/userInfo/cache",JSON.stringify({}),"application/json",showMessage,null,true);
	});
	
	function successLoginCallBack(data) {
		showMessage(data);
		if(data.code==-1){
			alert(data.description);
		}
		if(data.code==0){
			alert(data.description);
			window.location.href="index.jsp";
		}
	}
	
</script>
</html>