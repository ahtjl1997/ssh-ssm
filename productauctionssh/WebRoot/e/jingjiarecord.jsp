<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.model.Member"%>
<%@page import="com.dao.CommonDAO"%>
<%@page import="com.util.Info"%>
<%@page import="com.model.Goods"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.model.Jingjia"%>
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
<% 
CommonDAO dao = (CommonDAO) Info.getDao(request, "CommonDAO");
String goodsid = request.getParameter("goodsid");
ArrayList<Jingjia> jlist = (ArrayList<Jingjia>)dao.findByHql("from Jingjia where gid='"+goodsid+"' order by savetime desc");
%>
	<body>
		<jsp:include page="head.jsp"></jsp:include>

		<div class="wrap">
			<div class="cover-title">
				当前位置：
				<a href="/productauctionssh/e/index.jsp">首页</a> &gt;&gt; 拍品信息 &gt;&gt;竞价记录
			</div>
		</div>

		<div class="fn-clear"></div>

		<div class="wrap">
				<div class="info" style="width: 1088px;height: 500px;">
				  <table border="0" width="100%" style="border:1px solid #F3F3F3;border-bottom: 0px;">
				  <%if(jlist.size()!=0){ %>
				    <tr style="background:#F3F3F3">
				      <td style="padding-left: 5px;">状态</td>
				      <td style="padding-left: 2px;">价格</td>
				      <td style="padding-left: 2px;">竞拍人</td>
				      <td style="padding-left: 2px;">时间</td>
				    </tr>
				    <%
				    for(Jingjia j:jlist){ 
				    Member m = (Member)dao.findById(j.getMemberid(),"Member");
				    Goods g = (Goods)dao.findById(goodsid,"Goods");
				    %>
				    <tr>
				      <td style="padding-top: 15px;border-bottom: 1px dotted #F3F3F3;padding-left: 5px;"><%=g.getMaxprice().equals(j.getChuprice())?"当前最高价":"出局" %></td>
				      <td style="padding-top: 15px;border-bottom: 1px dotted #F3F3F3;padding-left: 2px;">￥<%=j.getChuprice() %></td>
				      <td style="padding-top: 15px;border-bottom: 1px dotted #F3F3F3;padding-left: 2px;"><%=m.getUname() %></td>
				      <td style="padding-top: 15px;border-bottom: 1px dotted #F3F3F3;padding-left: 2px;"><%=j.getSavetime() %></td>
				    </tr>
				    <%}}else{ %>
				    <tr>
				      <td align="center">暂无竞拍记录</td>
				    </tr>
				    <%} %>
				  </table>
				</div>






			<jsp:include page="bottom.jsp"></jsp:include>
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
    var iTime = document.getElementById(CID).innerText;
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
            sTime="<span style='color:darkorange'>" + sMinute+sSecond + "</font>";
        }
        else
        {
            sTime=sDay+sHour+sMinute+sSecond;
        }
        if(iTime==0){
            clearTimeout(Account);
              sTime="<span style='color:green'>时间到了！</span>";

              
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
    }
    document.getElementById(CID).innerHTML = sTime;
}
</script>


<SCRIPT LANGUAGE="JavaScript">
var maxtime;
if(window.name=='' || window.name == '-1' || isNaN(window.name)){
maxtime = 5*60;
}else{
maxtime = window.name;
}
function CountDown(){
if(maxtime>=0){
hours = Math.floor(maxtime/3600);
minutes = Math.floor((maxtime-hours*3600)/60);
seconds = Math.floor(maxtime%60);
msg = "距离时间结束仅剩"+hours+"时"+minutes+"分"+seconds+"秒";
document.all["timer"].innerHTML = msg;
--maxtime;
window.name = maxtime;
}
else{
clearInterval(timer);
msg="<span style='color:green'>时间到了！</span>";
        
}
}
timer = setInterval("CountDown()",1000);
</SCRIPT>
</html>