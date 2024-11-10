<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.util.*"%>
<%
request.setCharacterEncoding("gb2312");//设置页面字符集
DBO db=new DBO();//初始链接数据库类
String sql="select * from shangpin where 1=1 ";//查询 商品sql语句
db.open();//打开数据库链接
	String spmc=(String)request.getParameter("spmc");//商品名称
	if(spmc!=null&&!spmc.equals("")){
	sql+=" and spmc like '%"+spmc+"%'";//符合条件 拼接sql 商品名称
	}
	
	String js=(String)request.getParameter("js");//介绍
	if(js!=null&&!js.equals("")){
	sql+=" and js like '%"+js+"%'";//符合条件 拼接sql 介绍
	}
	
	String tp=(String)request.getParameter("tp");//图片
	if(tp!=null&&!tp.equals("")){
	sql+=" and tp like '%"+tp+"%'";//符合条件 拼接sql 图片
	}
	
	String jg=(String)request.getParameter("jg");//价格
	if(jg!=null&&!jg.equals("")){
	sql+=" and jg like '%"+jg+"%'";//符合条件 拼接sql 价格
	}
	
	String kc=(String)request.getParameter("kc");//库存
	if(kc!=null&&!kc.equals("")){
	sql+=" and kc like '%"+kc+"%'";//符合条件 拼接sql 库存
	}
	
	String bld=(String)request.getParameter("bld");//便利店
	if(bld!=null&&!bld.equals("")){
	sql+=" and bld like '%"+bld+"%'";//符合条件 拼接sql 便利店
	}
	
ResultSet rs=db.query(sql);//查询结果
//商品信息列表
%>

<HTML ><HEAD id=Head1><TITLE>商品信息列表</TITLE>

<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta name="renderer" content="webkit">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/layui.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/view.css"/>
	<link href="<%=request.getContextPath()%>/assets/tablecloth.css" rel="stylesheet" type="text/css" media="screen" />

<META http-equiv=Content-Type content="text/html; charset=gb2312">


</HEAD>
<body class="layui-view-body">

<form name="form" method="post" action="shangpinlist.jsp">
 <div class="layui-content">
        <div class="layui-page-header">
            <div class="pagewrap">
             
                <h2 class="title">商品列表</h2>
            </div>
        </div>
        <div class="layui-row">
            <div class="layui-card">
                <div class="layui-card-body">
                    <div class="form-box">
                        <div class="layui-form layui-form-item">
                            <div class="layui-inline">
							
            	商品名称：
               <input name="spmc" type="text">
            	便利店：
               <input name="bld" type="text">

                                <button class="layui-btn layui-btn-blue">查询</button>   <button class="layui-btn layui-btn-blue" type="button" onClick="window.location='cart.jsp'">购物车</button>
                             
                            </div>
                        </div>
                      
                        <table id="table1" class="layui-table">
						<tr  >
						<th>序号</th>
			
					         <th >商品名称</th>
			
					    
			
					         <th >图片</th>
			
					         <th >价格</th>
			
					         <th >库存</th>
			
					         <th >便利店</th>
        <th >操作</th>
						</tr>
						
						  <TBODY id="table2">

						<%
					int i=1;
					if(rs!=null){
					while(rs.next()){
					%>
						<tr>
											
						
						    <td ><%=i%></td>
					        <td   ><%=rs.getString("spmc")%></td>
					       
					
					       
					        <td   ><img src="..//upload/<%=rs.getString("tp")%>" width="60" height="60"></td>
					       
					        <td   ><%=rs.getString("jg")%></td>
					       
					        <td   ><%=rs.getString("kc")%></td>
					       
					        <td   ><%=rs.getString("bld")%></td>
					       
						<td >
						
									
						
						
					
						 <a href="detail.jsp?keyid=<%=rs.getString("spid")%>"  >查看</a>
						
						
						</td>
						</tr>
						
												<%
				i++;
				}
				}
				%>
						    </TBODY>
						</table>
							 <span id="spanFirst">第一页</span> <span id="spanPre">上一页</span> <span id="spanNext">下一页</span> <span id="spanLast">最后一页</span> 第<span id="spanPageNum"></span>页/共<span id="spanTotalPage"></span>页
							 
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="../assets/layui.all.js"></script>
    
<script>
      var theTable = document.getElementById("table2");
      var totalPage = document.getElementById("spanTotalPage");
      var pageNum = document.getElementById("spanPageNum");


      var spanPre = document.getElementById("spanPre");
      var spanNext = document.getElementById("spanNext");
      var spanFirst = document.getElementById("spanFirst");
      var spanLast = document.getElementById("spanLast");


      var numberRowsInTable = theTable.rows.length;
      var pageSize = 20;
      var page = 1;


      //下一页
     function next() {


          hideTable();


          currentRow = pageSize * page;
          maxRow = currentRow + pageSize;
          if (maxRow > numberRowsInTable) maxRow = numberRowsInTable;
          for (var i = currentRow; i < maxRow; i++) {
              theTable.rows[i].style.display = '';
          }
          page++;


          if (maxRow == numberRowsInTable) { nextText(); lastText(); }
          showPage();
          preLink();
          firstLink();
      }


      //上一页
     function pre() {


          hideTable();


          page--;


          currentRow = pageSize * page;
          maxRow = currentRow - pageSize;
          if (currentRow > numberRowsInTable) currentRow = numberRowsInTable;
          for (var i = maxRow; i < currentRow; i++) {
              theTable.rows[i].style.display = '';
          }




          if (maxRow == 0) { preText(); firstText(); }
          showPage();
          nextLink();
          lastLink();
      }


      //第一页
     function first() {
          hideTable();
          page = 1;
          for (var i = 0; i < pageSize; i++) {
              theTable.rows[i].style.display = '';
          }
          showPage();


          preText();
          nextLink();
          lastLink();
      }


      //最后一页
     function last() {
          hideTable();
          page = pageCount();
          currentRow = pageSize * (page - 1);
          for (var i = currentRow; i < numberRowsInTable; i++) {
              theTable.rows[i].style.display = '';
          }
          showPage();


          preLink();
          nextText();
          firstLink();
      }


      function hideTable() {
          for (var i = 0; i < numberRowsInTable; i++) {
              theTable.rows[i].style.display = 'none';
          }
      }


      function showPage() {
          pageNum.innerHTML = page;
      }


      //总共页数
     function pageCount() {
          var count = 0;
          if (numberRowsInTable % pageSize != 0) count = 1;
          return parseInt(numberRowsInTable / pageSize) + count;
      }


      //显示链接
     function preLink() { spanPre.innerHTML = "<a href='javascript:pre();'>上一页</a>"; }
      function preText() { spanPre.innerHTML = "上一页"; }


      function nextLink() { spanNext.innerHTML = "<a href='javascript:next();'>下一页</a>"; }
      function nextText() { spanNext.innerHTML = "下一页"; }


      function firstLink() { spanFirst.innerHTML = "<a href='javascript:first();'>第一页</a>"; }
      function firstText() { spanFirst.innerHTML = "第一页"; }


      function lastLink() { spanLast.innerHTML = "<a href='javascript:last();'>最后一页</a>"; }
      function lastText() { spanLast.innerHTML = "最后一页"; }


      //隐藏表格
     function hide() {
          for (var i = pageSize; i < numberRowsInTable; i++) {
              theTable.rows[i].style.display = 'none';
          }


          totalPage.innerHTML = pageCount();
          pageNum.innerHTML = '1';


          nextLink();
          lastLink();
      }


      hide();
 </script>


</form>
</BODY></HTML>

<%
db.close();
%>


