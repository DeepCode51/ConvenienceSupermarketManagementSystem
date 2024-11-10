package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.util.*;
import java.util.List;
import java.sql.ResultSet;

public class rukuServlet extends HttpServlet  {
	public void service(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
		request.setCharacterEncoding("gb2312");
		System.out.println("method"+request.getParameter("method"));
		String method=(String)request.getParameter("method");
		if(method.equals("insert")){//入库添加
			insertM(request, response);
		}else if(method.equals("list")){//入库列表
			ListM(request, response);
		}else if(method.equals("delete")){//入库删除
			deleteM(request, response);
		}else if(method.equals("modifyindex")){//入库修改页面
			modifyIndex(request, response);
		}
		else if(method.equals("modify")){//入库修改
			modifyM(request, response);
		}else if(method.equals("detail")){//入库详细信息
			detailM(request, response);
		}else if(method.equals("Plist")){//入库列表信息
			PListM(request, response);
		}
	}
	private void insertM(HttpServletRequest request, HttpServletResponse response){//入库添加
		DBO db=new DBO();//初始化数据链接基础类
		String sql="";//sql语句初始化
			String keyid =(String)request.getParameter("keyid");//入库表主键
String rkh=(String)request.getParameter("rkh");//入库号
String sp=(String)request.getParameter("sp");//商品
String bld=(String)request.getParameter("bld");//便利店
String rksl=(String)request.getParameter("rksl");//入库数量
String yh=(String)request.getParameter("yh");//用户
String czsj=(String)request.getParameter("czsj");//操作时间

		response.setCharacterEncoding("gb2312");

		int row=1;
		try {
			sql="update shangpin set kc=kc+"+rksl+" where spid='"+sp+"' and bld='"+bld+"'";
			db.update(sql);
			
			
	 		sql="insert into ruku(rkh,sp,bld,rksl,yh,czsj) values('"+rkh+"','"+sp+"','"+bld+"','"+rksl+"','"+yh+"','"+czsj+"')";
	 		;//入库SQL 语句
			row=db.update(sql);//执行sql语句 insert语句
			if(row==1){
			request.setAttribute("flag", "操作成功"); 
			}else{
			request.setAttribute("flag", "操作失败"); 
			}
			
			
			request.getRequestDispatcher("ruku/rukuadd.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
				
	}
	private void ListM(HttpServletRequest request, HttpServletResponse response){//入库信息列表
		ResultSet rs=null;
		String sql="select a.*,b.spmc from ruku a,shangpin b  where 1=1 and a.sp=b.spid ";//查询入库 sql语句

		
		if(request.getSession().getAttribute("yhm")!=null){
			
			sql+=" and a.bld in (select bld from yuangong where yhm='"+request.getSession().getAttribute("yhm")+"')";
			
		}
		
		String rkh=(String)request.getParameter("rkh");//入库号
		if(rkh!=null&&!rkh.equals("")){
		sql+=" and a.rkh like '%"+rkh+"%'";//符合条件 拼接sql 入库号
		}
		
		String sp=(String)request.getParameter("sp");//商品
		if(sp!=null&&!sp.equals("")){
		sql+=" and b.spmc like '%"+sp+"%'";//符合条件 拼接sql 商品
		}
		DBO db=new DBO();//初始化数据链接基础类
		db.open();
		
		//入库信息查询
		response.setCharacterEncoding("gb2312");
		try{
			rs=db.query(sql);//查询结果

			//PrintWriter out = response.getWriter();
			request.setAttribute("rs", rs); 
		

			request.getRequestDispatcher("ruku/rukulist.jsp").forward(request, response);
		}catch(Exception e){
			e.toString();
			e.printStackTrace();
		}
		
	}
	private void PListM(HttpServletRequest request, HttpServletResponse response){//入库分页信息列表
		ResultSet rs=null;
		String sql="select a.*,b.spmc from ruku a,shangpin b  where 1=1 and a.sp=b.spid ";//查询入库 sql语句
		
		
		if(request.getSession().getAttribute("yhm")!=null){
			
			sql+=" and a.bld in (select bld from yuangong where yhm='"+request.getSession().getAttribute("yhm")+"')";
			
		}
		
		String rkh=(String)request.getParameter("rkh");//入库号
		if(rkh!=null&&!rkh.equals("")){
		sql+=" and a.rkh like '%"+rkh+"%'";//符合条件 拼接sql 入库号
		}
		
		String sp=(String)request.getParameter("sp");//商品
		if(sp!=null&&!sp.equals("")){
		sql+=" and b.spmc like '%"+sp+"%'";//符合条件 拼接sql 商品
		}
		DBO db=new DBO();//初始化数据链接基础类
	   
	    String str=(String)request.getParameter("Page");
		
		response.setCharacterEncoding("gb2312");
		try{
			
if(str==null){
				str="0";
				}
rs=db.query(sql);

			PrintWriter out = response.getWriter();
			request.setAttribute("rs", rs); 
		

		request.getRequestDispatcher("ruku/rukuPlist.jsp?Page="+str).forward(request, response);
		}catch(Exception e){
			e.toString();
			e.printStackTrace();
		}
		
	}
	private void modifyIndex(HttpServletRequest request, HttpServletResponse response){//入库修改首页
			ResultSet rs=null;
	response.setCharacterEncoding("gb2312");

		
		
		String keyid =(String)request.getParameter("keyid");//入库表主键
String rkh=(String)request.getParameter("rkh");//入库号
String sp=(String)request.getParameter("sp");//商品
String bld=(String)request.getParameter("bld");//便利店
String rksl=(String)request.getParameter("rksl");//入库数量
String yh=(String)request.getParameter("yh");//用户
String czsj=(String)request.getParameter("czsj");//操作时间

	
		String sql="select * from ruku where rkid="+keyid;//查询一条要修改的信息
		DBO db=new DBO();//初始化数据链接基础类
		
		try{
			
			db.open();//初始化数据库链接
			rs=db.query(sql);//查询sql语句
			PrintWriter out = response.getWriter();
			request.setAttribute("rs", rs); 
			
			request.getRequestDispatcher("ruku/rukumodify.jsp").forward(request, response);
			//response.sendRedirect("ruku/rukumodify.jsp");
		}catch(Exception e){
			e.toString();
			e.printStackTrace();
		}
		
	}
	private void detailM(HttpServletRequest request, HttpServletResponse response){//入库详细信息页面
		
			ResultSet rs=null;
	response.setCharacterEncoding("gb2312");

		
		String keyid =(String)request.getParameter("keyid");//入库表主键
String rkh=(String)request.getParameter("rkh");//入库号
String sp=(String)request.getParameter("sp");//商品
String bld=(String)request.getParameter("bld");//便利店
String rksl=(String)request.getParameter("rksl");//入库数量
String yh=(String)request.getParameter("yh");//用户
String czsj=(String)request.getParameter("czsj");//操作时间

	
		String sql="select * from ruku where rkid="+keyid;//查询一条要修改的信息
		DBO db=new DBO();//初始化数据链接基础类
		
		try{
			
			db.open();
			rs=db.query(sql);//查询sql语句
			PrintWriter out = response.getWriter();
			request.setAttribute("rs", rs); 
			
			request.getRequestDispatcher("ruku/rukudetail.jsp").forward(request, response);
			//response.sendRedirect("ruku/rukumodify.jsp");
		}catch(Exception e){
			e.toString();
			e.printStackTrace();
		}
		
	}
	private void deleteM(HttpServletRequest request, HttpServletResponse response){//入库删除
		
		DBO db=new DBO();
	  response.setCharacterEncoding("gb2312");
	int row=1;
	String keyid=(String)request.getParameter("keyid"); 
	String sql="";
  sql="delete from ruku where rkid='"+keyid+"'";//删除入库 信息sql语句
		try{
					 row=db.update(sql);// 执行sql语句

				if(row==1){
				request.setAttribute("flag", "删除成功"); 
				}else{
				request.setAttribute("flag", "删除失败"); 
				}
		request.getRequestDispatcher("rukuServlet?method=list").forward(request, response);
		
			//response.sendRedirect("rukuServlet?method=list");
		}catch(Exception e){
			e.toString();
			e.printStackTrace();
		}
		
	}

	private void modifyM(HttpServletRequest request, HttpServletResponse response){//入库修改功能
	DBO db=new DBO();
		String keyid =(String)request.getParameter("keyid");//入库表主键
String rkh=(String)request.getParameter("rkh");//入库号
String sp=(String)request.getParameter("sp");//商品
String bld=(String)request.getParameter("bld");//便利店
String rksl=(String)request.getParameter("rksl");//入库数量
String yh=(String)request.getParameter("yh");//用户
String czsj=(String)request.getParameter("czsj");//操作时间


	response.setCharacterEncoding("gb2312");
	String sql="";
       
sql="update ruku set rkh='"+rkh+"',sp='"+sp+"',bld='"+bld+"',rksl='"+rksl+"',yh='"+yh+"',czsj='"+czsj+"' where rkid='"+keyid+"'";

	int row=1;
		try {
					
		 row=db.update(sql);
			
			if(row==1){
			request.setAttribute("flag", "操作成功"); 
			}else{
			request.setAttribute("flag", "操作失败"); 
			}
			request.getRequestDispatcher("rukuServlet?method=list").forward(request, response);
			
			//response.sendRedirect("rukuServlet?method=list");
		} catch (Exception e) {
			e.printStackTrace();
		}
				
	}
}
