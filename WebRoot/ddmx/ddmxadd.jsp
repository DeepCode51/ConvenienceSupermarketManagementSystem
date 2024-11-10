<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.util.*"%>
<%
request.setCharacterEncoding("gb2312");
DBO db=new DBO();
db.open();
String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>


<!DOCTYPE html>
<html>
<head>
<script language="javascript">
function checkDo(){
if(form.dd.value==""){
alert("订单不能为空");
return false;
form.dd.focus();
}

if(form.sp.value==""){
alert("商品不能为空");
return false;
form.sp.focus();
}

if(form.sl.value==""){
alert("数量不能为空");
return false;
form.sl.focus();
}

if(form.jg.value==""){
alert("价格不能为空");
return false;
form.jg.focus();
}

if(form.yh.value==""){
alert("用户不能为空");
return false;
form.yh.focus();
}

if(form.bld.value==""){
alert("便利店不能为空");
return false;
form.bld.focus();
}


form.action="<%=path %>/ddmxServlet";
form.submit();
}
</script>

    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/layui.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/view.css"/>
    <title></title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312"></head>
<body class="layui-view-body">


    <div class="layui-content">
        <div class="layui-row">
            <div class="layui-card">
                <div class="layui-card-header">新增订单明细</div>
                <form name="form" method=post class="layui-form layui-card-body" action="<%=path %>/ddmxServlet">
                 

	  <div class="layui-form-item">
                    <label class="layui-form-label">订单</label>
                    <div class="layui-input-block">
                      <input type="text" name="dd" required  lay-verify="required" placeholder="输入订单" autocomplete="off" class="layui-input">
                    </div>
                  </div>

	  <div class="layui-form-item">
                    <label class="layui-form-label">商品</label>
                    <div class="layui-input-block">
                      <input type="text" name="sp" required  lay-verify="required" placeholder="输入商品" autocomplete="off" class="layui-input">
                    </div>
                  </div>

	  <div class="layui-form-item">
                    <label class="layui-form-label">数量</label>
                    <div class="layui-input-block">
                      <input type="text" name="sl" required  lay-verify="required" placeholder="输入数量" autocomplete="off" class="layui-input">
                    </div>
                  </div>

	  <div class="layui-form-item">
                    <label class="layui-form-label">价格</label>
                    <div class="layui-input-block">
                      <input type="text" name="jg" required  lay-verify="required" placeholder="输入价格" autocomplete="off" class="layui-input">
                    </div>
                  </div>

	  <div class="layui-form-item">
                    <label class="layui-form-label">用户</label>
                    <div class="layui-input-block">
                      <input type="text" name="yh" required  lay-verify="required" placeholder="输入用户" autocomplete="off" class="layui-input">
                    </div>
                  </div>

	  <div class="layui-form-item">
                    <label class="layui-form-label">便利店</label>
                    <div class="layui-input-block">
                      <input type="text" name="bld" required  lay-verify="required" placeholder="输入便利店" autocomplete="off" class="layui-input">
                    </div>
                  </div>


					
						
		<input type=hidden name=method value="insert">
	

              
                  <div class="layui-form-item">
                    <div class="layui-input-block">
                      <button type="submit" class="layui-btn layui-btn-blue" lay-submit lay-filter="formDemo">提交</button>
                      <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                    </div>
                  </div>
                </form>  
            </div>
        </div>
    </div>
    <script src="<%=request.getContextPath()%>/assets/layui.all.js" charset="utf-8"></script>
<font color="#FF0000">
<%
if(request.getAttribute("flag")!=null){
out.println("操作提示："+(String)request.getAttribute("flag"));
}
%>
</font>


</body>
</html>




<%
db.close();
%>
