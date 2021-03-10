<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@page import="com.dao.CommonDAO"%>
<%@page import="com.util.Info"%>
<%@page import="com.model.Member"%>
<%@page import="com.util.PageManager"%>
<%@ include file="law.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<title>会员信息</title>
<link href="/productauctionssh/admin/css/common.css"
	rel="stylesheet" type="text/css" />
<link href="/productauctionssh/admin/css/web2table.css"
	rel="stylesheet" type="text/css" />
<script type="text/javascript"
	src="/productauctionssh/webui/jquery/jquery-1.9.0.js"></script>
<link
	href="/productauctionssh/webui/artDialog/skins/default.css"
	rel="stylesheet" type="text/css" />
<script
	src="/productauctionssh/webui/artDialog/jquery.artDialog.source.js"
	type="text/javascript"></script>
<script
	src="/productauctionssh/webui/artDialog/iframeTools.source.js"
	type="text/javascript"></script>
<link
	href="/productauctionssh/webui/treetable/skin/jquery.treetable.css"
	rel="stylesheet" type="text/css" />
<link
	href="/productauctionssh/webui/treetable/skin/jquery.treetable.theme.default.css"
	rel="stylesheet" type="text/css" />
<script
	src="/productauctionssh/webui/treetable/js/jquery.treetable.js"
	type="text/javascript"></script>
	<script type="text/javascript">
			$(function() {
			    $("#btnDelete").click(function(){
			        if($(".check:checked").length<1)
			        {
			           $.dialog.alert("请选择需要删除的会员");
			           return;
			        }
			        var idlist = new Array();
			        $(".check:checked").each(function(index,a){
			             idlist.push( $(this).attr("value"));
						});
						$.dialog.confirm("你确定要删除吗?", function(){
				             window.location.href=encodeURI('memberDel.action?idlist='+ idlist);
						  });
					});
					$("#btnCheckAll").click(function() {
						var ischeck = false;
						$(".check").each(function() {
							if ($(this).is(":checked")) {
								$(this).prop("checked", "");
								ischeck = false;
							} else {
								$(this).prop("checked", "true");
								ischeck = true;
							}
						});
						if ($(this).text() == "选择记录")
							$(this).text("取消选择");
						else
							$(this).text("选择记录");
					})
	});
</script>
</head>
<body >
	<%
	String hql="from Member where delstatus='0'";
						String url="/productauctionssh/admin/memberlist.jsp?1=1";
						String uname = request.getParameter("uname")==null?"":request.getParameter("uname");
	 %>
			<div class="search-title">
				<h2>会员管理</h2>
				<div class="description">
					
				</div>
			</div>
			<!-- 搜索控件开始 -->
			<div class="search-options">
				<form id="searchForm"
					action="huiyuanmanager.jsp?1=1"
					method="post">
					<table class="grid" cellspacing="0" width="150%">
						<tbody>
							<tr>
								<td>会员账号 <input name="uname" value="<%=uname %>"
									class="input-txt" type="text" id="accountname" />
									    <div class="search-form-item fn-left">
                           <div class="ui-button">
                           <input  class="ui-button-text" value="搜索"  type="submit" />
                           </div>
 
								</td>
							</tr>
						</tbody>
					</table>
				</form>
			</div>
			<!-- 搜索控件结束 -->
			<div class="clear"></div>
			<div class="action-details">

<a id="btnDelete" class="action-btn" href="javascript:void(0)">
	                  <em class="icon-delete"></em>
	                  <b>删除</b>
                  </a>

			</div>
			<table id="module" width="100%" border="0" cellspacing="0"
				cellpadding="0" class="ui-record-table">
				<thead>
					<tr>
						<th>选择</th>
						<th><b>用户名</b>
						</th>
						<th><b>密码</b>
						</th>

						<th><b>姓名</b>
						</th>
						<th><b>性别</b>
						</th>

						<th><b>邮箱</b>
						</th>
						<th><b>移动电话</b>
						</th>
						<th><b>联系地址</b>
						</th>
						
						<th>操作</th>
					</tr>
				</thead>
				<tbody>
				<%
				        CommonDAO dao = (CommonDAO)Info.getDao(request,"CommonDAO");
						String f = request.getParameter("f");
						if(f!=null){uname=Info.getUTFStr(uname);}
						if(!uname.equals("")){
						hql+=" and uname like '%"+uname+"%'";
						url+="&uname="+uname;
						}
						hql+=" order by id";
						PageManager pageManager = PageManager.getPage(url,10, request);
   	    				pageManager.doList(hql);
   	    				PageManager bean= (PageManager)request.getAttribute("page");
   	    				ArrayList<Member> list=( ArrayList<Member>)bean.getCollection();
   	    				if(list.size()==0){
				 %>
						<tr>
							<td colspan="20">没有相关会员信息</td>
						</tr>
						<%}else{for(Member member:list){ %>
						<tr>
							<td>&nbsp;<input id="chk<%=member.getId() %>" class="check" name="chk<%=member.getId() %>" type="checkbox" value='<%=member.getId() %>'/>
							</td>
							<td><%=member.getUname() %></td>
                             <td><%=member.getUpass() %></td>
							<td><%=member.getRealname()==null?"":member.getRealname() %></td>
							<td><%=member.getSex()==null?"":member.getSex()%></td>
							
							<td><%=member.getEmail()%></td>

							<td><%=member.getTel()==null?"":member.getTel()%></td>
							<td><%=member.getAddr()==null?"":member.getAddr()%></td>
							
							
							<td>
								
								<a class="chakan" href="memberedit.jsp?id=<%=member.getId() %>">修改</a>
							</td>
						</tr>
				<%} }%>
				<tr><td colspan="9">${page.info }</td></tr>
				</tbody>
			</table>
			<div class="clear"></div>
			<daowen:pager id="pager1" attcheform="searchForm" />
	
	
</body>
</html>
