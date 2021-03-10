<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.text.*"%>
<%@ page  contentType="text/html;charset=UTF-8" %>
<%@page import="com.dao.CommonDAO"%>
<%@page import="com.util.Info"%>
<%@page import="com.model.Pingjia"%>
<%@page import="com.model.Member"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="law.jsp"%>
<%
    String  id=request.getParameter("id");
    CommonDAO dao = (CommonDAO)Info.getDao(request,"CommonDAO");
	Pingjia pingjia = (Pingjia)dao.findById(id,"Pingjia"); 
	Member member = (Member)dao.findById(pingjia.getMemberid(),"Member");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
 <head>
  <title>评论信息查看</title>
   	<link href="/productauctionssh/admin/css/web2table.css" rel="stylesheet" type="text/css" />
 <link href="/productauctionssh/admin/css/layout.css" rel="stylesheet" type="text/css" />
 <link href="/productauctionssh/admin/css/menu.css" rel="stylesheet" type="text/css" />
    
    <script type="text/javascript" src="/productauctionssh/webui/jquery/jquery-1.9.0.js"></script>
</head>
<body >

	<div class="search-title">
		<h2>评论管理-> 查看评论</h2>
		<div class="description"></div>
	</div>
	<table  cellpadding="0" cellspacing="1" class="grid" width="100%">
		
		<tr>
			<td width="10%" align="right" class="title">评论时间:</td>
			<td width="*"><%=pingjia.getSavetime() %></td>
		</tr>
		<tr>
			<td align="right" class="title">评论人:</td>
			<td><%=member.getUname() %></td>
		</tr>
		<tr>
			<td align="right" class="title">内容:</td>
			<td><%=pingjia.getContent() %></td>
		</tr>
	</table>

</body>
</html>
