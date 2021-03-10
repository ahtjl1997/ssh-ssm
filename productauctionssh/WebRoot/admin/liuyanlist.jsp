<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@page import="com.util.PageManager"%>
<%@page import="com.model.Liuyan"%>
<%@page import="com.model.Member"%>
<%@page import="com.dao.CommonDAO"%>
<%@page import="com.util.Info"%>
<%@ include file="law.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<title>留言信息</title>
    <script src="/productauctionssh/webui/jquery/jquery-1.8.3.min.js" type="text/javascript"></script>
    <link href="/productauctionssh/webui/artDialog/skins/default.css" rel="stylesheet" type="text/css" />
    <script src="/productauctionssh/webui/artDialog/jquery.artDialog.source.js" type="text/javascript"></script>
    <script src="/productauctionssh/webui/artDialog/iframeTools.source.js" type="text/javascript"></script>
    <script src="/productauctionssh/webui/combo/combo.js" type="text/javascript"></script>
    <link href="/productauctionssh/webui/treetable/skin/jquery.treetable.css" rel="stylesheet" type="text/css" />
    <link href="/productauctionssh/webui/treetable/skin/jquery.treetable.theme.default.css" rel="stylesheet"
        type="text/css" />
    <script src="/productauctionssh/webui/treetable/js/jquery.treetable.js" type="text/javascript"></script>
     <link href="/productauctionssh/admin/css/web2table.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript">
			$(function() {
			    $("#btnDelete").click(function(){
			        if($(".check:checked").length<1)
			        {
			           $.dialog.alert("请选择需要删除选项");
			           return;
			        }
			        var idlist = new Array();
			        $(".check:checked").each(function(index,a){
			             idlist.push( $(this).attr("value"));
						});
						$.dialog.confirm("你确定要删除吗?", function(){
				             window.location.href=encodeURI('liuyanDel.action?idlist='+ idlist);
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
	<div class="search-title">
		<h2>留言管理</h2>
		<div class="description">
			
		</div>
	</div>
	<!-- 搜索控件开始 -->
	<!-- 搜索控件结束 -->
	<div class="clear"></div>
	<div class="action-details">
		 <a id="btnDelete" class="action-btn" href="javascript:void(0)"
			> <em class="icon-delete"></em> <b>删除</b>
		</a>
	</div>
	<table id="leaveword" width="100%" border="0" cellspacing="0"
		cellpadding="0" class="ui-record-table">
		<thead>
			<tr>
				<th>选择</th>
				
				<th><b>留言内容</b></th>
				<th><b>发布时间</b></th>
				<th><b>留言人</b></th>
				<th><b>回复</b></th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
		<%
		                String hql="from Liuyan where 1=1";
		                String url="liuyanlist.jsp?1=1";
		                CommonDAO dao = (CommonDAO)Info.getDao(request,"CommonDAO");
		                PageManager pageManager = PageManager.getPage(url,10, request);
   	    				pageManager.doList(hql);
   	    				PageManager bean= (PageManager)request.getAttribute("page");
   	    				ArrayList<Liuyan> list=( ArrayList<Liuyan>)bean.getCollection();
   	    				if(list.size()==0){
		 %>
				<tr>
					<td colspan="20">没有相关留言信息</td>
				</tr>
			<%	}
								     for(Liuyan  liuyan  :  list)
								      {
								      Member member = (Member)dao.findById(liuyan.getMemberid(),"Member");
							%>
			<tr>
				<td>&nbsp;<input id="chk<%=liuyan.getId()%>" class="check"
					name="chk<%=liuyan.getId()%>" type="checkbox"
					value='<%=liuyan.getId()%>'/></td>
				
				<td><%=java.net.URLDecoder.decode(liuyan.getContent(),"UTF-8")%></td>
				<td><%=liuyan.getLsavetime()%></td>
				
				<td><%=member.getUname()%></td>
				<td><%=liuyan.getHcontent()%></td>
				<td>
				   <%if(liuyan.getHcontent().equals("")){ %>
				      <a class="orange-href"
					href="/productauctionssh/admin/liuyanhf.jsp?id=<%=liuyan.getId()%>">回复</a>
				   <%} else{%>
					 <a class="orange-href"
					     href="/productauctionssh/admin/leaveworddetails.jsp?id=<%=liuyan.getId()%>">查看</a>
					<%} %>
				</td>
			</tr>
			<%}%>
		</tbody>
	</table>
	<div class="clear"></div>
	<daowen:pager id="pager1" attcheform="searchForm" />
</body>
</html>
