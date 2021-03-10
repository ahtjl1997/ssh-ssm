<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.dao.CommonDAO"%>
<%@page import="com.util.Info"%>
<%@page import="com.model.Sysuser"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.util.PageManager"%>
<%@page import="com.model.Goods"%>
<%@page import="com.model.Producttype"%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>拍品类别管理</title>
   
    
    <link href="/productauctionssh/admin/css/web2table.css" rel="stylesheet" type="text/css" />
    <link href="/productauctionssh/admin/css/layout.css" rel="stylesheet" type="text/css" />
    
    <script src="/productauctionssh/webui/jquery/jquery-1.9.0.js" type="text/javascript"></script>

    <link href="/productauctionssh/webui/artDialog/skins/default.css" rel="stylesheet" type="text/css" />

    <script src="/productauctionssh/webui/artDialog/jquery.artDialog.source.js" type="text/javascript"></script>
    
    <script src="/productauctionssh/webui/artDialog/iframeTools.source.js" type="text/javascript"></script>
    
    
    <script src="/productauctionssh/webui/combo/combo.js"
			type="text/javascript"></script>
	<script type="text/javascript">
			$(function() {
			    $("#btnDelete").click(function(){
			        if($(".check:checked").length<1)
			        {
			           $.dialog.alert("请选择需要删除的拍品");
			           return;
			        }
			        var idlist = new Array();
			        $(".check:checked").each(function(index,a){
			             idlist.push( $(this).attr("value"));
						});
						$.dialog.confirm("你确定要删除拍品?", function(){
				             window.location.href=encodeURI('producttypeDel.action?idlist='+ idlist);
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
<body>


           <div class="search-title">
                <h2>
                                                拍品类别管理
                </h2>
                <div class="description">
                    <a href="/productauctionssh/admin/producttypeadd.jsp">新增拍品类别</a>
                </div>
            </div>
            
               <div class="search-options">
               <form id="searchForm" action="producttypelist.jsp?f=f" method="post">
               <input type="hidden"  name="actiontype" value="get"/>
                <div class="pt-15 fn-clear">
                    <div class="search-form-item fn-left">
                        <label class="search-form-label">
                                                                类别名称:</label>
                        <div class="search-form-item-content">
                            <input id="txtUsername" type="text" name="key"  runat="server" class="input-txt" />
                        </div>
                    </div>
                    
                    <div class="search-form-item fn-left">
                       <div class="ui-button">
                        <input  class="ui-button-text" value="搜索"  type="submit" />
                        </div>
                    </div>
               </div>
                  
               
              </form>
            </div>
            <div class="action-details">
               
                  <a id="btnDelete" class="action-btn" href="javascript:void(0)">
	                  <em class="icon-delete"></em>
	                  <b>删除</b>
                  </a>
                
            </div>
            <table id="module" width="100%" border="0" cellspacing="0"
						cellpadding="0" class="ui-record-table">
						<thead >
							<tr>
								<th>
									选择
								</th>
								<th>
									<b>拍品类别名称</b>
								</th>
								<th>
									操作
								</th>
							</tr>
						</thead>
						<tbody>
						<%
						CommonDAO dao = (CommonDAO)Info.getDao(request,"CommonDAO");
						String hql="from Producttype where delstatus='0'";
						String url="/productauctionssh/admin/producttypelist.jsp?1=1";
						String f = request.getParameter("f");
						String key = request.getParameter("key")==null?"":request.getParameter("key");
						if(f!=null){key=Info.getUTFStr(key);}
						if(!key.equals("")){
						hql+=" and typename like '%"+key+"%'";
						url+="&key="+key;
						}
						System.out.println("hql=="+hql);
						hql+=" order by id";
						PageManager pageManager = PageManager.getPage(url,10, request);
   	    				pageManager.doList(hql);
   	    				PageManager bean= (PageManager)request.getAttribute("page");
   	    				ArrayList<Producttype> list=( ArrayList<Producttype>)bean.getCollection();
						if(list.size()==0){
						 %>
								<tr>
									<td colspan="20">
										没有相关系统用户信息
									</td>
								</tr>
							<%}else{ for(Producttype p:list){
							%>
								<tr>
									<td>
										&nbsp;
										<input id="chk" class="check"
											name="chk" type="checkbox"
											value='<%=p.getId() %>'>
									</td>
									<td><%=p.getTypename() %></td>
									<td>
										<a class="edit" href="producttypeedit.jsp?id=<%=p.getId() %>">修改</a>
									</td>
								</tr>
								<%}}%>
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
location.replace("/productauctionssh/admin/producttypelist.jsp");
<%}%>
</script>
</html>