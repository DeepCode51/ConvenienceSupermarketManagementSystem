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

public class shangpinServlet extends HttpServlet  {
	public void service(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
		request.setCharacterEncoding("gb2312");
		System.out.println("method"+request.getParameter("method"));
		String method=(String)request.getParameter("method");
		if(method.equals("insert")){//商品添加
			insertM(request, response);
		}else if(method.equals("list")){//商品列表
			ListM(request, response);
		}else if(method.equals("delete")){//商品删除
			deleteM(request, response);
		}else if(method.equals("modifyindex")){//商品修改页面
			modifyIndex(request, response);
		}
		else if(method.equals("modify")){//商品修改
			modifyM(request, response);
		}else if(method.equals("detail")){//商品详细信息
			detailM(request, response);
		}else if(method.equals("Plist")){//商品列表信息
			PListM(request, response);
		}
	}
	private void insertM(HttpServletRequest request, HttpServletResponse response){//商品添加
		DBO db=new DBO();//初始化数据链接基础类
		String sql="";//sql语句初始化
			String keyid =(String)request.getParameter("keyid");//商品表主键
String spmc=(String)request.getParameter("spmc");//商品名称
String js=(String)request.getParameter("js");//介绍
String tp=(String)request.getParameter("tp");//图片
String jg=(String)request.getParameter("jg");//价格
String kc=(String)request.getParameter("kc");//库存
String bld=(String)request.getParameter("bld");//便利店
String gys=(String)request.getParameter("gys");
		response.setCharacterEncoding("gb2312");
 
		int row=1;
		int num=0;
		ResultSet rs=null;
		try {
			sql="select count(1) as num from shangpin where spmc='"+spmc+"'  and bld='"+bld+"'";
			rs=db.query(sql);
			if(rs.next()){
				num=rs.getInt("num");
			}
			if(num>0){
				request.setAttribute("flag", "操作失败，商品名称重复"); 
			}else{
			
			sql="insert into shangpin(spmc,js,tp,jg,kc,bld,gys) values('"+spmc+"','"+js+"','"+tp+"','"+jg+"','"+kc+"','"+bld+"','"+gys+"')";
			;//商品SQL 语句
			row=db.update(sql);//执行sql语句 insert语句
			if(row==1){
			request.setAttribute("flag", "操作成功"); 
			}else{
			request.setAttribute("flag", "操作失败"); 
			}
			
			}
			
			
			request.getRequestDispatcher("shangpin/shangpinadd.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
				
	}
	private void ListM(HttpServletRequest request, HttpServletResponse response){//商品信息列表
		ResultSet rs=null;
		String sql="select * from shangpin where 1=1 ";//查询商品 sql语句
		
		if(request.getSession().getAttribute("yhm")!=null){
			
			sql+=" and bld in (select bld from yuangong where yhm='"+request.getSession().getAttribute("yhm")+"')";
			
		}
		
		String spmc=(String)request.getParameter("spmc");//商品名称
		if(spmc!=null&&!spmc.equals("")){
		sql+=" and spmc like '%"+spmc+"%'";//符合条件 拼接sql 商品名称
		}
		
		String js=(String)request.getParameter("js");//介绍
		if(js!=null&&!js.equals("")){
		sql+=" and js like '%"+js+"%'";//符合条件 拼接sql 介绍
		}
		DBO db=new DBO();//初始化数据链接基础类
		db.open();
		
		//商品信息查询
		response.setCharacterEncoding("gb2312");
		try{
			rs=db.query(sql);//查询结果

			//PrintWriter out = response.getWriter();
			request.setAttribute("rs", rs); 
		

			request.getRequestDispatcher("shangpin/shangpinlist.jsp").forward(request, response);
		}catch(Exception e){
			e.toString();
			e.printStackTrace();
		}
		
	}
	private void PListM(HttpServletRequest request, HttpServletResponse response){//商品分页信息列表
		ResultSet rs=null;
		String sql="select * from shangpin where 1=1 ";//查询商品 sql语句
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
		

		request.getRequestDispatcher("shangpin/shangpinPlist.jsp?Page="+str).forward(request, response);
		}catch(Exception e){
			e.toString();
			e.printStackTrace();
		}
		
	}
	private void modifyIndex(HttpServletRequest request, HttpServletResponse response){//商品修改首页
			ResultSet rs=null;
	response.setCharacterEncoding("gb2312");

		
		
		String keyid =(String)request.getParameter("keyid");//商品表主键
String spmc=(String)request.getParameter("spmc");//商品名称
String js=(String)request.getParameter("js");//介绍
String tp=(String)request.getParameter("tp");//图片
String jg=(String)request.getParameter("jg");//价格
String kc=(String)request.getParameter("kc");//库存
String bld=(String)request.getParameter("bld");//便利店
String gys=(String)request.getParameter("gys");

	
		String sql="select * from shangpin where spid="+keyid;//查询一条要修改的信息
		DBO db=new DBO();//初始化数据链接基础类
		
		try{
			
			db.open();//初始化数据库链接
			rs=db.query(sql);//查询sql语句
			PrintWriter out = response.getWriter();
			request.setAttribute("rs", rs); 
			
			request.getRequestDispatcher("shangpin/shangpinmodify.jsp").forward(request, response);
			//response.sendRedirect("shangpin/shangpinmodify.jsp");
		}catch(Exception e){
			e.toString();
			e.printStackTrace();
		}
		
	}
	private void detailM(HttpServletRequest request, HttpServletResponse response){//商品详细信息页面
		
			ResultSet rs=null;
	response.setCharacterEncoding("gb2312");

		
		String keyid =(String)request.getParameter("keyid");//商品表主键
String spmc=(String)request.getParameter("spmc");//商品名称
String js=(String)request.getParameter("js");//介绍
String tp=(String)request.getParameter("tp");//图片
String jg=(String)request.getParameter("jg");//价格
String kc=(String)request.getParameter("kc");//库存
String bld=(String)request.getParameter("bld");//便利店
String gys=(String)request.getParameter("gys");
	
		String sql="select * from shangpin where spid="+keyid;//查询一条要修改的信息
		DBO db=new DBO();//初始化数据链接基础类
		
		try{
			
			db.open();
			rs=db.query(sql);//查询sql语句
			PrintWriter out = response.getWriter();
			request.setAttribute("rs", rs); 
			
			request.getRequestDispatcher("shangpin/shangpindetail.jsp").forward(request, response);
			//response.sendRedirect("shangpin/shangpinmodify.jsp");
		}catch(Exception e){
			e.toString();
			e.printStackTrace();
		}
		
	}
	private void deleteM(HttpServletRequest request, HttpServletResponse response){//商品删除
		
		DBO db=new DBO();
	  response.setCharacterEncoding("gb2312");
	int row=1;
	String keyid=(String)request.getParameter("keyid"); 
	String sql="";
  sql="delete from shangpin where spid='"+keyid+"'";//删除商品 信息sql语句
		try{
					 row=db.update(sql);// 执行sql语句

				if(row==1){
				request.setAttribute("flag", "删除成功"); 
				}else{
				request.setAttribute("flag", "删除失败"); 
				}
		request.getRequestDispatcher("shangpinServlet?method=list").forward(request, response);
		
			//response.sendRedirect("shangpinServlet?method=list");
		}catch(Exception e){
			e.toString();
			e.printStackTrace();
		}
		
	}

	private void modifyM(HttpServletRequest request, HttpServletResponse response){//商品修改功能
	DBO db=new DBO();
		String keyid =(String)request.getParameter("keyid");//商品表主键
String spmc=(String)request.getParameter("spmc");//商品名称
String js=(String)request.getParameter("js");//介绍
String tp=(String)request.getParameter("tp");//图片
String jg=(String)request.getParameter("jg");//价格
String kc=(String)request.getParameter("kc");//库存
String bld=(String)request.getParameter("bld");//便利店
String gys=(String)request.getParameter("gys");

	response.setCharacterEncoding("gb2312");
	String sql="";
       
sql="update shangpin set spmc='"+spmc+"',js='"+js+"',tp='"+tp+"',jg='"+jg+"',kc='"+kc+"',bld='"+bld+"',gys='"+gys+"' where spid='"+keyid+"'";

	int row=1;
		try {
					
		 row=db.update(sql);
			
			if(row==1){
			request.setAttribute("flag", "操作成功"); 
			}else{
			request.setAttribute("flag", "操作失败"); 
			}
			request.getRequestDispatcher("shangpinServlet?method=list").forward(request, response);
			
			//response.sendRedirect("shangpinServlet?method=list");
		} catch (Exception e) {
			e.printStackTrace();
		}
				
	}
}
