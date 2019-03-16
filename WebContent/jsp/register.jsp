<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + 
                                      request.getServerName() + ":" +
                                      request.getServerPort() + path;
%>  
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="<%=basePath%>/js/jquery-3.3.1.js"></script>
<script type="text/javascript" src="<%=basePath%>/js/main.js"></script>
<script>
	$(document).ready(function() { 
	$('input[type=radio][name=sex]').change(function() { 
	if (this.value=='man')
	{ 
		$('.woman').hide();
		$(".man").show();	
	}
	else if (this.value == 'woman') 
	{ 
		$('.man').hide();
		$(".woman").show();
	}
	});
	$('img').click(function() { 
		if($(this).attr('id')=='mheadA'){
			$('#mheadB').removeClass();
			$('#mheadA').addClass('class2');
			$("#mheadB").attr("isSelect","0");//通过判断isSelect属性向后台传递选择的模型信息
			$("#mheadA").attr("isSelect","1");
		}
		if($(this).attr('id')=='mheadB'){
			$('#mheadA').removeClass();
			$('#mheadB').addClass('class2');
			$("#mheadA").attr("isSelect","0");
			$("#mheadB").attr("isSelect","1");
		}
		if($(this).attr('id')=='wheadA'){
			$('#wheadB').removeClass();
			$('#wheadA').addClass('class2');
			$("#wheadB").attr("isSelect","0");
			$("#wheadA").attr("isSelect","1");
		}
		if($(this).attr('id')=='wheadB'){
			$('#wheadA').removeClass();
			$('#wheadB').addClass('class2');
			$("#wheadA").attr("isSelect","0");
			$("#wheadB").attr("isSelect","1");
		}
	});
	$('img').hover(function() { 
		$(this).addClass('class1');
	});
	$('img').mouseover(function() { 
		$(this).addClass('class1');
	});
	$('img').mouseout(function() { 
		$(this).removeClass("class1");
	});
});
</script>
<style type="text/css">
			*{
				margin:0;
				padding:0;
				}
			#wrap{
				height:100%;
				width: 100%;
				position: absolute;
				background-image: url("<%=basePath%>/images/ui/registerBackground.jpg");
				background-size: 100% 100%;
			}
			#login{
				position: absolute;
				width: 325px;
				height: auto;
				left: 50%;
				margin:70px 0 0 -160px;
				background-color: rgba(208,216,223 ,0.8);
				border-bottom: 3px solid rgb(141,148,153);
				border-right:3px solid rgb(141,148,153) ;
				box-shadow:rgb(170,178,172)  0.3em 0.3em 0.2em ;
				border-radius: 3px;
			}
			#block1{
				margin-top: 5px;
				margin-left: 7px;
				height:35px;
				width: 318px;
				background-color: rgb(34,34,34);
				color: rgb(180,180,178);
				text-align: center;
				font-size: 23px;
				line-height: 35px;
				font-weight: bolder;
				font-family:simsun;
				border-radius: 2px;
				box-shadow:rgb(50,50,50)  0em 0.1em 0.2em ;
			}
			.style1{
				margin-left: 0px;
				width: 180px;
				height: 30px;
				background-color: transparent;
				border: 0;
				border-bottom: 4px solid rgb(200,200,200);
				border-radius: 7px;
				font-family:"";
				font-size: 20px;
				color:rgb(60,60,60);
			}
			p{
				color: rgb(130,130,130);
				margin-top: 18px;
				margin-left: 15px;
				font-size: 20px;
				line-height: 30px;
				font-weight: bold;
			}
			.button1{
				width: 300px;
				height: 30px;
				margin: 10px 0 0 15px;
				background-image:url("<%=basePath%>/images/ui/subTitle.png");
				background-size: 100% 100%;
				color: rgb(130,130,130);
				font-size: 19px;
				line-height: 26px;
				font-weight: bold;
				border: 3px solid rgb(190,202,227);
			}
			.style2{
				width: 115px;
				height: 35px;
				margin: 15px 0 0 25px;
				border-radius: 8px;
				color: rgb(220,222,221);
				font-size: 20px;
				line-height: 30px;
				font-weight: bold;
				background-color: rgb(54,121,204);
				margin-bottom: 10px;
			}
			input:focus{
				border: 3px solid rgb(190,202,227);
			}
			#img{
				margin: 10px 0 0 15px;
				width: 300px;
				height:120px;
				display: none ;
			}
			hr{
				margin: 10px 0 0 15px;
				width: 300px;
				border: 0;
				border-bottom: 2px solid rgb(182,182,182);
			}
			img{
				border: 2px solid transparent ;
			}
			.class1{
				cursor: pointer;
				border: 2px solid rgb(249,239,228);
				border-radius: 3px;
				box-shadow:rgb(40,40,40)  0.3em 0.3em 0.2em ;
			}
			.class2{
				cursor: pointer;
				border: 2px solid rgb(249,239,228);
				border-radius: 3px;
				box-shadow:rgb(40,40,40) inset  0.3em 0.3em 0.2em ;
			}
		</style>
