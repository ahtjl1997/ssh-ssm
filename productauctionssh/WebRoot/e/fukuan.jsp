<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.model.Member"%>
<%@page import="com.dao.CommonDAO"%>
<%@page import="com.util.Info"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.util.PageManager"%>
<%@page import="com.model.Goods"%>
<%@page import="com.model.Car"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>订单信息查看</title>
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
    





</head>
<body>
<%
	String  id=request.getParameter("id");
	CommonDAO dao = (CommonDAO)Info.getDao(request,"CommonDAO");
    Car c = (Car)dao.findById(id,"Car");
    Member member = (Member)dao.findById(c.getMemberid(),"Member");
    Goods g = (Goods)dao.findById(c.getGoodsid(),"Goods");
    Member mmm = (Member)dao.findById(g.getMemberid(),"Member");
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
	                       订单付款
	                </h2>
                </div>
		       <!--  -->
					  <table cellpadding="0" cellspacing="1" class="grid" width="100%">

                   <tr>
                      <td colspan='2'>
                         <!--  ${errormsg}-->
                      </td>
                   </tr>

					<tr>
						<td colspan="4">

							<table border="0" cellspacing="1" class="whitegrid"
								cellpadding="0" width="100%">

								<tr>
									<td class="style1">快照</td>
									<td class="style1">拍品名</td>
									<td class="style1">竞价</td>
									<td class="style1">卖家</td>
								</tr>

								<tr>

									<td bgcolor="#ffffff"><img src='<%=g.getImg()%>'
										width="60px" height="60px" />
									</td>
									<td class="style2"><%=g.getGoodsname()%></td>


									<td class="style2">
									<%=g.getMaxprice()%>&nbsp;元
									</td>
									<td class="style2">
									<%=mmm.getRealname()%>
									</td>
								</tr>
							</table>
						</td>
					</tr>
					
					<tr>
						<td colspan="4" class="style1">
						
						   支付金额:<font color="red">￥<%=c.getTotal()%></font>
						
						</td>
						
					</tr>

					<tr>
						<td colspan="4">
						
						
						 <form name="payform" method="post" action="fuKuan.action?id=<%=id %>&total=<%=c.getTotal() %>">
						      <input name="shname"  class="input-txt" type="text" id="shname" value="<%=member.getRealname() %>" placeholder="收货人..."  required/><br>
						      <input name="shtel"  class="input-txt" type="text" id="shtel" style="margin-top: 10px;" placeholder="联系电话..."  value="<%=member.getTel() %>" required/><br>
						      <input name="shaddr"  class="input-txt" type="text" id="shaddr"  style="margin-top: 10px;" placeholder="收货地址..." value="<%=member.getAddr() %>" required/><br>
						      <input type="submit" style="margin-top: 10px;" class="btn btn-default" value="确定付款"/>
						 </form>
						 
						   
						
						</td>
						
					</tr>

				</table>
		<!--  -->			   
					 
	  
			    </div>
		   </div>
			
		</div>
		


	<div class="fn-clear"></div>


	<jsp:include page="bottom.jsp"></jsp:include>



</body>
</html>