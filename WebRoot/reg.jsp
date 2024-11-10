<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%
request.setCharacterEncoding("gb2312");
%>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="gb2312">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="assets/css/layui.css">
    <link rel="stylesheet" href="assets/css/login.css">
  <style>
     body{
    background-image: url(bj.jpg); /*背景图片路径设置*/
    background-repeat:no-repeat; /*不进行平铺，图片适应窗口大小*/
    background-attachment: fixed; /*背景图片固定，不随内容滚动*/
    background-origin: border-box; /*从边框区域显示*/
    background-size:cover;/*全部覆盖*/

}

    
    </style>
    <title>便利超市管理系统 </title>
</head>
<body class="login-wrap">
<div class="login-container">

    <div align="center">   <h1>用户注册</h1></div>

    <form class="login-form" method="post" action="do.jsp">
      <div class="layui-form-item">
                    <label class="layui-form-label">用户名</label>
                    <div class="layui-input-block">
                      <input type="text" name="yhm" required  lay-verify="required" placeholder="请输入用户名" autocomplete="off" class="layui-input" value="">
                    </div>
                  </div>
                  <div class="layui-form-item">
                    <label class="layui-form-label">密码</label>
                    <div class="layui-input-block">
                      <input type="text" name="mm" required  lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input" value="">
                    </div>
                  </div>
                  <div class="layui-form-item">
                    <label class="layui-form-label">姓名</label>
                    <div class="layui-input-block">
                      <input type="text" name="xm" required  lay-verify="required" placeholder="请输入姓名" autocomplete="off" class="layui-input" value="">
                    </div>
                  </div>
                  <div class="layui-form-item">
                    <label class="layui-form-label">联系电话</label>
                    <div class="layui-input-block">
                      <input type="text" name="lxdh" required  lay-verify="required" placeholder="请输入联系电话" autocomplete="off" class="layui-input" value="">
                    </div>
                  </div>
                  <div class="layui-form-item">
                    <label class="layui-form-label">联系地址</label>
                    <div class="layui-input-block">
                      <input type="text" name="lxdz" required  lay-verify="required" placeholder="请输入联系地址" autocomplete="off" class="layui-input" value="">
                    </div>
                  </div>
        <button type="submit" class="login-button">注册<i class="ai ai-enter"></i></button>
		 <button type="button" class="login-button" onClick="window.location='login.jsp'">返回登录<i class="ai ai-enter"></i></button>
    </form>
</div>
</body>
<script src="assets/layui.js"></script>

</html>