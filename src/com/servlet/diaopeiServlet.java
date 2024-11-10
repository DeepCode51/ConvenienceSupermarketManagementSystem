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

public class diaopeiServlet extends HttpServlet  {
	public void service(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
		request.setCharacterEncoding("gb2312");
		System.out.println("method"+request.getParameter("method"));
		String method=(String)request.getParameter("method");
		if(method.equals("insert")){//调配添加
			insertM(request, response);
		}else if(method.equals("list")){//调配列表
			ListM(request, response);
		}else if(method.equals("delete")){//调配删除
			deleteM(request, response);
		}else if(method.equals("modifyindex")){//调配修改页面
			modifyIndex(request, response);
		}
		else if(method.equals("modify")){//调配修改
			modifyM(request, response);
		}else if(method.equals("detail")){//调配详细信息
			detailM(request, response);
		}else if(method.equals("Plist")){//调配列表信息
			PListM(request, response);
		}
	}
	private void insertM(HttpServletRequest request, HttpServletResponse response){//调配添加
		DBO db=new DBO();//初始化数据链接基础类
		String sql="";//sql语句初始化
			String keyid =(String)request.getParameter("keyid");//调配表主键
String sp=(String)request.getParameter("sp");//商品
String ybld=(String)request.getParameter("ybld");//原便利店
String xbld=(String)request.getParameter("xbld");//新便利店
String drsl=(String)request.getParameter("drsl");//调入数量
String czsj=(String)request.getParameter("czsj");//操作时间
String yh=(String)request.getParameter("yh");//用户

		response.setCharacterEncoding("gb2312");
 		
		ResultSet rs=null;
		
		int row=1;
		int num=0;
		
		int sl=0;
		try {
			
			
			sql="select count(1) as num from shangpin where spmc='"+sp+"' and bld='"+xbld+"'";
			
			rs=db.query(sql);
			if(rs.next()){
				num=rs.getInt("num");
			}
			
			if(num>0){
			
				
				sql="select * from shangpin where spmc='"+sp+"' and bld='"+ybld+"'";
				
				rs=db.query(sql);
				if(rs.next()){
					
					sl=rs.getInt("kc");
				}
				if(sl>Integer.parseInt(drsl)){//当前库存大于 调配数量可以调配
				
			sql="update shangpin set kc=kc-'"+drsl+"'  where  spmc='"+sp+"' and bld='"+ybld+"'";//原始  减掉 
			
			db.update(sql);
			
			sql="update shangpin set kc=kc+'"+drsl+"'  where  spmc='"+sp+"' and bld='"+xbld+"'";//新   增加
			
			db.update(sql);
			
			
			sql="insert into diaopei(sp,ybld,xbld,drsl,czsj,yh) values('"+sp+"','"+ybld+"','"+xbld+"','"+drsl+"','"+czsj+"','"+yh+"')";
			;//调配SQL 语句
			row=db.update(sql);//执行sql语句 insert语句
			if(row==1){
			request.setAttribute("flag", "操作成功"); 
			}else{
			request.setAttribute("flag", "操作失败"); 
			}
			
				}else{
					
					request.setAttribute("flag", "操作失败,库存不足"); 
					
				}
			
			
			
			
			
			
			}else{
				
				
				request.setAttribute("flag", "操作失败,新便利店无此商品"); 
				
			}
			
			
			request.getRequestDispatcher("diaopei/diaopeiadd.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
				
	}
	private void ListM(HttpServletRequest request, HttpServletResponse response){//调配信息列表
		ResultSet rs=null;
		String sql="select * from diaopei where 1=1 ";//查询调配 sql语句
		DBO db=new DBO();//初始化数据链接基础类
		db.open();
		
		//调配信息查询
		response.setCharacterEncoding("gb2312");
		try{
			rs=db.query(sql);//查询结果

			//PrintWriter out = response.getWriter();
			request.setAttribute("rs", rs); 
		

			request.getRequestDispatcher("diaopei/diaopeilist.jsp").forward(request, response);
		}catch(Exception e){
			e.toString();
			e.printStackTrace();
		}
		
	}
	private void PListM(HttpServletRequest request, HttpServletResponse response){//调配分页信息列表
		ResultSet rs=null;
		String sql="select * from diaopei where 1=1 ";//查询调配 sql语句
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
		

		request.getRequestDispatcher("diaopei/diaopeiPlist.jsp?Page="+str).forward(request, response);
		}catch(Exception e){
			e.toString();
			e.printStackTrace();
		}
		
	}
	private void modifyIndex(HttpServletRequest request, HttpServletResponse response){//调配修改首页
			ResultSet rs=null;
	response.setCharacterEncoding("gb2312");

		
		
		String keyid =(String)request.getParameter("keyid");//调配表主键
String sp=(String)request.getParameter("sp");//商品
String ybld=(String)request.getParameter("ybld");//原便利店
String xbld=(String)request.getParameter("xbld");//新便利店
String drsl=(String)request.getParameter("drsl");//调入数量
String czsj=(String)request.getParameter("czsj");//操作时间
String yh=(String)request.getParameter("yh");//用户

	
		String sql="select * from diaopei where dpid="+keyid;//查询一条要修改的信息
		DBO db=new DBO();//初始化数据链接基础类
		
		try{
			
			db.open();//初始化数据库链接
			rs=db.query(sql);//查询sql语句
			PrintWriter out = response.getWriter();
			request.setAttribute("rs", rs); 
			
			request.getRequestDispatcher("diaopei/diaopeimodify.jsp").forward(request, response);
			//response.sendRedirect("diaopei/diaopeimodify.jsp");
		}catch(Exception e){
			e.toString();
			e.printStackTrace();
		}
		
	}
	private void detailM(HttpServletRequest request, HttpServletResponse response){//调配详细信息页面
		
			ResultSet rs=null;
	response.setCharacterEncoding("gb2312");

		
		String keyid =(String)request.getParameter("keyid");//调配表主键
String sp=(String)request.getParameter("sp");//商品
String ybld=(String)request.getParameter("ybld");//原便利店
String xbld=(String)request.getParameter("xbld");//新便利店
String drsl=(String)request.getParameter("drsl");//调入数量
String czsj=(String)request.getParameter("czsj");//操作时间
String yh=(String)request.getParameter("yh");//用户

	
		String sql="select * from diaopei where dpid="+keyid;//查询一条要修改的信息
		DBO db=new DBO();//初始化数据链接基础类
		
		try{
			
			db.open();
			rs=db.query(sql);//查询sql语句
			PrintWriter out = response.getWriter();
			request.setAttribute("rs", rs); 
			
			request.getRequestDispatcher("diaopei/diaopeidetail.jsp").forward(request, response);
			//response.sendRedirect("diaopei/diaopeimodify.jsp");
		}catch(Exception e){
			e.toString();
			e.printStackTrace();
		}
		
	}
	private void deleteM(HttpServletRequest request, HttpServletResponse response){//调配删除
		
		DBO db=new DBO();
	  response.setCharacterEncoding("gb2312");
	int row=1;
	String keyid=(String)request.getParameter("keyid"); 
	String sql="";
  sql="delete from diaopei where dpid='"+keyid+"'";//删除调配 信息sql语句
		try{
					 row=db.update(sql);// 执行sql语句

				if(row==1){
				request.setAttribute("flag", "删除成功"); 
				}else{
				request.setAttribute("flag", "删除失败"); 
				}
		request.getRequestDispatcher("diaopeiServlet?method=list").forward(request, response);
		
			//response.sendRedirect("diaopeiServlet?method=list");
		}catch(Exception e){
			e.toString();
			e.printStackTrace();
		}
		
	}

	private void modifyM(HttpServletRequest request, HttpServletResponse response){//调配修改功能
	DBO db=new DBO();
		String keyid =(String)request.getParameter("keyid");//调配表主键
String sp=(String)request.getParameter("sp");//商品
String ybld=(String)request.getParameter("ybld");//原便利店
String xbld=(String)request.getParameter("xbld");//新便利店
String drsl=(String)request.getParameter("drsl");//调入数量
String czsj=(String)request.getParameter("czsj");//操作时间
String yh=(String)request.getParameter("yh");//用户


	response.setCharacterEncoding("gb2312");
	String sql="";
       
sql="update diaopei set sp='"+sp+"',ybld='"+ybld+"',xbld='"+xbld+"',drsl='"+drsl+"',czsj='"+czsj+"',yh='"+yh+"' where dpid='"+keyid+"'";

	int row=1;
		try {
					
		 row=db.update(sql);
			
			if(row==1){
			request.setAttribute("flag", "操作成功"); 
			}else{
			request.setAttribute("flag", "操作失败"); 
			}
			request.getRequestDispatcher("diaopeiServlet?method=list").forward(request, response);
			
			//response.sendRedirect("diaopeiServlet?method=list");
		} catch (Exception e) {
			e.printStackTrace();
		}
				
	}
}
