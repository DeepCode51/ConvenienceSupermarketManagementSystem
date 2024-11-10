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

public class gysServlet extends HttpServlet  {
	public void service(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
		request.setCharacterEncoding("gb2312");
		System.out.println("method"+request.getParameter("method"));
		String method=(String)request.getParameter("method");
		if(method.equals("insert")){//供应商添加
			insertM(request, response);
		}else if(method.equals("list")){//供应商列表
			ListM(request, response);
		}else if(method.equals("delete")){//供应商删除
			deleteM(request, response);
		}else if(method.equals("modifyindex")){//供应商修改页面
			modifyIndex(request, response);
		}
		else if(method.equals("modify")){//供应商修改
			modifyM(request, response);
		}else if(method.equals("detail")){//供应商详细信息
			detailM(request, response);
		}else if(method.equals("Plist")){//供应商列表信息
			PListM(request, response);
		}
	}
	private void insertM(HttpServletRequest request, HttpServletResponse response){//供应商添加
		DBO db=new DBO();//初始化数据链接基础类
		String sql="";//sql语句初始化
			String keyid =(String)request.getParameter("keyid");//供应商表主键
String gysmc=(String)request.getParameter("gysmc");//供应商名称
String js=(String)request.getParameter("js");//介绍
String jyfw=(String)request.getParameter("jyfw");//经营范围
String dj=(String)request.getParameter("dj");//等级

		response.setCharacterEncoding("gb2312");
 	
		int row=1;
		ResultSet rs=null;
		int num=0;
		try {
			sql="select count(1) as num from gys where gysmc='"+gysmc+"'";
			rs=db.query(sql);
			if(rs.next()){
				num=rs.getInt("num");
			}
			if(num>0){
			
				request.setAttribute("flag", "操作失败,名称重复"); 
			}else{
			
			sql="insert into gys(gysmc,js,jyfw,dj) values('"+gysmc+"','"+js+"','"+jyfw+"','"+dj+"')";
			;//供应商SQL 语句
			row=db.update(sql);//执行sql语句 insert语句
			if(row==1){
			request.setAttribute("flag", "操作成功"); 
			}else{
			request.setAttribute("flag", "操作失败"); 
			}
			}
			
			
			request.getRequestDispatcher("gys/gysadd.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
				
	}
	private void ListM(HttpServletRequest request, HttpServletResponse response){//供应商信息列表
		ResultSet rs=null;
		String sql="select * from gys where 1=1 ";//查询供应商 sql语句
		DBO db=new DBO();//初始化数据链接基础类
		db.open();
		String gysmc=(String)request.getParameter("gysmc");//供应商名称
		if(gysmc!=null&&!gysmc.equals("")){
		sql+=" and gysmc like '%"+gysmc+"%'";//符合条件 拼接sql 供应商名称
		}
		
		String js=(String)request.getParameter("js");//介绍
		if(js!=null&&!js.equals("")){
		sql+=" and js like '%"+js+"%'";//符合条件 拼接sql 介绍
		}
		
		//供应商信息查询
		response.setCharacterEncoding("gb2312");
		try{
			rs=db.query(sql);//查询结果

			//PrintWriter out = response.getWriter();
			request.setAttribute("rs", rs); 
		

			request.getRequestDispatcher("gys/gyslist.jsp").forward(request, response);
		}catch(Exception e){
			e.toString();
			e.printStackTrace();
		}
		
	}
	private void PListM(HttpServletRequest request, HttpServletResponse response){//供应商分页信息列表
		ResultSet rs=null;
		String sql="select * from gys where 1=1 ";//查询供应商 sql语句
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
		

		request.getRequestDispatcher("gys/gysPlist.jsp?Page="+str).forward(request, response);
		}catch(Exception e){
			e.toString();
			e.printStackTrace();
		}
		
	}
	private void modifyIndex(HttpServletRequest request, HttpServletResponse response){//供应商修改首页
			ResultSet rs=null;
	response.setCharacterEncoding("gb2312");

		
		
		String keyid =(String)request.getParameter("keyid");//供应商表主键
String gysmc=(String)request.getParameter("gysmc");//供应商名称
String js=(String)request.getParameter("js");//介绍
String jyfw=(String)request.getParameter("jyfw");//经营范围
String dj=(String)request.getParameter("dj");//等级

	
		String sql="select * from gys where gysid="+keyid;//查询一条要修改的信息
		DBO db=new DBO();//初始化数据链接基础类
		
		try{
			
			db.open();//初始化数据库链接
			rs=db.query(sql);//查询sql语句
			PrintWriter out = response.getWriter();
			request.setAttribute("rs", rs); 
			
			request.getRequestDispatcher("gys/gysmodify.jsp").forward(request, response);
			//response.sendRedirect("gys/gysmodify.jsp");
		}catch(Exception e){
			e.toString();
			e.printStackTrace();
		}
		
	}
	private void detailM(HttpServletRequest request, HttpServletResponse response){//供应商详细信息页面
		
			ResultSet rs=null;
	response.setCharacterEncoding("gb2312");

		
		String keyid =(String)request.getParameter("keyid");//供应商表主键
String gysmc=(String)request.getParameter("gysmc");//供应商名称
String js=(String)request.getParameter("js");//介绍
String jyfw=(String)request.getParameter("jyfw");//经营范围
String dj=(String)request.getParameter("dj");//等级

	
		String sql="select * from gys where gysid="+keyid;//查询一条要修改的信息
		DBO db=new DBO();//初始化数据链接基础类
		
		try{
			
			db.open();
			rs=db.query(sql);//查询sql语句
			PrintWriter out = response.getWriter();
			request.setAttribute("rs", rs); 
			
			request.getRequestDispatcher("gys/gysdetail.jsp").forward(request, response);
			//response.sendRedirect("gys/gysmodify.jsp");
		}catch(Exception e){
			e.toString();
			e.printStackTrace();
		}
		
	}
	private void deleteM(HttpServletRequest request, HttpServletResponse response){//供应商删除
		
		DBO db=new DBO();
	  response.setCharacterEncoding("gb2312");
	int row=1;
	String keyid=(String)request.getParameter("keyid"); 
	String sql="";
  sql="delete from gys where gysid='"+keyid+"'";//删除供应商 信息sql语句
		try{
					 row=db.update(sql);// 执行sql语句

				if(row==1){
				request.setAttribute("flag", "删除成功"); 
				}else{
				request.setAttribute("flag", "删除失败"); 
				}
		request.getRequestDispatcher("gysServlet?method=list").forward(request, response);
		
			//response.sendRedirect("gysServlet?method=list");
		}catch(Exception e){
			e.toString();
			e.printStackTrace();
		}
		
	}

	private void modifyM(HttpServletRequest request, HttpServletResponse response){//供应商修改功能
	DBO db=new DBO();
		String keyid =(String)request.getParameter("keyid");//供应商表主键
String gysmc=(String)request.getParameter("gysmc");//供应商名称
String js=(String)request.getParameter("js");//介绍
String jyfw=(String)request.getParameter("jyfw");//经营范围
String dj=(String)request.getParameter("dj");//等级


	response.setCharacterEncoding("gb2312");
	String sql="";
       
sql="update gys set gysmc='"+gysmc+"',js='"+js+"',jyfw='"+jyfw+"',dj='"+dj+"' where gysid='"+keyid+"'";

	int row=1;
		try {
					
		 row=db.update(sql);
			
			if(row==1){
			request.setAttribute("flag", "操作成功"); 
			}else{
			request.setAttribute("flag", "操作失败"); 
			}
			request.getRequestDispatcher("gysServlet?method=list").forward(request, response);
			
			//response.sendRedirect("gysServlet?method=list");
		} catch (Exception e) {
			e.printStackTrace();
		}
				
	}
}
