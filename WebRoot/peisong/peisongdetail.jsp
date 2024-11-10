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
String   dh="",cfd="",cfsj="",mdd="",ddsj="";


		
		if(keyid!=null&&!keyid.equals("")){
			
			sql+=" and psid='"+keyid+"'";
			
		}
		
		rs=(ResultSet)request.getAttribute("rs");

if(rs.next()){
 dh=rs.getString("dh");
cfd=rs.getString("cfd");
cfsj=rs.getString("cfsj");
mdd=rs.getString("mdd");
ddsj=rs.getString("ddsj");

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
                <div class="layui-card-header">查看配送</div>
                <form name="form" method=post class="layui-form layui-card-body" action="">
                 

	  <div class="layui-form-item">
                    <label class="layui-form-label">单号</label>
                    <div class="layui-input-block">
		     <div class="layui-form-mid layui-word-aux"><%=dh%></div>

                    </div>
                  </div>

	  <div class="layui-form-item">
                    <label class="layui-form-label">出发地</label>
                    <div class="layui-input-block">
		     <div class="layui-form-mid layui-word-aux"><%=cfd%></div>

                    </div>
                  </div>

	  <div class="layui-form-item">
                    <label class="layui-form-label">出发时间</label>
                    <div class="layui-input-block">
		     <div class="layui-form-mid layui-word-aux"><%=cfsj%></div>

                    </div>
                  </div>

	  <div class="layui-form-item">
                    <label class="layui-form-label">目的地</label>
                    <div class="layui-input-block">
		     <div class="layui-form-mid layui-word-aux"><%=mdd%></div>

                    </div>
                  </div>

	  <div class="layui-form-item">
                    <label class="layui-form-label">到达时间</label>
                    <div class="layui-input-block">
		     <div class="layui-form-mid layui-word-aux"><%=ddsj%></div>

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


