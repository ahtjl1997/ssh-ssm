<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.util.Retainone"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>在线充值-账户充值</title>
<link rel="stylesheet" href="/productauctionssh/e/css/index.css" type="text/css"></link>
<link rel="stylesheet" href="/productauctionssh/admin/css/web2table.css" type="text/css"></link>

<link rel="stylesheet" href="/productauctionssh/e/css/box.all.css" type="text/css"></link>

<script src="/productauctionssh/webui/jquery/jquery-1.5.2.min.js"
	
	type="text/javascript"></script>
 <script  type="text/javascript" src="/productauctionssh/webui/jquery/jquery.validate.min.js"></script>
    <script type="text/javascript"  src="/productauctionssh/webui/jquery/jquery.metadata.js" ></script>
    <script type="text/javascript"  src="/productauctionssh/webui/jquery/messages_cn.js" ></script>

    <script type="text/javascript">
    
    
           $(function ()
            {
               
                $.metadata.setType("attr","validate");
                $("#chongzhiForm").validate();
            });  
    
    </script>



</head>
<body>
<%
String id = request.getParameter("id");
String yue = request.getParameter("yue");
Retainone re =  new Retainone();
 %>
	<jsp:include page="/e/head.jsp"></jsp:include>

	<div class="wrap">
		<div class="cover-title">
			当前位置：<a href="/productauctionssh/e/index.jsp">首页</a> &gt;&gt; 在线充值
		</div>
	</div>


	<div class="fn-clear"></div>

		<div class="wrap">
		
		   <div class="main">
		   
		       <jsp:include  page="menu.jsp"></jsp:include>
		       <div class="main-content">
					
					 <form name="chongzhiForm" action="chongZhi.action?id=<%=id %>" id="chongzhiForm" method="post">
						<table border="0" cellspacing="1" class="grid" cellpadding="0"
							width="100%">
							
							<tr>
							
							    <td align="right">
							                   账户余额
							    </td>
							    <td >
							      
							          <span style="font-size:24px;font-weight:800;color:#f00;"><%=yue%>￥</span>
							    </td>
							    
							</tr>
							
							<tr>
								<td align="right">充值金额 :</td>
								<td align="left">
								    <input name="jine" style="width:80px" validate="{required:true,number:true,messages:{required:'请填写充值金额',number:'请填写正确充值金额'}}" type="text"id="txtJine" class="input-txt" />元
								</td>
								
							</tr>
							<tr>
							   <td colspan="2">
							        <div style="margin-left: 120px;">
								<input type="submit" value="充值" class="btn btn-default">
						    </div>
						
							   </td>
							</tr>
						
							
						</table>
						
						   
					</form>
					</div>
		   </div>
			
		</div>
		


	<div class="fn-clear"></div>


	<jsp:include page="bottom.jsp"></jsp:include>



</body>
</html>