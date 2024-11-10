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
%>


<!DOCTYPE html>
<html>
<head>
<script language="javascript">
function checkDo(){
if(form.rkh.value==""){
alert("入库号不能为空");
return false;
form.rkh.focus();
}

if(form.sp.value==""){
alert("商品不能为空");
return false;
form.sp.focus();
}

if(form.bld.value==""){
alert("便利店不能为空");
return false;
form.bld.focus();
}

if(form.rksl.value==""){
alert("入库数量不能为空");
return false;
form.rksl.focus();
}

if(form.yh.value==""){
alert("用户不能为空");
return false;
form.yh.focus();
}

if(form.czsj.value==""){
alert("操作时间不能为空");
return false;
form.czsj.focus();
}


form.action="<%=path %>/rukuServlet";
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
                <div class="layui-card-header">新增入库</div>
                <form name="form" method=post class="layui-form layui-card-body" action="<%=path %>/rukuServlet">
                 
		<%
		java.util.Date   now=new   java.util.Date();   
			  java.text.SimpleDateFormat   formatter=new   java.text.SimpleDateFormat("yyyyMMddHHmmssssss");
			//  System.out.print(formatter.format(now));
			  String ddid="RK"+formatter.format(now);
		%>
	  <div class="layui-form-item">
                    <label class="layui-form-label">入库号</label>
                    <div class="layui-input-block">
                      <input type="text" name="rkh" required value="<%=ddid%>" readonly=""  lay-verify="required" placeholder="输入入库号" autocomplete="off" class="layui-input">
                    </div>
                  </div>

	  <div class="layui-form-item">
                    <label class="layui-form-label">商品</label>
                    <div class="layui-input-block">
                   <select name="sp">
					  
					 <%
					 sql="select * from shangpin where 1=1";
					 if(session.getAttribute("yhm")!=null){
					 
					 sql+=" and bld in (select bld from yuangong where yhm='"+session.getAttribute("yhm")+"')";
					 }
					 rs=db.query(sql);
					 while(rs.next()){
					 %> 
					 
					 <option value="<%=rs.getString("spid")%>"><%=rs.getString("spmc")%></option>
					 <% }%>
					  
					  </select>
                    </div>
                  </div>

	  <div class="layui-form-item">
                    <label class="layui-form-label">便利店</label>
                    <div class="layui-input-block">
                    <select name="bld">
					  
					 <%
					 sql="select * from bld where 1=1";
					 if(session.getAttribute("yhm")!=null){
					 
					 sql+=" and mc in (select bld from yuangong where yhm='"+session.getAttribute("yhm")+"')";
					 }
					 rs=db.query(sql);
					 while(rs.next()){
					 %> 
					 
					 <option value="<%=rs.getString("mc")%>"><%=rs.getString("mc")%></option>
					 <% }%>
					  
					  </select>
                    </div>
                  </div>

	  <div class="layui-form-item">
                    <label class="layui-form-label">入库数量</label>
                    <div class="layui-input-block">
                      <input type="number" name="rksl" required  lay-verify="required" placeholder="输入入库数量" autocomplete="off" class="layui-input" value="1">
                    </div>
                  </div>

	  <div class="layui-form-item">
                    <label class="layui-form-label">用户</label>
                    <div class="layui-input-block">
                      <input type="text" name="yh" required  lay-verify="required" placeholder="输入用户" value="<%=session.getAttribute("yhm")%>" autocomplete="off" class="layui-input">
                    </div>
                  </div>

	  <div class="layui-form-item">
                    <label class="layui-form-label">操作时间</label>
                    <div class="layui-input-block">
                      <input type="text" name="czsj" required  lay-verify="required" placeholder="输入操作时间" autocomplete="off" class="layui-input" value="<%=StaticMethod.getStringDate()%>" readonly="">
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
