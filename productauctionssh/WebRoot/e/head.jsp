<%@ page language="java"  contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.model.Member"%>
<%@page import="com.dao.CommonDAO"%>
<%@page import="com.util.Info"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.model.Producttype"%>

 
 <script type="text/javascript">
  
    $(function(){
      
    	  $(".main-nav .menus li a").removeClass("current");
	      var headid='<%=request.getParameter("headid")%>';
	      if (headid != 'null') {
	           
	     	 $("#"+headid).addClass("current");
	 	 }
    
      $(".exit").click(function(){
          
            var pageurl_pagescope= $("#pageurl_pagescope").val();
            
            $.ajax({
		                     
		              url:encodeURI('/productauctionssh/admin/huiyuanmanager.do?actiontype=exit'),
					  method:'get',
					  success:function(){
					      window.location.reload();
					  },
					  error:function(xmhttprequest,status,excetpion){
					     $.alert("系统错误，错误编码"+status);
					  }
		     })

      })
    })

</script>
 
 <script type="text/javascript">

  $(function(){
      
    	  $(".navmenu").mouseover(function(){
    	    $(this).children("ul").show();
    	  })
	      $(".navmenu").mouseout(function(){
    	    $(this).children("ul").hide();
    	  })
       
 })
</script>

<%
Member member = (Member)session.getAttribute("member");
CommonDAO dao = (CommonDAO)Info.getDao(request,"CommonDAO");
ArrayList<Producttype> plist = (ArrayList<Producttype>)dao.findByHql("from Producttype where delstatus='0'");
 %>

  
  
<div class="index-toolbar">
  <div class="wrap">
  
            
    
    <%if(member!=null){ %>
            欢迎你!!<%=member.getUname() %>|
       <a href="/productauctionssh/e/accountinfo.jsp">个人中心</a>|      
      <a class="exit" style="cursor:pointer" href="memberExit.action">退出</a>|
    <%}%>
      <%if(member==null){ %>
      <a href="/productauctionssh/e/login.jsp">学生登录</a>|
      <a href="/productauctionssh/e/register.jsp">用户注册</a>|
   <%}%>
     
     <a href="/productauctionssh/admin/login.jsp" target="block">系统后台</a>
  </div>
  
   
</div>
   <div class="page-main-box">
        <div style="font-size: 28px; color:#A41616; font-weight: bold; width:400px; line-height:30px; font-family:tahoma, arial, Microsoft YaHei, Hiragino Sans GB; padding: 15px 10px;" class="fn-left">
                             校园拍卖
            
        </div>
       <form id="searchForm"  action="/productauctionssh/e/searchsp.jsp" method="post" >
           <input   type="hidden" name="actiontype" value="search" />
            <input type="hidden" name="forwardurl" value="/e/searchsp.jsp" />
        <div class="search-box">
            <div class="search-text">
            </div>
            <div class="keyword">
                <input type="text" placeholder="拍品名称" id="spname" name="spname" style="display:block;border-radius:5px 5px;">
                
            </div>
            <div class="so" style="margin-left: 10px;" >
                <input type="submit" class="sobtn" id="btnSearch" value="搜索" name="btnSearch" style="display:block;border-radius:5px 5px;">
            </div>
            <div class="error-container">
                
            </div>
        </div>
        
        </form>
    </div>

     
 </div>
<!-- s -->
  <div class="main-nav">   
    <div class="wrap">       
      <ul class="menus clearfix">
       <li><a   id= "1" class="current"  href="/productauctionssh/e/index.jsp">首页</a></li>
       <li><a   id="41" class="" href="/productauctionssh/e/index.jsp?stype=newgoods">最新上架</a></li>
       <li><a   id="41" class="" href="/productauctionssh/e/index.jsp?stype=goodsprice">价格排行</a></li>
       <li><a   id="41" class="" href="/productauctionssh/e/index.jsp?stype=clickgoods">点击排行</a></li>
       <li><a  id="44" class=""  href="<%if(member!=null){ %>/productauctionssh/e/liuyan.jsp<%}else{ %>/productauctionssh/e/login.jsp<%} %>">在线留言</a></li>    
       <li class= "navmenu" >
       <a id="41">分类</a>
       <ul class="second-nav">
       <%for(Producttype t:plist){ %>
       <li style="width:120px;height:35px;background-color:#8E8E8E">  <a class="" href="/productauctionssh/e/index.jsp?type=<%=t.getId() %>"><%=t.getTypename() %></a></li>
        <%} %>
       </ul>  
       </li>
      
      </ul>    
     </div>
    </div>
  
 <!-- e --> 
<div class="fn-clear"></div>
 <div class="pageinfo">
	     
	</div>

