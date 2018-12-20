<%--
  Created by IntelliJ IDEA.
  User: Haoge
  Date: 2018/12/7
  Time: 19:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <base href="${pageContext.request.contextPath}/">
    <title>用户登录</title>
    <!-- 对IE浏览器自适应的处理 -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- 设定页面能够与设备屏幕的大小自适应 -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="js/bootstrap-3.3.7/css/bootstrap.min.css">
    <!-- 可选的Bootstrap主题文件（一般不用引入） -->
    <link rel="stylesheet" href="js/bootstrap-3.3.7/css/bootstrap-theme.min.css">
    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="js/jquery-2.2.4.js"></script>
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="js/bootstrap-3.3.7/js/bootstrap.min.js"></script>

    <script src="js/background/js/jrj6out.js"></script>
    <script>try {
        Typekit.load({async: false});
    } catch (e) {
    }</script>

    <style>
        body {
            position: relative;
            margin: 0;
            overflow: hidden;
        }

        .intro-container {
            position: absolute;
            top: 50%;
            transform: translateY(-50%);
            color: white;
            text-align: center;
            margin: 0 auto;
            right: 0;
            left: 0;
        }

        h1 {
            font-family: 'brandon-grotesque', sans-serif;
            font-weight: bold;
            margin-top: 0px;
            margin-bottom: 0;
            font-size: 20px;
        }

        @media screen and (min-width: 860px) {
            h1 {
                font-size: 40px;
                line-height: 52px;
            }
        }

        .fancy-text {
            font-family: "adobe-garamond-pro", sans-serif;
            font-style: italic;
            letter-spacing: 1px;
            margin-bottom: 17px;
        }

        .button {
            position: relative;
            cursor: pointer;
            display: inline-block;
            font-family: 'brandon-grotesque', sans-serif;
            text-transform: uppercase;
            min-width: 200px;
            margin-top: 30px;
        }

        .button:hover .border {
            box-shadow: 0px 0px 10px 0px white;
        }

        .button:hover .border .left-plane, .button:hover .border .right-plane {
            transform: translateX(0%);
        }

        .button:hover .text {
            color: #121212;
        }

        .button .border {
            border: 1px solid white;
            transform: skewX(-20deg);
            height: 32px;
            border-radius: 3px;
            overflow: hidden;
            position: relative;
            transition: .10s ease-out;
        }

        .button .border .left-plane, .button .border .right-plane {
            position: absolute;
            background: white;
            height: 32px;
            width: 100px;
            transition: .15s ease-out;
        }

        .button .border .left-plane {
            left: 0;
            transform: translateX(-100%);
        }

        .button .border .right-plane {
            right: 0;
            transform: translateX(100%);
        }

        .button .text {
            position: absolute;
            left: 0;
            right: 0;
            top: 50%;
            transform: translateY(-50%);
            transition: .15s ease-out;
        }

        .x-mark {
            right: 10px;
            top: 10px;
            position: absolute;
            cursor: pointer;
            opacity: 0;
        }

        .x-mark:hover .right {
            transform: rotate(-45deg) scaleY(1.2);
        }

        .x-mark:hover .left {
            transform: rotate(45deg) scaleY(1.2);
        }

        .x-mark .container {
            position: relative;
            width: 20px;
            height: 20px;
        }

        .x-mark .left, .x-mark .right {
            width: 2px;
            height: 20px;
            background: white;
            position: absolute;
            border-radius: 3px;
            transition: .15s ease-out;
            margin: 0 auto;
            left: 0;
            right: 0;
        }

        .x-mark .right {
            transform: rotate(-45deg);
        }

        .x-mark .left {
            transform: rotate(45deg);
        }

        .sky-container {
            position: absolute;
            color: white;
            text-transform: uppercase;
            margin: 0 auto;
            right: 0;
            left: 0;
            top: 2%;
            text-align: center;
            opacity: 0;
        }

        @media screen and (min-width: 860px) {
            .sky-container {
                top: 18%;
                right: 12%;
                left: auto;
            }
        }

        .sky-container__left, .sky-container__right {
            display: inline-block;
            vertical-align: top;
            font-weight: bold;
        }

        .sky-container__left h2, .sky-container__right h2 {
            font-family: 'brandon-grotesque', sans-serif;
            font-size: 26px;
            line-height: 26px;
            margin: 0;
        }

        @media screen and (min-width: 860px) {
            .sky-container__left h2, .sky-container__right h2 {
                font-size: 72px;
                line-height: 68px;
            }
        }

        .sky-container__left {
            margin-right: 5px;
        }

        .sky-container .thirty-one {
            letter-spacing: 4px;
        }

        .text-right {
            text-align: right;
        }

        .text-left {
            text-align: left;
        }

        .twitter:hover a {
            transform: rotate(-45deg) scale(1.05);
        }

        .twitter:hover i {
            color: #21c2ff;
        }

        .twitter a {
            bottom: -40px;
            right: -75px;
            transform: rotate(-45deg);
        }

        .twitter i {
            bottom: 7px;
            right: 7px;
            color: #00ACED;
        }

        .social-icon a {
            position: absolute;
            background: white;
            color: white;
            box-shadow: -1px -1px 20px 0px rgba(0, 0, 0, 0.3);
            display: inline-block;
            width: 150px;
            height: 80px;
            transform-origin: 50% 50%;
            transition: .15s ease-out;
        }

        .social-icon i {
            position: absolute;
            pointer-events: none;
            z-index: 1000;
            transition: .15s ease-out;
        }

        .youtube:hover a {
            transform: rotate(45deg) scale(1.05);
        }

        .youtube:hover i {
            color: #ec4c44;
        }

        .youtube a {
            bottom: -40px;
            left: -75px;
            transform: rotate(45deg);
        }

        .youtube i {
            bottom: 7px;
            left: 7px;
            color: #E62117;
        }

    </style>

    <script src="js/background/js/prefixfree.min.js"></script>

