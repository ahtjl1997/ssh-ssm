<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.dao.CommonDAO"%>
<%@page import="com.util.Info"%>
<%@page import="com.model.Sysuser"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.util.PageManager"%>
<%@page import="com.model.Goods"%>


<%@page import="com.model.Notice"%>
<%@page import="com.model.Juese"%>
<%@page import="com.model.Shouquan"%>
<%@page import="com.model.Gongneng"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>授权管理</title>
   
    
    <link href="/productauctionssh/admin/css/web2table.css" rel="stylesheet" type="text/css" />
    <link href="/productauctionssh/admin/css/layout.css" rel="stylesheet" type="text/css" />
    
    <script src="/productauctionssh/webui/jquery/jquery-1.9.0.js" type="text/javascript"></script>

    <link href="/productauctionssh/webui/artDialog/skins/default.css" rel="stylesheet" type="text/css" />

    <script src="/productauctionssh/webui/artDialog/jquery.artDialog.source.js" type="text/javascript"></script>
    
    <script src="/productauctionssh/webui/artDialog/iframeTools.source.js" type="text/javascript"></script>
    
    
    <script src="/productauctionssh/webui/combo/combo.js"
			type="text/javascript"></script>
</head>
<body>


           <div class="search-title">
                <h2>
                                                授权管理
                </h2>
            </div>
            
               <div class="search-options">
               <form id="searchForm" action="jueselist.jsp?f=f" method="post">
               <input type="hidden"  name="actiontype" value="get"/>
                <div class="pt-15 fn-clear">
                    <div class="search-form-item fn-left">
                        <label class="search-form-label">
                                                                授权名称:</label>
                        <div class="search-form-item-content">
                            <input id="txtUsername" type="text" name="name"  runat="server" class="input-txt" />
                        </div>
                    </div>
               </div>
                  
               
              </form>
            </div>
            <table id="module" width="100%" border="0" cellspacing="0"
						cellpadding="0" class="ui-record-table">
						<thead >
							<tr>
								<th width="300">
									<b>名称</b>
								</th>
								<th>
									<b>功能</b>
								</th>
								<th width="100">
									操作
								</th>
							</tr>
						</thead>
						<tbody>
						<%
						CommonDAO dao = (CommonDAO)Info.getDao(request,"CommonDAO");
						String hql="from Juese where 1=1 and delstatus='0'";
						String url="/productauctionssh/admin/jueselist.jsp?1=1";
						PageManager pageManager = PageManager.getPage(url,10, request);
   	    				pageManager.doList(hql);
   	    				PageManager bean= (PageManager)request.getAttribute("page");
   	    				ArrayList<Juese> list=( ArrayList<Juese>)bean.getCollection();
						if(list.size()==0){
						 %>
								<tr>
									<td colspan="20">
										没有相关系统用户信息
									</td>
								</tr>
							<%}else{ for(Juese juese:list){%>
								<tr>
									<td>
										<%=juese.getName() %>
									</td>
									<td>
										<%
										ArrayList<Shouquan> qlist = (ArrayList<Shouquan>)dao.findByHql("from Shouquan where jsid='"+juese.getId()+"'");
										for(Shouquan s:qlist){
										Gongneng g = (Gongneng)dao.findById(s.getGnid(),"Gongneng");
										%>
										<%=g.getName() %>&nbsp;&nbsp;
										<% 
										}
										%>
									</td>
									<td>
										<a class="edit" href="shouquanedit.jsp?jsid=<%=juese.getId() %>">授权</a>
									</td>
								</tr>
								<% }}%>
								<tr><td colspan="9">${page.info }</td></tr>
						</tbody>
					</table>
					<div class="clear"></div>
					<daowen:pager id="pager1" attcheform="searchForm" />
</body>
<script type="text/javascript">
<%
String suc = (String)request.getAttribute("suc");
if(suc!=null){
%>
location.replace("/productauctionssh/admin/shouquanlist.jsp");
<%}%>
</script>
</html>