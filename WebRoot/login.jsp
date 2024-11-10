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

    <div align="center">   <h1>便利超市管理系统</h1></div>

    <form class="login-form" method="post" action="logincheck.jsp">
        <div class="input-group">
            <input type="text" id="yhm" name="yhm" class="input-field" placeholder="输入用户名" required  lay-verify="required" >
            <label for="username" class="input-label">

            </label>
        </div>
        <div class="input-group">
            <input type="password" id="mm" name="mm" placeholder="输入密码" class="input-field">
            <label for="password" class="input-label">

            </label>
        </div>
        <div class="input-group">
           <select name="qx">
               <option value="用户">用户</option>
			   <option value="员工">员工</option>
               <option value="管理员">管理员</option>
           </select>
            <label for="username" class="input-label">

            </label>
        </div>
        <button type="submit" class="login-button">登录<i class="ai ai-enter"></i></button>
		 <button type="button" class="login-button" onClick="window.location='reg.jsp'">注册<i class="ai ai-enter"></i></button>
    </form>
</div>
</body>
<script src="assets/layui.js"></script>

</html>