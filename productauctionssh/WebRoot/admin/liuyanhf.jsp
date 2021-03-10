<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.text.*"%>
<%@ page  contentType="text/html;charset=UTF-8" %>
<%@page import="com.dao.CommonDAO"%>
<%@page import="com.util.Info"%>
<%@page import="com.model.Liuyan"%>
<%@page import="com.model.Member"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="law.jsp"%>
<%
    String  id=request.getParameter("id");
    CommonDAO dao = (CommonDAO)Info.getDao(request,"CommonDAO");
    Sysuser s = (Sysuser)session.getAttribute("admin");
	Liuyan liuyan = (Liuyan)dao.findById(id,"Liuyan");
	Member member = (Member)dao.findById(liuyan.getMemberid(),"Member");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
 <head>
  <title>留言信息查看</title>
    <script type="text/javascript" src="/productauctionssh/webui/jquery/jquery-1.8.3.min.js"></script>
     <link href="/productauctionssh/admin/css/web2table.css" rel="stylesheet" type="text/css" />
</head>
<body >
	<div class="search-title">
		<h2>查看留言</h2>
		<div class="description"></div>
	</div>
		<form name="form1" method="post" action="liuyanHf.action?adminid=<%=s.getUsername() %>&id=<%=id %>">
			
	<table cellpadding="0" cellspacing="1" class="grid" width="100%">
		
		<tr>
			<td width="10%" align="right">时间:</td>
			<td><%=liuyan.getLsavetime() %></td>
		</tr>
	
		
		<tr>
			<td width="10%" align="right">留言人:</td>
			<td><%=member.getUname() %></td>
		</tr>
		<tr>
			<td align="right">留言内容:</td>
			<td colspan="3"><%=java.net.URLDecoder.decode(liuyan.getContent(),"UTF-8") %></td>
		</tr>
		<%if(liuyan.getHcontent().equals("")){ %>
		        <tr>
					<td align="right">回复:</td>
					<td>
					   <textarea name="hcontent"  style="width:98%;height:130px;" ></textarea>
				    </td>
				</tr>
		
		
		 <tr>
					<td colspan="4">
					   
					       <input type="submit" class="orange-button"  value="回复"/>
					    
					</td>
					
			</tr>
			<%} %>    
		
	</table>
	</form>
</body>
</html>
