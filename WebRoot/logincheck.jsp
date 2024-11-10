<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*"%>
<%@ page import="com.util.*"%>
<%
DBO db=new DBO();
request.setCharacterEncoding("gb2312");
String yhm=(String)request.getParameter("yhm");
String mm=(String)request.getParameter("mm");
    String qx=(String)request.getParameter("qx");

String sql="";

if(qx.equals("管理员")) {
    sql = "select * from gly where yhm='" + yhm + "' and mm='" + mm + "' ";

}

    if(qx.equals("用户")) {
        sql = "select * from yonghu where yhm='" + yhm + "' and mm='" + mm + "' ";

    }
 if(qx.equals("员工")) {
        sql = "select * from yuangong where yhm='" + yhm + "' and mm='" + mm + "' ";

    }

System.out.println("sql="+sql);
db.open();
ResultSet rs=db.query(sql);
out.println("<script>");
if(rs.next()){

    if(qx.equals("管理员")) {
        session.setAttribute("id",rs.getString("glyid"));

    }

    if(qx.equals("员工")) {
        session.setAttribute("id",rs.getString("ygid"));

    }
	   if(qx.equals("用户")) {
        session.setAttribute("id",rs.getString("yhid"));

    }


session.setAttribute("yhm",rs.getString("yhm"));
session.setAttribute("mm",rs.getString("mm"));
session.setAttribute("qx",qx);
;

//out.println("alert('登录成功');");
out.println("window.location='index.jsp'");
}else{
out.println("alert('用户名或者密码错误');");
out.println("window.location='login.jsp'");
}
out.println("</script>");
%>
