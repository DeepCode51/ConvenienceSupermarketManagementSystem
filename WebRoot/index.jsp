<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.main.util.*"%>

<%
request.setCharacterEncoding("gb2312");
String qx="";
if(session.getAttribute("qx")!=null){
qx=(String)session.getAttribute("qx");
}
%>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="gb2312">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="assets/css/layui.css">
    <link rel="stylesheet" href="assets/css/admin.css">
    <link rel="icon" href="/favicon.ico">
    <title>便利超市管理系统</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312"></head>
<body class="layui-layout-body">
    <div class="layui-layout layui-layout-admin">
        <div class="layui-header custom-header">
            
            <ul class="layui-nav layui-layout-left">
                <li class="layui-nav-item slide-sidebar" lay-unselect>
                    <a href="javascript:;" class="icon-font"><i class="ai ai-menufold"></i></a>
                </li>
            </ul>

            <ul class="layui-nav layui-layout-right">
                <li class="layui-nav-item">
                    <a href="javascript:;"><%=session.getAttribute("yhm")%></a>
                    <dl class="layui-nav-child">

                        <dd><a href="<%=request.getContextPath()%>/login.jsp">退出</a></dd>
                    </dl>
                </li>
            </ul>
        </div>

        <div class="layui-side custom-admin">
            <div class="layui-side-scroll">

                <div class="custom-logo">
                 
                    <h1>系统操作菜单</h1>
                </div>
                <ul id="Nav" class="layui-nav layui-nav-tree">

               
			   	<%
				if(qx.equals("管理员")){
				%>
                       
                    <li class="layui-nav-item">
                        <a href="javascript:;">
                            <i class="layui-icon">&#xe857;</i>
                            <em>用户管理</em>
                        </a>
                        <dl class="layui-nav-child">
						  <dd><a href="gly/glyadd.jsp">增加管理员</a></dd>
                            <dd><a href="glyServlet?method=list">管理管理员</a></dd>
						          <dd><a href="yuangong/yuangongadd.jsp">增加员工</a></dd>
                            <dd><a href="yuangongServlet?method=list">管理员工</a></dd>
                            <dd><a href="yonghu/yonghuadd.jsp">增加用户</a></dd>
                            <dd><a href="yonghuServlet?method=list">管理用户</a></dd>
				
                        </dl>
                    </li>
                
                       
                    <li class="layui-nav-item">
                        <a href="javascript:;">
                            <i class="layui-icon">&#xe857;</i>
                            <em>便利店管理</em>
                        </a>
                        <dl class="layui-nav-child">
                            <dd><a href="bld/bldadd.jsp">增加便利店</a></dd>
                            <dd><a href="bldServlet?method=list">管理便利店</a></dd>
				
                        </dl>
                    </li>
                
                       
      
                       
                    <li class="layui-nav-item">
                        <a href="javascript:;">
                            <i class="layui-icon">&#xe857;</i>
                            <em>供应商管理</em>
                        </a>
                        <dl class="layui-nav-child">
						 <dd><a href="dengji/dengjiadd.jsp">增加等级</a></dd>
                            <dd><a href="dengjiServlet?method=list">管理等级</a></dd>
                            <dd><a href="gys/gysadd.jsp">增加供应商</a></dd>
                            <dd><a href="gysServlet?method=list">管理供应商</a></dd>
				
                        </dl>
                    </li>
					
					<% }%>
                
                         	<%
				if(qx.equals("员工")){
				%>
                    <li class="layui-nav-item">
                        <a href="javascript:;">
                            <i class="layui-icon">&#xe857;</i>
                            <em>商品管理</em>
                        </a>
                        <dl class="layui-nav-child">
                            <dd><a href="shangpin/shangpinadd.jsp">增加商品</a></dd>
                            <dd><a href="shangpinServlet?method=list">管理商品</a></dd>
				
                        </dl>
                    </li>
                
                       
                    <li class="layui-nav-item">
                        <a href="javascript:;">
                            <i class="layui-icon">&#xe857;</i>
                            <em>入库管理</em>
                        </a>
                        <dl class="layui-nav-child">
                            <dd><a href="ruku/rukuadd.jsp">增加入库</a></dd>
                            <dd><a href="rukuServlet?method=list">管理入库</a></dd>
				
                        </dl>
                    </li>
                
                       
                    <li class="layui-nav-item">
                        <a href="javascript:;">
                            <i class="layui-icon">&#xe857;</i>
                            <em>调配管理</em>
                        </a>
                        <dl class="layui-nav-child">
                            <dd><a href="diaopei/diaopeiadd.jsp">增加调配</a></dd>
                            <dd><a href="diaopeiServlet?method=list">管理调配</a></dd>
				
                        </dl>
                    </li>
                
                       <% }%>
					   
					     	<%
				if(!qx.equals("管理员")){
				%>
                    <li class="layui-nav-item">
                        <a href="javascript:;">
                            <i class="layui-icon">&#xe857;</i>
                            <em>订单管理</em>
                        </a>
                        <dl class="layui-nav-child">
                            	<%
				if(qx.equals("员工")){
				%>
                            <dd><a href="dingdanServlet?method=list">管理订单</a></dd>
							<% }%>
							
							  	<%
				if(qx.equals("用户")){
				%>
				    <dd><a href="dingdanServlet?method=mylist">我的订单</a></dd>
					<% }%>
                        </dl>
                    </li>
                
                         	<%
				if(qx.equals("用户")){
				%>
                    <li class="layui-nav-item">
                        <a href="javascript:;">
                            <i class="layui-icon">&#xe857;</i>
                            <em>商品购物</em>
                        </a>
                        <dl class="layui-nav-child">
                            <dd><a href="ddmx/list.jsp">浏览商品</a></dd>
							
							   <dd><a href="ddmx/cart.jsp">购物车</a></dd>
                         
				
                        </dl>
                    </li>
					<% }%>
                
                       <% }%>
					   
					     	<%
				if(qx.equals("员工")){
				%>
                    <li class="layui-nav-item">
                        <a href="javascript:;">
                            <i class="layui-icon">&#xe857;</i>
                            <em>配送管理</em>
                        </a>
                        <dl class="layui-nav-child">
                            <dd><a href="peisong/list.jsp">订单配送</a></dd>
                            <dd><a href="peisongServlet?method=list">管理配送</a></dd>
				
                        </dl>
                    </li>
					<% }%>
                
				       <li class="layui-nav-item">
                        <a href="javascript:;">
                            <i class="layui-icon">&#xe857;</i>
                            <em>个人信息</em>
                        </a>
                        <dl class="layui-nav-child">
                            	<%
				if(qx.equals("管理员")){
				%>
                            <dd><a href="glyServlet?method=mod">个人信息</a></dd>
							<% }%>
							  	<%
				if(qx.equals("用户")){
				%>
							<dd><a href="yonghuServlet?method=mod">个人信息</a></dd>
							<% }%>
							
							  	<%
				if(qx.equals("员工")){
				%>
							<dd><a href="yuangongServlet?method=mod">个人信息</a></dd>
							<% }%>
				
                        </dl>
                    </li>
                    


                </ul>

            </div>
        </div>

        <div class="layui-body">
             <div class="layui-tab app-container" lay-allowClose="true" lay-filter="tabs">
                <ul id="appTabs" class="layui-tab-title custom-tab"></ul>
                <div id="appTabPage" class="layui-tab-content"></div>
            </div>
        </div>

        <div class="layui-footer">
            <p></p>
        </div>

        <div class="mobile-mask"></div>
    </div>
    <script src="assets/layui.js"></script>
    <script src="index.js" data-main="home"></script>
</body>
</html>






