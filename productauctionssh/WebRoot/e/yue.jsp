<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.dao.CommonDAO"%>
<%@page import="com.util.Info"%>
<%@page import="com.model.Member"%>
<%@page import="com.util.Retainone"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>会员登录</title>
<link rel="stylesheet" href="/productauctionssh/e/css/index.css" type="text/css"></link>
<link rel="stylesheet" href="/productauctionssh/admin/css/web2table.css" type="text/css"></link>

<link rel="stylesheet" href="/productauctionssh/e/css/box.all.css" type="text/css"></link>

<script
	src="/productauctionssh/webui/jquery/jquery-1.8.3.min.js"
	type="text/javascript"></script>





</head>
<body>
<%
CommonDAO dao = (CommonDAO)Info.getDao(request,"CommonDAO");
Member member = (Member)session.getAttribute("member");
Member m = (Member)dao.findById(member.getId(),"Member");
Retainone re =  new Retainone();

 %>
	<jsp:include page="/e/head.jsp"></jsp:include>
    <div class="fn-clear"></div>
	<div class="wrap">
		<div class="cover-title">
			当前位置：<a href="index.jsp">首页</a> &gt;&gt; <a href="myindex.jsp">个人中心</a>
		</div>
	</div>


	<div class="fn-clear"></div>

		<div class="wrap">
		
		   <div class="main">
		   
		       <jsp:include  page="menu.jsp"></jsp:include>
		       <div class="main-content">
					
					
					<div class="search-title">
					<h2>账户余额
					   
					</h2>
					<div class="description"></div>
				     </div>
				     
				    <div style="padding:30px;font-size:18px;">
				                   当前账户余额<span style="font-size:24px;font-weight:800;color:#f00;"><%=re.getAdecimal(m.getYue()) %>￥</span>
				                   
				                  <a href="/productauctionssh/e/chongzhi.jsp?id=<%=m.getId() %>&yue=<%=re.getAdecimal(m.getYue()) %>" class="btn btn-default">我要充值</a>
				                   
				    </div> 
			
					
		   </div>
			
		</div>
		


	<div class="fn-clear"></div>


	<jsp:include page="bottom.jsp"></jsp:include>



</body>
</html>