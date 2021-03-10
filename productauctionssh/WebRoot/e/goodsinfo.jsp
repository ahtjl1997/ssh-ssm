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

	</head>
	<body>
	<%
		String goodsid = request.getParameter("goodsid");
		CommonDAO dao = (CommonDAO) Info.getDao(request, "CommonDAO");
		Goods goods = (Goods) dao.findById(goodsid, "Goods");
		Member mmm = (Member) dao.findById(goods.getMemberid(), "Member");
		goods.setCs(goods.getCs()+1);
		dao.update(goods);
      SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
      Date begin = df.parse(df.format(new Date()));
      Date end = df.parse(goods.getEtime());
      long sjc = (end.getTime()-begin.getTime())/1000;
      System.out.println("sql==="+"select sum(score) as ascore ,saleid from Score where saleid='"+goods.getMemberid()+"'");
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
							<td style="border-left: 0px;"><%=mmm.getRealname() %>&nbsp;&nbsp;&nbsp;&nbsp;
							<%
							double aaa = 0.0;
							ArrayList<Score> slist = (ArrayList<Score>)dao.findByHql("from Score where saleid='"+mmm.getId()+"'");
							if(slist.size()>0){
								for(Score s:slist){
									aaa+=Double.parseDouble(s.getScore().toString());
								}
								sc = String.format("%.1f", aaa/slist.size());
							}%>
							卖家评分:  <font color="#D23030" style="font-size:20px;"><%=sc %>分</font>
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
						<tr>
							<td style="border-right: 0px;" align="right">拍品状态:</td>
							<td style="border-left: 0px;"><%=goods.getStatus() %></td>
						</tr>
						<tr>
							<td style="border-right: 0px;" width="12%" align="right">
								<div style="width: 80px;height: 30px;background:#D23030;padding-top:8px;padding-right: 12px;font-size: 15px;color:white;">当前竞价</div>
							</td>
							<td style="border-left: 0px;" width="*"><font color="#D23030" style="font-size:20px;"><b>￥<%=goods.getMaxprice() %></b></font></td>
						</tr>
						
						<tr>
							<td style="border-right: 0px;" width="12%" align="right">
								<div style="width: 80px;height: 30px;background:#D23030;padding-top:8px;padding-right: 12px;font-size: 15px;color:white;"><%if(goods.getStatus().equals("正在拍卖")){ %>正在进行:<%}else{%><%=goods.getStatus()%><%} %></div>
							</td>
							
							<td style="border-left: 0px;" width="*"><%if(goods.getStatus().equals("正在拍卖")){ %>距离结束时间:<span id="endtime" style="font-size:30px;color:green"><font style="color:green"><%=sjc %></font></span><%} %></td> 
						   
						</tr>
						<tr>
							<td colspan="9">
							<%if(member!=null){ %>
							<!--  <a id="btnIncart" class="btn btn-default" style="display:block;border-radius:5px 5px;" href="jingjia.jsp?goodsid=<%=goods.getId() %>&memberid=<%=member!=null?member.getId():"" %>">竞价 </a>-->
							<%if(goods.getStatus().equals("正在拍卖")){ 
							if(member.getUtype().equals("买家")){%>
							<a id="btnIncart" class="btn btn-default" style="display:block;border-radius:5px 5px;" href="<%=member.getId().toString().equals(goods.getMemberid())?"javascript:alert('不能竞价自己的拍品');":"jingjia.jsp?goodsid="+goods.getId()+"&memberid="+member.getId() %>">竞价 </a>
							<a id="btnIncart" class="btn btn-default" style="display:block;border-radius:5px 5px;margin: 7px auto;position:absolute;top:617px;left:1000px;" href="jingjiarecord.jsp?goodsid=<%=goods.getId() %>">竞价记录</a>
							
							<%}}else {%>
							<a id="btnIncart" class="btn btn-default" style="display:block;border-radius:5px 5px;" href="javascript:void(0)">交易完成</a>
							<%} %>
							<%}else { %>
						     <a id="btnIncart" class="btn btn-default" style="display:block;border-radius:5px 5px;" href="/productauctionssh/e/login.jsp">请先登录</a>   
							<%} %>
				
							</td>
                            
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
			<%ArrayList<Jingjia> jlist = (ArrayList<Jingjia>)dao.findByHql("from Jingjia where gid='"+goods.getId()+"'"); %>
	</body>
<script type="text/javascript">
<%
String no = (String)request.getAttribute("no");
if(no!=null){
%>
alert("没有购买记录，不能做出评价");
<%}%>
</script>
<script type="text/javascript">
var CID = "endtime";
if(window.CID != null)
{
    var iTime = document.getElementById(CID).innerText;//获取id标签为endtime的文本内容
    var Account;
    RemainTime();
}
function RemainTime()
{
    var iDay,iHour,iMinute,iSecond;
    var sDay="",sHour="",sMinute="",sSecond="",sTime="";
    if (iTime >= 0)
    {
        iDay = parseInt(iTime/24/3600);
        if (iDay > 0)
        {
            sDay = iDay + "天";
        }
        iHour = parseInt((iTime/3600)%24);
        if (iHour > 0){
            sHour = iHour + "小时";
        }
        iMinute = parseInt((iTime/60)%60);
        if (iMinute > 0){
            sMinute = iMinute + "分钟";
        }
        iSecond = parseInt(iTime%60);
        if (iSecond >= 0){
            sSecond = iSecond + "秒";
        }
        if ((sDay=="")&&(sHour=="")){
          if (sMinute==""){
            sTime="<span style='color:red'>" + sSecond + "</font>";}
          else{
            sTime="<span style='color:darkorange'>" + sMinute+sSecond + "</font>";}
        }
        else
        {
            sTime=sDay+sHour+sMinute+sSecond;
        }
        if(iTime==0){
              clearTimeout(Account);
              sTime="<span style='color:green'>时间到了！</span>";
              <%if(jlist.size()!=0){
              %>
              location.replace("paichu.action?id=<%=goods.getId()%>");
              <%}%>
              
        }
        else
        {
            Account = setTimeout("RemainTime()",1000);
        }
        iTime=iTime-1;
    }
    else
    {
            sTime="<span style='color:red'>倒计时结束！</span>";
            <%if(jlist.size()!=0){
              %>
              location.replace("paichu.action?id=<%=goods.getId()%>");
              <%}else{%>
               location.replace("changestatus.action?id=<%=goods.getId()%>");
              <%}%>
    }
    document.getElementById(CID).innerHTML = sTime;   //将剩余时间sTime赋给标签为endtime的控件
}
</script>

</html>