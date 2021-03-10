<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.model.Sysuser"%>
<%

      Sysuser sysuser = (Sysuser)session.getAttribute("admin");
      if(sysuser==null){
         
          response.sendRedirect("login.jsp");
          
      }

%>

