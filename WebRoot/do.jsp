<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.util.*"%>

<%
/*
用户添加后台
*/
DBO db=new DBO();//初始数据库链接
request.setCharacterEncoding("gb2312");//设置字符集
ResultSet rs=null;//声明结果集
	String keyid =(String)request.getParameter("keyid");
String yhm=(String)request.getParameter("yhm");// 变量 名 :用户名
String mm=(String)request.getParameter("mm");// 变量 名 :密码
String xm=(String)request.getParameter("xm");// 变量 名 :姓名
String lxdh=(String)request.getParameter("lxdh");// 变量 名 :联系电话
String lxdz=(String)request.getParameter("lxdz");// 变量 名 :联系地址

String sql="";//声明sql

int row=1;///定义执行结果
		int num=0;
try{
	sql="select count(1) as num from yonghu where yhm='"+yhm+"'";
	rs=db.query(sql);
	if(rs.next()){
	
	num=rs.getInt("num");
	}
	if(num>0){
	out.println("<script>");
out.println("alert('操作失败,用户名重复');");
out.println("window.location='yonghuadd.jsp'");
out.println("</script>");
	return;
	}
	
	 sql="insert into yonghu(yhm,mm,xm,lxdh,lxdz) values('"+yhm+"','"+mm+"','"+xm+"','"+lxdh+"','"+lxdz+"')";
;//用户SQL 语句
		//int row =0;
		row=db.update(sql);//执行sql语句
}catch(Exception e){
System.out.println(e.toString());}
if(row==1){//操作成功
out.println("<script>");
out.println("alert('操作成功');");
out.println("window.location='login.jsp'");
out.println("</script>");
}else{//操作失败
out.println("<script>");
out.println("alert('操作失败');");
out.println("window.location='yonghuadd.jsp'");
out.println("</script>");
}
db.close();
%>

