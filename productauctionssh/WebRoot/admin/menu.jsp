<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.model.Sysuser"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.model.Shouquan"%>
<%@page import="com.dao.CommonDAO"%>
<%@page import="com.util.Info"%>
<%@page import="com.model.Gongneng"%>
<script type="text/javascript">
   $(function(){
	   $(".accordion-item .leftMenus dd").click(function(){
	    	  $(".accordion-item .leftMenus dd").removeClass("current");
	    	  $(this).addClass("current");
	   });
   })
</script>

<div class="accordion-group">
	<div
		style="height: 600px; background: url(images/content.gif) repeat-y; display: none;"
		class="accordion-item">
		<%
		     CommonDAO dao = (CommonDAO)Info.getDao(request,"CommonDAO");
			 Sysuser s = (Sysuser)session.getAttribute("admin");
			 if(s.getUsertype().equals("1")){
			  %>
		 <h3>权限管理</h3>  
		<div class="leftMenus">
		      <dd>
                  <a target="main"  href="/productauctionssh/admin/jueselist.jsp">角色管理</a>
              </dd>
			  <dd>
                  <a target="main"  href="/productauctionssh/admin/gongnenglist.jsp">功能管理</a>
              </dd>
			  <dd>
				<a target="main"  href="/productauctionssh/admin/shouquanlist.jsp">功能授权</a>
			  </dd>
		</div>
		<%} %>
		
		<%
			 ArrayList<Object[]> list = (ArrayList<Object[]>)dao.findByHql("select DISTINCT fatherid as sfatherid,gnid from Shouquan where jsid='"+s.getUsertype()+"' GROUP BY fatherid ");
			 for(Object[] obj:list){
			 Gongneng g = (Gongneng)dao.findById(obj[0].toString(),"Gongneng");
			 ArrayList<Shouquan> slist = (ArrayList<Shouquan>)dao.findByHql("from Shouquan where fatherid='"+obj[0]+"' and jsid='"+s.getUsertype()+"'");
			  %>
		
		<h3><%=g.getName()%></h3>
		<div class="leftMenus">
		      <% 
		      for(Shouquan ss:slist){
			  Gongneng gg = (Gongneng)dao.findById(ss.getGnid(),"Gongneng");
		       %>
		       <dd>
				<a  href="/productauctionssh/admin/<%=gg.getUrl() %>" target="main"><%=gg.getName() %></a>
				</dd>
				<%} %>
		</div>
		<%}%>
		
	</div>
</div>
