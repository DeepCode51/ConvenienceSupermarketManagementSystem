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
			
			
			String   ddh="",xdsj="",yh="",zjg="",lxdh="",lxdz="",zt="",bld="";//初始化变量
String keyid=(String)request.getParameter("keyid");//主键
String sql="select * from dingdan where ddid="+keyid;//定义查询sql语句
ResultSet rs=null;//定义查询结果集
db.open();//打开数据库链接
rs=db.query(sql);//执行查询结果

/*
订单信息详情页面
*/
if(rs.next()){//遍历结果集查询 相应的变量
 ddh=rs.getString("ddh");//订单号
xdsj=rs.getString("xdsj");//下单时间
yh=rs.getString("yh");//用户
zjg=rs.getString("zjg");//总价格
lxdh=rs.getString("lxdh");//联系电话
lxdz=rs.getString("lxdz");//联系地址
zt=rs.getString("zt");//状态
bld=rs.getString("bld");//便利店

}
%>


<!DOCTYPE html>
<html>
<head>
<script language="javascript">
function checkDo(){
if(form.dh.value==""){
alert("单号不能为空");
return false;
form.dh.focus();
}

if(form.cfd.value==""){
alert("出发地不能为空");
return false;
form.cfd.focus();
}

if(form.cfsj.value==""){
alert("出发时间不能为空");
return false;
form.cfsj.focus();
}

if(form.mdd.value==""){
alert("目的地不能为空");
return false;
form.mdd.focus();
}

if(form.ddsj.value==""){
alert("到达时间不能为空");
return false;
form.ddsj.focus();
}


form.action="<%=path %>/peisongServlet";
form.submit();
}
</script>

    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/layui.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/view.css"/>
	  <script language="javascript" type="text/javascript" src="<%=request.getContextPath()%>/My97DatePicker/WdatePicker.js">
	  </script>
    <title></title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312"></head>
<body class="layui-view-body">


    <div class="layui-content">
        <div class="layui-row">
            <div class="layui-card">
                <div class="layui-card-header">新增配送</div>
                <form name="form" method=post class="layui-form layui-card-body" action="<%=path %>/peisongServlet">
                 

	  <div class="layui-form-item">
                    <label class="layui-form-label">单号</label>
                    <div class="layui-input-block">
                      <input type="text" name="dh" required  lay-verify="required" placeholder="输入单号" autocomplete="off" class="layui-input" value="<%=ddh%>"  readonly="">
                    </div>
                  </div>

	  <div class="layui-form-item">
                    <label class="layui-form-label">出发地</label>
                    <div class="layui-input-block">
                      <input type="text" name="cfd" required  lay-verify="required" placeholder="输入出发地" autocomplete="off" class="layui-input" value="<%=bld%>">
                    </div>
                  </div>

	  <div class="layui-form-item">
                    <label class="layui-form-label">出发时间</label>
                    <div class="layui-input-block">
                      <input type="text" name="cfsj" required  lay-verify="required" placeholder="输入出发时间" autocomplete="off" class="layui-input"  onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" >
                    </div>
                  </div>

	  <div class="layui-form-item">
                    <label class="layui-form-label">目的地</label>
                    <div class="layui-input-block">
                      <input type="text" name="mdd" required  lay-verify="required" placeholder="输入目的地" autocomplete="off" class="layui-input" value="<%=lxdh%>">
                    </div>
                  </div>

	  <div class="layui-form-item">
                    <label class="layui-form-label">到达时间</label>
                    <div class="layui-input-block">
                      <input type="text" name="ddsj" required  lay-verify="required" placeholder="输入到达时间" autocomplete="off" class="layui-input"  onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" >
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
