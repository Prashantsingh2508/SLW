 <%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>
<%@ page import ="java.io.*" %>


<%
session.setAttribute("username",null);
session.removeAttribute("username");
response.setHeader("Cache-Control", "no-store"); //when you hit back, it displays "Confirm page Submission"
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", 0);
session.invalidate();
response.sendRedirect("index.html");
%>
