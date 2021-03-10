<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.dao.CommonDAO"%>
<%@page import="com.util.Info"%>
<%@page import="com.model.Sysuser"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.util.PageManager"%>
<%@page import="com.model.Goods"%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>拍品管理</title>
   
    
    <link href="/productauctionssh/admin/css/web2table.css" rel="stylesheet" type="text/css" />
    <link href="/productauctionssh/admin/css/layout.css" rel="stylesheet" type="text/css" />
    
    <script src="/productauctionssh/webui/jquery/jquery-1.9.0.js" type="text/javascript"></script>

    <link href="/productauctionssh/webui/artDialog/skins/default.css" rel="stylesheet" type="text/css" />

    <script src="/productauctionssh/webui/artDialog/jquery.artDialog.source.js" type="text/javascript"></script>
    
    <script src="/productauctionssh/webui/artDialog/iframeTools.source.js" type="text/javascript"></script>
    <script type="text/javascript" src="/productauctionssh/layer/jquery-2.0.3.min.js"></script>
    <script type="text/javascript" src="/productauctionssh/layer/layer.js"></script>
    
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
				             window.location.href=encodeURI('goodsDel.action?idlist='+ idlist);
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
                                                拍品管理
                </h2>
                <div class="description">
                <!--      <a href="/productauctionssh/admin/goodsadd.jsp">新增拍品</a>-->
                </div>
            </div>
            
               <div class="search-options">
               <form id="searchForm" action="goodslist.jsp?f=f" method="post">
               <input type="hidden"  name="actiontype" value="get"/>
                <div class="pt-15 fn-clear">
                    <div class="search-form-item fn-left">
                        <label class="search-form-label">
                                                                拍品名称:</label>
                        <div class="search-form-item-content">
                            <input id="txtUsername" type="text" name="goodsname"  runat="server" class="input-txt" />
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
            <table id="module" width="100%" border="0" cellspacing="0"
						cellpadding="0" class="ui-record-table">
						<thead >
							<tr>
							<!-- 	<th>
									选择
								</th>
								 -->
								<th>
									<b>拍品名称</b>
								</th>
								<th>
									<b>起拍价</b>
								</th>
								<th>
									<b>最低加价</b>
								</th>
								<th>
									<b>截止时间</b>
								</th>
								<th>
									<b>拍品状态</b>
								</th>
								<th>
									<b>审核状态</b>
								</th>
								
								<th>
									操作
								</th>
							</tr>
						</thead>
						<tbody>
						<%
						CommonDAO dao = (CommonDAO)Info.getDao(request,"CommonDAO");
						String hql="from Goods where delstatus='0'";
						String url="/productauctionssh/admin/goodslist.jsp?1=1";
						String f = request.getParameter("f");
						String goodsname = request.getParameter("goodsname")==null?"":request.getParameter("goodsname");
						if(f!=null){goodsname=Info.getUTFStr(goodsname);}
						if(!goodsname.equals("")){
						hql+=" and goodsname like '%"+goodsname+"%'";
						url+="&goodsname="+goodsname;
						}
						System.out.println("hql=="+hql);
						hql+=" order by id desc";
						String tgid = request.getParameter("tgid");
						System.out.println("tjid==="+tgid);
						String jjid = request.getParameter("jjid");
						if(tgid!=null){
						Goods gg = (Goods)dao.findById(tgid,"Goods");
						gg.setShstatus("通过审核");
						dao.update(gg);
						}
						if(jjid!=null){
						Goods gg = (Goods)dao.findById(jjid,"Goods");
						gg.setShstatus("未通过审核");
						dao.update(gg);
						}
						
						String did = request.getParameter("did");
						if(did!=null){
						Goods gg = (Goods)dao.findById(did,"Goods");
						gg.setDelstatus("1");
						dao.update(gg);
						}
						PageManager pageManager = PageManager.getPage(url,10, request);
   	    				pageManager.doList(hql);
   	    				PageManager bean= (PageManager)request.getAttribute("page");
   	    				ArrayList<Goods> list=( ArrayList<Goods>)bean.getCollection();
						if(list.size()==0){
						 %>
								<tr>
									<td colspan="20">
										没有相关系统用户信息
									</td>
								</tr>
							<%}else{ for(Goods goods:list){
							%>
								<tr>
							<!--  	<td>
										&nbsp;
										<input id="chk" class="check"
											name="chk" type="checkbox"
											value='<%=goods.getId() %>'>
									</td>
									-->
									<td><%=goods.getGoodsname() %></td>
									<td><%=goods.getPrice() %></td>
									<td><%=goods.getJiajia() %></td>
									<td><%=goods.getEtime() %></td>
									<td><%=goods.getStatus() %></td>
									<td><%=goods.getShstatus() %></td>
									<td>
									    <%if(goods.getShstatus().equals("待审核")){ %>
									   <!--   <a class="edit" href="goodslist.jsp?tgid=<%=goods.getId() %>">通过</a>-->
									   <a class="edit" href="<%=Info.compare_datezq(goods.getEtime(),Info.getDateStr()).equals("small")?"javascript:alert('此商品已过期');":"goodslist.jsp?tgid="+goods.getId()+"" %>">通过</a>
									    <a class="edit" href="goodslist.jsp?jjid=<%=goods.getId() %>">拒绝</a>
									    <%} %>
								<!--  		<a class="edit" href="goodsedit.jsp?id=<%=goods.getId() %>">修改</a>-->
								        <%if(goods.getStatus().equals("正在拍卖")&&goods.getShstatus().equals("通过审核")){ %>
								        <a class="chakan" href="xiaoJia.action?id=<%=goods.getId() %>">下架</a>
								        <%} %>
								        <%if(goods.getStatus().equals("等待拍卖")&&goods.getShstatus().equals("通过审核")){ %>
								        <a class="chakan" href="shangJia.action?id=<%=goods.getId() %>">上架</a>
								        <%} %>
										<a class="chakan" href="goodsdetails.jsp?id=<%=goods.getId() %>">查看</a>
										
										<a class="chakan" href="goodslist.jsp?did=<%=goods.getId() %>">删除</a>
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
layer.msg('<%=suc%>');
<%}%>
</script>
</html>