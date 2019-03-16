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
<script type="text/javascript" src="<%=basePath%>/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/js/main.js"></script>
<link rel="stylesheet" href="<%=basePath%>/css/my.css" type="text/css">
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
		margin: 0;
		padding: 0;
	}
	#list{
		margin: 0 auto;
		margin-top: 15%;
	}
	table{
		border-spacing: 0 0;
	}
	tr.content:hover{
		background-color:#b5b5b5;
	}
	th{
		border: 1px solid black;
		border-radius:5px;
		background-color: #636363;
		color: white;
	}
	tr{
		background-color:white;
	}
	td{
		text-align:center;
		border: 1px solid black;
		
	}
	button{
		width:80px;
		height:30px;
		border-radius:8px;
		border:0;
		color:white;
	}
	
	/*------------------*/
			#login{
				position: absolute;
				width: 325px;
				height: auto;
				left: 50%;
				top:0;
				margin:35px 0 0 -160px;
				background-color: rgba(208,216,223 ,1);
				border-bottom: 3px solid rgb(141,148,153);
				border-right:3px solid rgb(141,148,153) ;
				box-shadow:rgb(170,178,172)  0.3em 0.3em 0.2em ;
				border-radius: 3px;
				display: none;
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
				height: 23px;
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
				box-shadow:rgb(40,40,40)   0.3em 0.3em 0.2em inset;
			}
			/*.border{
				border: 2px solid transparent ;
			}*/
</style>
</head>
<body>
	<div id="wrap">
	<div id="list">
		<table id="table">
			<tr>
				<th style="padding:0 7px;">id</th>
				<th style="padding:0 15px;">用户名称</th>
				<th style="padding:0 15px;">用户实名</th>
				<th style="padding:0 7px;">性别</th>
				<th style="padding:0 15px;">模型选择</th>
				<th style="padding:0 15px;">是否管理员</th>
				<th style="padding:0 100px;">操作</th>
			</tr>
				<tr id="template">
					<td id="id"></td>
					<td id="username"></td>
					<td id="realName"></td>
					<td id="sex"></td>
					<td id="image"><img id="headImage" alt="not found"></td>
					<td id="power"></td>
					<td id="operation"></td>
				</tr>
		</table>
		</div>
	</div>
	
	<div id="login">
				<div id="block1">信息修改</div>
				<form>
					<input type="hidden" id="curUsername">
					<p>用户名称：<input type="text" class="style1" id="username1" value=""/></p>
					<p>用户实名：<input type="text" class="style1" id="realName1" value=""/></p>
					<p>密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码：<input type="password" class="style1" id="password1" placeholder="如无需修改请留空"/></p>
					<p>密码确认：<input type="password" class="style1" id="password2" placeholder="如无需修改请留空"/></p>
					<p>性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别：
					<label for="male">男</label>
					<input type="radio" name="sex" id="male" value="man" />
  					<label for="female">女</label>
					<input type="radio" name="sex" id="female" value="woman" /> </p>
					<input type="button"  class="button1"  value="类型选择" />
					<hr  />
					<div id="img" class="man">
					<img id="mheadA" class="m"  src="<%=basePath%>/images/data/model/mheadA.png" width="65px" height="120px" style="margin-left: 60px;" />
					<img id="mheadB" class="m" src="<%=basePath%>/images/data/model/mheadB.png" width="65px" height="120px" style="margin-left: 40px;"/>
					</div>
					<div id="img" class="woman">
					<img id="wheadA" class="w" src="<%=basePath%>/images/data/model/wheadA.png" width="65px" height="120px" style="margin-left: 60px;" />
					<img id="wheadB" class="w" src="<%=basePath%>/images/data/model/wheadB.png" width="65px" height="120px" style="margin-left: 40px;"/>
					</div>
					<div style="text-align: center;margin-top:2px">
					是否为管理员
					<input type="radio" name="isAdmin" value="yes">是
					<input type="radio" name="isAdmin" value="no">否
					</div>
					<input id="alter" type="button" class="style2" value="点击修改" />
					<input id="goBack" type="button"  class="style2" value="取消" style="background-color: rgb(250,101,99);"/>
				</form>
				
			</div>
