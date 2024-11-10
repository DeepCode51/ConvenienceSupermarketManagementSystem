<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.util.*"%>

<%
/*
订单添加后台
*/
DBO db=new DBO();//初始数据库链接
request.setCharacterEncoding("gb2312");//设置字符集
ResultSet rs=null;//声明结果集
	String keyid =(String)request.getParameter("keyid");
String ddh=(String)request.getParameter("ddh");// 变量 名 :订单号
String xdsj=(String)request.getParameter("xdsj");// 变量 名 :下单时间
String yh=(String)request.getParameter("yh");// 变量 名 :用户
String zjg=(String)request.getParameter("zjg");// 变量 名 :总价格
String lxdh=(String)request.getParameter("lxdh");// 变量 名 :联系电话
String lxdz=(String)request.getParameter("lxdz");// 变量 名 :联系地址
String zt=(String)request.getParameter("zt");// 变量 名 :状态
String bld=(String)request.getParameter("bld");// 变量 名 :便利店

String sql="";//声明sql

int row=1;///定义执行结果
		
try{
	sql="update ddmx set dd='"+ddh+"' where dd='' and yh='"+yh+"'";
	db.update(sql);
	
	
	 sql="insert into dingdan(ddh,xdsj,yh,zjg,lxdh,lxdz,zt,bld) values('"+ddh+"','"+xdsj+"','"+yh+"','"+zjg+"','"+lxdh+"','"+lxdz+"','"+zt+"','"+bld+"')";
;//订单SQL 语句
		//int row =0;
		row=db.update(sql);//执行sql语句
}catch(Exception e){
System.out.println(e.toString());}
if(row==1){//操作成功
out.println("<script>");
out.println("alert('操作成功');");
out.println("window.location='list.jsp'");
out.println("</script>");
}else{//操作失败
out.println("<script>");
out.println("alert('操作失败');");
out.println("window.location='list.jsp'");
out.println("</script>");
}
db.close();
%>

