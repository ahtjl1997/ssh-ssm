<%@page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>系统注册</title>
<link rel="stylesheet" href="/productauctionssh/e/css/index.css" type="text/css"></link>
<link rel="stylesheet" href="/productauctionssh/e/css/box.all.css" type="text/css"></link>

<link rel="stylesheet" href="/productauctionssh/e/css/register.css" type="text/css"></link>

<script  src="/productauctionssh/webui/jquery/jquery-1.5.2.min.js"
	type="text/javascript"></script>
  <script  type="text/javascript" src="/productauctionssh/webui/jquery/jquery.validate.min.js"></script>
    <script type="text/javascript"  src="/productauctionssh/webui/jquery/jquery.metadata.js" ></script>
    <script type="text/javascript"  src="/productauctionssh/webui/jquery/messages_cn.js" ></script>	
   <script type="text/javascript">
    
       $(function(){
    	   
    	   $.metadata.setType("attr","validate");
    	   $("#form1").validate();
       })
   
   </script>


</head>
<body>

	<jsp:include page="head.jsp"></jsp:include>

	<div class="wrap">
		<div class="cover-title">
			当前位置：<a href="index.jsp">首页</a> &gt;&gt; <a href="register.jsp">系统注册</a>
		</div>
	</div>


	<div class="fn-clear"></div>

	<div class="wrap">
		<div class="whitebox">

			<h1>用户注册</h1>
           <form name="form1" id="form1" method="post" action="memberRegist.action">
			<div class="reg-box">

				<div class="reg-title" id="msgdiv">
					<%
                            String err = (String)request.getAttribute("err");
                            String no = (String)request.getAttribute("no");
                            if(err!=null){out.print("<img src=\"images/icon_wrong.png\"/>&nbsp;&nbsp;<font style='color:#E84048'>已存在的用户名</font>");}
                            if(no!=null){out.print("<img src=\"images/icon_wrong.png\"/>&nbsp;&nbsp;<font style='color:#E84048'>已存在的用户名</font>");}
                             %>
					
				</div>
				<div class="reg-content">
					<dl>
						<dt>用户名:</dt>
						<dd>
							<input type="text"  required  class="input width250" id="txtHuiyuanname" 
								name="uname"> 

						</dd>

					</dl>

					<dl>
						<dt>密码:</dt>
						<dd>
							<input type="password" required  class="input width250" id="txtPassword"
								name="upass"> 

						</dd>

					</dl>

					<dl>
						<dt>再次输入密码:</dt>
						<dd>
						<input type="password" required  class="input width250" id="txtPassword2"
								name="supass"> 

						</dd>

					</dl>

					<dl>
						<dt>邮箱:</dt>
						<dd>
							<input type="text" required   class="input width250" id="txtEamil"
								name="email"> 

						</dd>

					</dl>
					<dl>
						<dt>注册成为:</dt>
						<dd>
								<select id="utype" name="utype" required class="input width250">
									<option value="">请选择</option>
									<option value="买家">买家</option>
									<option value="拍卖者">拍卖者</option>
								</select>

						</dd>

					</dl>
					
					<dl>
						<dt></dt>
						<dd>
							<input type="submit" class="btn btn-default" id="btnReigster"
								value="注册" name="btnReigster">
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
$("#txtHuiyuanname").blur(function(){
var uname = $(this).val();

$.ajax({  
	        type: "POST",      
	         url: "usernamecheck.action", //servlet的名字     
	          data: "uname="+uname, 
	         success: function(data){       
	    if(data==1){  
	       $("#msgdiv").html("<img src=\"/productauctionssh/admin/images/icon_wrong.png\"/>&nbsp;&nbsp;<font style='color:#E84048'>已存在的用户名</font>");
	 }
	 }  
	});

})
</script>
<script type="text/javascript">
$("#form1").submit(function(){
if($("#txtPassword").val()!=$("#txtPassword2").val()){
$("#msgdiv").html("<img src=\"/productauctionssh/admin/images/icon_wrong.png\"/>&nbsp;&nbsp;<font style='color:#E84048'>输入的密码不一致</font>");
return false;
}else{
$("#form1").submit();
}
})
</script>
</html>