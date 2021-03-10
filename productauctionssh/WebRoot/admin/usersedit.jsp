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
String id = request.getParameter("id");
Sysuser sysuser = (Sysuser)dao.findById(id,"Sysuser");
ArrayList<Juese> list = (ArrayList<Juese>)dao.findByHql("from Juese where delstatus='0'");
 %>
           <div class="search-title">
                <h2>
                                                修改后台用户管理
                </h2>
                <div class="description">
                    
                </div>
            </div>
            <% System.out.println("img==="+sysuser.getImg()); %>
           	<form name="usersform" method="post" action="adminEdit.action" id="usersForm">
					<table class="grid" cellspacing="1" width="100%">
						<input type="hidden" name="id" value="<%=sysuser.getId() %>" />
						<tr>
							<td width="15%" align="right">
								用户名:
							</td>
							<td width="35%">
								<input name="username"  validate="{required:true,messages:{required:'请输入用户名'}}" value="<%=sysuser.getUsername() %>"
									class="input-txt" type="text" id="txtUsername" />
							</td>
							<td width="50%" colspan="2" rowspan="6">
							   <img id="imgXiangpian" width="200px" height="200px"
									src="<%=sysuser.getImg() %>" />
								<div>
									<input type="file" name="upload" id="btnulXiangpian" multiple />
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
								<input name="userpwd" validate="{required:true,messages:{required:'请输入密码'}}" value="<%=sysuser.getUserpwd() %>"
									class="input-txt" type="password" id="txtPassword" />
							</td>
						</tr>
						
						
						<tr>
							<td align="right">
								绑定邮箱:
							</td>
							<td>
								<input name="email" validate="{required:true,messages:{required:'请输入邮箱',email:'输入有效邮箱'}}"  value="<%=sysuser.getEmail() %>"
									class="input-txt" type="text" id="txtEmail" />
							</td>
						</tr>
						<tr>
							<td align="right">
								电话:
							</td>
							<td>
								<input name="tel" value="<%=sysuser.getTel() %>"
									class="input-txt" type="text" id="txtTel" />
							</td>
						</tr>
					
						<tr>
							<td align="right">
								真名:
							</td>
							<td>
								<input name="realname" value="<%=sysuser.getRealname() %>"
									class="input-txt" type="text" id="txtRealname" />
							</td>
						</tr>
					    <tr>	
							<td align="right">
								性别:
							</td>
							<td>
								<input name="sex" type="radio" <%if(sysuser.getSex().equals("男")){ %>  checked="checked" <%} %> value="男" />男
								<input name="sex" type="radio" <%if(sysuser.getSex().equals("女")){ %>  checked="checked" <%} %> value="女"  />女
							</td>
						</tr>
						
						<tr>	
							<td align="right">
								角色:
							</td>
							<td>
								<select name="usertype" id="usertype">
								  <%for(Juese j:list){%>
								  <option value="<%=j.getId() %>" <%=j.getId().toString().equals(sysuser.getUsertype())?"selected":"" %>><%=j.getName() %></option>
								  <%} %>
								</select>
							</td>
						</tr>
						
					</table>
					<div class="ui-button">
					  <input type="submit" value="提交" id="Button1" class="ui-button-text" />
					</div>
					
				</form>
     
  

</body>
</html>