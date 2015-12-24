<%--
  Created by IntelliJ IDEA.
  User: zhe-wang
  Date: 15-11-25
  Time: 下午8:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="com.web.loginservlet" %>
<%@ page import="com.mysql.parkingspacedata" %>
<%--<% response.setHeader("Refresh", "10"); %>
<% String currTime = new java.util.Date().toString();
    out.println(currTime); %>--%>
<br>
<br>
<%--
<%
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    String url="jdbc:mysql://localhost:3306/stopcar";
    String user = "root";
    String pass = "123456";
    Connection con=DriverManager.getConnection(url, user, pass);
    Statement stmt=con.createStatement();
    %>
<%
    String sql="SELECT * FROM parking_space WHERE parking_id = 9";
    //out.println(sql);
    ResultSet rs=stmt.executeQuery(sql);
    while(rs.next())
    {
        out.println(rs.getString("status"));
    }
    rs.close();
    stmt.close();
    con.close();
%>
--%>

    <%
        parkingspacedata parkingspacedata=new parkingspacedata();
        parkingspacedata.getstatus("select * from parking_space where parking_id=9");
        out.println(parkingspacedata.data());
    %>
<br>
<br>
<script type="text/javascript">
    <%
        parkingspacedata Parkingspacedata=new parkingspacedata();
        Parkingspacedata.getstatus("select * from parking_space where parking_id=9");
    %>
    var GetStatus=eval(<%=parkingspacedata.UserListData()%>);
  /*  for(var i =0 ; i<Status.length ; i++){
        alert(Status[i].number);
        alert(Status[i].status);
    }*/
    var Number = new Array();
    for(var i = 0 ; i<GetStatus.length ; i++){
        var myDate=new Date(GetStatus[i].time);
        alert(myDate);
        var Month = myDate.getMonth();
        alert(Month);

    }

</script>
</body>
</html>