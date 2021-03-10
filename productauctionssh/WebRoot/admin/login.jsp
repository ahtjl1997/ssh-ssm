<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户登录</title>

<link href="/productauctionssh/admin/css/login.css" rel="stylesheet" type="text/css" />
<link href="/productauctionssh/admin/css/web2table.css" rel="stylesheet" type="text/css" />
<style type="text/css">
.orange-button
{
	height: 30px;
	line-height: 30px;
	color: #fff;
	background-color: #f57403;
	border-color: #d66500;
	font-weight: 400;
	text-align: center;
	background-image: none;
	border-radius: 2px;
	cursor: pointer;
	display: inline-block;
	font-size: 14px;
	text-decoration: none;
	vertical-align: middle;
	padding: 0 20px;
}
</style>
</head>
<body style="background-color:#0088cc;">
	<div class="wrap">
        <form method="post" action="adminLogin.action" id="loginForm">
           
           <input type="hidden" name="actiontype" value="login" />
           <input name="usertype" value="0" type="hidden" >
         
		<div style="width:500px; margin-top:110px; margin-left:200px;">

			<div class="whitebox">

				<h1>拍品在线拍卖后台管理系统</h1>


				<div class="reg-box">


					<div class="reg-content">

                        <dl>

                            <%
                            String err = (String)request.getAttribute("err");
                            String no = (String)request.getAttribute("no");
                            if(err!=null){out.print("<img src=\"images/icon_wrong.png\"/>&nbsp;&nbsp;<font style='color:#E84048'>验证码不正确</font>");}
                            if(no!=null){out.print("<img src=\"images/icon_wrong.png\"/>&nbsp;&nbsp;<font style='color:#E84048'>用户名或密码错误</font>");}
                             %>

						</dl>

						<dl>
							<dt>用户名:</dt>
							<dd>
								<input type="text" class="ui-input"  id="username"
									name="username" required> <i></i>

							</dd>

						</dl>
						
						<dl>
							<dt>密码:</dt>
							<dd>

								<input type="password" class="ui-input" id="userpwd"
									name="userpwd" required> <i> </i>

							</dd>

						</dl>
						
						
						<dl>
							<dt> 
							
								 <img id="vcodeimg" src="../plusin/image.jsp" style="cursor: hand" onclick="this.src='../plusin/image.jsp?time=' + Math.random()"
                                title="点击刷新验证码" align="absMiddle" src="" />

							 
							 </dt>
							<dd>
						    
							<input type="text" name="validcode" id="txtTextcode" autocomplete="off"  class="ui-input" required>
                        

							</dd>

						</dl>
					

						<dl>
							<dt></dt>
							<dd>

								<input type="submit" class="orange-button" id="btnLogin" value="登录"
									name="btnLogin">

							</dd>

						</dl>


					</div>


				</div>


			</div>


		</div>
       </form>

	</div>
</body>
</html>