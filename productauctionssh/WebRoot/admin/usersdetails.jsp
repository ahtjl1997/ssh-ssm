<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.dao.CommonDAO"%>
<%@page import="com.util.Info"%>
<%@page import="com.model.Sysuser"%>
<%@page import="com.model.Juese"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="web" uri="/WEB-INF/webcontrol.tld"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查看用户信息</title>
  <link href="/productauctionssh/admin/css/web2table.css" rel="stylesheet" type="text/css" />
    <link href="/productauctionssh/admin/css/layout.css" rel="stylesheet" type="text/css" />
    <link href="/productauctionssh/admin/css/menu.css" rel="stylesheet" type="text/css" />
    

<script src="/productauctionssh/webui/jquery/jquery-1.9.0.js"
	type="text/javascript"></script>
<link href="/productauctionssh/uploadifyv3.1/uploadify.css"
	rel="stylesheet" type="text/css" />
<script
	src="/productauctionssh/uploadifyv3.1/jquery.uploadify-3.1.js"
	type="text/javascript"></script>
<link
	href="/productauctionssh/webui/artDialog/skins/green.css"
	rel="stylesheet" type="text/css" />

<script
	src="/productauctionssh/webui/artDialog/jquery.artDialog.source.js"
	type="text/javascript"></script>
<link rel="stylesheet"
	href="/productauctionssh/webui/jqueryui/themes/base/jquery.ui.all.css"
	type="text/css"></link>
<script type="text/javascript"
	src="/productauctionssh/webui/jqueryui/ui/jquery-ui.js"></script>
<script type="text/javascript"
	src="/productauctionssh/webui/jqueryui/ui/i18n/jquery.ui.datepicker-zh-CN.js"></script>
<script src="/productauctionssh/admin/js/combo.js"
	type="text/javascript"></script>


</head>
<body>
<%
CommonDAO dao = (CommonDAO)Info.getDao(request,"CommonDAO");
String id = request.getParameter("id");
Sysuser sysuser = (Sysuser)dao.findById(id,"Sysuser");
 %>	
			<div class="search-title">
				<h2>查看用户信息</h2>
				<div class="description"></div>
			</div>
			<table cellpadding="0" width="100%" cellspacing="1" class="grid">
				<tr>
					<td width="8%" align="right" class="title">用户名:</td>
					<td width="30%"><%=sysuser.getUsername() %></td>
					<td width="*" colspan="2" rowspan="7"><img id="imgXiangpian" width="200px" height="200px"
						src="<%=sysuser.getImg() %>" />
					</td>
				</tr>
				
				<tr>
					<td width="8%" align="right" class="title">真名:</td>
					<td width="30%"><%=sysuser.getRealname() %></td>
				</tr>
				
			   <tr>
					<td align="right" class="title">性别:</td>
					<td><%=sysuser.getSex() %></td>
				</tr>
				<tr>
					<td align="right" class="title">电话:</td>
					<td><%=sysuser.getTel() %></td>
				</tr>
				<tr>
					<td align="right" class="title">绑定邮箱:</td>
					<td><%=sysuser.getEmail() %></td>
				</tr>
				<tr>
					<td align="right" class="title">角色:</td>
					<td>
					<%Juese j =(Juese)dao.findById(sysuser.getUsertype(),"Juese"); %>
					<%=j.getName() %></td>
				</tr>
				
				<tr>
					<td align="right" class="title">创建时间:</td>
					<td><%=sysuser.getSavetime() %></td>
				</tr>
				
			</table>



</body>
</html>