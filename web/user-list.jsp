<%--
  Created by IntelliJ IDEA.
  User: zhe-wang
  Date: 15-11-12
  Time: ÏÂÎç7:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java"  pageEncoding="GBK"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
    <title>Detail Admin - User list</title>

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
    <link rel="stylesheet" href="css/compiled/user-list.css" type="text/css" media="screen" />

    <!-- open sans font -->
    <link href='http://fonts.useso.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css' />

    <!--[if lt IE 9]>
    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" /></head>
<body>
    <form action="<%= path %>/userlistservlet" method="post">
        <!-- navbar -->
        <div class="navbar navbar-inverse">
            <div class="navbar-inner">

            </div>
        </div>
        <!-- end navbar -->

        <!-- sidebar -->
        <div id="sidebar-nav">
            <ul id="dashboard-menu">
                <li>
                    <a href="index.html">
                        <i class="icon-home"></i>
                        <span>Home</span>
                    </a>
                </li>
                <li>
                    <a href="chart-showcase.html">
                        <i class="icon-signal"></i>
                        <span>Charts</span>
                    </a>
                </li>
                <li class="active">
                    <div class="pointer">
                        <div class="arrow"></div>
                        <div class="arrow_border"></div>
                    </div>
                    <a class="dropdown-toggle" href="#">
                        <i class="icon-group"></i>
                        <span>Users</span>
                    </a>
                </li>
                <li>
                    <a href="personal-info.html">
                        <i class="icon-cog"></i>
                        <span>My Info</span>
                    </a>
                </li>
                <li>
                    <a class="dropdown-toggle" href="#">
                        <i class="icon-share-alt"></i>
                        <span>Extras</span>
                        <i class="icon-chevron-down"></i>
                    </a>
                    <ul class="submenu">
                        <li><a href="signin.html">Sign in</a></li>
                        <li><a href="signup.html">Sign up</a></li>
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
                <div id="pad-wrapper" class="users-list">
                    <div class="row-fluid header">
                        <h3>Users</h3>
                        <div class="span10 pull-right">
                            <input type="text" class="span5 search" placeholder="Type a user's name..." />

                            <!-- custom popup filter -->
                            <!-- styles are located in css/elements.css -->
                            <!-- script that enables this dropdown is located in js/theme.js -->
                            <div class="ui-dropdown">
                                <div class="head" data-toggle="tooltip" title="Click me!">
                                    Filter users
                                    <i class="arrow-down"></i>
                                </div>
                                <div class="dialog">
                                    <div class="pointer">
                                        <div class="arrow"></div>
                                        <div class="arrow_border"></div>
                                    </div>
                                    <div class="body">
                                        <p class="title">
                                            Show users where:
                                        </p>
                                        <div class="form">
                                            <select>
                                                <option />Name
                                                <option />Email
                                                <option />Number of orders
                                                <option />Signed up
                                                <option />Last seen
                                            </select>
                                            <select>
                                                <option />is equal to
                                                <option />is not equal to
                                                <option />is greater than
                                                <option />starts with
                                                <option />contains
                                            </select>
                                            <input type="text" />
                                            <a class="btn-flat small">Add filter</a>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <a href="new-user.html" class="btn-flat success pull-right">
                                <span>&#43;</span>
                                NEW USER
                            </a>
                        </div>
                    </div>

                    <!-- Users table -->
                    <div class="row-fluid table">
                        <table class="table table-hover" id="table">
                            <thead>
                            <tr>
                                <th class="span4 sortable">
                                    Name
                                </th>
                                <th class="span3 sortable">
                                    <span class="line"></span>Signed up
                                </th>
                                <th class="span2 sortable">
                                    <span class="line"></span>Total spent
                                </th>
                                <th class="span3 sortable align-right">
                                    <span class="line"></span>Email
                                </th>
                            </tr>
                            </thead>
                            <tbody>
                            <!-- row -->
                            <tr class="first">
                                <td>
                                    <img src="img/contact-img.png" class="img-circle avatar hidden-phone" />
                                    <a href="user-profile.html" class="name">Alejandra Galvan Castillo</a>
                                    <span class="subtext">Graphic Design</span>
                                </td>
                                <td>
                                    Mar 13, 2012
                                </td>
                                <td>
                                    $ 4,500.00
                                </td>
                                <td class="align-right">
                                    <a href="#">alejandra@canvas.com</a>
                                </td>
                            </tr>
                            <!-- row -->
                            <tr>
                                <td>
                                    <img src="img/contact-img2.png" class="img-circle avatar hidden-phone" />
                                    <a href="user-profile.html" class="name">Alejandra Galvan Castillo</a>
                                    <span class="subtext">Graphic Design</span>
                                </td>
                                <td>
                                    Jun 03, 2012
                                </td>
                                <td>
                                    $ 549.99
                                </td>
                                <td class="align-right">
                                    <a href="#">alejandra@canvas.com</a>
                                </td>
                            </tr>
                            <!-- row -->
                            <tr>
                                <td>
                                    <img src="img/contact-img.png" class="img-circle avatar hidden-phone" />
                                    <a href="user-profile.html" class="name">Alejandra Galvan Castillo</a>
                                    <span class="subtext">Graphic Design</span>
                                </td>
                                <td>
                                    Mar 01, 2014
                                </td>
                                <td>
                                    $ 30.00
                                </td>
                                <td class="align-right">
                                    <a href="#">alejandra@canvas.com</a>
                                </td>
                            </tr>
                            <!-- row -->
                            <tr>
                                <td>
                                    <img src="img/contact-img2.png" class="img-circle avatar hidden-phone" />
                                    <a href="user-profile.html" class="name">Alejandra Galvan Castillo</a>
                                    <span class="subtext">Graphic Design</span>
                                </td>
                                <td>
                                    Jan 28, 2012
                                </td>
                                <td>
                                    $ 1,320.00
                                </td>
                                <td class="align-right">
                                    <a href="#">alejandra@canvas.com</a>
                                </td>
                            </tr>
                            <!-- row -->
                            <tr>
                                <td>
                                    <img src="img/contact-img.png" class="img-circle avatar hidden-phone" />
                                    <a href="user-profile.html" class="name">Alejandra Galvan Castillo</a>
                                    <span class="subtext">Graphic Design</span>
                                </td>
                                <td>
                                    May 16, 2012
                                </td>
                                <td>
                                    $ 89.99
                                </td>
                                <td class="align-right">
                                    <a href="#">alejandra@canvas.com</a>
                                </td>
                            </tr>
                            <!-- row -->
                            <tr>
                                <td>
                                    <img src="img/contact-img2.png" class="img-circle avatar hidden-phone" />
                                    <a href="user-profile.html" class="name">Alejandra Galvan Castillo</a>
                                    <span class="subtext">Graphic Design</span>
                                </td>
                                <td>
                                    Sep 06, 2012
                                </td>
                                <td>
                                    $ 344.00
                                </td>
                                <td class="align-right">
                                    <a href="#">alejandra@canvas.com</a>
                                </td>
                            </tr>
                            <!-- row -->
                            <tr>
                                <td>
                                    <img src="img/contact-img.png" class="img-circle avatar hidden-phone" />
                                    <a href="user-profile.html" class="name">Alejandra Galvan Castillo</a>
                                    <span class="subtext">Graphic Design</span>
                                </td>
                                <td>
                                    Jul 13, 2012
                                </td>
                                <td>
                                    $ 800.00
                                </td>
                                <td class="align-right">
                                    <a href="#">alejandra@canvas.com</a>
                                </td>
                            </tr>
                            <!-- row -->
                            <tr>
                                <td>
                                    <img src="img/contact-img2.png" class="img-circle avatar hidden-phone" />
                                    <a href="user-profile.html" class="name">Alejandra Galvan Castillo</a>
                                    <span class="subtext">Graphic Design</span>
                                </td>
                                <td>
                                    Feb 13, 2014
                                </td>
                                <td>
                                    $ 250.00
                                </td>
                                <td class="align-right">
                                    <a href="#">alejandra@canvas.com</a>
                                </td>
                            </tr>
                            <!-- row -->
                            <tr>
                                <td>
                                    <img src="img/contact-img.png" class="img-circle avatar hidden-phone" />
                                    <a href="user-profile.html" class="name">Alejandra Galvan Castillo</a>
                                    <span class="subtext">Graphic Design</span>
                                </td>
                                <td>
                                    Feb 27, 2014
                                </td>
                                <td>
                                    $ 1,300.00
                                </td>
                                <td class="align-right">
                                    <a href="#">alejandra@canvas.com</a>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="pagination pull-right">
                        <ul>
                            <li><a href="#">&#8249;</a></li>
                            <li><a class="active" href="#">1</a></li>
                            <li><a href="#">2</a></li>
                            <li><a href="#">3</a></li>
                            <li><a href="#">4</a></li>
                            <li><a href="#">5</a></li>
                            <li><a href="#">&#8250;</a></li>
                        </ul>
                    </div>
                    <!-- end users table -->
                </div>
            </div>
        </div>
        <!-- end main container -->
        

        <!-- scripts -->
        <script src="js/jquery-latest.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/theme.js"></script>
        <script type="text/javascript">
            function Darkskin(){
                document.getElementById("content").style.backgroundColor='#28303a';
                document.getElementById("sidebar-nav").style.backgroundColor='#28303a';
                document.getElementById("table").style.backgroundColor='#28303a';
            }
            function Defaultskin(){
                document.getElementById("content").style.backgroundColor='';
                document.getElementById("sidebar-nav").style.backgroundColor='';
                document.getElementById("table").style.backgroundColor='';
            }
        </script>

        </form>

</body>
</html>
