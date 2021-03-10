<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.model.Member"%>
<%@page import="com.dao.CommonDAO"%>
<%@page import="com.util.Info"%>
<%@page import="com.model.Goods"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.model.Jingjia"%>
<%@page import="com.model.Score"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<%
		Member member = (Member) session.getAttribute("member");
	%>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>系统首页</title>
		<link rel="stylesheet" href="/productauctionssh/e/css/index.css"
			type="text/css"></link>

		<link rel="stylesheet"
			href="/productauctionssh/admin/css/web2table.css" type="text/css"></link>

		<link rel="stylesheet" href="/productauctionssh/e/css/box.all.css"
			type="text/css"></link>

		<link rel="stylesheet"
			href="/productauctionssh/e/css/leaveword.css" type="text/css"></link>

		<script src="/productauctionssh/webui/jquery/jquery-1.8.3.min.js"
			type="text/javascript"></script>

		<script type="text/javascript">
	$(function() {

		$("#btnShoucang").click(
				function() {
					var goodsid = $("#goodsid").val();
					var memberid = $("#memberid").val();
						window.location.href = "favAdd.action?goodsid="+goodsid+"&memberid="+memberid;
				});

	})
</script>

	</head>
	<body>
		<%
			String goodsid = request.getParameter("goodsid");
			CommonDAO dao = (CommonDAO) Info.getDao(request, "CommonDAO");
			Goods goods = (Goods) dao.findById(goodsid, "Goods");
			Member mmm = (Member) dao.findById(goods.getMemberid(), "Member");
      ArrayList<Score> olist = (ArrayList<Score>)dao.findByHql("from Score where saleid='"+goods.getMemberid()+"'");
      double a = 0.0;
      String sc="";
      if(olist.size()!=0){
      for(Score score:olist){
      a+=Double.parseDouble(score.getScore().toString());
      }
      sc = String.format("%.1f", a/olist.size());
      }
      
		%>
		<jsp:include page="head.jsp"></jsp:include>

		<div class="wrap">
			<div class="cover-title">
				当前位置：
				<a href="/productauctionssh/e/index.jsp">首页</a> &gt;&gt; 拍品信息
			</div>
		</div>

		<div class="fn-clear"></div>

		<div class="wrap">
			<div>

				<div class="info">
					<h1>
						<%=goods.getGoodsname()%>
					</h1>

					<table cellpadding="0" cellspacing="1" border="2" class="grid" width="100%">

						<tr>
							<td width="30%" align="center" rowspan="13" >
								<img id="imgTupian" width="300px" height="300px" src="<%=goods.getImg()%>" />
							</td>

						</tr>
						<tr>
							<td  style="border-right: 0px;" align="right">卖家:</td>
							<td style="border-left: 0px;"><%=mmm.getRealname() %></td>
						</tr>
						
						<tr>
							<td  style="border-right: 0px;" align="right">卖家信誉:</td>
							<td style="border-left: 0px;">
							<%if(!sc.equals("")){ %>
							<%=sc%>分
							<%}else{ %>
							暂无评分
							<%} %>
							</td>
						</tr>

						<tr>
							<td style="border-right: 0px;" align="right">起拍价:</td>
							<td style="border-left: 0px;"><font color="#666666" style="font-size:20px;"><b>￥<%=goods.getPrice() %></b></font></td>
						</tr>
						<tr>
							<td style="border-right: 0px;" align="right">最低加价:</td>
							<td style="border-left: 0px;"><font color="#D23030" style="font-size:20px;"><b>￥<%=goods.getJiajia() %></b></font></td>
						</tr>
						<tr>
							<td style="border-right: 0px;" align="right">拍品新旧程度:</td>
							<td style="border-left: 0px;"><%=goods.getChengdu() %></td>
						</tr>
						<tr>
							<td style="border-right: 0px;" align="right">购买时间:</td>
							<td style="border-left: 0px;"><%=goods.getBuytime() %></td>
						</tr>
						<tr>
							<td style="border-right: 0px;" align="right">竞拍截止时间:</td>
							<td style="border-left: 0px;"><%=goods.getEtime() %></td>
						</tr>
						
					</table>

					<!-- s -->
					<div class="main-nav" style="margin-top:20px;">   
                       <div class="wrap">       
                        <ul class="menus clearfix">
                          <li><a  id="1" class="current"  href="javascript:void(0)">拍品描述</a></li>
                        </ul>    
                       </div>
                     </div>
					<div class="news-content" style="margin-top: 20px;">

							<%=goods.getContent() %>
					</div>


				</div>

			</div>



			<div class="fn-clear"></div>


			<jsp:include page="bottom.jsp"></jsp:include>
	</body>
</html>