<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.util.*"%>
<%
request.setCharacterEncoding("gb2312");//设置页面字符集
DBO db=new DBO();//数据库链接
String   spmc="",js="",tp="",jg="",kc="",bld="";//初始化变量
String keyid=(String)request.getParameter("keyid");//主键
String sql="select * from shangpin where spid="+keyid;//定义查询sql语句
ResultSet rs=null;//定义查询结果集
db.open();//打开数据库链接
rs=db.query(sql);//执行查询结果

/*
商品信息详情页面
*/
if(rs.next()){//遍历结果集查询 相应的变量
 spmc=rs.getString("spmc");//商品名称
js=rs.getString("js");//介绍
tp=rs.getString("tp");//图片
jg=rs.getString("jg");//价格
kc=rs.getString("kc");//库存
bld=rs.getString("bld");//便利店

}
%>

<HTML ><HEAD id=Head1><TITLE>商品</TITLE>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta name="renderer" content="webkit">
    <link rel="stylesheet" href="../assets/css/layui.css">
    <link rel="stylesheet" href="../assets/css/view.css"/>



</HEAD>
<BODY class="layui-view-body">




<div class="layui-content">
        <div class="layui-row">
            <div class="layui-card">
                <div class="layui-card-header">查看商品</div>
                <form class="layui-form layui-card-body" action="cart.jsp" method="post">
                  <div class="layui-form-item">
                    <label class="layui-form-label">商品名称</label>
                    <div class="layui-input-block">
                <div class="layui-form-mid layui-word-aux">   <%=spmc%> </div>
                    </div>
                  </div>
                  <div class="layui-form-item">
                    <label class="layui-form-label">介绍</label>
                    <div class="layui-input-block">
                <div class="layui-form-mid layui-word-aux">   <%=js%> </div>
                    </div>
                  </div>
                  <div class="layui-form-item">
                    <label class="layui-form-label">图片</label>
                    <div class="layui-input-block">
                <div class="layui-form-mid layui-word-aux">   <img src="../upload/<%=tp%>" width="200" height="200"> </div>
                    </div>
                  </div>
                  <div class="layui-form-item">
                    <label class="layui-form-label">价格</label>
                    <div class="layui-input-block">
                <div class="layui-form-mid layui-word-aux">   <%=jg%> </div>
                    </div>
                  </div>
                  <div class="layui-form-item">
                    <label class="layui-form-label">库存</label>
                    <div class="layui-input-block">
                <div class="layui-form-mid layui-word-aux">   <%=kc%> </div>
                    </div>
                  </div>
                  <div class="layui-form-item">
                    <label class="layui-form-label">便利店</label>
                    <div class="layui-input-block">
                <div class="layui-form-mid layui-word-aux">   <%=bld%> </div>
                    </div>
                  </div>
				
			    <div class="layui-form-item">
                    <label class="layui-form-label"></label>
                    <div class="layui-input-block">
                <div class="layui-form-mid layui-word-aux">    购买数量   <input type="number" name="sl" value="1" min=1 max=<%=kc%>>  <br> 
	  
	  <input type="hidden" name="keyid" value="<%=keyid%>" />
	  <input type="hidden" name="bld" value="<%=bld%>" />
	  <input type="hidden" name="jg" value="<%=jg%>" /> </div>
                    </div>
                  </div>
				
                  <div class="layui-form-item">
                    <div class="layui-input-block">
                      <button class="layui-btn layui-btn-blue" type="button" onClick="window.history.go(-1);">返回</button>
					  
					  
					  <%
if(session.getAttribute("yhm")!=null){
%>



<input type="submit" value="购买" name="B11" class="layui-btn layui-btn-blue"  id="B11"  />

<% } else {%>





<font color="red" size="3">登录后可购买</font>
<% }%>
                    </div>
                  </div><input type="hidden" name="keyid" value="<%=keyid%>">
                </form>  
            </div>
        </div>
    </div>
    <script src="../assets/layui.all.js"></script>
    <script>
      var form = layui.form
        ,layer = layui.layer;
    </script>






</BODY></HTML>


<%
db.close();
%>




