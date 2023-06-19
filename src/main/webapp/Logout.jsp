<%@page import="org.hibernate.internal.build.AllowSysOut"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page errorPage="ErrorPage.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>LogOut</title>
</head>
<body>
	<%
	session.invalidate();
	RequestDispatcher rd=request.getRequestDispatcher("login.html");
	rd.forward(request, response);
	response.setContentType("text/html");
	%>
</body>
</html>