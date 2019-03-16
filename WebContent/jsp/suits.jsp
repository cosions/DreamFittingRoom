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
<script src="<%=basePath%>/js/vendor/jquery.ui.widget.js"></script>
<script src="<%=basePath%>/js/jquery.iframe-transport.js" type="text/javascript"></script>
<script src="<%=basePath%>/js/jquery.fileupload.js" type="text/javascript"></script>
<link href="<%=basePath%>/css/main.css" rel="stylesheet" type="text/css">
<link href="<%=basePath%>/css/jquery.fileupload.css" rel="stylesheet" type="text/css">
<link href="<%=basePath%>/css/jquery.fileupload-ui.css" rel="stylesheet" type="text/css">

<style type="text/css">
	*{
		margin: 0;
		padding:0;
	}
	.box{
		width:19%;
		height:35%;
		text-align: center;
		border: 1px solid black;
		float: left;
		margin: 5px;
		background-color: #989898;
	}
	input{
		width:40%;
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
		margin-top: 5px;
		margin-bottom: 5px;
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
	select{
		width:40%;
		height: 25px;
		border-radius: 3px;
		border:0;
		background-color: #d8d8d8;
		color: #888;
	}
	#banner{
		background-color: #e2dfdf;
		width:300px;
		margin-left: 10px;
		margin-top: 10px; 
	}
	.banner{
		width:20%;
		background-color: linear-gradient(to top left, #908c8c,#b6b6bf);
	}
	.bannerItem{
		margin-left: 5px;
		margin-bottom: 5px;
	}
	.contentbox{
		width:35%;
		height:40%;
		border: 1px solid black;
		float: left;
		margin: 5px;
		background-color: #989898;
	}
</style>

</head>
<body>
	<div id="wrap">
		<div id="banner">
			<span class="bannerItem"><span>性别:</span><select id="bannerSex" class="banner">
			<option value="男">男</option>
			<option value="女">女</option>
			</select></span>
			<span class="bannerItem"><span>服饰类别:</span><select id="bannerSort" class="banner sort">
			
			</select></span>
			<button id="select">查询</button>
		
		</div>
		
		
		
		<div id="addClothing" class="box" >
			<p>服饰细目</p>
			<div class="input"><span>编号：</span><input style="width:50%;"   id="newCode" type="text" name="code" placeholder="请输入服饰编号"></div>
			<div class="input"><span>名称：</span><input style="width:50%;" id="newName" type="text" name="cname" placeholder="请输入服饰名称"></div>
			<div class="input"><span>价格：</span><input style="width:50%;" id="newPrice" type="text"  placeholder="请输入服饰价格"></div>
			<div class="input"><span>性别：</span><select style="width:50%;" id="newSex" name="sex">
			<option value="男">男</option>
			<option value="女">女</option>
			</select></div>
			<div class="input"><span>分类：</span><select style="width:50%;"  id="newSort" class="sort">
			
			</select></div>	
			<button id="addBtn">添加</button>
		</div>
		<div id="template" class="contentbox" style="display:none;position: relative;">
			<p style="text-align: center;">服饰细目</p>
		  <div id="clothingInfo" style="display:inline;width: 150px;">
			<input type="hidden" id="curCode" >
			<div class="input"><span>编号：</span><input id="code" type="text" name="code" placeholder="请输入服饰编号"></div>
			<div class="input"><span>名称：</span><input id="clothingName" type="text" name="cname" placeholder="请输入服饰名称"></div>
			<div class="input"><span>价格：</span><input id="price" type="text" name="cname" placeholder="请输入服饰价格"></div>
			<div class="input"><span>性别：</span><select id="sex">
				<option value="男">男</option>
				<option value="女">女</option>
			</select></div>
			
			<div class="input"><span>分类：</span><select id="sort" class="sort">
				
			</select></div>
		</div>
		<span id="uploaderContainer" style="width: 150px; position: absolute; top:30px;right:30px;">
			<span id="addImg">点击添加图片</span>
			<span style="display: none;"><input id="file" type="file" name="file" multiple ></span>
			<br>
			<span><img id="suitImage"  alt="nou found" width="120px" height="120px"></span>
		</span>
			
			<hr style="margin-top: 3px;margin-bottom: 3px;">
			&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
			<button id="alterBtn">修改</button>
			<button id="delBtn">删除</button>
		</div>
	</div>

</body>
<script type="text/javascript">
	$(document).ready(function () {

		
		
		
		//request(method,url,data,contentType,successCallBack,errorCallBack,async)
		request("POST","<%=basePath%>/clothingCategory/listAll",JSON.stringify({}),"application/json",init,serverError,true);
		
		//register event
		$("#select").click(function () {
			var sex = $("#bannerSex").val();
			var sort = $("#bannerSort").val();
			$("#newSex").val(sex);
			$("#newSort").val(sort);
			//$("#addClothing").show();
			
			alert(sex+"---"+sort);
			var json = {"clothingSex":sex,"sort":sort};
			request("POST","<%=basePath%>/clothing/listAll",JSON.stringify(json),"application/json",initClothDetail,serverError,true);
		});
		
		//给添加按钮注册事件
		$("#addBtn").click(function () {
			var code = $("#newCode").val();
			var name = $("#newName").val();
			var price = $("#newPrice").val();
			var sex = $("#newSex").val();
			var sort = $("#newSort").val();
			//合法性
			if(!isVaild(code)){
				alert("编号不能为空!");
				return;
			}
			
			if(!isVaild(name)){
				alert("名称不能为空!");
				return;
			}
			
			if(!isVaild(price)){
				alert("价格不能为空!");
				return;
			}
			
			var regex = /^[1-9]{1}[0-9]*(\.[1-9]{1}[0-9]*){0,1}$/;
			if(!regex.test(price)){
				alert("输入的价格不合法!");
				return;
			}
			
			//json object
			var json = {"code":code,"clothingName":name,"price":price,"clothingSex":sex,"sort":sort};
			request("POST","<%=basePath%>/clothing/add",JSON.stringify(json),"application/json",successAdd,serverError,true);		
		});
	
	});
	
	function successAdd(data) {
		if(data.code == -1){  //fail
			alert(data.description);
		}else{  //success
			alert(data.description);
			$("#newCode").val("");
			$("#newName").val("");
			$("#newPrice").val("");
			var json = {"clothingSex":data.data.clothingSex,"sort":data.data.sort}
			request("POST","<%=basePath%>/clothing/listAll",JSON.stringify(json),"application/json",initClothDetail,serverError,true);
		}
	}
	
	function init(data) {
		$(data.data).each(function (index,item) {
			var sort = $("<option></option>");
			$(sort).val(item.cname).html(item.cname);
			$(".sort").append(sort);
		});
	}
	
	function initClothDetail(data) {
		$(".content").remove();
		$(data.data).each(function (index,item) {
			var temp = $("#template").clone();
			$(temp).show();
			$(temp).attr("id",index+1);
			$(temp).addClass("content");
			
			$(temp).find("#curCode").val(item.code);
			$(temp).find("#code").val(item.code).attr("readonly",true);
			$(temp).find("#clothingName").val(item.clothingName);
			$(temp).find("#price").val(item.price);
			$(temp).find("#sex").val(item.clothingSex);
			
			
			$(temp).find("#sort").val(item.sort);
			
			
			
			if(item.image == "none"){
				//$(temp).find("#curImage").val("unknown.png");
				//alert($(temp).find("#file").val());
				$(temp).find("#suitImage").attr("src","<%=basePath%>/images/clothing/unknown.png");
			}else{
				//$(temp).find("#curImage").val(item.image);
				//alert($(temp).find("#file").val());
				$(temp).find("#suitImage").attr("src","<%=basePath%>/images/clothing/"+item.image);
			}
			//修改按钮注册事件
			$(temp).find("#alterBtn").click(function () {
				//event
				var str = "#"+(index+1);  //获取当前对象更改之后的值
				var curItem = $(str);
				var code = $(curItem).find("#curCode").val();
				var clothingName = $(curItem).find("#clothingName").val();
				var price = $(curItem).find("#price").val();
				var sex = $(curItem).find("#sex").val();
				var sort = $(curItem).find("#sort").val();
				
				//合法性
				if(!isVaild(clothingName)){
					alert("名称不能为空!");
					return;
				}
				
				if(!isVaild(price)){
					alert("价格不能为空!");
					return;
				}
				
				if(!isVaild(sort)){
					alert("名称不能为空!");
					return;
				}
				
				var regex = /^[1-9]{1}[0-9]*(\.[1-9]{1}[0-9]*){0,1}$/;
				if(!regex.test(price)){
					alert("输入的价格不合法!");
					return;
				}
				
				
				var json = {"code":code,"clothingName":clothingName,"price":price,"clothingSex":sex,"sort":sort};
				request("POST","<%=basePath%>/clothing/alter",JSON.stringify(json),"application/json",successAlter,serverError,true);
			});
			
			
			//删除按钮注册事件
			$(temp).find("#delBtn").click(function () {
				//event
				if(confirm("确定删除吗？")){
					request("POST","<%=basePath%>/clothing/del",JSON.stringify(item),"application/json",successDel,serverError,true);
				}
			});	
			
			//给添加图片 注册事件
			$(temp).find("#addImg").click(function () {
				$(temp).find("#file").click();
			});
			
			var curCode = item.code;
			var url = '<%=basePath%>/upload/uploadImage?code='+curCode;
			$(temp).find("#file").attr("data-url",url);
			//$(temp).find("#file").on("change",function () {
				//alert("change:"+$(temp).find("#file")[0].files[0].name);
				
			//});
			//初始化fileuploader
			$(temp).find("#file").fileupload({
				autoUpload: true,
		    	dataType: 'json',
		    	done: function (e, data) {		    	
		    	//$("#imageUrl").val(data.result.description);
		    		if (data.result.code == -1){
		    			alert(data.result.description);
		    		} else{
			    		$(temp).find("#suitImage").attr("src","<%=basePath%>/images/clothing/"+data.result.description);
			    		showMessage({"code":0,"description":data.result.description+"上传成功！"});	    			
		    		}
		        }
			});
			
			$("#wrap").append(temp);
		});
		
		
	}
	
	function successAlter(data) {
		alert(data.description);
		if(data.code == 0){
			var json = {"clothingSex":data.data.clothingSex,"sort":data.data.sort};
			request("POST","<%=basePath%>/clothing/listAll",JSON.stringify(json),"application/json",initClothDetail,serverError,true);
		}
	}
	
	function successDel(data) {
		alert(data.description);
		if(data.code == 0){
			var json = {"clothingSex":data.data.clothingSex,"sort":data.data.sort};
			request("POST","<%=basePath%>/clothing/listAll",JSON.stringify(json),"application/json",initClothDetail,serverError,true);
		}
		
	}
	





</script>

</html>