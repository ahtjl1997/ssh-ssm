<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.text.*"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>拍卖信息查看</title>
<link rel="stylesheet"
	href="/productauctionssh/e/css/index.css" type="text/css"></link>
<link rel="stylesheet"
	href="/productauctionssh/e/css/box.all.css"
	type="text/css"></link>
<link href="/productauctionssh/admin/css/web2table.css"
	rel="stylesheet" type="text/css" />
<link href="/productauctionssh/uploadifyv3.1/uploadify.css"
	rel="stylesheet" type="text/css" />
<script type="text/javascript"
	src="/productauctionssh/webui/jquery/jquery-1.9.0.js"></script>
<script
	src="/productauctionssh/uploadifyv3.1/jquery.uploadify-3.1.js"
	type="text/javascript"></script>
<script type="text/javascript"
	src="/productauctionssh/webui/jquery-validation/jquery.validate.min.js"></script>
<script type="text/javascript"
	src="/productauctionssh/webui/jquery-validation/jquery.metadata.js"></script>
<script type="text/javascript"
	src="/productauctionssh/webui/jquery-validation/messages_cn.js"></script>
<script type="text/javascript"
	src="/productauctionssh/editor/kindeditor-min.js"></script>
<script type="text/javascript"
	src="/productauctionssh/editor/lang/zh_CN.js"></script>
<script type="text/javascript">
	$(function() {
	});
</script>
</head>
<body style="padding:10px">
	<jsp:include page="/e/head.jsp"></jsp:include>
	<div class="wrap">
		<div class="cover-title">
			当前位置：<a href="index.jsp">首页</a> &gt;&gt; <a href="#">新增拍卖</a>
		</div>
	</div>
	<div class="fn-clear"></div>
	<div class="wrap">
		<div class="main">
			<jsp:include page="menu.jsp"></jsp:include>
			<div class="main-content">
				<div style="margin-top:80px;font-size:26px; margin-left:80px;">
					<font color="red">X 余额不足,付款失败！</font></br>

				</div>
				
			</div>
		</div>
</body>
</html>
