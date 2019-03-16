<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;

%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<script src="<%=basePath %>/js/jquery.min.js"></script>
		<script src="<%=basePath %>/js/main.js"></script>
		<link rel="stylesheet" href="<%=basePath %>/css/my.css" type="text/css">
		<style>
			*{
				margin: 0;
				padding: 0;
			}
			#seletedclothes{
				border: 2px solid rgba(166,166,166,0.5);
				width: 460px;
				height: 370px;
				float: right;
				margin: 30px 20px 0 00px;
				background: transparent;
				overflow: auto;
				position: relative;
				z-index: 7;
			}
			.temp1{
				float: left;
				margin: 10px 0px 10px 15px;
				width: 200px;
				border:1px solid rgb(222,222,222) ;
				background: rgba(188,188,188,0.6);
				box-shadow:rgb(90,90,90) 0.2em 0.2em 0.2em;
			}
			p{
				color: rgb(30,30,30);
				margin: 5px 10px 0px 10px;
				font-size: 15px;
				line-height: 20px;
				font-weight: bold;
			
			}
			.temp1 input[type="text"]{
				margin-left:0px;
				width: 100px;
				height: 20px;
				border: 1px solid transparent;
				border-bottom: 1px solid rgb(88,88,88);
				border-radius: 7px;
				font-family:"";
				font-size: 14px;
				color:white;
				}
			input[name="code"]{
					background-color: rgb(204,7,8);
					border-radius: 4px;
				}
			input[name="cname"]{
					background-color: rgb(6,88,167);
					border-radius: 4px;
				}
			input[name="price"]{
					background-color: rgb(40,45,50);
					border-radius: 4px;
				}
			img.ico{
				vertical-align: middle;
				width: 30px;
				height: 30px;
				overflow: hidden;
			}
			.temp1 span{
				display: inline-block;
				width: 14px;
				font-size: 14px;
				vertical-align: middle;
				overflow: visible;
			}
			#show{
	
				width: 330px;
				height: 500px;
				float: right;
				margin: 38px 30px 0 0px;
				background: transparent;
				position: relative;
			}
			
			.position{
				width: 100%;
				height: 100%;
				position: absolute;
				top: 0;
				left: 0;
				z-index: 0;
			}
			#diban{
				height: 100%;
				width: 460px;
				position: absolute;
				top: 50px;
				left: -55px;
				z-index: 0;
			}
			#reshow{
				
				width: 190px;
				height: 550px;
				float:right ;
				margin: 0px 0px 0 0px;
				overflow: auto;
			}
			.temp2{
				z-index: 50;
				position: relative;
				width: 150px;
				height: 260px;
				border: 1px solid rgb(222,222,222);
				float: left;
				margin: 5px 20px 20px 10px;
				background-color: rgba(222,222,222,1);
				box-shadow: #000000 0.2em 0.2em 0.3em; 
			}
			.add{
				position: absolute;
				left:90px;
				width: 50px;
				height: 50px;
			}
			select{
				color: rgb(230,230,230);
				border: 1px solid transparent;
				background-color: rgb(136,136,136);
				box-shadow: rgb(90,90,90) 0.1em 0.1em 0.1em;
			}
			select:hover{
				border: 1px solid rgb(108,134,174);

			}
			option{
				color: rgb(230,230,230);
			}
			.temp2img img{
				width: 150px;
				height: 190px;
			}
			.temp2 p{
				color: rgb(30,30,30);
				margin: 5px 0px 0px 5px;
				font-size: 11px;
				line-height: 14px;
				font-weight: normal;
			}
			.temp2 p input{
				margin-left:0px;
				width: 80px;
				height: 14px;
				border: 1px solid transparent;
				border-bottom: 1px solid rgb(88,88,88);
				border-radius: 3px;
				font-size: 10px;
				color:white;
			}
		</style>
	</head>
	<body>
		<div id="wrap">
			
			<div id="reshow">
				<div id="choose">
					<p style="margin: 0;line-height:26px;font-size: 12px;background-color: rgb(162,169,176);box-shadow: rgb(40,40,40) 0em 0.2em 0.4em;color: rgb(66,66,66);">选择分类：<select id="sort">
					</select></p> 
				</div>
				<div id="template" class="temp2" style="display: none;">
					<img id="addImg" class="add" src="<%=basePath %>/images/ui/add.png" />
						<img style="width: 150px;height: 150px;"   id="img" class="" src="" />
					<p>编号：<input type="text" name="code" id="clothingCode"  /> </p>
					<p>名称：<input type="text" name="cname" id="clothingName" /> </p>
					<p>单价：<input type="text" name="price"  id= "price"/> </p>
				</div>
			</div>
			
			<div id="show" > 
				<img id="diban" class="" src="<%=basePath %>/images/ui/ground.png" />
				<img id="yinzi" class="position" src="<%=basePath %>/images/data/model/modelShadow.png" />
				<img id="model" class="position" src="" />
			</div>
			
			<div id="seletedclothes">
				<div id="template2" class="temp1" style="display: none;">
					<input type="hidden" id="curClothingCode">
					<p>编号：<input type="text" name="code" id="selectedCode" /> </p>
					<p>名称：<input type="text" name="cname" id="selectedName"/> </p>
					<p>单价：<input type="text" name="price" id="price2"/> </p>
					<p style="line-height: 30px;padding-left: 45px;padding-bottom: 5px;font-size: 0;">
					<img class="ico" id="showzindex" src="<%=basePath %>/images/ui/zIndex.png"/>
					<span id="z">0</span>
					<img class="ico" id="up" src="<%=basePath %>/images/ui/up.png"/>
					<img class="ico" id="down" src="<%=basePath %>/images/ui/down.png" />	
					<img class="ico" id="remove" src="<%=basePath %>/images/ui/remove.png"/>	
					</p>
				</div>				
			</div>
			<div id="curTotalPrice" style="position: absolute;right:16%;top:60%; background-color: #d6dde4;text-align: center; border-radius: 3px;">
				<p style="width: 75px;">总价</p>
				<div style="background-color: #282d32; margin-left:1px;margin-right: 1px;border-bottom-right-radius:8px;border-bottom-left-radius:8px; "><span id="totalPrice" style=" color: white;"></span></div>
			</div>
			
		</div>
	</body>
	<script type="text/javascript">
	
		$(document).ready(function () {
			//初始化价格为0元
			var initPrice = 0;
			$("#totalPrice").html(initPrice.formatMoney());
			
			//初始化分类
			request("POST","<%=basePath%>/clothingCategory/listAll",JSON.stringify({}),"application/json",initCategory,serverError,false);
			//显示衣服
			var sort = $("#sort").val();
			var json = {"sort":sort};
			request("POST","<%=basePath%>/clothing/listAll2",JSON.stringify(json),"application/json",initClothing,serverError,true);
			//初始化人物模型
			request("POST","<%=basePath%>/userInfo/getModel",JSON.stringify({}),"application/json",initModel,serverError,true);
			//初始化之前的着装
			request("POST","<%=basePath%>/dressRecord/initDress",JSON.stringify({}),"application/json",initDress,serverError,true);
			
			$("#sort").change(function () {
				var sort = $("#sort").val();
				var json = {"sort":sort};
				request("POST","<%=basePath%>/clothing/listAll2",JSON.stringify(json),"application/json",initClothing,serverError,true);
			});
		});
		
		function initDress(data) {
			var totalPrice = 0;
			$(".curClothing").remove();
			$(".curSelectedClothing").remove();
			$(data.data).each(function (index,item) {
				var img = $("<img/>");
				$(img).addClass("position");
				$(img).attr("id",item.clothing.clothingName);
				$(img).attr("src","<%=basePath%>/images/clothing/"+item.clothing.image);
				$(img).css("z-index",item.z_index);
				$(img).addClass("curClothing");
				$("#show").append(img);
				//计算价钱
				totalPrice = totalPrice + parseInt(item.clothing.price);
				
				var temp2 = $("#template2").clone();
				$(temp2).find("#curClothingCode").val(item.clothing.code);
				$(temp2).attr("id",item.clothing.code);
				$(temp2).show();
				$(temp2).find("#selectedCode").val(item.clothing.code);
				$(temp2).find("#selectedName").val(item.clothing.clothingName);
				$(temp2).addClass("curSelectedClothing")
				var p = parseInt(item.clothing.price);
				$(temp2).find("#price2").val(p.formatMoney());
				$(temp2).find("#z").html(item.z_index)
				
				var i=item.z_index;
				var curCloth = "#"+item.clothing.clothingName;
				$(temp2).find("#up").click(function(){
					i++;
					$(curCloth).css("z-index",i);
					$(temp2).find("#z").html(i);
					request("POST","<%=basePath%>/dressRecord/alter",JSON.stringify({clothingCode:item.clothing.code,z_index:i}),"application/json",null,serverError,true);
				});
				$(temp2).find("#down").click(function(){
					i--;
					$(curCloth).css("z-index",i);
					$(temp2).find("#z").html(i);
					request("POST","<%=basePath%>/dressRecord/alter",JSON.stringify({clothingCode:item.clothing.code,z_index:i}),"application/json",null,serverError,true);
				});
				$(temp2).find("#remove").click(function(){
					request("POST","<%=basePath%>/dressRecord/delByRecordID",JSON.stringify({id:item.recordID}),"application/json",successDel,serverError,true);
					$(temp2).remove();
					$(curCloth).remove();
				});
				$("#seletedclothes").append(temp2);
				
			});
			$("#totalPrice").attr("totalPrice",totalPrice);
			$("#totalPrice").html(totalPrice.formatMoney());	
		}
		
		function successDel(data) {			
			var curTotalPrice = parseInt($("#totalPrice").attr("totalPrice"));
			curTotalPrice = curTotalPrice - parseInt(data.data.price);
			$("#totalPrice").html(curTotalPrice.formatMoney());
		}
		
		
		function initModel(data) {
			$("#model").attr("src","<%=basePath %>/images/data/model/"+data.data+"Model.png");
		}
		
		function initCategory(data) {
			$(data.data).each(function (index,item) {
				var option = $("<option></option>");
				$(option).val(item.cname);
				$(option).html(item.cname);
				$("#sort").append(option);
			});
		}
		
		function initClothing(data) {
			$(".content").remove();
			$(data.data).each(function (index,item) {
				var temp = $("#template").clone();
				$(temp).show();
				$(temp).addClass("content");
				$(temp).attr("id",index+1);
				$(temp).find("#img").attr("src","<%=basePath%>/images/clothing/"+item.image);
				$(temp).find("#clothingCode").val(item.code);
				$(temp).find("#clothingName").val(item.clothingName);
				var price = parseInt(item.price);
				$(temp).find("#price").val(price.formatMoney());
				$(temp).find("#addImg").click(function () {
					
					//将数据存入数据库
					var clothingCode = item.code;
					var curClothing = "#"+item.clothingName;
					var z_index = 0;
					var clothingSort = item.sort;
					var json = {"clothingCode":clothingCode,"z_index":z_index,"clothing_cate_code":clothingSort};
					request("POST","<%=basePath%>/dressRecord/add",JSON.stringify(json),"application/json",successAdd,serverError,true);
					
					
				});
				$("#reshow").append(temp);
			});
		}
		
		function successAdd(data) {
			request("POST","<%=basePath%>/dressRecord/initDress",JSON.stringify({}),"application/json",initDress,serverError,true);
		}
		
	
	
	
	</script>
	
	
	
</html>