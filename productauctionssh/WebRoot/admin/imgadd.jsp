<%@ page language="java" import="java.util.*"
	contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.text.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="web" uri="/WEB-INF/webcontrol.tld"%>

<%@ include file="law.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<title>焦点图</title>
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
<link href="/productauctionssh/uploadifyv3.1/uploadify.css"
	rel="stylesheet" type="text/css" />
<script
	src="/productauctionssh/uploadifyv3.1/jquery.uploadify-3.1.js"
	type="text/javascript"></script>
<script type="text/javascript"
	src="/productauctionssh/webui/jquery-form/jquery.form.js"></script>
<script type="text/javascript"
	src="/productauctionssh/editor/kindeditor-min.js"></script>
<script type="text/javascript"
	src="/productauctionssh/editor/lang/zh_CN.js"></script>
<link rel="stylesheet"
	href="/productauctionssh/webui/jqueryui/themes/base/jquery.ui.all.css"
	type="text/css"></link>
<script type="text/javascript"
	src="/productauctionssh/webui/jqueryui/ui/jquery-ui.js"></script>
<script type="text/javascript"
	src="/productauctionssh/webui/jqueryui/ui/i18n/jquery.ui.datepicker-zh-CN.js"></script>
<script type="text/javascript">
        function initControl(){
			           $('#btnulTupian').uploadify({  
			                'formData': { 'folder': '/productauctionssh/Upload' },  
			                'buttonText': '选择图片',  
			                'buttonClass': 'browser',  
			                'removeCompleted': true,  
			                'swf': '/productauctionssh/uploadifyv3.1/uploadify.swf', 
			                'fileTypeExts':"*.jpg;*.gif;*.png;",
			                'auto':true, 
			                'removeTimeout':0,
			                'debug': false,  
			                'height': 15,  
			                'width':90,  
			                'uploader': 'uploadImg.action',
			                 'fileSizelimit':'2048KB',
			                 'queueSizelimit':'5',
			                 'onUploadSuccess':function(file, data, response){
			                     $("#filelist").show();
			                     $("#imgTupian").attr("src","/productauctionssh/upfile/"+file.name);
                                 $("#hidTupian").val("/productauctionssh/upfile/"+ file.name);
							}
						});
		var imgtupiansrc = "${requestScope.jiaodiantu.tupian}";
		if (imgtupiansrc == "") {
			var url = "/productauctionssh/upload/nopic.jpg";
			$("#imgTupian").attr("src", url);
			$("#hidTupian").val(url);
		} else {
			$("#imgTupian").attr("src", imgtupiansrc);
			$("#hidTupian").val(imgtupiansrc);
		}
		//开始绑定
		//结束绑定
	}
	$(function() {
		initControl();
		$("#jiaodiantuForm").submit(function() {
			return true;
		})
	});
</script>
</head>
<body>
	
			<div class="search-title">
				<h2>
					焦点图管理-> <a href="#">新建焦点图</a>
				</h2>
				<div class="description"></div>
			</div>
			<form name="jiaodiantuform" method="post"
				action="imgvAdd.action"
				id="jiaodiantuForm">
				<table class="grid" cellspacing="1" width="100%">
					<tr>
						
					    <td colspan="4" >
					    <img id="imgTupian" width="850px" height="200px"
							src="" />
							<div>
								<input type="file" name="upload" id="btnulTupian" />
							</div> <input type="hidden" id="hidTupian" name="tupian"
							value="" /></td>
					</tr>
					
				</table>
				<div class="ui-button">
					<input type="submit" value="提交" id="Button1" class="ui-button-text" />
				</div>
			</form>
	
</body>
</html>
