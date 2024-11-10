<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.util.*"%>
<%
DBO db=new DBO();
request.setCharacterEncoding("gb2312");
ResultSet rs=null;
String sql="";
String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>



<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="gb2312">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/layui.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/view.css"/>
  
    <title>管理后台</title>
</head>
<body class="layui-view-body">
    <div class="layui-content">
        <div class="layui-page-header">
            <div class="pagewrap">
             
                <h2 class="title">商品列表</h2>
            </div>
        </div>
	
<form name="form" action="<%=request.getContextPath()%>/shangpinServlet?method=list" method="post" >
        <div class="layui-row">
            <div class="layui-card">
                <div class="layui-card-body">
                    <div class="form-box">
                        <div class="layui-form layui-form-item">
                            <div class="layui-inline">

		
			
        

                                <div class="layui-form-mid">商品名称：</div>
                                <div class="layui-input-inline" style="width: 100px;">
                                  <input type="text" autocomplete="off" name="spmc" class="layui-input">
                                </div>
                               


	



                            
                                <button type="submit" class="layui-btn layui-btn-blue">查询</button>
                         
                            </div>
                        </div>
                    
                        <table  class="layui-table"  id="table1">
			<tr class="layui-table-header">
			  <th>序号 </th>
					        <th >商品名称</th>
					       
					  
					       
					        <th >图片</th>
					       
					        <th >价格</th>
					       
					        <th >库存</th>
					       
					        <th >便利店</th>
					       

			
					       
      
			   <th>操作</th>
		
                        </tr>
			 <TBODY id="table2">			

			  
			  <%
			  
rs=(ResultSet)request.getAttribute("rs");
			  int i=1;
			  while(rs.next()){
			  %>
			  
			  <tr align="left">
			  <td><%=i%></td>
					        <td ><%=rs.getString("spmc")%></td>
					       
			
					       
					        <td ><img src="<%=path%>/upload/<%=rs.getString("tp")%>" width="80" height="80"></td>
					       
					        <td ><%=rs.getString("jg")%></td>
					       
					        <td ><%=rs.getString("kc")%></td>
					       
					        <td ><%=rs.getString("bld")%></td>
					       


<td ><a href="<%=path%>/shangpinServlet?method=delete&keyid=<%=rs.getString("spid")%>"  onClick="javascript:if(confirm('是否删除')){return true;} else{return false;}">删除</a>|<a href="<%=path%>/shangpinServlet?method=modifyindex&keyid=<%=rs.getString("spid")%>">修改</a>|<a href="<%=path%>/shangpinServlet?method=detail&keyid=<%=rs.getString("spid")%>">详细</a></td>

			</tr>
			
    <%
	
		i++;
			
}
				 %>
			  
			  
	    </TBODY>		
						
						</table>
						 <span id="spanFirst">第一页</span> <span id="spanPre">上一页</span> <span id="spanNext">下一页</span> <span id="spanLast">最后一页</span> 第<span id="spanPageNum"></span>页/共<span id="spanTotalPage"></span>页
                    </div>
                </div>
            </div>
	    </form>
        </div>
    </div>
	
	<font color="#FF0000">
<%
if(request.getAttribute("flag")!=null){
out.println("操作提示："+(String)request.getAttribute("flag"));
}
%>
</font>
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



    <script src="<%=request.getContextPath()%>/assets/layui.all.js"></script>
    
</body>
</html>


