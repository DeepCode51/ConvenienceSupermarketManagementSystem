<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.util.*"%>
<%
DBO db=new DBO();
String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
request.setCharacterEncoding("gb2312");
ResultSet rs=null;
String sql="";
String keyid=(String)request.getParameter("keyid");
int row=0;

String   sp="",ybld="",xbld="",drsl="",czsj="",yh="";

rs=(ResultSet)request.getAttribute("rs");
if(rs.next()){
 sp=rs.getString("sp");
ybld=rs.getString("ybld");
xbld=rs.getString("xbld");
drsl=rs.getString("drsl");
czsj=rs.getString("czsj");
yh=rs.getString("yh");

}
%>

<!DOCTYPE html>
<html>
<head>
<script language="javascript">
function checkDo(){
if(form.sp.value==""){
alert("商品不能为空");
return false;
form.sp.focus();
}

if(form.ybld.value==""){
alert("原便利店不能为空");
return false;
form.ybld.focus();
}

if(form.xbld.value==""){
alert("新便利店不能为空");
return false;
form.xbld.focus();
}

if(form.drsl.value==""){
alert("调入数量不能为空");
return false;
form.drsl.focus();
}

if(form.czsj.value==""){
alert("操作时间不能为空");
return false;
form.czsj.focus();
}

if(form.yh.value==""){
alert("用户不能为空");
return false;
form.yh.focus();
}


form.action="<%=path %>diaopeiServlet";
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
                <div class="layui-card-header">修改调配</div>
                <form name="form" method=post class="layui-form layui-card-body" action="<%=path %>/diaopeiServlet">
                 

	  <div class="layui-form-item">
                    <label class="layui-form-label">商品</label>
                    <div class="layui-input-block">
                      <input type="text" name="sp" required  lay-verify="required" placeholder="输入商品" autocomplete="off" class="layui-input" value="<%=sp%>" >
                    </div>
                  </div>

	  <div class="layui-form-item">
                    <label class="layui-form-label">原便利店</label>
                    <div class="layui-input-block">
                      <input type="text" name="ybld" required  lay-verify="required" placeholder="输入原便利店" autocomplete="off" class="layui-input" value="<%=ybld%>" >
                    </div>
                  </div>

	  <div class="layui-form-item">
                    <label class="layui-form-label">新便利店</label>
                    <div class="layui-input-block">
                      <input type="text" name="xbld" required  lay-verify="required" placeholder="输入新便利店" autocomplete="off" class="layui-input" value="<%=xbld%>" >
                    </div>
                  </div>

	  <div class="layui-form-item">
                    <label class="layui-form-label">调入数量</label>
                    <div class="layui-input-block">
                      <input type="text" name="drsl" required  lay-verify="required" placeholder="输入调入数量" autocomplete="off" class="layui-input" value="<%=drsl%>" >
                    </div>
                  </div>

	  <div class="layui-form-item">
                    <label class="layui-form-label">操作时间</label>
                    <div class="layui-input-block">
                      <input type="text" name="czsj" required  lay-verify="required" placeholder="输入操作时间" autocomplete="off" class="layui-input" value="<%=czsj%>" >
                    </div>
                  </div>

	  <div class="layui-form-item">
                    <label class="layui-form-label">用户</label>
                    <div class="layui-input-block">
                      <input type="text" name="yh" required  lay-verify="required" placeholder="输入用户" autocomplete="off" class="layui-input" value="<%=yh%>" >
                    </div>
                  </div>


					<input type="hidden" name="keyid" value="<%=keyid%>">
		<input type=hidden name=method value="modify">
						
	
	

              
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

