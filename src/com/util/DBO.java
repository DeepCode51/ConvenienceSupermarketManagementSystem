package com.util;

import javax.activation.DataSource;
import java.sql.*;

public class DBO {

	private Connection conn;
	private Statement stmt;
  	private DataSource ds;
	
	public DBO()
	{
		open();
	}

	/**
		打开数据库
	*/
	public void open() 
	{
		 String driver = "com.mysql.jdbc.Driver"; 

		   
		    String url = "jdbc:mysql://127.0.0.1:3306/graduation_277_jspblcsgl?characterEncoding=gb2312&amp;mysqlEncoding=gb2312";

		    // MySQL配置时的用户名
		    String user = "root"; 

		    // MySQL配置时的密码
		    String password = "123456";
		  
		    try {
		    	 Class.forName(driver); 
		    	 conn = DriverManager.getConnection(url, user, password); 
	
			stmt=conn.createStatement();
			System.out.println("打开数据库连接");
		} 
		catch (Exception ex) 
		{
		System.err.println("打开数据库时出错: " + ex.getMessage());
		}
	}

	/**
		关闭数据库，将连接返还给连接池
	*/
	public void close() 
	{
		try 
		{
		
				
		//	connMgr.freeConnection("java", conn);
			conn.close();
			System.out.println ("释放连接");
		} 
		catch (SQLException ex) 
		{ 
			System.err.println("返还连接池出错: " + ex.getMessage());
		}
	}

	/**
		执行查询
	*/
	public ResultSet executeQuery(String sql) throws SQLException
	{
		ResultSet rs = null;
		

		rs = stmt.executeQuery(sql);
		System.out.println ("执行查询");
		return rs;
	}
	public ResultSet query(String sql) throws SQLException
	{
		ResultSet rs = null;
		System.out.println(sql);

		rs = stmt.executeQuery(sql);
		System.out.println ("执行查询");
		return rs;
	}
    

	/**
		执行增删改
	*/
	
	public int executeUpdate(String sql) throws SQLException
	{
		int ret = 0;
		
	
		ret = stmt.executeUpdate(sql);
	
		System.out.println ("执行增删改");
		return ret;
	}
	public int update(String sql) throws SQLException
	{
		int ret = 0;
		
	
		ret = stmt.executeUpdate(sql);
	
		System.out.println ("执行增删改");
		return ret;
	}
	/**
		将SQL语句加入到批处理
	*/
	public void addBatch(String sql) throws SQLException 
	{
		stmt.addBatch(sql);
	}

	/**
		执行批处理
	*/
	public int [] executeBatch() throws SQLException 
	{
		boolean isAuto=conn.getAutoCommit();
		
		conn.setAutoCommit(false);
		int [] updateCounts = stmt.executeBatch();
		
//		conn.commit();
		
//		conn.setAutoCommit(isAuto);
		//conn.setAutoCommit(true);
		return updateCounts;
	}
	public boolean getAutoCommit() throws SQLException
	{
		return conn.getAutoCommit();
	}
	public void setAutoCommit(boolean auto)  throws SQLException 
	{
		conn.setAutoCommit(auto);
	}
	
	public void commit() throws SQLException 
	{
		conn.commit();
//		this.close();
	}
	public void rollBack() throws SQLException 
	{
		conn.rollback();
//		this.close();
	}
	public static void main(String[] args) {
		DBO con= new DBO();
		//con.open();
//		ResultSet rs=null;
//		String sql="select id dd from didian";
//		List list=new  ArrayList();
//		//ResultSet rs=null;
//	
//		
//		try{
//			rs=con.executeQuery(sql);
//		}catch(Exception e){
//			System.out.println(e.toString());
//			
//		}
		con.close();
	}
}
