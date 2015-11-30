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
                alert("������ͣ��λ������");
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

                        <h5 class="personal-title">�½�ͣ����</h5>

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
            //���ص�ͼ�������������λ����
            map = new AMap.Map('field-map', {
                resizeEnable: true
            });
            map.plugin('AMap.Geolocation', function() {
                geolocation = new AMap.Geolocation({
                    enableHighAccuracy: true,//�Ƿ�ʹ�ø߾��ȶ�λ��Ĭ��:true
                    timeout: 10000,          //����10���ֹͣ��λ��Ĭ�ϣ������
                    maximumAge: 0,           //��λ�������0���룬Ĭ�ϣ�0
                    convert: true,           //�Զ�ƫ�����꣬ƫ�ƺ������Ϊ�ߵ����꣬Ĭ�ϣ�true
                    showButton: true,        //��ʾ��λ��ť��Ĭ�ϣ�true
                    buttonPosition: 'LB',    //��λ��ťͣ��λ�ã�Ĭ�ϣ�'LB'�����½�
                    buttonOffset: new AMap.Pixel(10, 20),//��λ��ť�����õ�ͣ��λ�õ�ƫ������Ĭ�ϣ�Pixel(10, 20)
                    showMarker: true,        //��λ�ɹ����ڶ�λ����λ����ʾ���ǣ�Ĭ�ϣ�true
                    showCircle: true,        //��λ�ɹ�����ԲȦ��ʾ��λ���ȷ�Χ��Ĭ�ϣ�true
                    panToLocation: true,     //��λ�ɹ��󽫶�λ����λ����Ϊ��ͼ���ĵ㣬Ĭ�ϣ�true
                    zoomToAccuracy: true     //��λ�ɹ��������ͼ��Ұ��Χʹ��λλ�ü����ȷ�Χ��Ұ�ڿɼ���Ĭ�ϣ�false
                    //setZoom:15
                });
                map.addControl(geolocation);
                AMap.event.addListener(geolocation, 'complete', onComplete);//���ض�λ��Ϣ
                AMap.event.addListener(geolocation, 'error', onError);      //���ض�λ������Ϣ

            });
            //��ȡ��ǰλ����Ϣ
            function getCurrentPosition() {
                geolocation.getCurrentPosition();


            }
            getCurrentPosition();

            /*    //��ص�ǰλ�ò���ȡ��ǰλ����Ϣ
             function watchPosition() {
             geolocation.watchPosition();
             }*/

            //������λ���
            function onComplete(data) {
                /* var str = '<div>��λ�ɹ�</div>';
                 str += '<div>���ȣ�' + data.position.getLng() + '</div>';
                 str += '<div>γ�ȣ�' + data.position.getLat() + '</div>';
                 str += '<div>���ȣ�' + data.accuracy + ' ��</div>';
                 str += '<div>�Ƿ񾭹�ƫ�ƣ�' + (data.isConverted ? '��' : '��') + '</div>';*/
                document.getElementById("longitude").value=data.position.getLng();
                document.getElementById("latitude").value=data.position.getLat();
            }

        </script>
    </form>


</body>
</html>