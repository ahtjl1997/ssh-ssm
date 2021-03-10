<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.dao.CommonDAO"%>
<%@page import="com.model.Member"%>
<%@page import="com.util.Info"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>密码修改</title>
<link rel="stylesheet" href="/productauctionssh/e/css/index.css" type="text/css"></link>
<link rel="stylesheet" href="/productauctionssh/e/css/box.all.css" type="text/css"></link>

<script
	src="/productauctionssh/webui/jquery/jquery-1.5.2.min.js"
	type="text/javascript"></script>
  <script  type="text/javascript" src="/productauctionssh/webui/jquery/jquery.validate.min.js"></script>
  <script type="text/javascript"  src="/productauctionssh/webui/jquery/jquery.metadata.js" ></script>
  <script type="text/javascript"  src="/productauctionssh/webui/jquery/messages_cn.js" ></script>	
  <script type="text/javascript">
   
        $(function(){
        	
        	 $.metadata.setType("attr", "validate");
             $("#formModifypw").validate();
        	
        })
  
  </script>
  
  

</head>
<body>
<%
CommonDAO dao = (CommonDAO)Info.getDao(request,"CommonDAO");
Member member = (Member)session.getAttribute("member");
Member m = (Member)dao.findById(member.getId(),"Member");
String id = request.getParameter("id");
 %>
	<jsp:include page="head.jsp"></jsp:include>

	<div class="wrap">
		<div class="cover-title">
			当前位置：<a href="index.jsp">首页</a> &gt;&gt; <a href="myindex.jsp">会员中心</a>
		</div>
	</div>


	<div class="fn-clear"></div>

		<div class="wrap">
		
		   <div class="main">
		   
		       <jsp:include  page="menu.jsp"></jsp:include>
		       <div class="main-content">
					<div class="search-title" style="margin-left: 50px; margin-top: 25px;margin-bottom: 10px;">
					<h2>
					 申请售后
					</h2>
					<div class="description"> </div>
				     </div>
					 <form name="formModifypw" action="shouhouAdd.action?memberid=<%=member.getId() %>&ddid=<%=id %>" id="formModifypw" method="post">
						<table border="0" cellspacing="1" class="grid" cellpadding="0" width="100%">
							<tr>
								<td align="right" valign="top">问题描述:</td>
								<td align="left">
								  <textarea rows="5" cols="50" name="content" requried style="font-size: 12px;"></textarea>
								</td>
							</tr>
						</table>
						
						    <div style="margin-left: 120px;">
								<input type="submit" value="提交" class="btn btn-default">
						    </div>
						
					</form>
					</div>
		   </div>
			
		</div>
		


	<div class="fn-clear"></div>


	<jsp:include page="bottom.jsp"></jsp:include>



</body>
</html>