</body>
<script type="text/javascript">
	$(document).ready(function () {
		//将模板隐藏
		$("#template").hide();
		//设置样式
		$("#list").width($("#table").width());
		$("#goBack").click(function () {
			request("POST","<%=basePath%>/userInfo/all",JSON.stringify({}),"application/json",list,serverError,true);
			//刷新页面，若将自己的管理员权限撤销，就无法再看见所有成员的信息
			$(".content").remove();
			$("#login").hide();
		});
		//页面初始化请求数据
		//request(method,url,data,contentType,successCallBack,errorCallBack,async)
		request("POST","<%=basePath%>/userInfo/all",JSON.stringify({}),"application/json",list,serverError,true);
		
		//修改按钮注册事件
		$("#alter").click(function () {
			//获取用户填入的信息,并判断合法性
			var username = $("#curUsername").val();
			
			var realName = $("#realName1").val();
			if(!isVaild(realName)){
				alert("用户实名不能为空!");
				return;
			}
			
			
			var sex = $("input:radio[name='sex']:checked").val();
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
			
			var password = $("#password1").val();
			var password1 = $("#password2").val();
			if(password != "" || password1 != ""){
					if(password!=password1){
					alert("两次密码不一致!");
					return;
				}
			}
			//获取是否设置为管理员
			var power;
			if($("input:radio[name=isAdmin]:checked").val() == "yes"){
				power = "管理员";
			}else{
				power = "普通用户";
			}
			
			//保证后台的数据的合法性
			var regex = /^[a-zA-Z0-9]{3,20}$/;
			if(password != "" && !regex.test(password)){
				alert("密码需为长度为3~20的字母和数字组合！");
				return;
			}
			if(realName.length > 10){
				alert("用户实名的长度应小于等于10！");
				return;
			}
			
			//将传送数据转为json
			var data={username:username,password:password,realName:realName,sex:sex,image:image,power:power};
			console.log(data);
			//request(method,url,data,contentType,successCallBack,errorCallBack,async)
			request("POST","<%=basePath%>/userInfo/alter",JSON.stringify(data),"application/json",successAlter,serverError,true);
			
		});
		
		
	});
	
	//修改成功回调函数
	function successAlter(data) {
		alert(data.description);
		if (data.code == 1){  //修改的为当前用户
			request("POST","<%=basePath%>/userInfo/getOne",JSON.stringify(data.data),"application/json",initCurUser,serverError,true);
			$(window.parent.banner.document).find("#curLoginUser").html(data.data.realName);
		} else{  //is 0
			request("POST","<%=basePath%>/userInfo/getOne",JSON.stringify(data.data),"application/json",initCurUser,serverError,true);
		}
	}
	
	//列出所有用户的信息
	function list(data) {
		if(data.code == 0){
			$(".content").remove();
			$(data.data).each(function (index,item) {
				var temp = $("#template").clone();
				$(temp).show();
				$(temp).attr("id",index+1);
				$(temp).addClass("content");
			
			//填充数据并设置hover属性
				var oldColor = $(temp).find("#id").css("background-color");
				$(temp).find("#id").html(item.id).hover(function () {
					$(this).css("background-color","#d47a7a");
				},function(){
					$(this).css("background-color",oldColor);
				});
			
				$(temp).find("#username").html(item.username).hover(function () {
					$(this).css("background-color","#d47a7a");
				},function(){
					$(this).css("background-color",oldColor);
				});
			
				$(temp).find("#realName").html(item.realName).hover(function () {
					$(this).css("background-color","#d47a7a");
				},function(){
					$(this).css("background-color",oldColor);
				});
			
				$(temp).find("#sex").html(item.sex).hover(function () {
					$(this).css("background-color","#d47a7a");
				},function(){
					$(this).css("background-color",oldColor);
				});
			
				var src = "<%=basePath%>/images/data/model/"+item.image+".png";
				$(temp).find("#headImage").attr("src",src).width("50px").height("60px");
				$(temp).find("#image").hover(function () {
					$(this).css("background-color","#d47a7a");
				},function(){
					$(this).css("background-color",oldColor);
				});
			
				if(item.power == "管理员"){
					$(temp).find("#power").html("是").hover(function () {
						$(this).css("background-color","#d47a7a");
					},function(){
						$(this).css("background-color",oldColor);
					});
				}
				else{
					$(temp).find("#power").html("").hover(function () {
						$(this).css("background-color","#d47a7a");
					},function(){
						$(this).css("background-color",oldColor);
					});
				}
			
				var alterBtn = $("<button></button>")
				$(alterBtn).html("修改");
				$(alterBtn).css("background-color","#407ec4");
			//给每个用户信息后面的修改按钮注册事件
				$(alterBtn).click(function () {
					$("#password1").val("");
					$("#password2").val("");
					console.log("item",item);
					request("POST","<%=basePath%>/userInfo/getOne",JSON.stringify(item),"application/json",initCurUser,serverError,true);
					//将表单显示出
					$("#login").show();
				});
				var deleteBtn = $("<button></button>")
				$(deleteBtn).html("删除");
				$(deleteBtn).css("background-color","#e95862");
			//给每个用户信息后面的删除按钮注册事件
				$(deleteBtn).click(function () {
					//自己不能删除自己
					var curUsername = "${sessionScope.curUser.username}";
					if(item.username == curUsername){
						alert("无法删除自己的账号!");
						return;
					}
					//弹出对话框
					var isDelete = confirm("确定要删除吗？")
					if(isDelete){
						request("POST","<%=basePath%>/userInfo/del",JSON.stringify(item),"application/json",delSuccess,serverError,true);
					}
				});
				$(temp).find("#operation").append(alterBtn).append(deleteBtn).hover(function () {
					$(this).css("background-color","#d47a7a");
				},function(){
					$(this).css("background-color",oldColor);
				});
				$("table").append(temp);
			});
		}else{
			alert(data.description);
		}
		
	}
	
	//成功删除回调函数
	function delSuccess(data) {
		alert(data.description);
		request("POST","<%=basePath%>/userInfo/all",JSON.stringify({}),"application/json",list,serverError,true);
	}
	
	//初始化表单信息
	function initCurUser(data) {
		console.log(data);
		console.log(data.data);
		var username = data.data.username;
		var realName = data.data.realName;
		var sex = "input:radio[name=sex][value="+data.data.sex+"]";//input:radio[value=man]
		var image = "#"+data.data.image; //#wheadB
		$("#username1").val(username).attr("readonly","true");
		$("#curUsername").val(username);
		$("#realName1").val(realName);
		console.log("sex",sex);
		$(sex).prop("checked",true);
		var show = "."+data.data.sex;
		if(data.data.sex == "man"){
			$(show).show();
			$(".woman").hide();
		} else{
			$(show).show();
			$(".man").hide();
		}
		var img = data.data.image;
		if(data.data.sex =="man"){
			$(".m").removeClass("class2").attr("isSelect","0");
		}
		else{
			$(".w").removeClass("class2").attr("isSelect","0");
		}
		$(image).addClass('class2').attr("isSelect","1");
		if(data.data.power == "管理员"){
			$("input:radio[name=isAdmin][value=yes]").prop("checked",true);
		}else{
			$("input:radio[name=isAdmin][value=no]").prop("checked",true);
		}
	}
</script>
</html>