<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html class="login-bg">
<head>
	<title>Detail Admin - Sign in</title>
    
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
    <!-- bootstrap -->
    <link href="css/bootstrap/bootstrap.css" rel="stylesheet" />
    <link href="css/bootstrap/bootstrap-responsive.css" rel="stylesheet" />
    <link href="css/bootstrap/bootstrap-overrides.css" type="text/css" rel="stylesheet" />

    <!-- global styles -->
    <link rel="stylesheet" type="text/css" href="css/layout.css" />
    <link rel="stylesheet" type="text/css" href="css/elements.css" />
    <link rel="stylesheet" type="text/css" href="css/icons.css" />

    <!-- libraries -->
    <link rel="stylesheet" type="text/css" href="css/lib/font-awesome.css" />
    
    <!-- this page specific styles -->
    <link rel="stylesheet" href="css/compiled/signin.css" type="text/css" media="screen" />

    <!-- open sans font -->
    <link href='http://fonts.useso.com/css?family=Open+Sans:300italic,400italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css' />

    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<script type="text/javascript">
		function check(){
			if(document.getElementById("name").value==""){
				alert("请输入用户名！");
				document.getElementById("name").focus();
				return false;
			}
			if(document.getElementById("password").value==""){
				alert("请输入密码！");
				document.getElementById("password").focus();
				return false;
			}
		}
	</script>
</head>


<body>

	<form action="<%= path %>/loginservlet" method="post">
    	<div class="row-fluid login-wrapper">

			<img class="logo" ></img>
	
	        <div class="span4 box">
	            <div class="content-wrap">
	                <h6>Log in</h6>
	                <input class="span12" id="name" type="text" name="name" placeholder="E-mail address" />
	                <input class="span12" id="password" type="password" name="password" placeholder="Your password" />
	                <a href="#" class="forgot">Forgot password?</a>
	                <div class="remember">
	                    <input id="remember-me" type="checkbox" />
	                    <label for="remember-me">Remember me</label>
	                </div>
	                <input class="btn-glow primary login" type="submit" onclick="return check()" value="Log in"/>
	            </div> 
	        </div>
	
	        <div class="span4 no-account">
	            <p>Don't have an account?</p>
	            <a href="signup.jsp">Sign up</a>
	        </div>
	    </div>
	
		<!-- scripts -->
	    <script src="js/jquery-latest.js"></script>
	    <script src="js/bootstrap.min.js"></script>
	    <script src="js/theme.js"></script>
	</form>
</body>
</html>