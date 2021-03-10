<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.model.Member"%>
<%@page import="com.dao.CommonDAO"%>
<%@page import="com.util.Info"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.util.PageManager"%>
<%@page import="com.model.Goods"%>
<%@page import="com.model.Car"%>
<%@page import="com.model.Score"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>订单管理</title>
<link rel="stylesheet" href="/productauctionssh/e/css/index.css" type="text/css"></link>
<link rel="stylesheet" href="/productauctionssh/e/css/box.all.css" type="text/css"></link>

<script src="/productauctionssh/webui/jquery/jquery-1.8.3.min.js" type="text/javascript"></script>
<link href="/productauctionssh/admin/css/web2table.css" rel="stylesheet" type="text/css" />
   
    <link href="/productauctionssh/admin/css/menu.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="/productauctionssh/webui/jquery/jquery-1.9.0.js"></script>
     <link href="/productauctionssh/webui/artDialog/skins/default.css" rel="stylesheet" type="text/css" />
    <script src="/productauctionssh/webui/artDialog/jquery.artDialog.source.js" type="text/javascript"></script>
    <script src="/productauctionssh/webui/artDialog/iframeTools.source.js" type="text/javascript"></script>
    <link href="/productauctionssh/webui/treetable/skin/jquery.treetable.css" rel="stylesheet" type="text/css" />
    <link href="/productauctionssh/webui/treetable/skin/jquery.treetable.theme.default.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="/productauctionssh/layer/jquery-2.0.3.min.js"></script>
    <script type="text/javascript" src="/productauctionssh/layer/layer.js"></script>





</head>
<body>
<%
Member member = (Member)session.getAttribute("member");
CommonDAO dao = (CommonDAO)Info.getDao(request,"CommonDAO");
Member m = (Member)dao.findById(member.getId(),"Member");
 %>
	<jsp:include page="head.jsp"></jsp:include>

	<div class="wrap">
		<div class="cover-title">
			当前位置：<a href="index.jsp">首页</a> &gt;&gt; <a href="myindex.jsp">个人中心</a>
		</div>
	</div>


	<div class="fn-clear"></div>

		<div class="wrap">
		
		   <div class="main">
		   <jsp:include  page="menu.jsp"></jsp:include>
		       <div class="main-content" style="width: 84.3%;margin-left: 174px;">
		       <div class="search-title">
					  <h2>
	                       订单管理
	                </h2>
                </div>
		       <!--  -->
		       <form action="myorder.jsp" method="post" name="f1">
					<table  cellspacing="0" width="100%" style="margin-left: 40px;margin-top: 20px;margin-bottom: 20px;">
					        <tbody>
					          <tr>
					             <td>
					          订单编号
                                           <input name="key"  value="" class="input-txt" type="text" id="key"  />
					                 <div class="ui-button">
					                    <input type="submit" value="搜索" id="btnSearch" class="ui-button-text" /> 
					                 </div>
					             </td>
					          </tr>
					        </tbody>
					   </table>
				</form>	   
					   <table id="module" width="100%" border="0" cellspacing="0"
		cellpadding="0" class="ui-record-table">
		<thead>
			<tr>
			    <th><b>订单编号</b>
				</th>
				<th><b>拍品名称</b>
				</th>
				<th><b>竞价</b>
				</th>
				<th><b>实付金额</b>
				</th>
				<th><b>付款状态</b>
				</th>
				<th><b>发货状态</b>
				</th>
				<th><b>收货状态</b>
				</th>
				<th><b>退货状态</b>
				</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
<%
String hql="from Car where memberid='"+m.getId()+"'";
String url="myorder.jsp?1=1";
String key = Info.getUTFStr(request.getParameter("key"));
if(key!=null){
hql+=" and ddno like '%"+key+"%'";
url+="&key="+key;
}
hql+=" order by id desc";
PageManager pageManager = PageManager.getPage(url,10, request);
pageManager.doList(hql);
PageManager bean= (PageManager)request.getAttribute("page");
ArrayList<Car> list=( ArrayList<Car>)bean.getCollection();
%>
<%if(list.size()==0){ %>		
					 
					 <tr>
								<td colspan="20">没有相关拍卖信息</td>
					 </tr>
<%
}else{ for(Car c:list){
Goods g = (Goods)dao.findById(c.getGoodsid(),"Goods");
%>					 
							<tr>
							    <td><%=c.getDdno() %></td>
							    <td><a href="salegoodsx.jsp?goodsid=<%=g.getId() %>"><%=g.getGoodsname() %></a></td>
								<td><%=g.getMaxprice() %></td>
								<td><%=c.getTotal() %></td>
								<td><%=c.getFkstatus() %></td>
								<td><%=c.getFhstatus() %></td>
								<td><%=c.getShstatus() %></td>
								<td><%=c.getThstatus() %></td>
								<td>
								    <%if(c.getFkstatus().equals("待付款")){ %>
								    <a href="fukuan.jsp?id=<%=c.getId() %>" class="orange-href">付款</a>
								    <%} %>
								    <%if(c.getFhstatus().equals("已发货")&&c.getShstatus().equals("未签收")){ %>
								    <a href="qianShou.action?id=<%=c.getId() %>" class="orange-href">签收</a>
								    <%} %>
								    <%if(c.getShstatus().equals("已签收")){ %>
								    <%if(!c.getThstatus().equals("同意")){ %>
								        
							
								    <a href="tuiHuo.action?id=<%=c.getId() %>" class="orange-href">退货</a>
								    <a href="pingfen.jsp?saleid=<%=g.getMemberid() %>&gid=<%=g.getId() %>" class="orange-href">评价</a>
							 <%} %>
								    <%} %>
								    
								    
								</td>
							</tr>
<%}} %>		
                            <tr>
                              <td colspan="10" align="left">${page.info }</td>
                            </tr>	
		</tbody>
	</table>
		<!--  -->			   
					 
	  
			    </div>
		   </div>
			
		</div>
		


	<div class="fn-clear"></div>


	<jsp:include page="bottom.jsp"></jsp:include>
</body>
<script type="text/javascript">
<%
String suc = (String)request.getAttribute("suc");
if(suc!=null){
%>
layer.msg('<%=suc%>');
<%}%>
<%
String no = (String)request.getAttribute("no");
if(no!=null){
%>
layer.msg('<%=no%>');
<%}%>
</script>
</html>