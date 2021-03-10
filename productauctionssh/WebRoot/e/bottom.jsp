<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.dao.CommonDAO"%>
<%@page import="com.util.Info"%>
<%@page import="com.model.Yqlj"%>
 
  
  <div class="wrap">
		<div class="frendlink" >
			<strong>友情链接：</strong>
			<%
			CommonDAO dao = (CommonDAO)Info.getDao(request,"CommonDAO");
			ArrayList<Yqlj> list = (ArrayList<Yqlj>)dao.findByHql("from Yqlj where 1=1");
			for(Yqlj yqlj:list){
		    %>
		    <a href="<%=yqlj.getUrl() %>" target="_blank"><%=yqlj.getName() %></a>
		    <%} %>

		</div>


	</div>
	<div class="fn-clear"></div>
	<div>
		<div id="footer_bg">
			<div id="footer">校园物品拍卖&nbsp;&nbsp;&nbsp;&nbsp;</div>
		</div>
	</div>
	
</div>
	
