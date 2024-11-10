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
			
			String sql="";
			ResultSet rs=null;
			int all=0;
			int num=0;
			String bld="";
			
			if(session.getAttribute("yhm")!=null){
			
			sql="select sum(sl*jg) as num from ddmx where dd='' and yh='"+session.getAttribute("yhm")+"'";
			rs=db.query(sql);
			if(rs.next()){
			
			num=rs.getInt("num");
			}
			
				sql="select * from ddmx where dd='' and yh='"+session.getAttribute("yhm")+"'";
				
				rs=db.query(sql);
			if(rs.next()){
			
			bld=rs.getString("bld");
			}
			
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


form.action="<%=path %>/dingdanServlet";
form.submit();
}
</script>

    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/layui.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/view.css"/>
    <title></title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312"></head>
<body class="layui-view-body">

	<%
	java.util.Date   now=new   java.util.Date();   
			  java.text.SimpleDateFormat   formatter=new   java.text.SimpleDateFormat("yyyyMMddHHmmssssss");
			//  System.out.print(formatter.format(now));
			  String ddid="order"+formatter.format(now);

	
	%>

    <div class="layui-content">
        <div class="layui-row">
            <div class="layui-card">
                <div class="layui-card-header">新增订单</div>
                <form name="form" method=post class="layui-form layui-card-body" action="<%=path %>/ddmx/do.jsp">
                 

	  <div class="layui-form-item">
                    <label class="layui-form-label">订单号</label>
                    <div class="layui-input-block">
                      <input type="text" name="ddh" required  lay-verify="required" placeholder="输入订单号" autocomplete="off" class="layui-input" value="<%=ddid%>" readonly="">
                    </div>
                  </div>

	  <div class="layui-form-item">
                    <label class="layui-form-label">下单时间</label>
                    <div class="layui-input-block">
                      <input type="text" name="xdsj" required  lay-verify="required" placeholder="输入下单时间" autocomplete="off" class="layui-input" value="<%=StaticMethod.getStringDate()%>" readonly="">
                    </div>
                  </div>

	  <div class="layui-form-item">
                    <label class="layui-form-label">用户</label>
                    <div class="layui-input-block">
                      <input type="text" name="yh" required  lay-verify="required" placeholder="输入用户" autocomplete="off" class="layui-input" value="<%=session.getAttribute("yhm")%>">
                    </div>
                  </div>

	  <div class="layui-form-item">
                    <label class="layui-form-label">总价格</label>
                    <div class="layui-input-block">
                      <input type="text" name="zjg" required  lay-verify="required" placeholder="输入总价格" autocomplete="off" class="layui-input" value="<%=num%>">
                    </div>
                  </div>

	  <div class="layui-form-item">
                    <label class="layui-form-label">联系电话</label>
                    <div class="layui-input-block">
                      <input type="text" name="lxdh" required  lay-verify="required" placeholder="输入联系电话" autocomplete="off" class="layui-input">
                    </div>
                  </div>

	  <div class="layui-form-item">
                    <label class="layui-form-label">联系地址</label>
                    <div class="layui-input-block">
                      <input type="text" name="lxdz" required  lay-verify="required" placeholder="输入联系地址" autocomplete="off" class="layui-input">
                    </div>
                  </div>

	  <div class="layui-form-item">
                    <label class="layui-form-label">状态</label>
                    <div class="layui-input-block">
                      <input type="text" name="zt" required  lay-verify="required" placeholder="输入状态" autocomplete="off" class="layui-input" value="未处理" readonly="">
                    </div>
                  </div>

	  <div class="layui-form-item">
                    <label class="layui-form-label">便利店</label>
                    <div class="layui-input-block">
                      <input type="text" name="bld" required  lay-verify="required" placeholder="输入便利店" autocomplete="off" class="layui-input" value="<%=bld%>" readonly="">
                    </div>
                  </div>


					
						
		<input type=hidden name=method value="insert">
	

              
                  <div class="layui-form-item">
                    <div class="layui-input-block">
                      <button type="submit" class="layui-btn layui-btn-blue" lay-submit lay-filter="formDemo">提交</button>
                      <button type="button" onClick="window.location='list.jsp'" class="layui-btn layui-btn-primary">继续购物</button>
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
