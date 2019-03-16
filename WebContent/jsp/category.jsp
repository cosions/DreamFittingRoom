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
<link rel="stylesheet" href="<%=basePath%>/css/my.css" type="text/css">
<script type="text/javascript" src="<%=basePath%>/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/js/main.js"></script>
<style type="text/css">
	*{
		margin: 0;
		padding:0;
	}
	.box{
		width:19%;
		height:24%;
		text-align: center;
		border: 1px solid black;
		float: left;
		margin: 5px;
		background-color: #989898;
	}
	input{
		width:70%;
		height: 21px;
		border-radius:3px;
		border:0;
		background-color: #d8d8d8;
	}
	p{
		border: 1px solid black;
		width:70%;
		margin:5px 15% 5px 15%;
		border-radius:5px;
		background: linear-gradient(to top left, #908c8c,#b6b6bf);
		color: #e2dfdf;
	}
	.input{
		margin-top: 3px;
		margin-bottom: 3px;
	}
	button{
		margin-bottom: 5px;
		margin-top: 5px;
		border-radius:5px;
		border:0;
		border-bottom:1px solid black;
		border-right:1px solid black;
		width:50px;
		height:25px;
		background: linear-gradient(to top left, #908c8c,#b6b6bf);
		color: #e2dfdf;
	}
</style>
</head>
<body>
	<div id="wrap">
		<div id="addClothing" class="box">
			<p>服饰类别</p>
			<div class="input"><span>编号：</span><input id="newCode" type="text" name="code" placeholder="请输入服饰编号"></div>
			<div class="input"><span>名称：</span><input id="newName" type="text" name="cname" placeholder="请输入服饰名称"></div>
			<button id="addBtn">添加</button>
		</div>
		<div id="template" class="box" style="display:none;">
			<p>服饰类别</p>
			<input type="hidden" id="curCode">
			<div class="input"><span>编号：</span><input id="code" type="text" name="code" placeholder="请输入服饰编号"></div>
			<div class="input"><span>名称：</span><input id="cname" type="text" name="cname" placeholder="请输入服饰名称"></div>
			<button id="alterBtn">修改</button>
			<button id="delBtn">删除</button>
		</div>
	</div>

</body>
<script type="text/javascript">
	$(document).ready(function () {
		//给添加按钮注册事件
		$("#addBtn").click(function () {
			//获取用户输入的值
			var code = $("#newCode").val();
			var cname = $("#newName").val();
			
			//判断数据的合法性
			if(!isVaild(code)){
				alert("编号不能为空！");
				return;
			}
			
			if(!isVaild(cname)){
				alert("分类名称不能为空！");
				return;
			}
			//判断编号的合法性
			if(code.length > 10){
				alert("输入的编号名称过长！")
				return;
			}
			//判断分类名称的合法性
			if(cname.length >10){
				alert("输入的分类名称过长！");
				return;
			}
			
			var clothingCate = {"code":code,"cname":cname};
			console.log(clothingCate);
			request("POST","<%=basePath%>/clothingCategory/add",JSON.stringify(clothingCate),"application/json",successAdd,serverError,true);
			
			
		});
		//请求初始化的数据
		//request(method,url,data,contentType,successCallBack,errorCallBack,async)
		request("POST","<%=basePath%>/clothingCategory/listAll",JSON.stringify({}),"application/json",listAll,serverError,true);
	});
	
	//成功添加回调函数
	function successAdd(data) {
		if(data.code == -1){
			alert(data.description);
		}else{
			alert(data.description);
			$("#newCode").val("");
			$("#newName").val("");
			request("POST","<%=basePath%>/clothingCategory/listAll",JSON.stringify({}),"application/json",listAll,serverError,true);
		}
	}
	
	//成功修改回调函数
	function successAlter(data) {
		alert(data.description);
		request("POST","<%=basePath%>/clothingCategory/listAll",JSON.stringify({}),"application/json",listAll,serverError,true);
	}
	
	//成功删除回调函数
	function successDel(data) {
		alert(data.description);
		request("POST","<%=basePath%>/clothingCategory/listAll",JSON.stringify({}),"application/json",listAll,serverError,true);
	}
	
	//列出所有分类的信息
	function listAll(data) {
		console.log(data.data);
		//先将之前的记录清空
		$(".content").remove();
		$(data.data).each(function (index,item) {
			var temp = $("#template").clone();
			$(temp).show();
			$(temp).attr("id",index+1);
			$(temp).addClass("content");
			//填充数据
			$(temp).find("#curCode").val(item.code);
			$(temp).find("#code").val(item.code).attr("readonly",true);
			$(temp).find("#cname").val(item.cname);
			//给修改按钮注册事件
			$(temp).find("#alterBtn").click(function () {
				//获取修改之后的值
				var curItem = "#"+(index+1);
				var code = $(curItem).find("#curCode").val();
				var cname = $(curItem).find("#cname").val();
				//判断合法性
				if(cname.length >10){
					alert("输入的分类名称过长！");
					return;
				}
				var clothingCate = {"code":code,"cname":cname};
				request("POST","<%=basePath%>/clothingCategory/alter",JSON.stringify(clothingCate),"application/json",successAlter,serverError,true);
			});	
			//给删除按钮注册事件
			$(temp).find("#delBtn").click(function () {
				if(confirm("确定要删除吗？")){
					request("POST","<%=basePath%>/clothingCategory/del",JSON.stringify(item),"application/json",successDel,serverError,true);
				}
			});
			$("#wrap").append(temp);
		});
		
	}

</script>
</html>