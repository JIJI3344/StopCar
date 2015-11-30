<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.mysql.parkingspacedata" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
<head>
	<title></title>

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
	<link href="css/lib/font-awesome.css" type="text/css" rel="stylesheet" />

	<!-- this page specific styles -->
	<link rel="stylesheet" href="css/compiled/tables.css" type="text/css" media="screen" />

	<!-- open sans font -->
	<link href='http://fonts.useso.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css' />

	<!--[if lt IE 9]>
	<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]-->
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /></head>
<body>
	<form action="<%= path %>/indexservlet" method="post" name="form1">
		<!-- navbar
		<div class="navbar navbar-inverse">
			<div class="navbar-inner">

			</div>
		</div>
		<!-- end navbar -->

		<!-- sidebar -->
		<div id="sidebar-nav" >
			<ul id="dashboard-menu">
				<li class="active">
					<div class="pointer">
						<div class="arrow"></div>
						<div class="arrow_border"></div>
					</div>
					<a href="index.jsp">
						<i class="icon-home"></i>
						<span>主页</span>
					</a>
				</li>
				<li>
					<a href="chart-showcase.html">
						<i class="icon-signal"></i>
						<span>数据分析</span>
					</a>
				</li>
				<li>
					<a href="user-list.jsp">
						<i class="icon-group"></i>
						<span>车主</span>
						<!--<i class="icon-chevron-down"></i>-->
					</a>

				<li>
					<a href="personal.jsp">
						<i class="icon-cog"></i>
						<span>个人设置</span>
					</a>
				</li>
				<li>
					<a class="dropdown-toggle" href="#">
						<i class="icon-share-alt"></i>
						<span>登出</span>
						<i class="icon-chevron-down"></i>
					</a>
					<ul class="submenu">
						<!--                    <li><a href="code-editor.html">Code editor</a></li>
											<li><a href="grids.html">Grids</a></li>-->
						<li><a href="signin.jsp">登录</a></li>
						<li><a href="signup.jsp">注册</a></li>
					</ul>
				</li>
			</ul>
		</div>
		<!-- end sidebar -->


		<!-- main container -->
		<div class="content" id="content">

			<!-- settings changer -->
			<div class="skins-nav">
				<a href="#" class="skin first_nav selected" onclick="Defaultskin()">
					<span class="icon"></span><span class="text">Default skin</span>
				</a>
				<a  class="skin second_nav" data-file="css/skins/dark.css" onclick="Darkskin()">
					<span class="icon"></span><span class="text">Dark skin</span>
				</a>
			</div>

			<div class="container-fluid">
				<div id="pad-wrapper">

					<div class="table-wrapper products-table section">
						<div class="row-fluid head">
							<div class="span12">
								<h4>车位状况</h4>
							</div>
						</div>

						<div class="row-fluid filter-block">
							<div class="pull-right">
								<div class="ui-select">
									<select>
										<option />车位编号
										<option />车位状态
										<option />停车时长
									</select>
								</div>
							</div>
						</div>

						<div class="row-fluid">
							<table class="table table-hover">
								<thead>
								<tr>
									<th class="span3">
										<!--<input type="checkbox" />-->
										车位编号
									</th>
									<th class="span3">
										<span class="line"></span>车位状态
									</th>
									<th class="span3">
										<span class="line"></span>车主帐户
									</th>
									<th class="span4">
										<span class="line"></span>停车/预定时间
									</th>

								</tr>
								</thead>
								<tbody id="tbody">
		<%--						<!-- row -->
								<tr class="first">
									<td id = "number00">

									</td>
									<td class="description" >
										<span class="label label-success" id = "status00"></span>
									</td>
									<td>
										<span class="label label-success">Active</span>
										<ul class="actions">
											<li><a href="#">Edit</a></li>
											<li class="last"><a href="#">Delete</a></li>
										</ul>
									</td>
								</tr>
								<!-- row -->
								<tr>
									<td>
										<div class="img">
											<img src="img/table-img.png" />
										</div>
										<a href="#" class="name">Internet tend</a>
									</td>
									<td class="description">
										There are many variations of passages.
									</td>
									<td>
										<ul class="actions">
											<li><a href="#">Edit</a></li>
											<li class="last"><a href="#">Delete</a></li>
										</ul>
									</td>
								</tr>
								<!-- row -->
								<tr>
									<td>
										&lt;%&ndash;<input type="checkbox" />&ndash;%&gt;
										<div class="img">
											<img src="img/table-img.png" />
										</div>
										<a href="#" class="name">Generate Lorem </a>
									</td>
									<td class="description">
										if you are going to use a passage of Lorem Ipsum.
									</td>
									<td>
										<ul class="actions">
											<li><a href="#">Edit</a></li>
											<li class="last"><a href="#">Delete</a></li>
										</ul>
									</td>
								</tr>
								<!-- row -->
								<tr>
									<td>
										&lt;%&ndash;<input type="checkbox" />&ndash;%&gt;
										<div class="img">
											<img src="img/table-img.png" />
										</div>
										<a href="#" class="name">Internet tend</a>
									</td>
									<td class="description">
										There are many variations of passages.
									</td>
									<td>
										<span class="label label-info">Standby</span>
										<ul class="actions">
											<li><a href="#">Edit</a></li>
											<li class="last"><a href="#">Delete</a></li>
										</ul>
									</td>
								</tr>
								<tr>
									<td>
										&lt;%&ndash;<input type="checkbox" />&ndash;%&gt;
										<div class="img">
											<img src="img/table-img.png" />
										</div>
										<a href="#" class="name">Generate Lorem </a>
									</td>
									<td class="description">
										if you are going to use a passage of Lorem Ipsum.
									</td>
									<td>
										<span class="label label-success">Active</span>
										<ul class="actions">
											<li><a href="#">Edit</a></li>
											<li class="last"><a href="#">Delete</a></li>
										</ul>
									</td>
								</tr>--%>
								</tbody>
							</table>
						</div>
					</div>
					<!-- end products table -->
				</div>
			</div>
		</div>
		<input type="submit" value="提交">
		<!-- end main container -->

		<!-- scripts -->
		<script src="js/jquery-latest.js"></script>
		<script src="js/bootstrap.min.js"></script>
		<script src="js/theme.js"></script>
		<script type="text/javascript">
			<%
				parkingspacedata Parkingspacedata=new parkingspacedata();
				Parkingspacedata.getstatus("select * from parking_space where parking_id=9");
			%>
			var GetStatus=eval(<%=Parkingspacedata.data()%>);
			/*for(var i =0 ; i<GetStatus.length ; i++){
			 alert(GetStatus[i].number);
			 alert(GetStatus[i].status);
			 }*/
			var Number = new Array();
			for(var i = 0 ; i<GetStatus.length ; i++){
				Number[i]="00"+GetStatus[i].number+"号";
			}
			var Status = new Array();
			for(var j = 0 ; j<GetStatus.length ; j++){
				if(GetStatus[j].status==0){
					Status[j]="空闲";
				}else  if(GetStatus[j].status==1){
					Status[j]="被预定";
				}else {
					Status[j]="在使用";
				}
			}
			//alert(Number[0]);
			//alert(Status[0]);

			function add(index){

				var tr = document.createElement("tr");
				tr.id="first"+index;
				document.getElementById("tbody").appendChild(tr);

				var td = document.createElement("td");
				td.id="number"+index;
				document.getElementById("first"+index).appendChild(td);

				var td = document.createElement("td");
				td.id="td"+index;
				document.getElementById("first"+index).appendChild(td);

				var span = document.createElement("span");
				span.id="status"+index;
				document.getElementById("td"+index).appendChild(span);

				var td = document.createElement("td");
				td.id="name"+index;
				document.getElementById("first"+index).appendChild(td);

				var td = document.createElement("td");
				td.id="edit"+index;
				document.getElementById("first"+index).appendChild(td);

				var ul = document.createElement("ul");
				ul.className="actions";
				ul.id="ul"+index;
				document.getElementById("edit"+index).appendChild(ul);

				var li = document.createElement("li");
				li.innerHTML="<a href='#'>Edit</a>";
				document.getElementById("ul"+index).appendChild(li);

				var li = document.createElement("li");
				li.innerHTML="<a href='#'>Delete</a>";
				document.getElementById("ul"+index).appendChild(li);
			}


			function change(dataIndex){
				document.getElementById("number"+dataIndex).innerHTML=Number[dataIndex];
				document.getElementById("status"+dataIndex).innerHTML=Status[dataIndex];
				if(Status[dataIndex]=="空闲"){
					document.getElementById("status"+dataIndex).className="label label-success";
				}else {
					document.getElementById("status"+dataIndex).className="label label-info";
				}
			}
			for(var m=0; m<GetStatus.length; m++){
				add(m);
				change(m);
			}



			function Darkskin(){
				document.getElementById("content").style.backgroundColor='#28303a';
				document.getElementById("sidebar-nav").style.backgroundColor='#28303a';
			}
			function Defaultskin(){
				document.getElementById("content").style.backgroundColor='';
				document.getElementById("sidebar-nav").style.backgroundColor='';

			}
		</script>

	</form>
</body>
</html>