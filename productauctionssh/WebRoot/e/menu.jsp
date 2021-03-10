<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.model.Member"%>
<script  type="text/javascript">
     
   $(function(){

      $("#side-menu .menu-group li").removeClass("current");
     
      var seedid='<%=request.getParameter("seedid")%>';
      
      if(seedid!="null")
         $("#"+seedid).addClass("current");
      else
        $("#m1").addClass("current");
      
   })

</script>
<div id="side-menu" style="height: auto;">

  <%Member member = (Member) session.getAttribute("member"); %>
    <div class="menu-group" >
		<h2>
			拍卖信息
		</h2>
		<ul>
		<%if(member.getUtype().equals("拍卖者")){ %>
		    <li id="101" >
				<a  href="/productauctionssh/e/productlist.jsp">拍品管理</a>
			</li>
			
			<li id="101" >
				<a  href="/productauctionssh/e/saleorder.jsp">销售订单</a>
			</li>
			<li id="101" >
				<a  href="/productauctionssh/e/pingfenlist2.jsp">买家评价</a>
			</li>
			<%}else{ %>
			<li id="101" >
				<a  href="/productauctionssh/e/myorder.jsp">我的订单</a>
			</li>
			<li id="101" >
				<a  href="/productauctionssh/e/jjrecord.jsp">竞价记录</a>
			</li>
			<li id="101" >
				<a  href="/productauctionssh/e/pingfenlist.jsp">评分记录</a>
			</li>
			<%} %>
			<!-- 
			
			
			<li id="103" >
				<a  href="/productauctionssh/e/myfav.jsp">我的足迹</a>
			</li>
			
			<li id="103" >
				<a  href="/productauctionssh/e/jubaolist.jsp">举报</a>
			</li>
			
			<li id="103" >
				<a  href="/productauctionssh/e/beijubaolist.jsp">违规信息</a>
			</li>
			-->
			
		
			

		</ul>
	</div>
    
	<div class="menu-group" >
		<h2>
			账户信息
		</h2>
		<ul>
			<li id="m201" class="current">
				<a  href="/productauctionssh/e/accountinfo.jsp" target="_self">账户信息</a>
			</li>
			<li id="m202" >
				<a  href="/productauctionssh/e/yue.jsp" target="_self">账户余额</a>
			</li>
			<li id="m203">
				<a href="/productauctionssh/e/upassedit.jsp" target="_self">密码修改</a>
			</li>
			<li id="m204">
				<a href="/productauctionssh/e/memberedit.jsp" target="_self">信息修改</a>
			</li>
          
		</ul>
	</div>
	




</div>