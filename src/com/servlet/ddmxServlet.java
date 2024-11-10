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

public class ddmxServlet extends HttpServlet  {
	public void service(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
		request.setCharacterEncoding("gb2312");
		System.out.println("method"+request.getParameter("method"));
		String method=(String)request.getParameter("method");
		if(method.equals("insert")){//订单明细添加
			insertM(request, response);
		}else if(method.equals("list")){//订单明细列表
			ListM(request, response);
		}else if(method.equals("delete")){//订单明细删除
			deleteM(request, response);
		}else if(method.equals("modifyindex")){//订单明细修改页面
			modifyIndex(request, response);
		}
		else if(method.equals("modify")){//订单明细修改
			modifyM(request, response);
		}else if(method.equals("detail")){//订单明细详细信息
			detailM(request, response);
		}else if(method.equals("Plist")){//订单明细列表信息
			PListM(request, response);
		}
	}
	private void insertM(HttpServletRequest request, HttpServletResponse response){//订单明细添加
		DBO db=new DBO();//初始化数据链接基础类
		String sql="";//sql语句初始化
			String keyid =(String)request.getParameter("keyid");//订单明细表主键
String dd=(String)request.getParameter("dd");//订单
String sp=(String)request.getParameter("sp");//商品
String sl=(String)request.getParameter("sl");//数量
String jg=(String)request.getParameter("jg");//价格
String yh=(String)request.getParameter("yh");//用户
String bld=(String)request.getParameter("bld");//便利店

		response.setCharacterEncoding("gb2312");
 		sql="insert into ddmx(dd,sp,sl,jg,yh,bld) values('"+dd+"','"+sp+"','"+sl+"','"+jg+"','"+yh+"','"+bld+"')";
;//订单明细SQL 语句
		int row=1;
		try {
			row=db.update(sql);//执行sql语句 insert语句
			if(row==1){
			request.setAttribute("flag", "操作成功"); 
			}else{
			request.setAttribute("flag", "操作失败"); 
			}
			
			
			request.getRequestDispatcher("ddmx/ddmxadd.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
				
	}
	private void ListM(HttpServletRequest request, HttpServletResponse response){//订单明细信息列表
		ResultSet rs=null;
		String sql="select * from ddmx where 1=1 ";//查询订单明细 sql语句
		DBO db=new DBO();//初始化数据链接基础类
		db.open();
		
		//订单明细信息查询
		response.setCharacterEncoding("gb2312");
		try{
			rs=db.query(sql);//查询结果

			//PrintWriter out = response.getWriter();
			request.setAttribute("rs", rs); 
		

			request.getRequestDispatcher("ddmx/ddmxlist.jsp").forward(request, response);
		}catch(Exception e){
			e.toString();
			e.printStackTrace();
		}
		
	}
	private void PListM(HttpServletRequest request, HttpServletResponse response){//订单明细分页信息列表
		ResultSet rs=null;
		String sql="select * from ddmx where 1=1 ";//查询订单明细 sql语句
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
		

		request.getRequestDispatcher("ddmx/ddmxPlist.jsp?Page="+str).forward(request, response);
		}catch(Exception e){
			e.toString();
			e.printStackTrace();
		}
		
	}
	private void modifyIndex(HttpServletRequest request, HttpServletResponse response){//订单明细修改首页
			ResultSet rs=null;
	response.setCharacterEncoding("gb2312");

		
		
		String keyid =(String)request.getParameter("keyid");//订单明细表主键
String dd=(String)request.getParameter("dd");//订单
String sp=(String)request.getParameter("sp");//商品
String sl=(String)request.getParameter("sl");//数量
String jg=(String)request.getParameter("jg");//价格
String yh=(String)request.getParameter("yh");//用户
String bld=(String)request.getParameter("bld");//便利店

	
		String sql="select * from ddmx where ddmxid="+keyid;//查询一条要修改的信息
		DBO db=new DBO();//初始化数据链接基础类
		
		try{
			
			db.open();//初始化数据库链接
			rs=db.query(sql);//查询sql语句
			PrintWriter out = response.getWriter();
			request.setAttribute("rs", rs); 
			
			request.getRequestDispatcher("ddmx/ddmxmodify.jsp").forward(request, response);
			//response.sendRedirect("ddmx/ddmxmodify.jsp");
		}catch(Exception e){
			e.toString();
			e.printStackTrace();
		}
		
	}
	private void detailM(HttpServletRequest request, HttpServletResponse response){//订单明细详细信息页面
		
			ResultSet rs=null;
	response.setCharacterEncoding("gb2312");

		
		String keyid =(String)request.getParameter("keyid");//订单明细表主键
String dd=(String)request.getParameter("dd");//订单
String sp=(String)request.getParameter("sp");//商品
String sl=(String)request.getParameter("sl");//数量
String jg=(String)request.getParameter("jg");//价格
String yh=(String)request.getParameter("yh");//用户
String bld=(String)request.getParameter("bld");//便利店

	
		String sql="select * from ddmx where ddmxid="+keyid;//查询一条要修改的信息
		DBO db=new DBO();//初始化数据链接基础类
		
		try{
			
			db.open();
			rs=db.query(sql);//查询sql语句
			PrintWriter out = response.getWriter();
			request.setAttribute("rs", rs); 
			
			request.getRequestDispatcher("ddmx/ddmxdetail.jsp").forward(request, response);
			//response.sendRedirect("ddmx/ddmxmodify.jsp");
		}catch(Exception e){
			e.toString();
			e.printStackTrace();
		}
		
	}
	private void deleteM(HttpServletRequest request, HttpServletResponse response){//订单明细删除
		
		DBO db=new DBO();
	  response.setCharacterEncoding("gb2312");
	int row=1;
	String keyid=(String)request.getParameter("keyid"); 
	String sql="";
  sql="delete from ddmx where ddmxid='"+keyid+"'";//删除订单明细 信息sql语句
		try{
					 row=db.update(sql);// 执行sql语句

				if(row==1){
				request.setAttribute("flag", "删除成功"); 
				}else{
				request.setAttribute("flag", "删除失败"); 
				}
		request.getRequestDispatcher("ddmxServlet?method=list").forward(request, response);
		
			//response.sendRedirect("ddmxServlet?method=list");
		}catch(Exception e){
			e.toString();
			e.printStackTrace();
		}
		
	}

	private void modifyM(HttpServletRequest request, HttpServletResponse response){//订单明细修改功能
	DBO db=new DBO();
		String keyid =(String)request.getParameter("keyid");//订单明细表主键
String dd=(String)request.getParameter("dd");//订单
String sp=(String)request.getParameter("sp");//商品
String sl=(String)request.getParameter("sl");//数量
String jg=(String)request.getParameter("jg");//价格
String yh=(String)request.getParameter("yh");//用户
String bld=(String)request.getParameter("bld");//便利店


	response.setCharacterEncoding("gb2312");
	String sql="";
       
sql="update ddmx set dd='"+dd+"',sp='"+sp+"',sl='"+sl+"',jg='"+jg+"',yh='"+yh+"',bld='"+bld+"' where ddmxid='"+keyid+"'";

	int row=1;
		try {
					
		 row=db.update(sql);
			
			if(row==1){
			request.setAttribute("flag", "操作成功"); 
			}else{
			request.setAttribute("flag", "操作失败"); 
			}
			request.getRequestDispatcher("ddmxServlet?method=list").forward(request, response);
			
			//response.sendRedirect("ddmxServlet?method=list");
		} catch (Exception e) {
			e.printStackTrace();
		}
				
	}
}
