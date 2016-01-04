<%@ page import="com.mysql.parkingspacedata" %>
<%@ page import="com.web.loginservlet" %>
<%@ page import="com.mysql.getstatistics" %><%--
  Created by IntelliJ IDEA.
  User: zhe-wang
  Date: 15-12-1
  Time: 下午3:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Detail Admin - Chart Showcase</title>

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
    <link href="css/lib/jquery-ui-1.10.2.custom.css" rel="stylesheet" type="text/css" />
    <link href="css/lib/font-awesome.css" type="text/css" rel="stylesheet" />
    <link href="css/lib/morris.css" type="text/css" rel="stylesheet" />

    <!-- open sans font -->
    <link href='http://fonts.useso.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css' />

    <!--[if lt IE 9]>
    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
</head>
<body>

    <!-- navbar -->
    <div class="navbar navbar-inverse">
        <div class="navbar-inner">

        </div>
    </div>
    <!-- end navbar -->

    <!-- sidebar -->
    <div id="sidebar-nav" >
        <ul id="dashboard-menu">
            <li>
                <a href="index.jsp">
                    <i class="icon-home"></i>
                    <span>主页</span>
                </a>
            </li>
            <li class="active">
                <div class="pointer">
                    <div class="arrow"></div>
                    <div class="arrow_border"></div>
                </div>
                <a href="chart.jsp">
                    <i class="icon-signal"></i>
                    <span>分析</span>
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
                    <span>设置</span>
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
            <a href="#" class="skin first_nav selected">
                <span class="icon"></span><span class="text">Default</span>
            </a>
            <a href="#" class="skin second_nav" data-file="css/skins/dark.css">
                <span class="icon"></span><span class="text">Dark skin</span>
            </a>
        </div>

        <div class="container-fluid">
            <div id="pad-wrapper">
                <!-- morris stacked chart -->
                <div class="row-fluid">
                    <div class="span12">
                        <br />
                        <div id="hero-area" style="height: 250px;"></div>
                    </div>
                </div>


                <!-- jQuery flot chart -->
                <div class="row-fluid section">
                    <h4 class="title">
                        <div class="btn-group pull-right">
                            <button class="glow left active">日</button>
                            <button class="glow middle">月</button>
                            <button class="glow right">年</button>
                        </div>
                    </h4>
                    <div class="span12">
                        <div id="statsChart" style="width: 97%;height: 250px;margin-top: 35px;"></div>
                    </div>
                </div>





            </div>
        </div>
    </div>
    <!-- end main container -->


    <!-- scripts for this page -->
    <script src="js/jquery-latest.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery-ui-1.10.2.custom.min.js"></script>
    <!-- knob -->
    <script src="js/jquery.knob.js"></script>
    <!-- flot charts -->
    <script src="js/jquery.flot.js"></script>
    <script src="js/jquery.flot.stack.js"></script>
    <script src="js/jquery.flot.resize.js"></script>
    <!-- morrisjs -->
    <script src="http://cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
    <script src="js/morris.min.js"></script>
    <!-- call all plugins -->
    <script src="js/theme.js"></script>

    <script type="text/javascript">
        <%
            parkingspacedata Parkingspacedata=new parkingspacedata();
            Parkingspacedata.getstatus("select * from parking_space where parking_id="+loginservlet.id);
        %>
        var GetChart=eval(<%=Parkingspacedata.UserListData()%>);

        var Free = 0;
        var Book = 0;
        var Use = 0;
        for (var i=0 ; i <GetChart.length; i++){
            if(GetChart[i].status==0){Free++;}
            else if(GetChart[i].status==1){Book++;}
            else {Use++;}


           // alert(Month);

        }
        // Morris Donut Chart
        Morris.Donut({
            element: 'hero-area',
            data: [
                {label: '空闲', value: Math.round((Free/GetChart.length)*100) },
                {label: '预定中', value: Math.round((Book/GetChart.length)*100) },
                {label: '使用中', value: Math.round((Use/GetChart.length)*100) },
            ],
            colors: ["#30a1ec", "#76bdee", "#c4dafe"],
            formatter: function (y) { return y + "%" }
        });

/*        <%
        getstatistics GstStatistics = new getstatistics();
        GstStatistics.getstatistics("select * from statistics where parking_id="+loginservlet.id);
        %>
        var Statistics =eval(<%=GstStatistics.data()%>);

        var myDate=new Date(GetChart[i].time);
        var Month = myDate.getMonth()+1;*/

        //  jQuery Flot Chart
        var visits = [[1, 0], [2, 0], [3, 0], [4, 0],[5, 0],[6, 65]];
        var visitors = [[1,0], [2,0], [3, 0], [4, 0],[5, 0],[6, 40]];

        var plot = $.plot($("#statsChart"),
                [ { data: visits, label: "停车"},
                    { data: visitors, label: "预约" }], {
                    series: {
                        lines: { show: true,
                            lineWidth: 1,
                            fill: true,
                            fillColor: { colors: [ { opacity: 0.05 }, { opacity: 0.09 } ] }
                        },
                        points: { show: true,
                            lineWidth: 2,
                            radius: 3
                        },
                        shadowSize: 0,
                        stack: true
                    },
                    grid: { hoverable: true,
                        clickable: true,
                        tickColor: "#f9f9f9",
                        borderWidth: 0
                    },
                    legend: {
                        // show: false
                        labelBoxBorderColor: "#fff"
                    },
                    colors: ["#a7b5c5", "#30a0eb"],
                    xaxis: {
                        ticks: [[1, "" ], [2, ""], [3, ""], [4,""], [5,""], [6,""],
                            [7,""]],
                        font: {
                            size: 12,
                            family: "Open Sans, Arial",
                            variant: "small-caps",
                            color: "#9da3a9"
                        }
                    },
                    yaxis: {
                        ticks:3,
                        tickDecimals: 0,
                        font: {size:12, color: "#9da3a9"}
                    }
                });

        function showTooltip(x, y, contents) {
            $('<div id="tooltip">' + contents + '</div>').css( {
                position: 'absolute',
                display: 'none',
                top: y - 30,
                left: x - 50,
                color: "#fff",
                padding: '2px 5px',
                'border-radius': '6px',
                'background-color': '#000',
                opacity: 0.80
            }).appendTo("body").fadeIn(200);
        }

        var previousPoint = null;
        $("#statsChart").bind("plothover", function (event, pos, item) {
            if (item) {
                if (previousPoint != item.dataIndex) {
                    previousPoint = item.dataIndex;

                    $("#tooltip").remove();
                    var x = item.datapoint[0].toFixed(0),
                            y = item.datapoint[1].toFixed(0);

                    var month = item.series.xaxis.ticks[item.dataIndex].label;

                    showTooltip(item.pageX, item.pageY,
                            item.series.label + "  " + month + ": " + y);
                }
            }
            else {
                $("#tooltip").remove();
                previousPoint = null;
            }
        });
    </script>
</body>
</html>
