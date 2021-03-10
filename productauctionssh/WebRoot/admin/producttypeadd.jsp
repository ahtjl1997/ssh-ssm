<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.text.*"%>
<%@page import="com.dao.CommonDAO"%>
<%@page import="com.util.Info"%>
<%@page import="com.model.Sysuser"%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="web" uri="/WEB-INF/webcontrol.tld"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>拍品类别添加</title>
        <script charset="utf-8" src="/productauctionssh/kindeditor/kindeditor.js"></script>
	    <script charset="utf-8" src="/productauctionssh/kindeditor/Kind.js"></script>
        <script charset="utf-8" src="/productauctionssh/kindeditor/lang/zh-CN.js"></script>
     <link href="/productauctionssh/admin/css/web2table.css" rel="stylesheet" type="text/css" />
    <link href="/productauctionssh/admin/css/layout.css" rel="stylesheet" type="text/css" />
    <link href="/productauctionssh/admin/css/menu.css" rel="stylesheet" type="text/css" />
    
    <script src="/productauctionssh/webui/jquery/jquery-1.9.0.js" type="text/javascript"></script>
    
    
    <script  type="text/javascript" src="/productauctionssh/webui/jquery/jquery.validate.min.js"></script>
    <script type="text/javascript"  src="/productauctionssh/webui/jquery/jquery.metadata.js" ></script>
    <script type="text/javascript"  src="/productauctionssh/webui/jquery/messages_cn.js" ></script>
	    
    
    <link href="/productauctionssh/uploadifyv3.1/uploadify.css"
			rel="stylesheet" type="text/css" />
	<script src="/productauctionssh/uploadifyv3.1/jquery.uploadify-3.1.js"
			type="text/javascript"></script>
    <link href="/productauctionssh/webui/artDialog/skins/green.css" rel="stylesheet" type="text/css" />

    <script src="/productauctionssh/webui/artDialog/jquery.artDialog.source.js" type="text/javascript"></script>
    <link rel="stylesheet" href="/productauctionssh/webui/jqueryui/themes/base/jquery.ui.all.css"
			type="text/css"></link>
	<script type="text/javascript" src="/productauctionssh/webui/jqueryui/ui/jquery-ui.js"></script>
	<script type="text/javascript" src="/productauctionssh/webui/jqueryui/ui/i18n/jquery.ui.datepicker-zh-CN.js"></script>
</head>
<body>
           <div class="search-title">
                <h2>
                                                新增拍品类别管理
                </h2>
                <div class="description">
                </div>
            </div>
            <%CommonDAO dao = (CommonDAO)Info.getDao(request,"CommonDAO"); %>
           	<form name="usersform" method="post" action="producttypeAdd.action" id="usersForm">
					<table class="grid" cellspacing="1" width="100%" >
						<tr>
							<td align="right">
								拍品类别名称:
							</td>
							<td>
								<input name="typename"  class="input-txt" type="text" id="price" required/>
							</td>
						</tr>
						
					</table>
					<div class="ui-button">
					  <input type="submit" value="提交" id="Button1" class="ui-button-text" />
					</div>
					
				</form>
</body>
</html>