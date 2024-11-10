<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.util.*"%>
<%
DBO db=new DBO();
db.open();
ResultSet rs=null;
request.setCharacterEncoding("gb2312");
String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
String keyid=(String)request.getParameter("keyid");
String sql="";
String   gysmc="",js="",jyfw="",dj="";


		
		if(keyid!=null&&!keyid.equals("")){
			
			sql+=" and gysid='"+keyid+"'";
			
		}
		
		rs=(ResultSet)request.getAttribute("rs");

if(rs.next()){
 gysmc=rs.getString("gysmc");
js=rs.getString("js");
jyfw=rs.getString("jyfw");
dj=rs.getString("dj");

}
%>




<!DOCTYPE html>
<html>
<head>

    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/layui.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/view.css"/>
    <title></title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312"></head>
<body class="layui-view-body">


    <div class="layui-content">
        <div class="layui-row">
            <div class="layui-card">
                <div class="layui-card-header">查看供应商</div>
                <form name="form" method=post class="layui-form layui-card-body" action="">
                 

	  <div class="layui-form-item">
                    <label class="layui-form-label">供应商名称</label>
                    <div class="layui-input-block">
		     <div class="layui-form-mid layui-word-aux"><%=gysmc%></div>

                    </div>
                  </div>

	  <div class="layui-form-item">
                    <label class="layui-form-label">介绍</label>
                    <div class="layui-input-block">
		     <div class="layui-form-mid layui-word-aux"><%=js%></div>

                    </div>
                  </div>

	  <div class="layui-form-item">
                    <label class="layui-form-label">经营范围</label>
                    <div class="layui-input-block">
		     <div class="layui-form-mid layui-word-aux"><%=jyfw%></div>

                    </div>
                  </div>

	  <div class="layui-form-item">
                    <label class="layui-form-label">等级</label>
                    <div class="layui-input-block">
		     <div class="layui-form-mid layui-word-aux"><%=dj%></div>

                    </div>
                  </div>


            <input type="hidden" name="keyid" value="<%=keyid%>">
		<input type=hidden name=method value="modify">
                  <div class="layui-form-item">
                    <div class="layui-input-block">
                      <button type="button" class="layui-btn layui-btn-blue" lay-submit lay-filter="formDemo" onClick="history.go(-1)">返回</button>
                
                    </div>
                  </div>
                </form>  
            </div>
        </div>
    </div>
    <script src="<%=request.getContextPath()%>/assets/layui.all.js"></script>


</body>
</html>


