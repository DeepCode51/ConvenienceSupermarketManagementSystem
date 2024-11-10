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

public class dingdanServlet extends HttpServlet  {
	public void service(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
		request.setCharacterEncoding("gb2312");
		System.out.println("method"+request.getParameter("method"));
		String method=(String)request.getParameter("method");
		if(method.equals("insert")){//订单添加
			insertM(request, response);
		}else if(method.equals("list")){//订单列表
			ListM(request, response);
		}else if(method.equals("mylist")){//订单列表
			mylist(request, response);
		}else if(method.equals("delete")){//订单删除
			deleteM(request, response);
		}else if(method.equals("modifyindex")){//订单修改页面
			modifyIndex(request, response);
		}
		else if(method.equals("modify")){//订单修改
			modifyM(request, response);
		}else if(method.equals("detail")){//订单详细信息
			detailM(request, response);
		}else if(method.equals("Plist")){//订单列表信息
			PListM(request, response);
		}
	}
	private void insertM(HttpServletRequest request, HttpServletResponse response){//订单添加
		DBO db=new DBO();//初始化数据链接基础类
		String sql="";//sql语句初始化
			String keyid =(String)request.getParameter("keyid");//订单表主键
String ddh=(String)request.getParameter("ddh");//订单号
String xdsj=(String)request.getParameter("xdsj");//下单时间
String yh=(String)request.getParameter("yh");//用户
String zjg=(String)request.getParameter("zjg");//总价格
String lxdh=(String)request.getParameter("lxdh");//联系电话
String lxdz=(String)request.getParameter("lxdz");//联系地址
String zt=(String)request.getParameter("zt");//状态
String bld=(String)request.getParameter("bld");//便利店

		response.setCharacterEncoding("gb2312");
 		sql="insert into dingdan(ddh,xdsj,yh,zjg,lxdh,lxdz,zt,bld) values('"+ddh+"','"+xdsj+"','"+yh+"','"+zjg+"','"+lxdh+"','"+lxdz+"','"+zt+"','"+bld+"')";
;//订单SQL 语句
		int row=1;
		try {
			row=db.update(sql);//执行sql语句 insert语句
			if(row==1){
			request.setAttribute("flag", "操作成功"); 
			}else{
			request.setAttribute("flag", "操作失败"); 
			}
			
			
			request.getRequestDispatcher("dingdan/dingdanadd.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
				
	}
	private void ListM(HttpServletRequest request, HttpServletResponse response){//订单信息列表
		ResultSet rs=null;
		String sql="select * from dingdan where 1=1 ";//查询订单 sql语句
		DBO db=new DBO();//初始化数据链接基础类
		db.open();
		 if(request.getSession().getAttribute("yhm")!=null){
			 
			 sql+=" and bld in (select bld from yuangong where yhm='"+request.getSession().getAttribute("yhm")+"')";
			 }
		//订单信息查询
		response.setCharacterEncoding("gb2312");
		try{
			rs=db.query(sql);//查询结果

			//PrintWriter out = response.getWriter();
			request.setAttribute("rs", rs); 
		

			request.getRequestDispatcher("dingdan/dingdanlist.jsp").forward(request, response);
		}catch(Exception e){
			e.toString();
			e.printStackTrace();
		}
		
	}
	
	private void mylist(HttpServletRequest request, HttpServletResponse response){//订单信息列表
		ResultSet rs=null;
		String sql="select * from dingdan where 1=1 ";//查询订单 sql语句
		if(request.getSession().getAttribute("yhm")!=null){
			sql+=" and yh='"+request.getSession().getAttribute("yhm")+"'";
			
		}
		DBO db=new DBO();//初始化数据链接基础类
		db.open();
		
		//订单信息查询
		response.setCharacterEncoding("gb2312");
		try{
			rs=db.query(sql);//查询结果

			//PrintWriter out = response.getWriter();
			request.setAttribute("rs", rs); 
		

			request.getRequestDispatcher("dingdan/mylist.jsp").forward(request, response);
		}catch(Exception e){
			e.toString();
			e.printStackTrace();
		}
		
	}
	private void PListM(HttpServletRequest request, HttpServletResponse response){//订单分页信息列表
		ResultSet rs=null;
		String sql="select * from dingdan where 1=1 ";//查询订单 sql语句
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
		

		request.getRequestDispatcher("dingdan/dingdanPlist.jsp?Page="+str).forward(request, response);
		}catch(Exception e){
			e.toString();
			e.printStackTrace();
		}
		
	}
	private void modifyIndex(HttpServletRequest request, HttpServletResponse response){//订单修改首页
			ResultSet rs=null;
	response.setCharacterEncoding("gb2312");

		
		
		String keyid =(String)request.getParameter("keyid");//订单表主键
String ddh=(String)request.getParameter("ddh");//订单号
String xdsj=(String)request.getParameter("xdsj");//下单时间
String yh=(String)request.getParameter("yh");//用户
String zjg=(String)request.getParameter("zjg");//总价格
String lxdh=(String)request.getParameter("lxdh");//联系电话
String lxdz=(String)request.getParameter("lxdz");//联系地址
String zt=(String)request.getParameter("zt");//状态
String bld=(String)request.getParameter("bld");//便利店

	
		String sql="select * from dingdan where ddid="+keyid;//查询一条要修改的信息
		DBO db=new DBO();//初始化数据链接基础类
		
		try{
			
			db.open();//初始化数据库链接
			rs=db.query(sql);//查询sql语句
			PrintWriter out = response.getWriter();
			request.setAttribute("rs", rs); 
			
			request.getRequestDispatcher("dingdan/dingdanmodify.jsp").forward(request, response);
			//response.sendRedirect("dingdan/dingdanmodify.jsp");
		}catch(Exception e){
			e.toString();
			e.printStackTrace();
		}
		
	}
	private void detailM(HttpServletRequest request, HttpServletResponse response){//订单详细信息页面
		
			ResultSet rs=null;
	response.setCharacterEncoding("gb2312");

		
		String keyid =(String)request.getParameter("keyid");//订单表主键
String ddh=(String)request.getParameter("ddh");//订单号
String xdsj=(String)request.getParameter("xdsj");//下单时间
String yh=(String)request.getParameter("yh");//用户
String zjg=(String)request.getParameter("zjg");//总价格
String lxdh=(String)request.getParameter("lxdh");//联系电话
String lxdz=(String)request.getParameter("lxdz");//联系地址
String zt=(String)request.getParameter("zt");//状态
String bld=(String)request.getParameter("bld");//便利店

	
		String sql="select * from dingdan where ddid="+keyid;//查询一条要修改的信息
		DBO db=new DBO();//初始化数据链接基础类
		
		try{
			
			db.open();
			rs=db.query(sql);//查询sql语句
			PrintWriter out = response.getWriter();
			request.setAttribute("rs", rs); 
			
			request.getRequestDispatcher("dingdan/dingdandetail.jsp").forward(request, response);
			//response.sendRedirect("dingdan/dingdanmodify.jsp");
		}catch(Exception e){
			e.toString();
			e.printStackTrace();
		}
		
	}
	private void deleteM(HttpServletRequest request, HttpServletResponse response){//订单删除
		
		DBO db=new DBO();
	  response.setCharacterEncoding("gb2312");
	int row=1;
	String keyid=(String)request.getParameter("keyid"); 
	String sql="";
  sql="delete from dingdan where ddid='"+keyid+"'";//删除订单 信息sql语句
		try{
					 row=db.update(sql);// 执行sql语句

				if(row==1){
				request.setAttribute("flag", "删除成功"); 
				}else{
				request.setAttribute("flag", "删除失败"); 
				}
		request.getRequestDispatcher("dingdanServlet?method=list").forward(request, response);
		
			//response.sendRedirect("dingdanServlet?method=list");
		}catch(Exception e){
			e.toString();
			e.printStackTrace();
		}
		
	}

	private void modifyM(HttpServletRequest request, HttpServletResponse response){//订单修改功能
	DBO db=new DBO();
		String keyid =(String)request.getParameter("keyid");//订单表主键
String ddh=(String)request.getParameter("ddh");//订单号
String xdsj=(String)request.getParameter("xdsj");//下单时间
String yh=(String)request.getParameter("yh");//用户
String zjg=(String)request.getParameter("zjg");//总价格
String lxdh=(String)request.getParameter("lxdh");//联系电话
String lxdz=(String)request.getParameter("lxdz");//联系地址
String zt=(String)request.getParameter("zt");//状态
String bld=(String)request.getParameter("bld");//便利店


	response.setCharacterEncoding("gb2312");
	String sql="";
       
sql="update dingdan set ddh='"+ddh+"',xdsj='"+xdsj+"',yh='"+yh+"',zjg='"+zjg+"',lxdh='"+lxdh+"',lxdz='"+lxdz+"',zt='"+zt+"',bld='"+bld+"' where ddid='"+keyid+"'";

	int row=1;
		try {
					
		 row=db.update(sql);
			
			if(row==1){
			request.setAttribute("flag", "操作成功"); 
			}else{
			request.setAttribute("flag", "操作失败"); 
			}
			request.getRequestDispatcher("dingdanServlet?method=list").forward(request, response);
			
			//response.sendRedirect("dingdanServlet?method=list");
		} catch (Exception e) {
			e.printStackTrace();
		}
				
	}
}
