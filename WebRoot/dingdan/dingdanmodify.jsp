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
alert("�����Ų���Ϊ��");
return false;
form.ddh.focus();
}

if(form.xdsj.value==""){
alert("�µ�ʱ�䲻��Ϊ��");
return false;
form.xdsj.focus();
}

if(form.yh.value==""){
alert("�û�����Ϊ��");
return false;
form.yh.focus();
}

if(form.zjg.value==""){
alert("�ܼ۸���Ϊ��");
return false;
form.zjg.focus();
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

if(form.zt.value==""){
alert("״̬����Ϊ��");
return false;
form.zt.focus();
}

if(form.bld.value==""){
alert("�����겻��Ϊ��");
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
                <div class="layui-card-header">�޸Ķ���</div>
                <form name="form" method=post class="layui-form layui-card-body" action="<%=path %>/dingdanServlet">
                 

	  <div class="layui-form-item">
                    <label class="layui-form-label">������</label>
                    <div class="layui-input-block">
                      <input type="text" name="ddh" required  lay-verify="required" placeholder="���붩����" autocomplete="off" class="layui-input" value="<%=ddh%>" >
                    </div>
                  </div>

	  <div class="layui-form-item">
                    <label class="layui-form-label">�µ�ʱ��</label>
                    <div class="layui-input-block">
                      <input type="text" name="xdsj" required  lay-verify="required" placeholder="�����µ�ʱ��" autocomplete="off" class="layui-input" value="<%=xdsj%>" >
                    </div>
                  </div>

	  <div class="layui-form-item">
                    <label class="layui-form-label">�û�</label>
                    <div class="layui-input-block">
                      <input type="text" name="yh" required  lay-verify="required" placeholder="�����û�" autocomplete="off" class="layui-input" value="<%=yh%>" >
                    </div>
                  </div>

	  <div class="layui-form-item">
                    <label class="layui-form-label">�ܼ۸�</label>
                    <div class="layui-input-block">
                      <input type="text" name="zjg" required  lay-verify="required" placeholder="�����ܼ۸�" autocomplete="off" class="layui-input" value="<%=zjg%>" >
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

	  <div class="layui-form-item">
                    <label class="layui-form-label">״̬</label>
                    <div class="layui-input-block">
                    <select name="zt">
					<option value="δ����">δ����</option>
					<option value="�Ѵ���">�Ѵ���</option>
					<option value="����">����</option>
					<option value="���">���</option>
					</select>
                    </div>
                  </div>

	  <div class="layui-form-item">
                    <label class="layui-form-label">������</label>
                    <div class="layui-input-block">
                      <input type="text" name="bld" required  lay-verify="required" placeholder="���������" autocomplete="off" class="layui-input" value="<%=bld%>"  readonly="">
                    </div>
                  </div>


					<input type="hidden" name="keyid" value="<%=keyid%>">
		<input type=hidden name=method value="modify">
						
	
	

              
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
