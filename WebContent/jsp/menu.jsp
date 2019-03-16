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
<script type="text/javascript" src="<%=basePath%>/js/jquery.min.js">
</script>
<script type="text/javascript" src="<%=basePath%>/js/main.js"></script>
<style type="text/css">
	*{
		margin: 0;
		padding: 0;
	}
	#wrapper{
		position: absolute;
		width: 140px;
		height:100%;
		background-color: rgb(208,208,208);
	}
	.size{
		margin: 20px auto;
	}
</style>
</head>
<body>
	<div id="wrapper">
		<div id="self" class="size">
			<a href="self.jsp" target="workspace"><img id="img1" alt="picture not found" src="<%=basePath%>/images/ui/self.png"></a>
		</div>
		<div id="userList" class="size">
			<a href="memberManage.jsp" target="workspace"><img id="img2" alt="picture not found" src="<%=basePath%>/images/ui/userList.png"></a>
		</div>
		<div id="catalog" class="size">
			<a href="category.jsp" target="workspace"><img id="img3" alt="picture not found" src="<%=basePath%>/images/ui/catalog.png"></a>
		</div>
		<div id="suits" class="size">
			<a href="suits.jsp" target="workspace"><img id="img4" alt="picture not found" src="<%=basePath%>/images/ui/suits.png"></a>
		</div>
		<div id="mySuits" class="size">
			<a href="room.jsp" target="workspace"><img id="img5" alt="picture not found" src="<%=basePath%>/images/ui/mySuits.png"></a>
		</div>
		<div id="exit" class="size">
			<a href="login.jsp" target="_top"><img id="img6" alt="picture not found" src="<%=basePath%>/images/ui/exit.png"></a>
		</div>
	</div>
</body>
<script type="text/javascript">
	$(document).ready(function() {
		$("img").css({"height":"70px"});
		$("img").css({"width":"70px"});
		$(".size").css({"width":$("img").css("width"),"height":$("img").css("height")});
		
		$("#exit").click(function () {
			request("POST","<%=basePath%>/userInfo/exit",JSON.stringify({}),"application/json",null,serverError,true);
		});
		
		$("#img1").hover(  
		function () {
			$("#img1").css({"height":"73px"});
			$("#img1").css({"width":"73px"});
			$("#self").css({"width":$("#img1").css("width"),"height":$("#img1").css("height")});
		},
		function () {
			$("#img1").css({"height":"70px"});
			$("#img1").css({"width":"70px"});
			$("#self").css({"width":$("#img1").css("width"),"height":$("#img1").css("height")});	
		}
		);
		
		$("#img2").hover(  
				function () {
					$("#img2").css({"height":"73px"});
					$("#img2").css({"width":"73px"});
					$("#userList").css({"width":$("#img2").css("width"),"height":$("#img2").css("height")});
				},
				function () {
					$("#img2").css({"height":"70px"});
					$("#img2").css({"width":"70px"});
					$("#userList").css({"width":$("#img2").css("width"),"height":$("#img2").css("height")});	
				}
		);
		
		$("#img3").hover(  
				function () {
					$("#img3").css({"height":"73px"});
					$("#img3").css({"width":"73px"});
					$("#catalog").css({"width":$("#img3").css("width"),"height":$("#img3").css("height")});
				},
				function () {
					$("#img3").css({"height":"70px"});
					$("#img3").css({"width":"70px"});
					$("#catalog").css({"width":$("#img3").css("width"),"height":$("#img3").css("height")});	
				}
		);
		
		$("#img4").hover(  
				function () {
					$("#img4").css({"height":"73px"});
					$("#img4").css({"width":"73px"});
					$("#suits").css({"width":$("#img4").css("width"),"height":$("#img4").css("height")});
				},
				function () {
					$("#img4").css({"height":"70px"});
					$("#img4").css({"width":"70px"});
					$("#suits").css({"width":$("#img4").css("width"),"height":$("#img4").css("height")});	
				}
		);
		
		$("#img5").hover(  
				function () {
					$("#img5").css({"height":"73px"});
					$("#img5").css({"width":"73px"});
					$("#mySuits").css({"width":$("#img5").css("width"),"height":$("#img5").css("height")});
				},
				function () {
					$("#img5").css({"height":"70px"});
					$("#img5").css({"width":"70px"});
					$("#mySuits").css({"width":$("#img5").css("width"),"height":$("#img5").css("height")});	
				}
		);
		
		$("#img6").hover(  
				function () {
					$("#img6").css({"height":"73px"});
					$("#img6").css({"width":"73px"});
					$("#exit").css({"width":$("#img5").css("width"),"height":$("#img5").css("height")});
				},
				function () {
					$("#img6").css({"height":"70px"});
					$("#img6").css({"width":"70px"});
					$("#exit").css({"width":$("#img6").css("width"),"height":$("#img6").css("height")});	
				}
		);
			
	});
	
</script>
</html>