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
if(form.gysmc.value==""){
alert("供应商名称不能为空");
return false;
form.gysmc.focus();
}

if(form.js.value==""){
alert("介绍不能为空");
return false;
form.js.focus();
}

if(form.jyfw.value==""){
alert("经营范围不能为空");
return false;
form.jyfw.focus();
}

if(form.dj.value==""){
alert("等级不能为空");
return false;
form.dj.focus();
}


form.action="<%=path %>/gysServlet";
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
                <div class="layui-card-header">新增供应商</div>
                <form name="form" method=post class="layui-form layui-card-body" action="<%=path %>/gysServlet">
                 

	  <div class="layui-form-item">
                    <label class="layui-form-label">供应商名称</label>
                    <div class="layui-input-block">
                      <input type="text" name="gysmc" required  lay-verify="required" placeholder="输入供应商名称" autocomplete="off" class="layui-input">
                    </div>
                  </div>

	  <div class="layui-form-item">
                    <label class="layui-form-label">介绍</label>
                    <div class="layui-input-block">
                     
					  
					  <textarea   name="js" required   lay-verify="required" placeholder="输入介绍" cols="80" rows="5"></textarea>
                    </div>
                  </div>

	  <div class="layui-form-item">
                    <label class="layui-form-label">经营范围</label>
                    <div class="layui-input-block">
                      <input type="text" name="jyfw" required  lay-verify="required" placeholder="输入经营范围" autocomplete="off" class="layui-input">
                    </div>
                  </div>

	  <div class="layui-form-item">
                    <label class="layui-form-label">等级</label>
                    <div class="layui-input-block">
                     <select name="dj">
					 
					 <%
					 sql="select * from dengji";
					 rs=db.query(sql);
					 while(rs.next()){
					 %>
					 <option value="<%=rs.getString("dj")%>"><%=rs.getString("dj")%></option>
					 <% }%>
					 </select>
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
