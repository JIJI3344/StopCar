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

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Insert title here</title>
</head>
<body>

    <form action="<%= path %>/UploadTest" method="post" enctype="multipart/form-data">
        <input type="file" name="upload" siez="16"><br>
        <input type="submit" value="提交">
    </form>
</body>
</html>
