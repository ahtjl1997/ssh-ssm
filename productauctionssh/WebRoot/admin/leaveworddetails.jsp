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
			<td colspan="3"><%=liuyan.getContent() %></td>
		</tr>
		<tr>
			<td width="10%" align="right">回复人:</td>
			<td><%=liuyan.getAdminid() %></td>
		</tr>
		<tr>
			<td width="10%" align="right">回复时间:</td>
			<td>
			 <%=liuyan.getHsavetime() %>
			
			</td>
		</tr>
		<tr>
			<td width="10%" align="right">回复内容:</td>
			<td> <%=liuyan.getHcontent() %></td>
		</tr>
		
	</table>
</body>
</html>
