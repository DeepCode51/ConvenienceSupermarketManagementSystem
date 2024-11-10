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

public class dengjiServlet extends HttpServlet  {
	public void service(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
		request.setCharacterEncoding("gb2312");
		System.out.println("method"+request.getParameter("method"));
		String method=(String)request.getParameter("method");
		if(method.equals("insert")){//等级添加
			insertM(request, response);
		}else if(method.equals("list")){//等级列表
			ListM(request, response);
		}else if(method.equals("delete")){//等级删除
			deleteM(request, response);
		}else if(method.equals("modifyindex")){//等级修改页面
			modifyIndex(request, response);
		}
		else if(method.equals("modify")){//等级修改
			modifyM(request, response);
		}else if(method.equals("detail")){//等级详细信息
			detailM(request, response);
		}else if(method.equals("Plist")){//等级列表信息
			PListM(request, response);
		}
	}
	private void insertM(HttpServletRequest request, HttpServletResponse response){//等级添加
		DBO db=new DBO();//初始化数据链接基础类
		String sql="";//sql语句初始化
			String keyid =(String)request.getParameter("keyid");//等级表主键
String dj=(String)request.getParameter("dj");//等级

		response.setCharacterEncoding("gb2312");
 		sql="insert into dengji(dj) values('"+dj+"')";
;//等级SQL 语句
		int row=1;
		try {
			row=db.update(sql);//执行sql语句 insert语句
			if(row==1){
			request.setAttribute("flag", "操作成功"); 
			}else{
			request.setAttribute("flag", "操作失败"); 
			}
			
			
			request.getRequestDispatcher("dengji/dengjiadd.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
				
	}
	private void ListM(HttpServletRequest request, HttpServletResponse response){//等级信息列表
		ResultSet rs=null;
		String sql="select * from dengji where 1=1 ";//查询等级 sql语句
		DBO db=new DBO();//初始化数据链接基础类
		db.open();
		
		String dj=(String)request.getParameter("dj");//等级
		if(dj!=null&&!dj.equals("")){
		sql+=" and dj like '%"+dj+"%'";//符合条件 拼接sql 等级
		}
		
		//等级信息查询
		response.setCharacterEncoding("gb2312");
		try{
			rs=db.query(sql);//查询结果

			//PrintWriter out = response.getWriter();
			request.setAttribute("rs", rs); 
		

			request.getRequestDispatcher("dengji/dengjilist.jsp").forward(request, response);
		}catch(Exception e){
			e.toString();
			e.printStackTrace();
		}
		
	}
	private void PListM(HttpServletRequest request, HttpServletResponse response){//等级分页信息列表
		ResultSet rs=null;
		String sql="select * from dengji where 1=1 ";//查询等级 sql语句
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
		

		request.getRequestDispatcher("dengji/dengjiPlist.jsp?Page="+str).forward(request, response);
		}catch(Exception e){
			e.toString();
			e.printStackTrace();
		}
		
	}
	private void modifyIndex(HttpServletRequest request, HttpServletResponse response){//等级修改首页
			ResultSet rs=null;
	response.setCharacterEncoding("gb2312");

		
		
		String keyid =(String)request.getParameter("keyid");//等级表主键
String dj=(String)request.getParameter("dj");//等级

	
		String sql="select * from dengji where djid="+keyid;//查询一条要修改的信息
		DBO db=new DBO();//初始化数据链接基础类
		
		try{
			
			db.open();//初始化数据库链接
			rs=db.query(sql);//查询sql语句
			PrintWriter out = response.getWriter();
			request.setAttribute("rs", rs); 
			
			request.getRequestDispatcher("dengji/dengjimodify.jsp").forward(request, response);
			//response.sendRedirect("dengji/dengjimodify.jsp");
		}catch(Exception e){
			e.toString();
			e.printStackTrace();
		}
		
	}
	private void detailM(HttpServletRequest request, HttpServletResponse response){//等级详细信息页面
		
			ResultSet rs=null;
	response.setCharacterEncoding("gb2312");

		
		String keyid =(String)request.getParameter("keyid");//等级表主键
String dj=(String)request.getParameter("dj");//等级

	
		String sql="select * from dengji where djid="+keyid;//查询一条要修改的信息
		DBO db=new DBO();//初始化数据链接基础类
		
		try{
			
			db.open();
			rs=db.query(sql);//查询sql语句
			PrintWriter out = response.getWriter();
			request.setAttribute("rs", rs); 
			
			request.getRequestDispatcher("dengji/dengjidetail.jsp").forward(request, response);
			//response.sendRedirect("dengji/dengjimodify.jsp");
		}catch(Exception e){
			e.toString();
			e.printStackTrace();
		}
		
	}
	private void deleteM(HttpServletRequest request, HttpServletResponse response){//等级删除
		
		DBO db=new DBO();
	  response.setCharacterEncoding("gb2312");
	int row=1;
	String keyid=(String)request.getParameter("keyid"); 
	String sql="";
  sql="delete from dengji where djid='"+keyid+"'";//删除等级 信息sql语句
		try{
					 row=db.update(sql);// 执行sql语句

				if(row==1){
				request.setAttribute("flag", "删除成功"); 
				}else{
				request.setAttribute("flag", "删除失败"); 
				}
		request.getRequestDispatcher("dengjiServlet?method=list").forward(request, response);
		
			//response.sendRedirect("dengjiServlet?method=list");
		}catch(Exception e){
			e.toString();
			e.printStackTrace();
		}
		
	}

	private void modifyM(HttpServletRequest request, HttpServletResponse response){//等级修改功能
	DBO db=new DBO();
		String keyid =(String)request.getParameter("keyid");//等级表主键
String dj=(String)request.getParameter("dj");//等级


	response.setCharacterEncoding("gb2312");
	String sql="";
       
sql="update dengji set dj='"+dj+"' where djid='"+keyid+"'";

	int row=1;
		try {
					
		 row=db.update(sql);
			
			if(row==1){
			request.setAttribute("flag", "操作成功"); 
			}else{
			request.setAttribute("flag", "操作失败"); 
			}
			request.getRequestDispatcher("dengjiServlet?method=list").forward(request, response);
			
			//response.sendRedirect("dengjiServlet?method=list");
		} catch (Exception e) {
			e.printStackTrace();
		}
				
	}
}
