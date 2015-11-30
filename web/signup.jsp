<%@ page language="java"  pageEncoding="GBK"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html class="login-bg">
<head>
	<title>Detail Admin - Sign up</title>
    
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
    <link rel="stylesheet" href="css/compiled/signup.css" type="text/css" media="screen" />

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
			if(document.getElementById("password0").value==""){
				alert("请输入密码！");
				document.getElementById("password0").focus();
				return false;
			}
			if(document.getElementById("password1").value==""){
				alert("请再次输入密码！");
				document.getElementById("password1").focus();
				return false;
			}
			if(document.getElementById("password0").value !=document.getElementById("password1").value){
				alert("两次密码不同，请重新输入！");
				document.getElementById("password0").value="";
				document.getElementById("password1").value="";
				document.getElementById("password0").focus();
				return false;
			}
		}
		function test(){
		 	if(<%=request.getAttribute("result")%>==true){
				alert("账户已存在，请重新输入！");
				document.getElementById("name").value="";
				document.getElementById("password0").value="";
				document.getElementById("password1").value="";
				document.getElementById("name").focus();
		 	}
			
		}
		test();
	</script>
	
</head>
<body>
	<form action="<%= path %>/signupservlet" method="post">
	    <div class="header">

			<img class="logo" />

	    </div>
	    <div class="row-fluid login-wrapper">
	        <div class="box">
	            <div class="content-wrap">
	                <h6>Sign Up</h6>
	                <input class="span12" type="text" id="name" name="name" placeholder="E-mail address" />
	                <input class="span12" type="password" id="password0" name="password0" placeholder="Password" />
	                <input class="span12" type="password" id="password1" name="password1" placeholder="Confirm Password" />
	                <div class="action">
	                    <input class="btn-glow primary signup" type="submit" onclick="return check()" value="Sign up" />
	                </div>                
	            </div>
	        </div>
	
	        <div class="span4 already">
	            <p>Already have an account?</p>
	            <a href="signin.jsp">Sign in</a>
	        </div>
	    </div>
	
		<!-- scripts -->
	    <script src="js/jquery-latest.js"></script>
	    <script src="js/bootstrap.min.js"></script>
	    <script src="js/theme.js"></script>
    </form>

</body>
</html>