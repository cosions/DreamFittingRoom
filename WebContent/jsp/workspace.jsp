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
<style type="text/css">
	*{
		margin: 0;
		padding: 0;
	}
	#wrapper{
		position: absolute;
		width: 100%;
		height: 100%;
		background-image: url("<%=basePath%>/images/ui/registerBackground.jpg");
		background-size: 100% 100%;
	}
	
</style>
</head>
<body>
	<div id="wrapper">	
	</div>
</body>
<script type="text/javascript">

</script>
</html>