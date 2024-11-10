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
String   spmc="",js="",tp="",jg="",kc="",bld="",gys="";


		
		if(keyid!=null&&!keyid.equals("")){
			
			sql+=" and spid='"+keyid+"'";
			
		}
		
		rs=(ResultSet)request.getAttribute("rs");

if(rs.next()){
 spmc=rs.getString("spmc");
js=rs.getString("js");
tp=rs.getString("tp");
jg=rs.getString("jg");
kc=rs.getString("kc");
bld=rs.getString("bld");
gys=rs.getString("gys");
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
                <div class="layui-card-header">查看商品</div>
                <form name="form" method=post class="layui-form layui-card-body" action="">
                 

	  <div class="layui-form-item">
                    <label class="layui-form-label">商品名称</label>
                    <div class="layui-input-block">
		     <div class="layui-form-mid layui-word-aux"><%=spmc%></div>

                    </div>
                  </div>
				  
				  
				  
	  <div class="layui-form-item">
                    <label class="layui-form-label">供应商</label>
                    <div class="layui-input-block">
		     <div class="layui-form-mid layui-word-aux"><%=gys%></div>

                    </div>
                  </div>

	  <div class="layui-form-item">
                    <label class="layui-form-label">介绍</label>
                    <div class="layui-input-block">
		     <div class="layui-form-mid layui-word-aux"><%=js%></div>

                    </div>
                  </div>

	  <div class="layui-form-item">
                    <label class="layui-form-label">图片</label>
                    <div class="layui-input-block">
		     <div class="layui-form-mid layui-word-aux">
			 
			 
			 <img src="<%=request.getContextPath()%>/upload/<%=tp%>" width="200" height="200 ">
			 </div>

                    </div>
                  </div>

	  <div class="layui-form-item">
                    <label class="layui-form-label">价格</label>
                    <div class="layui-input-block">
		     <div class="layui-form-mid layui-word-aux"><%=jg%></div>

                    </div>
                  </div>

	  <div class="layui-form-item">
                    <label class="layui-form-label">库存</label>
                    <div class="layui-input-block">
		     <div class="layui-form-mid layui-word-aux"><%=kc%></div>

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