</head>
<body>
	<div id="wrap">
			<div id="login">
				<div id="block1">注册</div>
				<form>
					<p>用户名称：<input type="text" class="style1" id="username" value=""/></p>
					<p>用户实名：<input type="text" class="style1" id="realName" value=""/></p>
					<p>密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码：<input type="password" class="style1" id="password" value=""/></p>
					<p>密码确认：<input type="password" class="style1" id="password1" value=""/></p>
					<p>性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别：
					<label for="male">男</label>
					<input type="radio" name="sex" id="male" value="man" />
  					<label for="female">女</label>
					<input type="radio" name="sex" id="female" value="woman" /> </p>
					<input type="button"  class="button1"  value="类型选择" />
					<hr  />
					<div id="img" class="man">
					<img id="mheadA"  src="<%=basePath%>/images/data/model/mheadA.png" width="65px" height="120px" style="margin-left: 60px;" />
					<img id="mheadB"  src="<%=basePath%>/images/data/model/mheadB.png" width="65px" height="120px" style="margin-left: 40px;"/>
					</div>
					<div id="img" class="woman">
					<img id="wheadA"  src="<%=basePath%>/images/data/model/wheadA.png" width="65px" height="120px" style="margin-left: 60px;" />
					<img id="wheadB"  src="<%=basePath%>/images/data/model/wheadB.png" width="65px" height="120px" style="margin-left: 40px;"/>
					</div>
					<input id="register" type="button" class="style2" value="点击注册" />
					<input id="goBack" type="button"  class="style2" value="返回登录" style="background-color: rgb(250,101,99);" onclick="window.location.href='login.jsp'"/>
				</form>
				
			</div>
		</div>
</body>
	<script type="text/javascript">
		$(document).ready(function () {
			$("#register").click(function () {
				//获取用户填入的信息,并判断合法性
				var username = $("#username").val();
				if(!isVaild(username)){
					alert("用户名不能为空!");
					return;
				}
				
				var password = $("#password").val();
				if(!isVaild(password)){
					alert("密码不能为空!");
					return;
				}
				
				var realName = $("#realName").val();
				if(!isVaild(realName)){
					alert("用户实名不能为空!");
					return;
				}
				
				var password1 = $("#password1").val();
				if(!isVaild(password1)){
					alert("第二次密码不能为空!");
					return;
				}
				
				var sex = $("input:radio[name='sex']:checked").val();
				console.log("sex",sex);
				if(sex == null){
					alert("请选择性别!");
					return;
				}
				
				var image;
				if(sex=="man"){
					if($("#mheadA").attr("isSelect") != "1" && $("#mheadB").attr("isSelect") != "1" ){
						event.preventDefault();
						alert("请选择人物模型!");
						return;
					}else if($("#mheadA").attr("isSelect") == "1"){
						image ="mheadA";
					}else{
						image = "mheadB";
					}
				}else{
					if($("#wheadA").attr("isSelect") != "1" && $("#wheadB").attr("isSelect") != "1" ){
						event.preventDefault();
						alert("请选择人物模型!");
						return;
					}else if($("#wheadA").attr("isSelect") == "1"){
						image ="wheadA";
					}else{
						image = "wheadB";
					}
				}
				//判断两次输入的密码是否一致
				if(password != password1){
					alert("两次密码不一致!")
					return;
				}
				//保证后台的数据的合法性
				var regex = /^[a-zA-Z0-9]{3,20}$/;
				if(!regex.test(username)){
					alert("用户名需为长度为3~20的字母和数字组合！");
					return;
				}
				if(!regex.test(password)){
					alert("密码需为长度为3~20的字母和数字组合！");
					return;
				}
				if(realName.length > 10){
					alert("用户实名的长度应小于等于10！");
					return;
				}
								
				//将传送数据转为json对象
				var data={username:username,password:password,realName:realName,sex:sex,image:image};
				console.log(data);
				//request(method,url,data,contentType,successCallBack,errorCallBack,async)
				request("POST","<%=basePath%>/userInfo/register",JSON.stringify(data),"application/json",registerCallback,serverError,true);
				
			});
		});
		
		//成功注册则跳转至登录界面
		function registerCallback(data) {
			//注册失败
			if(data.code == -1){
				alert(data.description);
			} else{
				alert(data.description);
				window.location.href="login.jsp";
			}
		}
		
	</script>
</html>