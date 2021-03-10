<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@page import="com.dao.CommonDAO"%>
<%@page import="com.util.Info"%>
<%@page import="com.util.PageManager"%>
<%@page import="com.model.Imgv"%>
<%@ include file="law.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<title>焦点图信息</title>
 <link href="/productauctionssh/admin/css/web2table.css" rel="stylesheet" type="text/css" />
    <link href="/productauctionssh/admin/css/layout.css" rel="stylesheet" type="text/css" />
    <link href="/productauctionssh/admin/css/menu.css" rel="stylesheet" type="text/css" />
    
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
			           $.dialog.alert("请选择需要删除项");
			           return;
			        }
			        var idlist = new Array();
			        $(".check:checked").each(function(index,a){
			             idlist.push( $(this).attr("value"));
						});
						$.dialog.confirm("你确定要删除吗?", function(){
				             window.location.href=encodeURI('imgvDel.action?idlist='+ idlist);
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
				<h2>焦点图管理</h2>
				<div class="description">
					<a
						href="/productauctionssh/admin/imgadd.jsp">新建焦点图</a>
				</div>
			</div>
			<!-- 搜索控件开始 -->
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
						<th width="10%">选择</th>
						<th><b>显示图片</b>
						</th width="10%">
						<th>操作</th>
					</tr>
				</thead>
				<tbody>
				<%      
				        String hql="from Imgv where 1=1";
				        String url="imglist.jsp?1=1";
				        CommonDAO dao = (CommonDAO)Info.getDao(request,"CommonDAO");
						PageManager pageManager = PageManager.getPage(url,10, request);
   	    				pageManager.doList(hql);
   	    				PageManager bean= (PageManager)request.getAttribute("page");
   	    				ArrayList<Imgv> list=( ArrayList<Imgv>)bean.getCollection();
   	    				if(list.size()==0){
				 %>
						<tr>
							<td colspan="20">没有相关焦点图信息</td>
						</tr>
			      <%}else {for(Imgv imgv:list){ %>
						<tr>
							<td width="10%">&nbsp;<input id="chk<%=imgv.getId() %>" class="check"
								name="chk<%=imgv.getId() %>" type="checkbox"
								value='<%=imgv.getId() %>'>
							</td>
							<td><img src='<%=imgv.getImg() %>' width="550" height="200"/></td>
							<td width="10%">
							    <a class="edit" href="/productauctionssh/admin/imgedit.jsp?id=<%=imgv.getId() %>">修改</a>
								
							</td>
						</tr>
						<%}} %>
						<tr><td colspan="3">${page.info }</td></tr>
				</tbody>
			</table>
			<div class="clear"></div>
			<daowen:pager id="pager1" attcheform="searchForm" />
		
	
</body>
</html>
