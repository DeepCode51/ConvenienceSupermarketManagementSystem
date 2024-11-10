<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.util.*"%>
<%
request.setCharacterEncoding("gb2312");//设置页面字符集
DBO db=new DBO();//初始链接数据库类
String sql="";
ResultSet rs=null;
String keyid=(String)request.getParameter("keyid");//商品编号
String jg=(String)request.getParameter("jg");//当前价格

String bld=(String)request.getParameter("bld");//商家
String sl=(String)request.getParameter("sl");
System.out.println("sl-:"+sl);


String yhm="";

if(session.getAttribute("yhm")!=null){
yhm=(String)session.getAttribute("yhm");
}


 	if(keyid!=null&&!keyid.equals("")){
  sql="insert into ddmx(dd,sp,sl,jg,yh,bld) values('','"+keyid+"','"+sl+"','"+jg+"','"+yhm+"','"+bld+"')";
;//订单明细SQL 语句
db.update(sql);

	sql="update shangpin set kc=kc-'"+sl+"' where spid='"+keyid+"'";
	
	db.update(sql);
	
	}

%>

<HTML ><HEAD id=Head1><TITLE>订单明细信息列表</TITLE>

<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta name="renderer" content="webkit">
    <link rel="stylesheet" href="../assets/css/layui.css">
    <link rel="stylesheet" href="../assets/css/view.css"/>
	<link href="../assets/tablecloth.css" rel="stylesheet" type="text/css" media="screen" />

<META http-equiv=Content-Type content="text/html; charset=gb2312">


</HEAD>
<body class="layui-view-body">

<form name="form" method="post" action="ddmxlist.jsp">
 <div class="layui-content">
        <div class="layui-page-header">
            <div class="pagewrap">
             
                <h2 class="title">购物车</h2>
            </div>
        </div>
        <div class="layui-row">
            <div class="layui-card">
                <div class="layui-card-body">
                    <div class="form-box">
                        <div class="layui-form layui-form-item">
                            <div class="layui-inline">
							
            <button class="layui-btn layui-btn-blue" type="button" onClick="window.location='list.jsp'">继续购物</button>
                             
                            </div>
                        </div>
                      
                        <table id="table1"  class="layui-table">
						<tr  >
						<th>序号</th>
			
					   
			
					         <th >商品</th>
			
					         <th >数量</th>
			
					         <th >价格</th>
			
					
			
					         <th >便利店</th>
        <th >操作</th>
						</tr>
						
						  <TBODY id="table2">

						<%
						 sql="select a.*,b.spmc  from ddmx a,shangpin b where 1=1 and a.sp=b.spid and a.yh='"+session.getAttribute("yhm")+"' and a.dd='' ";//查询 订单明细sql语句
db.open();//打开数据库链接
	
	
 rs=db.query(sql);//查询结果
//订单明细信息列表
	int a=0;
	String blda="";
						
					int i=1;
					if(rs!=null){
					while(rs.next()){
						
						if(!blda.equals(rs.getString("bld"))){
						blda=rs.getString("bld");
						a++;
						}
					
					
					%>
						<tr>
											
						
						    <td ><%=i%></td>
					
					       
					        <td   ><%=rs.getString("spmc")%></td>
					       
					        <td   ><%=rs.getString("sl")%></td>
					       
					        <td   ><%=rs.getString("jg")%></td>
					       
			
					       
					        <td   ><%=rs.getString("bld")%></td>
					       
						<td >
						
									
						
						
					
					
						 <a href="ddmxdelete.jsp?keyid=<%=rs.getString("ddmxid")%>&sp=<%=rs.getString("sp")%>&sl=<%=rs.getString("sl")%>" onClick="javascript:if(confirm('是否删除')){return true;}else{return false;}">删除</a>
						 <a href="detail.jsp?keyid=<%=rs.getString("sp")%>"  >查看</a>
						
						
						</td>
						</tr>
						
												<%
				i++;
				}
				}
				%>
						    </TBODY>
						</table>
							<%
							System.out.println("a="+a);
							if(a==1){
							if(i>0){
							%>
							
							<input type="button" value="提交订单" class="layui-btn layui-btn-blue" onClick="window.location='dingdanadd.jsp'">
							<% }
							}else {
							
							%>
							
							<font color="#FF0000">一个订单不能有多个便利店或无购物明细</font>
							<% }%>
							 
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="../assets/layui.all.js"></script>
    



</form>
</BODY></HTML>

<%
db.close();
%>


