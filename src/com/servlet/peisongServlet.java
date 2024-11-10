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

public class peisongServlet extends HttpServlet  {
	public void service(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
		request.setCharacterEncoding("gb2312");
		System.out.println("method"+request.getParameter("method"));
		String method=(String)request.getParameter("method");
		if(method.equals("insert")){//配送添加
			insertM(request, response);
		}else if(method.equals("list")){//配送列表
			ListM(request, response);
		}else if(method.equals("delete")){//配送删除
			deleteM(request, response);
		}else if(method.equals("modifyindex")){//配送修改页面
			modifyIndex(request, response);
		}
		else if(method.equals("modify")){//配送修改
			modifyM(request, response);
		}else if(method.equals("detail")){//配送详细信息
			detailM(request, response);
		}else if(method.equals("Plist")){//配送列表信息
			PListM(request, response);
		}
	}
	private void insertM(HttpServletRequest request, HttpServletResponse response){//配送添加
		DBO db=new DBO();//初始化数据链接基础类
		String sql="";//sql语句初始化
			String keyid =(String)request.getParameter("keyid");//配送表主键
String dh=(String)request.getParameter("dh");//单号
String cfd=(String)request.getParameter("cfd");//出发地
String cfsj=(String)request.getParameter("cfsj");//出发时间
String mdd=(String)request.getParameter("mdd");//目的地
String ddsj=(String)request.getParameter("ddsj");//到达时间

		response.setCharacterEncoding("gb2312");
 
		int row=1;
		try {
			
			sql="update dingdan set zt='已配送' where ddh='"+dh+"'";
			
			db.update(sql);
			
			sql="insert into peisong(dh,cfd,cfsj,mdd,ddsj) values('"+dh+"','"+cfd+"','"+cfsj+"','"+mdd+"','"+ddsj+"')";
			;//配送SQL 语句
			row=db.update(sql);//执行sql语句 insert语句
			if(row==1){
			request.setAttribute("flag", "操作成功"); 
			}else{
			request.setAttribute("flag", "操作失败"); 
			}
			
			
			request.getRequestDispatcher("peisong/list.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
				
	}
	private void ListM(HttpServletRequest request, HttpServletResponse response){//配送信息列表
		ResultSet rs=null;
		String sql="select * from peisong where 1=1 ";//查询配送 sql语句
		DBO db=new DBO();//初始化数据链接基础类
		db.open();
		
		//配送信息查询
		response.setCharacterEncoding("gb2312");
		try{
			rs=db.query(sql);//查询结果

			//PrintWriter out = response.getWriter();
			request.setAttribute("rs", rs); 
		

			request.getRequestDispatcher("peisong/peisonglist.jsp").forward(request, response);
		}catch(Exception e){
			e.toString();
			e.printStackTrace();
		}
		
	}
	private void PListM(HttpServletRequest request, HttpServletResponse response){//配送分页信息列表
		ResultSet rs=null;
		String sql="select * from peisong where 1=1 ";//查询配送 sql语句
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
		

		request.getRequestDispatcher("peisong/peisongPlist.jsp?Page="+str).forward(request, response);
		}catch(Exception e){
			e.toString();
			e.printStackTrace();
		}
		
	}
	private void modifyIndex(HttpServletRequest request, HttpServletResponse response){//配送修改首页
			ResultSet rs=null;
	response.setCharacterEncoding("gb2312");

		
		
		String keyid =(String)request.getParameter("keyid");//配送表主键
String dh=(String)request.getParameter("dh");//单号
String cfd=(String)request.getParameter("cfd");//出发地
String cfsj=(String)request.getParameter("cfsj");//出发时间
String mdd=(String)request.getParameter("mdd");//目的地
String ddsj=(String)request.getParameter("ddsj");//到达时间

	
		String sql="select * from peisong where psid="+keyid;//查询一条要修改的信息
		DBO db=new DBO();//初始化数据链接基础类
		
		try{
			
			db.open();//初始化数据库链接
			rs=db.query(sql);//查询sql语句
			PrintWriter out = response.getWriter();
			request.setAttribute("rs", rs); 
			
			request.getRequestDispatcher("peisong/peisongmodify.jsp").forward(request, response);
			//response.sendRedirect("peisong/peisongmodify.jsp");
		}catch(Exception e){
			e.toString();
			e.printStackTrace();
		}
		
	}
	private void detailM(HttpServletRequest request, HttpServletResponse response){//配送详细信息页面
		
			ResultSet rs=null;
	response.setCharacterEncoding("gb2312");

		
		String keyid =(String)request.getParameter("keyid");//配送表主键
String dh=(String)request.getParameter("dh");//单号
String cfd=(String)request.getParameter("cfd");//出发地
String cfsj=(String)request.getParameter("cfsj");//出发时间
String mdd=(String)request.getParameter("mdd");//目的地
String ddsj=(String)request.getParameter("ddsj");//到达时间

	
		String sql="select * from peisong where psid="+keyid;//查询一条要修改的信息
		DBO db=new DBO();//初始化数据链接基础类
		
		try{
			
			db.open();
			rs=db.query(sql);//查询sql语句
			PrintWriter out = response.getWriter();
			request.setAttribute("rs", rs); 
			
			request.getRequestDispatcher("peisong/peisongdetail.jsp").forward(request, response);
			//response.sendRedirect("peisong/peisongmodify.jsp");
		}catch(Exception e){
			e.toString();
			e.printStackTrace();
		}
		
	}
	private void deleteM(HttpServletRequest request, HttpServletResponse response){//配送删除
		
		DBO db=new DBO();
	  response.setCharacterEncoding("gb2312");
	int row=1;
	String keyid=(String)request.getParameter("keyid"); 
	String sql="";
  sql="delete from peisong where psid='"+keyid+"'";//删除配送 信息sql语句
		try{
					 row=db.update(sql);// 执行sql语句

				if(row==1){
				request.setAttribute("flag", "删除成功"); 
				}else{
				request.setAttribute("flag", "删除失败"); 
				}
		request.getRequestDispatcher("peisongServlet?method=list").forward(request, response);
		
			//response.sendRedirect("peisongServlet?method=list");
		}catch(Exception e){
			e.toString();
			e.printStackTrace();
		}
		
	}

	private void modifyM(HttpServletRequest request, HttpServletResponse response){//配送修改功能
	DBO db=new DBO();
		String keyid =(String)request.getParameter("keyid");//配送表主键
String dh=(String)request.getParameter("dh");//单号
String cfd=(String)request.getParameter("cfd");//出发地
String cfsj=(String)request.getParameter("cfsj");//出发时间
String mdd=(String)request.getParameter("mdd");//目的地
String ddsj=(String)request.getParameter("ddsj");//到达时间


	response.setCharacterEncoding("gb2312");
	String sql="";
       
sql="update peisong set dh='"+dh+"',cfd='"+cfd+"',cfsj='"+cfsj+"',mdd='"+mdd+"',ddsj='"+ddsj+"' where psid='"+keyid+"'";

	int row=1;
		try {
					
		 row=db.update(sql);
			
			if(row==1){
			request.setAttribute("flag", "操作成功"); 
			}else{
			request.setAttribute("flag", "操作失败"); 
			}
			request.getRequestDispatcher("peisongServlet?method=list").forward(request, response);
			
			//response.sendRedirect("peisongServlet?method=list");
		} catch (Exception e) {
			e.printStackTrace();
		}
				
	}
}
