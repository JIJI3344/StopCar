<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <title>Detail Admin - My Info</title>

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
    <link rel="stylesheet" href="css/compiled/personal-info.css" type="text/css" media="screen" />

    <!-- open sans font -->
    <link href='http://fonts.useso.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css' />

    <!--map-->
    <link rel="stylesheet" href="http://cache.amap.com/lbs/static/main.css"/>

    <!--[if lt IE 9]>
    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" /></head>
    <script type="text/javascript">
        function check(){
            if(document.getElementById("number").value=="number"){
                alert("请输入停车位数量！");
                document.getElementById("name").focus();
                return false;
            }
        }
    </script>
<body>
    <form action="<%= path %>/personalservlet" method="post">
        <!-- navbar -->
        <div class="navbar navbar-inverse">
            <div class="navbar-inner">

            </div>
        </div>
        <!-- end navbar -->

        <!-- main container .wide-content is used for this layout without sidebar :)  -->
        <div class="content wide-content">
            <div class="container-fluid">
                <div class="settings-wrapper" id="pad-wrapper">
                    <!-- avatar column -->
                    <div class="span3 avatar-box">
                        <div class="personal-image">
                            <img src="img/personal-info.png" class="avatar img-circle" />
                            <p>Upload a different photo...</p>

                            <input type="file" />
                        </div>
                    </div>

                    <!-- edit form column -->
                    <div class="span7 personal-info">

                        <h5 class="personal-title">新建停车厂</h5>

                        <form />
                            <div class="field-box">
                                <label>Number:</label>
                                <input class="span5 inline-input" type="text" value="0" name="number"/>
                            </div>
                            <div class="field-box">
                                <label>Longitude:</label>
                                <input class="span5 inline-input" type="text" value="longitude" id="longitude" name="longitude"/>
                            </div>
                            <div class="field-box">
                                <label>Latitude:</label>
                                <input class="span5 inline-input" type="text" value="latitude" id="latitude" name="latitude"/>
                            </div>
                            <div id="field-map" >

                            </div>

                            <div class="span6 field-box actions">
                                <input type="submit" class="btn-glow primary" value="Save" onclick="return check()" />
                                <!--<span>OR</span>
                                <input type="reset" value="Cancel" class="reset" />-->
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!-- end main container -->

        <!-- scripts -->
        <script src="js/jquery-latest.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/theme.js"></script>
        <script src='http://webapi.amap.com/maps?v=1.3&key=eb3386d571d52e3e3784bb19f80507ab'></script>
        <script type="text/javascript">
            var map, geolocation;
            //加载地图，调用浏览器定位服务
            map = new AMap.Map('field-map', {
                resizeEnable: true
            });
            map.plugin('AMap.Geolocation', function() {
                geolocation = new AMap.Geolocation({
                    enableHighAccuracy: true,//是否使用高精度定位，默认:true
                    timeout: 10000,          //超过10秒后停止定位，默认：无穷大
                    maximumAge: 0,           //定位结果缓存0毫秒，默认：0
                    convert: true,           //自动偏移坐标，偏移后的坐标为高德坐标，默认：true
                    showButton: true,        //显示定位按钮，默认：true
                    buttonPosition: 'LB',    //定位按钮停靠位置，默认：'LB'，左下角
                    buttonOffset: new AMap.Pixel(10, 20),//定位按钮与设置的停靠位置的偏移量，默认：Pixel(10, 20)
                    showMarker: true,        //定位成功后在定位到的位置显示点标记，默认：true
                    showCircle: true,        //定位成功后用圆圈表示定位精度范围，默认：true
                    panToLocation: true,     //定位成功后将定位到的位置作为地图中心点，默认：true
                    zoomToAccuracy: true     //定位成功后调整地图视野范围使定位位置及精度范围视野内可见，默认：false
                    //setZoom:15
                });
                map.addControl(geolocation);
                AMap.event.addListener(geolocation, 'complete', onComplete);//返回定位信息
                AMap.event.addListener(geolocation, 'error', onError);      //返回定位出错信息

            });
            //获取当前位置信息
            function getCurrentPosition() {
                geolocation.getCurrentPosition();


            }
            getCurrentPosition();

            /*    //监控当前位置并获取当前位置信息
             function watchPosition() {
             geolocation.watchPosition();
             }*/

            //解析定位结果
            function onComplete(data) {
                /* var str = '<div>定位成功</div>';
                 str += '<div>经度：' + data.position.getLng() + '</div>';
                 str += '<div>纬度：' + data.position.getLat() + '</div>';
                 str += '<div>精度：' + data.accuracy + ' 米</div>';
                 str += '<div>是否经过偏移：' + (data.isConverted ? '是' : '否') + '</div>';*/
                document.getElementById("longitude").value=data.position.getLng();
                document.getElementById("latitude").value=data.position.getLat();
            }

        </script>
    </form>


</body>
</html>