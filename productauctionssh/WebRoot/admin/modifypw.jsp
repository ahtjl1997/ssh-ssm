<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.dao.CommonDAO"%>
<%@page import="com.util.Info"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ include file="law.jsp"%>
<html>
  <head>
    <title>后台用户中心</title>
   <script type="text/javascript" src="/productauctionssh/webui/jquery/jquery-1.8.3.min.js"></script>
   <script  type="text/javascript" src="/productauctionssh/webui/jquery/jquery.validate.min.js"></script>
  <script type="text/javascript"  src="/productauctionssh/webui/jquery/jquery.metadata.js" ></script>
  <script type="text/javascript"  src="/productauctionssh/webui/jquery/messages_cn.js" ></script>
   <link href="/productauctionssh/webui/artDialog/skins/default.css" rel="stylesheet" type="text/css" />
    <script src="/productauctionssh/webui/artDialog/jquery.artDialog.source.js" type="text/javascript"></script>
    <script src="/productauctionssh/webui/artDialog/iframeTools.source.js" type="text/javascript"></script>
   <link href="/productauctionssh/admin/css/web2table.css" rel="stylesheet" type="text/css" />
    <link href="/productauctionssh/admin/css/layout.css" rel="stylesheet" type="text/css" />
     <script  type="text/javascript">
             $(function(){
                    $.metadata.setType("attr","validate");
                    $("#form1").validate();
             });
    </script>
  </head>
  <body >
    	  <div class="search-title">
		      <h2>修改密码</h2>
		<div class="description">
		</div>
	</div>
	<%
	Sysuser s = (Sysuser)session.getAttribute("admin");
	CommonDAO dao = (CommonDAO)Info.getDao(request,"CommonDAO");
	Sysuser e = (Sysuser)dao.findById(s.getId(),"Sysuser");
	 %>
	<form name="form1" class="form-horizontal" action="passEdit.action?id=<%=e.getId() %>"  id="form1" method="post"  >
                <table border="0" cellspacing="1"  class="grid" cellpadding="0" width="100%" >
                <tr>
                   <td colspan="2">
                   <%String suc = (String)request.getAttribute("suc"); %>
                   <%=
                   suc!=null?"<font style='color:green'>修改成功</font>":""
                    %>
                   </td>
                </tr>
                <tr>
                      <td align="right" >原始密码 :</td>
                      <td align="left" >
                        <input name="password1"  type="password" id="password1" class="input-txt" validate="{required:true,messages:{required:'请输入密码'}}" />
                      </td>
                  </tr>
                 <tr>
                      <td align="right">修改密码 :</td>
                      <td align="left" >
                        <input name="userpwd"   type="password" id="repassword1" class="input-txt" validate="{required:true,messages:{required:'请输入确定密码'}}" />
                      </td>
                  </tr>
                   <tr>
                      <td align="right" >确认密码 :</td>
                      <td align="left">
                        <input name="repassword2"  type="password" id="repassword2" class="input-txt" validate="{required:true,equalTo:'#repassword1',messages:{required:'请输入确定密码',equalTo:'两次密码不一致'}}" />
                      </td>
                  </tr>
                   <tr>
						        <td colspan="4">
						                <div class="ui-button">
											<button class="ui-button-text"><i class="icon-ok icon-white"></i>修改密码</button>
									     </div>
						       </td>
				  </tr>
              </table>
          </form>
  </body>
</html>
