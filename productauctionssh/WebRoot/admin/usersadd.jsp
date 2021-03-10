<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.text.*"%>
<%@page import="com.dao.CommonDAO"%>
<%@page import="com.util.Info"%>
<%@page import="com.model.Sysuser"%>
<%@page import="com.model.Juese"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="web" uri="/WEB-INF/webcontrol.tld"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户添加</title>
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
   
	<script type="text/javascript">
        function initControl(){
	  //开始绑定
                    //结束绑定
                      $("#txtCreatetime").datepicker({
                         dateFormat:'yy-mm-dd'
                      }).datepicker("setDate",new Date());
			           $('#btnulXiangpian').uploadify({  
			                'formData': { 'folder': '/productauctionssh/Upload' },  
			                'buttonText': '选择图片',  
			                'buttonClass': 'browser',  
			                'removeCompleted': true,  
			                'swf': '/productauctionssh/uploadifyv3.1/uploadify.swf',
			                'uploader': 'uploadImg.action', 
			                'fileTypeExts':"*.jpg;*.gif;*.png;",
			                'auto':true, 
			                'removeTimeout':0,
			                'debug': false,  
			                'height': 15,  
			                'width':90,  
			                 'fileSizelimit':'2048KB',
			                 'queueSizelimit':'5',
			                 'onUploadSuccess':function(file, data, response){
			                     $("#filelist").show();
			                     $("#imgXiangpian").attr("src","/productauctionssh/upfile/"+file.name);
                                 $("#hidXiangpian").val("/productauctionssh/upfile/"+file.name);
			                  }
			             }); 
			          var imgxiangpiansrc=$("#imgXiangpian").attr("src");
				       if(imgxiangpiansrc==""){
				         var url="/productauctionssh/upload/nopic.jpg";
				         
				         $("#imgXiangpian").attr("src",url);
				         $("#hidXiangpian").val(url);
				       }else
				       {
				          $("#imgXiangpian").attr("src",imgxiangpiansrc);
				          $("#hidXiangpian").val(imgxiangpiansrc); 
				       }
        }
        $(function ()
        {
            initControl();
            $.metadata.setType("attr","validate");
            $("#usersForm").validate();
                   
        });  
    </script>
    
</head>
<body>
<% 
CommonDAO dao = (CommonDAO)Info.getDao(request,"CommonDAO");
ArrayList<Juese> list = (ArrayList<Juese>)dao.findByHql("from Juese where delstatus='0'");
%>
           <div class="search-title">
                <h2>
                                                新建后台用户管理
                </h2>
                <div class="description">
                </div>
            </div>
           	<form name="usersform" method="post" action="adminAdd.action" id="usersForm">
					<table class="grid" cellspacing="1" width="100%">
						<tr>
							<td width="15%" align="right">
								用户名:
							</td>
							<td width="35%">
								<input name="username" id="username"  validate="{required:true,messages:{required:'请输入用户名'}}" 
									class="input-txt" type="text" /><div id="errmsg" style="display: none;font-weight: "></div>
							</td>
							<td width="50%" colspan="2" rowspan="6">
							   <img id="imgXiangpian" width="200px" height="200px"
									src="" />
								<div>
									<input type="file" name="upload" id="btnulXiangpian" />
								</div>
								<input type="hidden" id="hidXiangpian" name="xiangpian"
									value="" />
							</td>
						</tr>
						<tr>
							<td align="right">
								密码:
							</td>
							<td>
								<input name="userpwd" validate="{required:true,messages:{required:'请输入密码'}}" 
									class="input-txt" type="password" id="txtPassword" />
							</td>
						</tr>
						
						
						<tr>
							<td align="right">
								绑定邮箱:
							</td>
							<td>
								<input name="email" validate="{required:true,messages:{required:'请输入邮箱',email:'输入有效邮箱'}}"  
									class="input-txt" type="text" id="txtEmail" />
							</td>
						</tr>
						<tr>
							<td align="right">
								电话:
							</td>
							<td>
								<input name="tel" 
									class="input-txt" type="text" id="txtTel" validate="{required:true,messages:{required:'请输入电话',tel:'输入有效电话'}}"/>
							</td>
						</tr>
					
						<tr>
							<td align="right">
								真名:
							</td>
							<td>
								<input name="realname" 
									class="input-txt" type="text" id="txtRealname" validate="{required:true,messages:{required:'请输入真名'}}" />
							</td>
						</tr>
					    <tr>	
							<td align="right">
								性别:
							</td>
							<td>
								<input name="sex" type="radio" checked="checked"  value="男" />男
								<input name="sex" type="radio" value="女"  />女
							</td>
						</tr>
						
						<tr>	
							<td align="right">
								角色:
							</td>
							<td>
								<select name="usertype" id="usertype">
								  <option value="">请选择</option>
								  <%for(Juese j:list){%>
								  <option value="<%=j.getId() %>"><%=j.getName() %></option>
								  <%} %>
								</select>
							</td>
						</tr>
						
					</table>
					<div class="ui-button">
					  <input type="submit" value="提交" id="Button1" class="ui-button-text" />
					</div>
					
				</form>
     
<script type="text/javascript">
$("#username").blur(function(){
var username = $(this).val();
$.ajax({  
	        type: "POST",      
	         url: "usernamecheck.action",   
	          data: "username="+username, 
	         success: function(data){       
	    if(data==0){ 
	    $("#errmsg").text("用户名可用");
	    $("#errmsg").css("display","block");
	    $("#errmsg").css("color","green");
	    $("#errmsg").css("font-weight:","20px;");
	    }else{
	    $("#errmsg").text("已存在的用户名");
	    $("#errmsg").css("display","block");
	    $("#errmsg").css("color","red");
	    }   
	 }     
	});
})


<%
String no = (String)request.getAttribute("no");
String suc = (String)request.getAttribute("suc");
if(no!=null){
%>
alert("已存在的用户名");
location.replace("/productauctionssh/admin/usersadd.jsp");
<%}%>
<%
if(suc!=null){
%>
location.replace("/productauctionssh/admin/usersmanager.jsp");
<%}%>
</script> 
</body>
</html>