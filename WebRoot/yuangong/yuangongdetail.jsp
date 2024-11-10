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
String   yhm="",mm="",xm="",bld="";


		
		if(keyid!=null&&!keyid.equals("")){
			
			sql+=" and ygid='"+keyid+"'";
			
		}
		
		rs=(ResultSet)request.getAttribute("rs");

if(rs.next()){
 yhm=rs.getString("yhm");
mm=rs.getString("mm");
xm=rs.getString("xm");
bld=rs.getString("bld");

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
                <div class="layui-card-header">查看员工</div>
                <form name="form" method=post class="layui-form layui-card-body" action="">
                 

	  <div class="layui-form-item">
                    <label class="layui-form-label">用户名</label>
                    <div class="layui-input-block">
		     <div class="layui-form-mid layui-word-aux"><%=yhm%></div>

                    </div>
                  </div>

	  <div class="layui-form-item">
                    <label class="layui-form-label">密码</label>
                    <div class="layui-input-block">
		     <div class="layui-form-mid layui-word-aux"><%=mm%></div>

                    </div>
                  </div>

	  <div class="layui-form-item">
                    <label class="layui-form-label">姓名</label>
                    <div class="layui-input-block">
		     <div class="layui-form-mid layui-word-aux"><%=xm%></div>

                    </div>
                  </div>

	  <div class="layui-form-item">
                    <label class="layui-form-label">便利店</label>
                    <div class="layui-input-block">
		     <div class="layui-form-mid layui-word-aux"><%=bld%></div>

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


