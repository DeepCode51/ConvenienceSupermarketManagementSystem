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

String   ddh="",xdsj="",yh="",zjg="",lxdh="",lxdz="",zt="",bld="";

rs=(ResultSet)request.getAttribute("rs");
if(rs.next()){
 ddh=rs.getString("ddh");
xdsj=rs.getString("xdsj");
yh=rs.getString("yh");
zjg=rs.getString("zjg");
lxdh=rs.getString("lxdh");
lxdz=rs.getString("lxdz");
zt=rs.getString("zt");
bld=rs.getString("bld");

}
%>

<!DOCTYPE html>
<html>
<head>
<script language="javascript">
function checkDo(){
if(form.ddh.value==""){
alert("订单号不能为空");
return false;
form.ddh.focus();
}

if(form.xdsj.value==""){
alert("下单时间不能为空");
return false;
form.xdsj.focus();
}

if(form.yh.value==""){
alert("用户不能为空");
return false;
form.yh.focus();
}

if(form.zjg.value==""){
alert("总价格不能为空");
return false;
form.zjg.focus();
}

if(form.lxdh.value==""){
alert("联系电话不能为空");
return false;
form.lxdh.focus();
}

if(form.lxdz.value==""){
alert("联系地址不能为空");
return false;
form.lxdz.focus();
}

if(form.zt.value==""){
alert("状态不能为空");
return false;
form.zt.focus();
}

if(form.bld.value==""){
alert("便利店不能为空");
return false;
form.bld.focus();
}


form.action="<%=path %>dingdanServlet";
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
                <div class="layui-card-header">修改订单</div>
                <form name="form" method=post class="layui-form layui-card-body" action="<%=path %>/dingdanServlet">
                 

	  <div class="layui-form-item">
                    <label class="layui-form-label">订单号</label>
                    <div class="layui-input-block">
                      <input type="text" name="ddh" required  lay-verify="required" placeholder="输入订单号" autocomplete="off" class="layui-input" value="<%=ddh%>" >
                    </div>
                  </div>

	  <div class="layui-form-item">
                    <label class="layui-form-label">下单时间</label>
                    <div class="layui-input-block">
                      <input type="text" name="xdsj" required  lay-verify="required" placeholder="输入下单时间" autocomplete="off" class="layui-input" value="<%=xdsj%>" >
                    </div>
                  </div>

	  <div class="layui-form-item">
                    <label class="layui-form-label">用户</label>
                    <div class="layui-input-block">
                      <input type="text" name="yh" required  lay-verify="required" placeholder="输入用户" autocomplete="off" class="layui-input" value="<%=yh%>" >
                    </div>
                  </div>

	  <div class="layui-form-item">
                    <label class="layui-form-label">总价格</label>
                    <div class="layui-input-block">
                      <input type="text" name="zjg" required  lay-verify="required" placeholder="输入总价格" autocomplete="off" class="layui-input" value="<%=zjg%>" >
                    </div>
                  </div>

	  <div class="layui-form-item">
                    <label class="layui-form-label">联系电话</label>
                    <div class="layui-input-block">
                      <input type="text" name="lxdh" required  lay-verify="required" placeholder="输入联系电话" autocomplete="off" class="layui-input" value="<%=lxdh%>" >
                    </div>
                  </div>

	  <div class="layui-form-item">
                    <label class="layui-form-label">联系地址</label>
                    <div class="layui-input-block">
                      <input type="text" name="lxdz" required  lay-verify="required" placeholder="输入联系地址" autocomplete="off" class="layui-input" value="<%=lxdz%>" >
                    </div>
                  </div>

	  <div class="layui-form-item">
                    <label class="layui-form-label">状态</label>
                    <div class="layui-input-block">
                    <select name="zt">
					<option value="未处理">未处理</option>
					<option value="已处理">已处理</option>
					<option value="配送">配送</option>
					<option value="完成">完成</option>
					</select>
                    </div>
                  </div>

	  <div class="layui-form-item">
                    <label class="layui-form-label">便利店</label>
                    <div class="layui-input-block">
                      <input type="text" name="bld" required  lay-verify="required" placeholder="输入便利店" autocomplete="off" class="layui-input" value="<%=bld%>"  readonly="">
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

