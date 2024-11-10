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

public class bldServlet extends HttpServlet  {
	public void service(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
		request.setCharacterEncoding("gb2312");
		System.out.println("method"+request.getParameter("method"));
		String method=(String)request.getParameter("method");
		if(method.equals("insert")){//便利店添加
			insertM(request, response);
		}else if(method.equals("list")){//便利店列表
			ListM(request, response);
		}else if(method.equals("delete")){//便利店删除
			deleteM(request, response);
		}else if(method.equals("modifyindex")){//便利店修改页面
			modifyIndex(request, response);
		}
		else if(method.equals("modify")){//便利店修改
			modifyM(request, response);
		}else if(method.equals("detail")){//便利店详细信息
			detailM(request, response);
		}else if(method.equals("Plist")){//便利店列表信息
			PListM(request, response);
		}
	}
	private void insertM(HttpServletRequest request, HttpServletResponse response){//便利店添加
		DBO db=new DBO();//初始化数据链接基础类
		String sql="";//sql语句初始化
			String keyid =(String)request.getParameter("keyid");//便利店表主键
String mc=(String)request.getParameter("mc");//名称
String dz=(String)request.getParameter("dz");//地址
String lxdh=(String)request.getParameter("lxdh");//联系电话
String fzr=(String)request.getParameter("fzr");//负责人

		response.setCharacterEncoding("gb2312");
 	
		int row=1;
		int num=0;
		ResultSet rs=null;
		
		try {
			sql="select count(1) as num from bld where mc='"+mc+"'";
			rs=db.query(sql);
			if(rs.next()){
				num=rs.getInt("num");
				
			}
			if(num>0){
				request.setAttribute("flag", "操作失败、名称重复"); 
			}else{
			
			
			
			sql="insert into bld(mc,dz,lxdh,fzr) values('"+mc+"','"+dz+"','"+lxdh+"','"+fzr+"')";
			;//便利店SQL 语句
			
			row=db.update(sql);//执行sql语句 insert语句
			if(row==1){
			request.setAttribute("flag", "操作成功"); 
			}else{
			request.setAttribute("flag", "操作失败"); 
			}
			
			
			}
			
			
			request.getRequestDispatcher("bld/bldadd.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
				
	}
	private void ListM(HttpServletRequest request, HttpServletResponse response){//便利店信息列表
		ResultSet rs=null;
		String sql="select * from bld where 1=1 ";//查询便利店 sql语句
		DBO db=new DBO();//初始化数据链接基础类
		db.open();
		String mc=(String)request.getParameter("mc");//名称
		if(mc!=null&&!mc.equals("")){
		sql+=" and mc like '%"+mc+"%'";//符合条件 拼接sql 名称
		}
		
		String dz=(String)request.getParameter("dz");//地址
		if(dz!=null&&!dz.equals("")){
		sql+=" and dz like '%"+dz+"%'";//符合条件 拼接sql 地址
		}
		//便利店信息查询
		response.setCharacterEncoding("gb2312");
		try{
			rs=db.query(sql);//查询结果

			//PrintWriter out = response.getWriter();
			request.setAttribute("rs", rs); 
		

			request.getRequestDispatcher("bld/bldlist.jsp").forward(request, response);
		}catch(Exception e){
			e.toString();
			e.printStackTrace();
		}
		
	}
	private void PListM(HttpServletRequest request, HttpServletResponse response){//便利店分页信息列表
		ResultSet rs=null;
		String sql="select * from bld where 1=1 ";//查询便利店 sql语句
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
		

		request.getRequestDispatcher("bld/bldPlist.jsp?Page="+str).forward(request, response);
		}catch(Exception e){
			e.toString();
			e.printStackTrace();
		}
		
	}
	private void modifyIndex(HttpServletRequest request, HttpServletResponse response){//便利店修改首页
			ResultSet rs=null;
	response.setCharacterEncoding("gb2312");

		
		
		String keyid =(String)request.getParameter("keyid");//便利店表主键
String mc=(String)request.getParameter("mc");//名称
String dz=(String)request.getParameter("dz");//地址
String lxdh=(String)request.getParameter("lxdh");//联系电话
String fzr=(String)request.getParameter("fzr");//负责人

	
		String sql="select * from bld where bldid="+keyid;//查询一条要修改的信息
		DBO db=new DBO();//初始化数据链接基础类
		
		try{
			
			db.open();//初始化数据库链接
			rs=db.query(sql);//查询sql语句
			PrintWriter out = response.getWriter();
			request.setAttribute("rs", rs); 
			
			request.getRequestDispatcher("bld/bldmodify.jsp").forward(request, response);
			//response.sendRedirect("bld/bldmodify.jsp");
		}catch(Exception e){
			e.toString();
			e.printStackTrace();
		}
		
	}
	private void detailM(HttpServletRequest request, HttpServletResponse response){//便利店详细信息页面
		
			ResultSet rs=null;
	response.setCharacterEncoding("gb2312");

		
		String keyid =(String)request.getParameter("keyid");//便利店表主键
String mc=(String)request.getParameter("mc");//名称
String dz=(String)request.getParameter("dz");//地址
String lxdh=(String)request.getParameter("lxdh");//联系电话
String fzr=(String)request.getParameter("fzr");//负责人

	
		String sql="select * from bld where bldid="+keyid;//查询一条要修改的信息
		DBO db=new DBO();//初始化数据链接基础类
		
		try{
			
			db.open();
			rs=db.query(sql);//查询sql语句
			PrintWriter out = response.getWriter();
			request.setAttribute("rs", rs); 
			
			request.getRequestDispatcher("bld/blddetail.jsp").forward(request, response);
			//response.sendRedirect("bld/bldmodify.jsp");
		}catch(Exception e){
			e.toString();
			e.printStackTrace();
		}
		
	}
	private void deleteM(HttpServletRequest request, HttpServletResponse response){//便利店删除
		
		DBO db=new DBO();
	  response.setCharacterEncoding("gb2312");
	int row=1;
	String keyid=(String)request.getParameter("keyid"); 
	String sql="";
  sql="delete from bld where bldid='"+keyid+"'";//删除便利店 信息sql语句
		try{
					 row=db.update(sql);// 执行sql语句

				if(row==1){
				request.setAttribute("flag", "删除成功"); 
				}else{
				request.setAttribute("flag", "删除失败"); 
				}
		request.getRequestDispatcher("bldServlet?method=list").forward(request, response);
		
			//response.sendRedirect("bldServlet?method=list");
		}catch(Exception e){
			e.toString();
			e.printStackTrace();
		}
		
	}

	private void modifyM(HttpServletRequest request, HttpServletResponse response){//便利店修改功能
	DBO db=new DBO();
		String keyid =(String)request.getParameter("keyid");//便利店表主键
String mc=(String)request.getParameter("mc");//名称
String dz=(String)request.getParameter("dz");//地址
String lxdh=(String)request.getParameter("lxdh");//联系电话
String fzr=(String)request.getParameter("fzr");//负责人


	response.setCharacterEncoding("gb2312");
	String sql="";
       
sql="update bld set mc='"+mc+"',dz='"+dz+"',lxdh='"+lxdh+"',fzr='"+fzr+"' where bldid='"+keyid+"'";

	int row=1;
		try {
					
		 row=db.update(sql);
			
			if(row==1){
			request.setAttribute("flag", "操作成功"); 
			}else{
			request.setAttribute("flag", "操作失败"); 
			}
			request.getRequestDispatcher("bldServlet?method=list").forward(request, response);
			
			//response.sendRedirect("bldServlet?method=list");
		} catch (Exception e) {
			e.printStackTrace();
		}
				
	}
}
