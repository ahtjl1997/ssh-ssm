<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@page import="java.util.ArrayList"%>
<%@page import="com.dao.CommonDAO"%>
<%@page import="com.util.Info"%>
<%@page import="com.model.Goods"%>
<%@page import="com.util.Retainone"%>
<%@page import="com.model.Jingjia"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>系统首页</title>
		<link rel="stylesheet" href="/productauctionssh/e/css/index.css"
			type="text/css"></link>
		<link href="/productauctionssh/e/css/box.all.css" rel="stylesheet"
			type="text/css" />

		<script src="/productauctionssh/webui/jquery/jquery-1.8.3.min.js"
			type="text/javascript"></script>
	</head>
	<body>
		<%
			String status = Info.getUTFStr(request.getParameter("status"));
			CommonDAO dao = (CommonDAO) Info.getDao(request, "CommonDAO");
		%>
		<jsp:include page="head.jsp"></jsp:include>


		<div class="fn-clear"></div>
		<div class="wrap"
			style="min-height: 600px; overflow: hidden; margin-top: 20px;">
			<div style="width: 200px; float: left; overflow: hidden">

				<!-- s -->
				<div class="navbar">
					<div class="title">
					热门拍品
					</div>
					<div class="content">
						<ul>
                         <%
                         ArrayList<Object[]> jlist = (ArrayList<Object[]>)dao.findByHql("select COUNT(gid) as num,gid from Jingjia where 1=1 group by gid");
                         for(Object[] obj:jlist){
                         Goods gg = (Goods)dao.findById(obj[1].toString(),"Goods");
                         if(gg.getStatus().equals("正在拍卖")){
                         %>
							<li>
								<a href="/productauctionssh/e/shangpininfo.jsp" target="self">
									<img src="<%=gg.getImg() %>" width="120" height="120"> </a>
								<div class="name">
									<p></p>
									<div class="price">
										<em>￥<%=gg.getMaxprice() %> <b></b> </em>
									</div>
								</div>
							</li>
						<%}} %>
							
						</ul>
					</div>

				</div>
<!-- e -->



			</div>
			<div style="float: right; width: 915px;">

				<!-- s -->

				<div class="box">
					<div class="title">
						<strong><%=status %></strong>
					</div>
					<div class="content">
						<div class="image-items">
						<% 
						ArrayList<Goods> plist = (ArrayList<Goods>) dao.findByHql("from Goods where status='"+ status + "' and delstatus='0'");
						for(Goods goods:plist){
						 %>
							<div class="image-item image-size">
								<a href="goodsinfo.jsp?goodsid=<%=goods.getId() %>"><img
										src="<%=goods.getImg() %>" /> </a>
								<div class="text-info" style="text-align: left">
								    <span >
									<a href="goodsinfo.jsp?goodsid=<%=goods.getId() %>"><%=goods.getGoodsname() %> </a>
									</span>
									<span style="color:#333333;float: right">【浏览次数】<%=goods.getCs()%>次</span>
								</div>
							</div>
						<%} %>
							
						</div>
					</div>
				</div>
				<!-- e -->



			</div>

		</div>


		<jsp:include page="bottom.jsp"></jsp:include>



	</body>
</html>