</head>

<body>
<div class="x-mark">
    <div class="container">
        <div class="left"></div>
        <div class="right"></div>
    </div>
</div>
<div class="intro-container">

    <h1>欢迎您！使用<br> 人力资源管理系统</h1>
    <h4>${sessionScope.errorMsg}</h4>
    <div class="button shift-camera-button">
        <div class="border">
            <div class="left-plane"></div>
            <div class="right-plane"></div>
        </div>
        <div class="text">用户登录</div>
    </div>
</div>

<div class="sky-container text-center">
    <div>
        <div class="col-lg-4">
        </div>
        <div class="col-lg-6">
            <div class="col-lg-1"></div>
            <div class="col-lg-5">
                <form action="open/login" method="post" class="form-horizontal" role="form">
                    <div class="form-group">
                        <div class="input-group input-group-lg">
                            <div class="input-group-addon"><span class="glyphicon glyphicon-user"
                                                                 style="color: #1e5cff"></span></div>
                            <input style="width: 550px;" type="text" class="form-control" id="loginName" name="username" value="admin" placeholder="请输入用户名">
                        </div>
                    </div>
                    <div class="clearfix"></div>
                    <br>
                    <div class="form-group">
                        <div class="input-group input-group-lg">
                            <div class="input-group-addon"><span class="glyphicon glyphicon-lock"
                                                                 style="color: firebrick;"></span></div>
                            <input style="width: 550px;" type="password" class="form-control" id="password" name="password" value="admin" placeholder="请输入密码">
                        </div>
                    </div>
                    <br>
                    <div class="form-group">
                        <div style="width: 580px" class="text-center">
                            <button type="submit" class="btn btn-primary btn-md login-btn-sumbit">&nbsp;登录&nbsp;</button>&nbsp;&nbsp;
                            <button type="reset" class="btn btn-default btn-md login-btn-reset">&nbsp;重置&nbsp;</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>


<script src='js/background/js/jquery.min.js'></script>
<script src='js/background/js/TweenMax.min.js'></script>
<script src='js/background/js/three.min.js'></script>
<script src="js/background/js/index.js"></script>

</body>
</html>
