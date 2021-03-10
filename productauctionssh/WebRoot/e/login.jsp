<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>会员登录</title>
<link rel="stylesheet" href="/productauctionssh/e/css/index.css" type="text/css"></link>

<link rel="stylesheet" href="/productauctionssh/e/css/box.all.css" type="text/css"></link>

<link rel="stylesheet" href="/productauctionssh/e/css/register.css" type="text/css"></link>

<script src="/productauctionssh/webui/jquery/jquery-1.8.3.min.js" type="text/javascript"></script>
    <script  type="text/javascript" src="/productauctionssh/webui/jquery/jquery.validate.min.js"></script>
    <script type="text/javascript"  src="/productauctionssh/webui/jquery/jquery.validateex.js" ></script>
    <script type="text/javascript"  src="/productauctionssh/webui/jquery/jquery.metadata.js" ></script>
    <script type="text/javascript"  src="/productauctionssh/webui/jquery/messages_cn.js" ></script>

  <script type="text/javascript">
       
        $(function ()
        {
           
            $.metadata.setType("attr","validate");
            $("#form1").validate();
        });  
    </script>
 


</head>
<body>
	<jsp:include page="head.jsp"></jsp:include>

	<div class="wrap">
		<div class="cover-title">
			当前位置：<a href="index.jsp">首页</a> &gt;&gt; <a href="login.jsp">会员登录</a>
		</div>
	</div>


	<div class="fn-clear"></div>

	<div class="wrap">
		<div class="whitebox">

			<h1>用户登录</h1>
           <form name="form1" id="form1" method="post" action="memberLogin.action">
			<div class="reg-box">

				
				<div class="reg-content">
					
					<dl>
					  <dt>
					    <%
                            String no = (String)request.getAttribute("no");
                            if(no!=null){out.print("<img src=\"/productauctionssh/admin/images/icon_wrong.png\"/>&nbsp;&nbsp;<font style='color:#E84048'>用户名或密码错误</font>");}
                          %>
                          <%
                            String err = (String)request.getAttribute("err");
                            if(err!=null){out.print("<img src=\"/productauctionssh/admin/images/icon_wrong.png\"/>&nbsp;&nbsp;<font style='color:#E84048'>验证码错误</font>");}
                          %>
                             </dt>
					</dl>
					<dl>
						<dt>用户名:</dt>
						<dd>
							<input type="text" class="ui-input" id="txtHuiyuanname" validate="{required:true,messages:{required:'请输入用户名称'}}"
								name="uname"> <i></i>

						</dd>

					</dl>

					<dl>
						<dt>密码:</dt>
						<dd>
							<input type="password" class="ui-input"  validate="{required:true,messages:{required:'请输入登录密码'}}" id="txtPassword"
								name="upass"> 
								<i>

								 </i>

						</dd>

					</dl>
					
					<dl>
						<dt>验证码:</dt>
						<dd>
						    <input type="text" class="ui-input"  validate="{required:true,messages:{required:'请输入验证码'}}" id="txtRandoms"
								name="randoms"><br/>
						    <img src="ma.jsp" id="yzm" onclick="ma();" style="cursor: pointer;margin-top: 12px;">
							<!--  <span onClick="ma();" style="cursor: pointer;"  ><font style="margin-top: 0px;">换一张</font></span>-->

						</dd>

					</dl>
					
				     <dl>
						<dt></dt>
						<dd>
							<input type="submit" class="orange-button" id="btnReigster" value="登录" name="btnReigster" style="display:block;border-radius:5px 5px;">
						</dd>

					</dl>

                
				</div>


			</div>
          </form>

		</div>
		

	</div>

	<div class="fn-clear"></div>
</body>
<script type="text/javascript">
function ma()
{
var a = document.getElementById("yzm");
var myDate=new Date()
a.src="ma.jsp?d="+myDate;
}
</script>
</html>