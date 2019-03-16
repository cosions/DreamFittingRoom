<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + 
                                      request.getServerName() + ":" +
                                      request.getServerPort() + path;
%>    
<html>
<head>
<title>梦想试衣间</title>
<script type="text/javascript" src="<%=basePath%>/js/jquery.min.js"></script>
</head>
<frameset rows="48px,*" border="0">
	<frame id="banner" name="banner" src="<%=basePath%>/jsp/banner.jsp"  />
	<frameset cols="140px,*" border="1">
		<frame src="<%=basePath%>/jsp/menu.jsp" />
		<frame id="workspace" name="workspace" src="<%=basePath%>/jsp/workspace.jsp" />
 	</frameset>	
 </frameset>
</html>