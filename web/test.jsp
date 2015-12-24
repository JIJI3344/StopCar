<%--
  Created by IntelliJ IDEA.
  User: zhe-wang
  Date: 15-11-19
  Time: 下午2:23
  To change this template use File | Settings | File Templates.
--%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ page import="com.web.loginservlet" %>
<%@ page import="org.apache.catalina.connector.Request" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Insert title here</title>
</head>
<body>
<form action="<%= path %>/loginservlet" method="post">

    <input type="submit"  value="Log in"/>
    <%=loginservlet.ip%>
    <%=request.getRemoteAddr()%>
    </form>


</body>
</html>
