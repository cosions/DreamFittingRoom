<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;

%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<style type="text/css">
	*{
		margin: 0;
		padding:0;
	}
	#wrapper{
		position:absolute;
		width:100%;
		height:48px;
		background-image:url("<%=basePath%>/images/ui/thGlass.png"); 
		background-size: 100% 100%;
	}
	img{
		position: absolute;
		right: 0;
		top: 0;
	}
	#curUser{
		margin-top: 8px;
		margin-left:10px;
	}
</style>
</head>
<body>
	<div id="wrapper">
		<div id="curUser">当前用户：<span id="curLoginUser">${sessionScope.curUser.realName }</span></div>
		<img alt="picture not found" src="<%=basePath%>/images/ui/themeBanner.png">
	</div>
</body>

</html>