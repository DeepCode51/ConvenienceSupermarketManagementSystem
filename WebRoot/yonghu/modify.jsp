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

String   yhm="",mm="",xm="",lxdh="",lxdz="";

rs=(ResultSet)request.getAttribute("rs");
if(rs.next()){
 yhm=rs.getString("yhm");
mm=rs.getString("mm");
xm=rs.getString("xm");
lxdh=rs.getString("lxdh");
lxdz=rs.getString("lxdz");

}
%>

<!DOCTYPE html>
<html>
<head>
<script language="javascript">
function checkDo(){
if(form.yhm.value==""){
alert("�û�������Ϊ��");
return false;
form.yhm.focus();
}

if(form.mm.value==""){
alert("���벻��Ϊ��");
return false;
form.mm.focus();
}

if(form.xm.value==""){
alert("��������Ϊ��");
return false;
form.xm.focus();
}

if(form.lxdh.value==""){
alert("��ϵ�绰����Ϊ��");
return false;
form.lxdh.focus();
}

if(form.lxdz.value==""){
alert("��ϵ��ַ����Ϊ��");
return false;
form.lxdz.focus();
}


form.action="<%=path %>yonghuServlet";
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
                <div class="layui-card-header">�޸��û�</div>
                <form name="form" method=post class="layui-form layui-card-body" action="<%=path %>/yonghuServlet">
                 

	  <div class="layui-form-item">
                    <label class="layui-form-label">�û���</label>
                    <div class="layui-input-block">
                      <input type="text" name="yhm" required  lay-verify="required" placeholder="�����û���" autocomplete="off" class="layui-input" value="<%=yhm%>" >
                    </div>
                  </div>

	  <div class="layui-form-item">
                    <label class="layui-form-label">����</label>
                    <div class="layui-input-block">
                      <input type="text" name="mm" required  lay-verify="required" placeholder="��������" autocomplete="off" class="layui-input" value="<%=mm%>" >
                    </div>
                  </div>

	  <div class="layui-form-item">
                    <label class="layui-form-label">����</label>
                    <div class="layui-input-block">
                      <input type="text" name="xm" required  lay-verify="required" placeholder="��������" autocomplete="off" class="layui-input" value="<%=xm%>" >
                    </div>
                  </div>

	  <div class="layui-form-item">
                    <label class="layui-form-label">��ϵ�绰</label>
                    <div class="layui-input-block">
                      <input type="text" name="lxdh" required  lay-verify="required" placeholder="������ϵ�绰" autocomplete="off" class="layui-input" value="<%=lxdh%>" >
                    </div>
                  </div>

	  <div class="layui-form-item">
                    <label class="layui-form-label">��ϵ��ַ</label>
                    <div class="layui-input-block">
                      <input type="text" name="lxdz" required  lay-verify="required" placeholder="������ϵ��ַ" autocomplete="off" class="layui-input" value="<%=lxdz%>" >
                    </div>
                  </div>


					<input type="hidden" name="keyid" value="<%=keyid%>">
		<input type=hidden name=method value="update">
						
	
	

              
                  <div class="layui-form-item">
                    <div class="layui-input-block">
                      <button type="submit" class="layui-btn layui-btn-blue" lay-submit lay-filter="formDemo">�ύ</button>
                      <button type="reset" class="layui-btn layui-btn-primary">����</button>
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
out.println("������ʾ��"+(String)request.getAttribute("flag"));
}
%>
</font>


</body>
</html>




<%
db.close();
%>
